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
-- Phần 1: Chi nhánh, chương trình khuyến mãi và nhân viên
-- [1] Nhân viên
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

-- [2] Bác sĩ
CREATE TABLE BacSi (
    MaNhanVien INT PRIMARY KEY,
    ChungChi VARCHAR(1) NOT NULL, 
    ChuyenMon VARCHAR(1) NOT NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);

-- [3]Dược sĩ
CREATE TABLE DuocSi (
    MaNhanVien INT PRIMARY KEY,
    GiayPhepHanhNghe VARCHAR(8) NOT NULL,
    TrinhDo VARCHAR(1) NOT NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);

-- [4] Chi nhánh
CREATE TABLE ChiNhanh (
    MaChiNhanh INT PRIMARY KEY,
    MaNhanVienQuanLy INT NOT NULL,
    SoLuongSanPham INT NOT NULL,
    SoLuongNhanVien INT NOT NULL,
    DiaChi VARCHAR(100) NOT NULL,
    TenChiNhanh VARCHAR(100) NOT NULL,
    FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);

-- [5] Khuyến mãi
CREATE TABLE KhuyenMai (
    MaKhuyenMai VARCHAR(20) PRIMARY KEY NOT NULL,
    MaChiNhanh INT NOT NULL,
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE
);

-- [6] Chương trình khuyến mãi
CREATE TABLE ChuongTrinhKhuyenMai (
    MaKhuyenMai VARCHAR(20) PRIMARY KEY NOT NULL,
    MaChiNhanh INT NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    MoTa VARCHAR(50),
    LoaiGiam INT CHECK (LoaiGiam IN (1, 2)), -- Loại giảm giá (ví dụ: 1 cho phần trăm, 2 cho giảm giá trực tiếp)
    GiaTriGiam DECIMAL(10, 2),
    FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai) ON DELETE CASCADE
);

-- Phần 2: Sản phẩm và nhà cung cấp
-- [7] Nhà cung cấp
CREATE TABLE NhaCungCap (
    MaNhaCungCap VARCHAR(10) PRIMARY KEY NOT NULL,
    TenNhaCungCap VARCHAR(50) NOT NULL,
    DiaChi VARCHAR(100)
);

-- [8] Danh mục sản phẩm
CREATE TABLE DanhMucSanPham (
    MaSanPham VARCHAR(10) PRIMARY KEY NOT NULL,
    TenSanPham VARCHAR(50) NOT NULL,
    DonViNhoNhat VARCHAR(20) NOT NULL, -- Đơn vị nhỏ nhất (ví dụ: Hộp, Vỉ)
    SoSaoTrungBinh INT CHECK (SoSaoTrungBinh BETWEEN 1 AND 5), -- (1 đến 5, đơn vị là sao)
    MaChiNhanh INT NOT NULL,
    MaNhaCungCap VARCHAR(10) NOT NULL,
    FOREIGN KEY (MaChiNhanh) REFERENCES ChiNhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap) ON DELETE CASCADE
);
-- Phần 3 : Khách hàng và đơn hàng
-- [9] Khách hàng
CREATE TABLE KhachHang (
    MaKhachHang VARCHAR(10) PRIMARY KEY ,
    TenKhachHang VARCHAR(100) NOT NULL,
    SoNha VARCHAR(100) NOT NULL,
    TenDuong VARCHAR(100) NOT NULL,
	SoDienThoai VARCHAR(11) NOT NULL, 
	MaGioiThieu VARCHAR(11),
	DiemTichLuy INT NOT NULL,
	Tinh VARCHAR(100) NOT NULL
);

-- [10] Đơn hàng
CREATE TABLE DonHang (
	MaDonHang VARCHAR(10) PRIMARY KEY,
	ToaThuoc VARCHAR(255) NOT NULL,
	TienThuoc DECIMAL(10,2) NOT NULL,
) 

