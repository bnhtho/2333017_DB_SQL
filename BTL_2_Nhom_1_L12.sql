
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
-- [1] Nhân viên
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()), 
    GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')),
    Email NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    SoDienThoai CHAR(11) NOT NULL,
    KinhNghiem NVARCHAR(2) NOT NULL,  -- Sửa thành NVARCHAR
    LuongNhanVien DECIMAL(10, 2)
);

-- [2] Bác sĩ
CREATE TABLE BacSi (
    MaNhanVien INT PRIMARY KEY,
    ChungChi NVARCHAR(1) NOT NULL,  -- Sửa thành NVARCHAR
    ChuyenMon NVARCHAR(1) NOT NULL,  -- Sửa thành NVARCHAR
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);
-- [3] Dược sĩ
CREATE TABLE DuocSi (
    MaNhanVien INT PRIMARY KEY,
    GiayPhepHanhNghe NVARCHAR(8) NOT NULL,  -- Sửa thành NVARCHAR
    TrinhDo NVARCHAR(1) NOT NULL,  -- Sửa thành NVARCHAR
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);
-- [4] Người phụ thuộc
CREATE TABLE NguoiPhuThuoc (
    MaNguoiPhuThuoc INT PRIMARY KEY,  -- Thêm khóa chính cho bảng người phụ thuộc
    MaNhanVien INT,  -- Thêm khóa ngoại để liên kết với bảng NhanVien
    TenNguoiPhuThuoc NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()), 
    GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')),
    MoiQuanHe NVARCHAR(99) CHECK( MoiQuanHe IN ('Anh','Chị','Em','Cha','Mẹ','Con')),
    CONSTRAINT FK_NguoiPhuThuoc_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);


-- [5] Chi nhánh
CREATE TABLE ChiNhanh (
    MaChiNhanh INT PRIMARY KEY,
    MaNhanVienQuanLy INT NOT NULL,
    SoLuongSanPham INT NOT NULL,
    SoLuongNhanVien INT NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    TenChiNhanh NVARCHAR(100) NOT NULL,  -- Sửa thành NVARCHAR
    FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);

-- [6] Khuyến mãi
CREATE TABLE KhuyenMai (
    MaKhuyenMai NVARCHAR(20) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    MaChiNhanh INT NOT NULL,
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE
);

-- [7] Chương trình khuyến mãi
CREATE TABLE ChuongTrinhKhuyenMai (
    MaKhuyenMai NVARCHAR(20) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    MaChiNhanh INT NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    MoTa NVARCHAR(50),  -- Sửa thành NVARCHAR
    LoaiGiam INT CHECK (LoaiGiam IN (1, 2)),  -- Loại giảm giá (ví dụ: 1 cho phần trăm, 2 cho giảm giá trực tiếp)
    GiaTriGiam DECIMAL(10, 2),
    FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai) ON DELETE CASCADE
);

-- Phần 2: Sản phẩm và nhà cung cấp
-- [8] Nhà cung cấp
CREATE TABLE NhaCungCap (
    MaNhaCungCap NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    TenNhaCungCap NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    DiaChi NVARCHAR(100)  -- Sửa thành NVARCHAR
);

-- [9] Danh mục sản phẩm
CREATE TABLE DanhMucSanPham (
    MaSanPham NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    TenSanPham NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    DonViNhoNhat NVARCHAR(20) NOT NULL,  -- Sửa thành NVARCHAR
    SoSaoTrungBinh INT CHECK (SoSaoTrungBinh BETWEEN 1 AND 5),  -- (1 đến 5, đơn vị là sao)
    MaChiNhanh INT NOT NULL,
    MaNhaCungCap NVARCHAR(10) NOT NULL,  -- Sửa thành NVARCHAR
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap) ON DELETE CASCADE
);

-- Phần 3 : Khách hàng và đơn hàng
-- [10] Khách hàng
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

-- [11] Đơn hàng
CREATE TABLE DonHang (
    MaDonHang NVARCHAR(10) PRIMARY KEY,  -- Sửa thành NVARCHAR
    ToaThuoc NVARCHAR(255) NOT NULL,  -- Sửa thành NVARCHAR
    TienThuoc DECIMAL(10, 2) NOT NULL
);

-- [12] Đơn vị giao hàng
CREATE TABLE DonViGiaoHang (
    MaDonVi NVARCHAR(10) PRIMARY KEY,  -- Sửa thành NVARCHAR
    TenDonVi NVARCHAR(255) NOT NULL  -- Sửa thành NVARCHAR
);

--
-- Phần 4 : Các mối liên hệ giữa các thực thể
-- [13] Đánh giá sản phẩm
CREATE TABLE DanhGia (
    MaDanhGia NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    MaKhachHang NVARCHAR(10) NOT NULL,  
    NoiDungDanhGia NVARCHAR(255),  -- Sửa thành NVARCHAR
    MaSanPham NVARCHAR(10) NOT NULL,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang) ON DELETE CASCADE,
    FOREIGN KEY (MaSanPham) REFERENCES DanhMucSanPham(MaSanPham) ON DELETE CASCADE
);

-- [14] (Chi tiết đơn hàng) - <được giao bởi>
CREATE TABLE ChiTietDonHang (
    MaVanDon NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    TinhTrang NVARCHAR(50) NOT NULL,  -- Sửa thành NVARCHAR
    DiaChiDonHang NVARCHAR(255) NOT NULL,  -- Sửa thành NVARCHAR
    MaDonViVanChuyen NVARCHAR(10) NOT NULL,  -- Sửa thành NVARCHAR
    ChiPhiGiaoHang DECIMAL(10, 2),
    FOREIGN KEY (MaDonViVanChuyen) REFERENCES DonViGiaoHang(MaDonVi) ON DELETE CASCADE
);

-- [15] Chi tiết hoá dơn
CREATE TABLE ChiTietHoaDon (
    MaHoaDon NVARCHAR(10) PRIMARY KEY NOT NULL,  -- Sửa thành NVARCHAR
    SoTienKhuyenMai DECIMAL(10, 2) DEFAULT 0,   
    ApDungKhuyenMai BIT NOT NULL DEFAULT 0,     
    ThoiGianXuatHoaDon DATETIME NOT NULL,       
    TongTien DECIMAL(10, 2) NOT NULL
);