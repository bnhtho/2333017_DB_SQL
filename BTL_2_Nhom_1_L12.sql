-- Create database if not exists
IF NOT EXISTS (
    SELECT *
    FROM sys.databases
    WHERE name = 'Medical'
)
BEGIN
    CREATE DATABASE [Medical]
END
GO

USE Medical
GO
-- Phần 1: Chi nhánh,chương trình khuyến mãi và nhân viên
-- [1] Nhân viên
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien VARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()), 
    GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')),
    Email VARCHAR(50) NOT NULL,
    SoDienThoai VARCHAR(11) NOT NULL, -- yêu cầu là 11 kí tự
    KinhNghiem VARCHAR(2) NOT NULL, -- Đơn vị là năm
    LuongNhanVien DECIMAL(10, 2)
);

-- [2] Bác sĩ là subclass của Nhân viên
CREATE TABLE BacSi (
    MaNhanVien INT PRIMARY KEY, -- Khóa chính, liên kết với MaNhanVien trong bảng NhanVien
    ChungChi VARCHAR(1) NOT NULL, -- Chứng chỉ (A - sơ cấp, B - Chứng chỉ nâng cao) 
    ChuyenMon VARCHAR(1) NOT NULL, -- Chuyên môn (ví dụ: "N" cho Nội, "Y" cho Y học...)
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien (MaNhanVien) ON DELETE CASCADE
);
GO

-- [3] Dược sĩ là subclass của Nhân viên
CREATE TABLE DuocSi (
    MaNhanVien INT PRIMARY KEY, -- Khóa chính, liên kết với MaNhanVien trong bảng NhanVien
    GiayPhepHanhNghe VARCHAR(8) NOT NULL, -- Giấy phép hành nghề
    TrinhDo VARCHAR(1) NOT NULL, -- Trình độ (ví dụ: "C" cho Cao đẳng, "D" cho Đại học...)
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien (MaNhanVien) ON DELETE CASCADE
);
GO
-- [4] Chi nhánh
CREATE TABLE ChiNhanh (
    MaChiNhanh INT PRIMARY KEY, -- Khóa chính
	MaNhanVienQuanLy INT NOT NULL ,-- Mã nhân viên quản lý
    SoLuongSanPham INT NOT NULL, -- số lượng sản phẩm có trong nhánh
	SoLuongNhanVien INT NOT NULL,
	DiaChi VARCHAR(100) NOT NULL, 
	TenChiNhanh VARCHAR(100) NOT NULL,
	FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);
-- [5] Khuyến mãi
CREATE TABLE KhuyenMai (
    MaKhuyenMai Varchar(20) PRIMARY KEY NOT NULL, -- Khóa chính -- Mã khuyến mãi 20 kí tự
	MaChiNhanh INT NOT NULL,
	-- MaChiNhanh trong bảng KhuyenMai sẽ  tham khảo MaChiNhanh của bảng ChiNhanh
	FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE
);
-- [6] Chương trình Khuyến mãi
CREATE TABLE ChuongTrinhKhuyenMai (
    MaKhuyenMai Varchar(20) PRIMARY KEY NOT NULL, -- Khóa chính -- Mã khuyến mãi 20 kí tự
	MaChiNhanh INT NOT NULL, 
	NgayBatDau DATE NOT NULL,
	NgayKetThuc DATE NOT NULL,
	MoTa Varchar(50),
	LoaiGiam INT, 
	GiaTriGiam DECIMAL(10, 2),
	-- MaKhuyenMai trong bảng Chuong_TrinhKhuyenMai sẽ  tham khảo MaKhuyenMai của bảng KhuyenMai
	FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai) ON DELETE CASCADE,
);
-- Phần 2: Sản phẩm và nhà cung cấp
-- [7] Nhà cung cấp
CREATE TABLE NhaCungCap (
    MaNhaCungCap VARCHAR(10) PRIMARY KEY NOT NULL, -- Mã nhà cung cấp (PK)
    TenNhaCungCap VARCHAR(50) NOT NULL, -- Tên nhà cung cấp
    DiaChi VARCHAR(100) -- Địa chỉ nhà cung cấp
);
-- [8] Danh mục sản phẩm
CREATE TABLE DanhMucSanPham (
    MaSanPham VARCHAR(10) PRIMARY KEY NOT NULL, -- Mã sản phẩm (PK)
    TenSanPham VARCHAR(50) NOT NULL, -- Tên sản phẩm
    DonViNhoNhat VARCHAR(20) NOT NULL, -- Đơn vị nhỏ nhất (ví dụ: Hộp, Vỉ)
    SoSaoTrungBinh INT, -- Đánh giá sản phẩm (1-5 sao)
    MaChiNhanh INT NOT NULL, -- FK tham chiếu đến bảng ChiNhanh
    MaNhaCungCap VARCHAR(10) NOT NULL, -- FK tham chiếu đến bảng NhaCungCap
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap) ON DELETE CASCADE
);

-- Trigger
GO
CREATE TRIGGER trg_SoluongNhanvien_SanPham ON ChiNhanh AFTER INSERT, UPDATE AS
BEGIN
	-- Kiểm tra điều kiện ràng buộc
	IF EXISTS (
    	SELECT 1
    	FROM inserted
    	WHERE SoLuongNhanVien < SoLuongSanPham / 10 -- Ví dụ: 1 nhân viên quản lý 10 sản phẩm
	)
	BEGIN
    	-- Nếu không thỏa mãn điều kiện, rollback giao dịch
    	ROLLBACK TRANSACTION;
    	RAISERROR ('Số lượng nhân viên không đủ để quản lý số lượng sản phẩm hiện có.', 16, 1);
	END
END;
GO