-- [11] Đơn vị giao hàng
CREATE TABLE DonViGiaoHang (
    MaDonVi VARCHAR(10) PRIMARY KEY,
    TenDonVi VARCHAR(255) NOT NULL
);

--
-- Phần 4 : Các mối liên hệ giữa các thực thể
-- [12] Đánh giá sản phẩm
-- Cần có bảng DanhMucSanPham và KhachHang
CREATE TABLE DanhGia (
	MaDanhGia VARCHAR(10) PRIMARY KEY NOT NULL,
	MaKhachHang VARCHAR(10) NOT NULL,  
	NoiDungDanhGia VARCHAR(255), -- Có thể null
	MaSanPham VARCHAR(10) NOT NULL,
	FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang) ON DELETE CASCADE,
    FOREIGN KEY (MaSanPham) REFERENCES DanhMucSanPham(MaSanPham) ON DELETE CASCADE
);

-- [13] (Chi tiết đơn hàng) - <được giao bởi>
-- Đây là bảng chứa thông tin đơn hàng sẽ được giao / tình trạng và đơn vị đơn hàng
CREATE TABLE ChiTietDonHang (
    MaVanDon VARCHAR(10) PRIMARY KEY NOT NULL,
    TinhTrang VARCHAR(50) NOT NULL,       -- Tình trạng đơn hàng
    DiaChiDonHang VARCHAR(255) NOT NULL,  -- Địa chỉ giao hàng
    MaDonViVanChuyen VARCHAR(10) NOT NULL, -- Mã đơn vị vận chuyển
	ChiPhiGiaoHang DECIMAL(10, 2), -- chi phí giao hàng
    FOREIGN KEY (MaDonViVanChuyen) REFERENCES DonViGiaoHang(MaDonVi) ON DELETE CASCADE
);
-- [14] Chi tiết hoá dơn
CREATE TABLE ChiTietHoaDon (
    MaHoaDon VARCHAR(10) PRIMARY KEY NOT NULL,  -- Mã hóa đơn
    SoTienKhuyenMai DECIMAL(10, 2) DEFAULT 0,   -- Số tiền khuyến mãi (nếu không có thì là 0)
    ApDungKhuyenMai BIT NOT NULL DEFAULT 0,     -- 0: Không áp dụng, 1: Có áp dụng
    ThoiGianXuatHoaDon DATETIME NOT NULL,       -- Thời gian xuất hóa đơn
    TongTien DECIMAL(10, 2) NOT NULL            -- Tổng tiền (tính toán thủ công hoặc qua ứng dụng)
);
SELECT * FROM ChiTietHoaDon
-- Trigger kiểm tra số lương nhân viên và sản phẩm.

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

GO
CREATE TRIGGER trg_CalculateTongTien
ON ChiTietHoaDon
AFTER INSERT, UPDATE
AS
BEGIN
    -- Tính toán lại tổng tiền cho mỗi bản ghi mới chèn hoặc cập nhật
    UPDATE cthd
    SET cthd.TongTien = 
        CASE 
            WHEN i.ApDungKhuyenMai = 1 THEN
                (SELECT dh.TienThuoc FROM DonHang dh WHERE dh.MaDonHang = i.MaHoaDon)
                - i.SoTienKhuyenMai 
                + (SELECT ctdh.ChiPhiGiaoHang FROM ChiTietDonHang ctdh WHERE ctdh.MaVanDon = i.MaHoaDon)
            ELSE
                (SELECT dh.TienThuoc FROM DonHang dh WHERE dh.MaDonHang = i.MaHoaDon)
                + (SELECT ctdh.ChiPhiGiaoHang FROM ChiTietDonHang ctdh WHERE ctdh.MaVanDon = i.MaHoaDon)
        END
    FROM ChiTietHoaDon cthd
    INNER JOIN inserted i ON cthd.MaHoaDon = i.MaHoaDon;
END;

GO
