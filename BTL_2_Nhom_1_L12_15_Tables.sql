
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
    MaNhanVienQuanLy INT NOT NULL,
    SoLuongSanPham INT NOT NULL,
    SoLuongDanhMucSanPham INT NOT NULL,
    SoLuongNhanVien INT NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    TenChiNhanh NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
);
-- [2] Nhân viên

CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()), 
    GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')),
    Email NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    SoDienThoai CHAR(11) NOT NULL,
    KinhNghiem NVARCHAR(2) NOT NULL,  -- Sửa thành NVARCHAR
    LuongNhanVien DECIMAL(10, 2),
    MaChiNhanh INT NOT NULL,
    --BS FLag
    ChungChi NVARCHAR(1) NOT NULL,  -- Sửa thành NVARCHAR
    ChuyenMon NVARCHAR(1) NOT NULL,  -- Sửa thành NVARCHAR
    --DS Flag
    GiayPhepHanhNghe NVARCHAR(8) NOT NULL,  -- Sửa thành NVARCHAR
    TrinhDo NVARCHAR(1) NOT NULL,  -- Sửa thành NVARCHAR
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) 
);

-- [3] Người phụ thuộc
CREATE TABLE NguoiPhuThuoc (
    MaNguoiPhuThuoc INT PRIMARY KEY,  -- Thêm khóa chính cho bảng người phụ thuộc
    MaNhanVien INT,  -- Thêm khóa ngoại để liên kết với bảng NhanVien
    TenNguoiPhuThuoc NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()), 
    GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')),
    MoiQuanHe NVARCHAR(99) CHECK( MoiQuanHe IN ('Anh','Chị','Em','Cha','Mẹ','Con')),
    CONSTRAINT FK_NguoiPhuThuoc_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);




-- [4] Khuyến mãi
CREATE TABLE KhuyenMai (
    MaKhuyenMai NVARCHAR(20) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    MaChiNhanh INT NOT NULL,
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) 
);

-- [5] Chương trình khuyến mãi
CREATE TABLE ChuongTrinhKhuyenMai (
    MaKhuyenMai NVARCHAR(20) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    MoTa NVARCHAR(50),  -- Sửa thành NVARCHAR
    LoaiGiam INT CHECK (LoaiGiam IN (1, 2)),  -- Loại giảm giá (ví dụ: 1 cho phần trăm, 2 cho giảm giá trực tiếp)
    GiaTriGiam DECIMAL(10, 2),
    FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai) 
);

-- Phần 2: Sản phẩm và nhà cung cấp
-- [6] Nhà cung cấp
CREATE TABLE NhaCungCap (
    MaNhaCungCap NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    TenNhaCungCap NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    DiaChi NVARCHAR(100)  -- Sửa thành NVARCHAR
);

-- [7] Danh mục sản phẩm
CREATE TABLE DanhMucSanPham (
    MaSanPham NVARCHAR(10) PRIMARY KEY,  -- Sửa thành NVARCHAR
    TenSanPham NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    DonViNhoNhat NVARCHAR(20) NOT NULL,  -- Sửa thành NVARCHAR
    MaNhaCungCap NVARCHAR(10) NOT NULL,  -- Sửa thành NVARCHAR
    SoLuong INT NOT NULL, 
    GiaBan DECIMAL(10,2) NOT NULL,
	MaChiNhanh INT NOT NULL, -- mã chi nhánh
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap) 
);
-- [8] Bảng bán
CREATE TABLE Ban (
    MaSanPham NVARCHAR(10),
    MaChiNhanh INT,
    FOREIGN KEY (MaSanPham) REFERENCES DanhMucSanPham(MaSanPham),
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh),
    PRIMARY KEY (MaSanPham, MaChiNhanh)
);

-- Phần 3 : Khách hàng và đơn hàng
-- [9] Khách hàng
CREATE TABLE KhachHang (
    MaKhachHang NVARCHAR(10) PRIMARY KEY,  -- Sửa thành NVARCHAR
    TenKhachHang NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    SoNha NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    TenDuong NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    SoDienThoai NVARCHAR(11) NOT NULL,  -- Sửa thành NVARCHAR
    MaGioiThieu NVARCHAR(11),  -- Sửa thành NVARCHAR
    DiemTichLuy INT NOT NULL,
    Tinh NVARCHAR(100) NOT NULL  -- Sửa thành NVARCHAR
);
-- [10] Khách hàng và số điện thoại
CREATE TABLE KhachHangSDT (
    MaKhachHang NVARCHAR(10),
    SoDienThoai NVARCHAR(10),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    PRIMARY KEY (MaKhachHang, SoDienThoai)
);

-- [11] Đơn hàng
CREATE TABLE DonHang (
    MaDonHang NVARCHAR(10) PRIMARY KEY,  -- Sửa thành NVARCHAR
    ToaThuoc NVARCHAR(255) NOT NULL,  -- Sửa thành NVARCHAR
    TienThuoc DECIMAL(10, 2) NOT NULL,
    -- MaDonViVanChuyen NVARCHAR(10),
    MaKhachHang NVARCHAR(10),
    MaNhanVien INT,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) 
    
);

-- [12] Đơn vị giao hàng
CREATE TABLE DonViGiaoHang (
    MaDonVi NVARCHAR(10) PRIMARY KEY,  -- Sửa thành NVARCHAR
    TenDonVi NVARCHAR(255) NOT NULL  -- Sửa thành NVARCHAR
);

--
-- Phần 4 : Các mối liên hệ giữa các thực thể


-- [13] (Chi tiết đơn hàng) - <được giao bởi>
CREATE TABLE ChiTietDonHang (
    MaVanDon NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    TinhTrang NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    DiaChiDonHang NVARCHAR(255) NOT NULL,  -- Sửa thành NVARCHAR
    MaDonViVanChuyen NVARCHAR(10) NOT NULL,  -- Sửa thành NVARCHAR
    ChiPhiGiaoHang DECIMAL(10, 2),
    FOREIGN KEY (MaDonViVanChuyen) REFERENCES DonViGiaoHang(MaDonVi)
);

-- [14] Chi tiết hoá dơn - <hóa đơn>
CREATE TABLE ChiTietHoaDon (
    MaHoaDon NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    SoTienKhuyenMai DECIMAL(10, 2) DEFAULT 0,   
    ApDungKhuyenMai BIT NOT NULL DEFAULT 0,     
    ThoiGianXuatHoaDon DATETIME NOT NULL,       
    TongTien DECIMAL(10, 2) NOT NULL
);
-- [15] Bảng thanh toán
CREATE TABLE ThanhToan (
    MaDonHang NVARCHAR(10) PRIMARY KEY,
    MaChiNhanh INT,
    MaKhachHang NVARCHAR(10),
    FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
)




-- Cập nhật khóa ngoại MaNhanVienQuanLy sau
ALTER TABLE ChiNhanh
ADD CONSTRAINT FK_ChiNhanh_NhanVien FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien);

