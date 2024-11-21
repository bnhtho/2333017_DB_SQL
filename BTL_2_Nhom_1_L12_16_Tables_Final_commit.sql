

IF NOT EXISTS (
	SELECT *
	FROM sys.databases
	WHERE name = 'Medical'
)
BEGIN
	CREATE DATABASE [Medical]
END
GO

-- Hỗ trợ tiếng Việt có dấu trong Database Medical
ALTER DATABASE Medical
COLLATE Latin1_General_100_CI_AS_SC_UTF8;
--
USE Medical

-- Phần 1: Chi nhánh, chương trình khuyến mãi và nhân viên
-- [1] Chi nhánh
CREATE TABLE ChiNhanh (
	MaChiNhanh INT PRIMARY KEY,
	MaNhanVienQuanLy INT,
	SoLuongSanPham INT,
	SoLuongDanhMucSanPham INT,
	SoLuongNhanVien INT,
	DiaChi NVARCHAR(100) NOT NULL,
	TenChiNhanh NVARCHAR(100) NOT NULL
);

-- [2] Nhân viên
CREATE TABLE NhanVien (
	MaNhanVien INT PRIMARY KEY,
	TenNhanVien NVARCHAR(100) NOT NULL,
	NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()),
	GioiTinh CHAR(1) NOT NULL CHECK (GioiTinh IN ('M', 'F')),
	Email NVARCHAR(50) NOT NULL,
	SoDienThoai CHAR(11) NOT NULL,
	KinhNghiem NVARCHAR(2),
	LuongNhanVien DECIMAL(10, 2),
	MaChiNhanh INT,
	LoaiNV BIT,
	ChungChi NVARCHAR(1),
	ChuyenMon NVARCHAR(1),
	GiayPhepHanhNghe NVARCHAR(8),
	TrinhDo NVARCHAR(1),
	CONSTRAINT	fk_nhanvien_chinhanh FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh)
);

-- [3] Người phụ thuộc
CREATE TABLE NguoiPhuThuoc (
	MaNguoiPhuThuoc INT PRIMARY KEY,
	MaNhanVien INT,
	TenNguoiPhuThuoc NVARCHAR(100) NOT NULL,
	NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()),
	GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')),
	MoiQuanHe NVARCHAR(99) CHECK (MoiQuanHe IN ('Anh', 'Chị', 'Em', 'Cha', 'Mẹ', 'Con')),
	CONSTRAINT	fk_nguoiphuthuoc_nhanvien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

-- [4] Khuyến mãi
CREATE TABLE KhuyenMai (
	MaKhuyenMai NVARCHAR(20) PRIMARY KEY,
	MaChiNhanh INT,
	CONSTRAINT	fk_khuyenmai_chinhanh FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh)
);

-- [5] Chương trình khuyến mãi
CREATE TABLE ChuongTrinhKhuyenMai (
	MaKhuyenMai NVARCHAR(20) PRIMARY KEY,
	NgayBatDau DATE,
	NgayKetThuc DATE,
	MoTa NVARCHAR(50),
	LoaiGiam INT CHECK (LoaiGiam IN (1, 2)),
	GiaTriGiam DECIMAL(10, 2)
);

-- Phần 2: Sản phẩm và nhà cung cấp
-- [6] Nhà cung cấp
CREATE TABLE NhaCungCap (
	MaNhaCungCap NVARCHAR(10) PRIMARY KEY,
	TenNhaCungCap NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL
);

-- [7] Danh mục sản phẩm
CREATE TABLE DanhMucSanPham (
	MaSanPham NVARCHAR(10) PRIMARY KEY,
	TenSanPham NVARCHAR(50) NOT NULL,
	DonViNhoNhat NVARCHAR(20) NOT NULL,
	MaNhaCungCap NVARCHAR(10),
	SoLuong INT,
	GiaBan DECIMAL(10, 2),
	MaChiNhanh INT,
	CONSTRAINT fk_danhmucsanpham_chinhanh FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh),
	CONSTRAINT fk_danhmucsanpham_nhacungcap FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
);

