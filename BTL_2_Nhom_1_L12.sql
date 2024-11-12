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

-- [1] NhanVien
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien VARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()), 
    GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')),
    Email VARCHAR(50) NOT NULL,
    SoDienThoai CHAR(11) NOT NULL,
    KinhNghiem VARCHAR(2) NOT NULL,
    LuongNhanVien DECIMAL(10, 2)
);

-- [2] BacSi
CREATE TABLE BacSi (
    MaNhanVien INT PRIMARY KEY,
    ChungChi VARCHAR(1) NOT NULL, 
    ChuyenMon VARCHAR(1) NOT NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);

-- [3] DuocSi
CREATE TABLE DuocSi (
    MaNhanVien INT PRIMARY KEY,
    GiayPhepHanhNghe VARCHAR(8) NOT NULL,
    TrinhDo VARCHAR(1) NOT NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);

-- [4] ChiNhanh
CREATE TABLE ChiNhanh (
    MaChiNhanh INT PRIMARY KEY,
    MaNhanVienQuanLy INT NOT NULL,
    SoLuongSanPham INT NOT NULL,
    SoLuongNhanVien INT NOT NULL,
    DiaChi VARCHAR(100) NOT NULL,
    TenChiNhanh VARCHAR(100) NOT NULL,
    FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);

-- [5] KhuyenMai
CREATE TABLE KhuyenMai (
    MaKhuyenMai VARCHAR(20) PRIMARY KEY NOT NULL,
    MaChiNhanh INT NOT NULL,
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE
);

-- [6] ChuongTrinhKhuyenMai
CREATE TABLE ChuongTrinhKhuyenMai (
    MaKhuyenMai VARCHAR(20) PRIMARY KEY NOT NULL,
    MaChiNhanh INT NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    MoTa VARCHAR(50),
    LoaiGiam INT CHECK (LoaiGiam IN (1, 2)), 
    GiaTriGiam DECIMAL(10, 2),
    FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai) ON DELETE CASCADE
);

-- [7] NhaCungCap
CREATE TABLE NhaCungCap (
    MaNhaCungCap VARCHAR(10) PRIMARY KEY NOT NULL,
    TenNhaCungCap VARCHAR(50) NOT NULL,
    DiaChi VARCHAR(100)
);

-- [8] DanhMucSanPham
CREATE TABLE DanhMucSanPham (
    MaSanPham VARCHAR(10) PRIMARY KEY NOT NULL,
    TenSanPham VARCHAR(50) NOT NULL,
    DonViNhoNhat VARCHAR(20) NOT NULL,
    SoSaoTrungBinh INT CHECK (SoSaoTrungBinh BETWEEN 1 AND 5),
    MaChiNhanh INT NOT NULL,
    MaNhaCungCap VARCHAR(10) NOT NULL,
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap) ON DELETE CASCADE
);

-- Trigger
GO
CREATE TRIGGER trg_SoluongNhanvien_SanPham ON ChiNhanh  AFTER INSERT, UPDATE AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE SoLuongNhanVien < SoLuongSanPham / 10
    )
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR ('Số lượng nhân viên không đủ để quản lý số lượng sản phẩm hiện có.', 16, 1);
    END
END;
GO


-- [1] Nhân viên
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien)
VALUES
(1, 'Nguyen A', '1985-05-15', 'M', 'nguyena@gmail.com', '0912345678', '5', 10000),
(2, 'Tran B', '1990-08-20', 'F', 'tranb@yahoo.com', '0912345679', '3', 8000),
(3, 'Le C', '1982-03-10', 'M', 'lec@outlook.com', '0912345680', '10', 15000);

-- [2] Bác sĩ
INSERT INTO BacSi (MaNhanVien, ChungChi, ChuyenMon)
VALUES
(1, 'B', 'N'),
(3, 'A', 'Y');

-- [3] Dược sĩ
INSERT INTO DuocSi (MaNhanVien, GiayPhepHanhNghe, TrinhDo)
VALUES
(2, 'GP123456', 'D');

-- [4] Chi nhánh
INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh)
VALUES
(1, 1, 200, 20, '123 Tran Hung Dao', 'Chi nhánh 1'),
(2, 2, 150, 15, '456 Le Loi', 'Chi nhánh 2');

-- [5] Khuyến mãi
INSERT INTO KhuyenMai (MaKhuyenMai, MaChiNhanh)
VALUES
('KM001', 1),
('KM002', 2);

-- [6] Chương trình Khuyến mãi
INSERT INTO ChuongTrinhKhuyenMai (MaKhuyenMai, MaChiNhanh, NgayBatDau, NgayKetThuc, MoTa, LoaiGiam, GiaTriGiam)
VALUES
('KM001', 1, '2024-11-01', '2024-11-30', 'Giảm giá 10%', 1, 10.00),
('KM002', 2, '2024-11-01', '2024-11-30', 'Giảm giá 20%', 1, 20.00);

-- [7] Nhà cung cấp
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi)
VALUES
('NCC001', 'Nha Cung Cap 1', '123 Hai Ba Trung'),
('NCC002', 'Nha Cung Cap 2', '456 Le Duan');

-- [8] Danh mục sản phẩm
INSERT INTO DanhMucSanPham (MaSanPham, TenSanPham, DonViNhoNhat, SoSaoTrungBinh, MaChiNhanh, MaNhaCungCap)
VALUES
('SP001', 'Sản phẩm 1', 'Hộp', 5, 1, 'NCC001'),
('SP002', 'Sản phẩm 2', 'Vỉ', 4, 2, 'NCC002'),
('SP003', 'Sản phẩm 3', 'Chai', 3, 1, 'NCC001');
