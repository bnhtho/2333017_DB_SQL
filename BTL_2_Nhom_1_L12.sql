-- [Database Medical]
-- Create database: If no database available
IF NOT EXISTS (
        SELECT *
        FROM sys.databases
        WHERE name = 'Medical'
        )
BEGIN
    CREATE DATABASE [Medical]
END
GO
use Medical
-- ╔═══════════════════════╗
-- ║   Create Table        ║
-- ╚═══════════════════════╝

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

-- [1.1] Bác sĩ là subclass của Nhân viên
CREATE TABLE BacSi (
    MaNhanVien INT PRIMARY KEY, -- Khóa chính, liên kết với MaNhanVien trong bảng NhanVien
    ChungChi VARCHAR(1) NOT NULL, -- Chứng chỉ (A - sơ cấp, B - Chứng chỉ nâng cao) 
    ChuyenMon VARCHAR(1) NOT NULL, -- Chuyên môn (ví dụ: "N" cho Nội, "Y" cho Y học...)
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien (MaNhanVien) ON DELETE CASCADE
);

-- [1.2] Dược sĩ là subclass của Nhân viên
CREATE TABLE DuocSi (
    MaNhanVien INT PRIMARY KEY, -- Khóa chính, liên kết với MaNhanVien trong bảng NhanVien
    GiayPhepHanhNghe VARCHAR(8) NOT NULL, -- Giấy phép hành nghề
    TrinhDo VARCHAR(1) NOT NULL, -- Trình độ (ví dụ: "C" cho Cao đẳng, "D" cho Đại học...)
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien (MaNhanVien) ON DELETE CASCADE
); 