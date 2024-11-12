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
    SoDienThoai CHAR(11) NOT NULL CHECK (LEN(SoDienThoai) = 11),
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