-- [8] Bảng bán
CREATE TABLE Ban (
	MaSanPham NVARCHAR(10),
	MaChiNhanh INT,
	CONSTRAINT fk_ban_masanpham FOREIGN KEY (MaSanPham) REFERENCES DanhMucSanPham(MaSanPham),
	CONSTRAINT fk_ban_machinhanh FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh),
	PRIMARY KEY (MaSanPham, MaChiNhanh)
);

-- Phần 3: Khách hàng và đơn hàng
-- [9] Khách hàng
CREATE TABLE KhachHang (
	MaKhachHang NVARCHAR(10) PRIMARY KEY,
	TenKhachHang NVARCHAR(100) NOT NULL,
	SoNha NVARCHAR(100),
	TenDuong NVARCHAR(100),
	Tinh NVARCHAR(100) NOT NULL,
	SoDienThoai NVARCHAR(11),
	MaGioiThieu NVARCHAR(11),
	DiemTichLuy INT
);

-- [10] Khách hàng và số điện thoại
-- Sửa lại kiểu dữ liệu SoDienThoai trong KhachHangSDT
CREATE TABLE KhachHangSDT (
	MaKhachHang NVARCHAR(10),
	SoDienThoai NVARCHAR(11),
	CONSTRAINT fk_khachhangsdt_makh FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	PRIMARY KEY (MaKhachHang, SoDienThoai)
);


-- [11] Đơn hàng
CREATE TABLE DonHang (
	MaDonHang NVARCHAR(10) PRIMARY KEY,
	ToaThuoc NVARCHAR(255),
	TienThuoc DECIMAL(10, 2) NOT NULL,
	Ngay DATE,
	NhanXet NVARCHAR(500),
	MaKhachHang NVARCHAR(10),
	MaNhanVien INT,
	CONSTRAINT fk_donhang_makh FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	CONSTRAINT fk_donhang_manv FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

-- [12] Đơn vị giao hàng
CREATE TABLE DonViGiaoHang (
	MaDonVi NVARCHAR(10) PRIMARY KEY,
	TenDonVi NVARCHAR(255) NOT NULL,
);

-- Phần 4: Các mối liên hệ giữa các thực thể
-- [13] Chi tiết đơn hàng
CREATE TABLE ChiTietDonHang (
	MaVanDon NVARCHAR(10) PRIMARY KEY,
	TinhTrang NVARCHAR(50),
	DiaChiDonHang NVARCHAR(255) NOT NULL,
	MaDonViVanChuyen NVARCHAR(10),
	ChiPhiGiaoHang DECIMAL(10, 2),
	CONSTRAINT fk_chitiet_donhang_don_vi_van_chuyen FOREIGN KEY (MaDonViVanChuyen) REFERENCES DonViGiaoHang(MaDonVi)
);

-- [14] Chi tiết hóa đơn
CREATE TABLE ChiTietHoaDon (
	MaHoaDon NVARCHAR(10) PRIMARY KEY,
	SoTienKhuyenMai DECIMAL(10, 2) DEFAULT 0,
	ApDungKhuyenMai BIT NOT NULL DEFAULT 0,
	ThoiGianXuatHoaDon DATETIME NOT NULL,
	TongTien DECIMAL(10, 2) NOT NULL
);

-- [15] Thanh toán
CREATE TABLE ThanhToan (
	MaDonHang NVARCHAR(10),
	MaChiNhanh INT,
	MaKhachHang NVARCHAR(10),
	CONSTRAINT  fk_thanhtoan_ma_donhang FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
	CONSTRAINT  fk_thanhtoan_ma_chinhanh FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh),
	CONSTRAINT  fk_thanhtoan_ma_khachhang FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	PRIMARY KEY (MaDonHang)
);
-- [16] Bảng bao gồm
CREATE TABLE BaoGom (
	MaSanPham NVARCHAR(10),
	MaDonHang NVARCHAR(10),
	SoLuong INT,
	CONSTRAINT fk_baogom_ma_sp FOREIGN KEY (MaSanPham) REFERENCES DanhMucSanPham(MaSanPham),
	CONSTRAINT fk_baogom_ma_donhang FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
	PRIMARY KEY (MaSanPham, MaDonHang)
);

-- -- Cập nhật khóa ngoại MaNhanVienQuanLy sau khi insert
ALTER TABLE ChiNhanh
ADD CONSTRAINT FK_chinhanh_nhanvien FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien);