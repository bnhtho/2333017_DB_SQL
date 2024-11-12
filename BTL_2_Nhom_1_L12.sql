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

-- [1] Nhân viên
CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY, -- Khóa chính
    TenNhanVien VARCHAR(100) NOT NULL, -- Không được để trống
    NgaySinh DATE NOT NULL CHECK (NgaySinh < GETDATE()), -- Ngày sinh phải trước ngày hiện tại
    GioiTinh CHAR(1) CHECK (GioiTinh IN ('M', 'F')), -- Chỉ nhận 'M' (nam) hoặc 'F' (nữ)
    Email VARCHAR(50) NOT NULL, -- email
    SoDienThoai VARCHAR(8) NOT NULL, -- Số điện thoại
    KinhNghiem VARCHAR(2) NOT NULL, -- Kinh nghiệm (ví dụ: "1" cho 1 năm, "5" cho 5 năm)
    LuongNhanVien DECIMAL(10, 2) -- Lương nhân viên (VND)
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
	-- Ma nhan viên quản lý của store sẽ là FK của 
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
	MaChiNhanh INT NOT NULL, -- Mã chi nhánh sẽ áp dụng cho chương trình khuyến mãi
	NgayBatDau DATE NOT NULL, -- ngày bắt đầu
	NgayKetThuc DATE NOT NULL, -- Ngày kết thúc
	MoTa Varchar(50) -- Mô tả mã khuyến mãi
	-- MaKhuyenMai trong bảng Chuong_TrinhKhuyenMai sẽ  tham khảo MaKhuyenMai của bảng KhuyenMai
	FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai) ON DELETE CASCADE
);