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
GO

-- [1.1] Bác sĩ là subclass của Nhân viên
CREATE TABLE BacSi (
    MaNhanVien INT PRIMARY KEY, -- Khóa chính, liên kết với MaNhanVien trong bảng NhanVien
    ChungChi VARCHAR(1) NOT NULL, -- Chứng chỉ (A - sơ cấp, B - Chứng chỉ nâng cao) 
    ChuyenMon VARCHAR(1) NOT NULL, -- Chuyên môn (ví dụ: "N" cho Nội, "Y" cho Y học...)
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien (MaNhanVien) ON DELETE CASCADE
);
GO

-- [1.2] Dược sĩ là subclass của Nhân viên
CREATE TABLE DuocSi (
    MaNhanVien INT PRIMARY KEY, -- Khóa chính, liên kết với MaNhanVien trong bảng NhanVien
    GiayPhepHanhNghe VARCHAR(8) NOT NULL, -- Giấy phép hành nghề
    TrinhDo VARCHAR(1) NOT NULL, -- Trình độ (ví dụ: "C" cho Cao đẳng, "D" cho Đại học...)
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien (MaNhanVien) ON DELETE CASCADE
);
GO

-- Trigger [1]: Tạo trigger tính lương nhân viên theo 1 năm.
GO
CREATE TRIGGER tr_TinhLuongNhanVien ON NhanVien AFTER INSERT AS 
BEGIN
    DECLARE @MaNhanVien INT;
    DECLARE @KinhNghiem INT;
    DECLARE @Luong DECIMAL(10, 2);

    -- Lấy giá trị từ bảng inserted (dùng khi chèn hoặc cập nhật)
    SELECT @MaNhanVien = MaNhanVien, @KinhNghiem = CAST(KinhNghiem AS INT) FROM inserted;

    -- Tính lương dựa trên kinh nghiệm
    SET @Luong = @KinhNghiem * 2000000; -- Mỗi năm kinh nghiệm tương ứng 2 triệu đồng

    -- Cập nhật lương vào bảng nhân viên
    UPDATE NhanVien
    SET LuongNhanVien = @Luong
    WHERE MaNhanVien = @MaNhanVien;
END;
GO

--- Trigger [2]: Tính lương bác sĩ
GO
CREATE TRIGGER tr_TinhLuongBacSi
ON BacSi
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNhanVien INT;
    DECLARE @ChungChi VARCHAR(1);
    DECLARE @Luong DECIMAL(10, 2);

    -- Lấy giá trị từ bảng inserted
    SELECT @MaNhanVien = MaNhanVien, @ChungChi = ChungChi FROM inserted;

    -- Lương bác sĩ theo chứng chỉ
    IF @ChungChi = 'A' -- Sơ cấp
    BEGIN
        SET @Luong = 20000000; -- Ví dụ, bác sĩ sơ cấp có lương 20 triệu
    END
    ELSE IF @ChungChi = 'B' -- Nâng cao
    BEGIN
        SET @Luong = 30000000; -- Bác sĩ nâng cao có lương 30 triệu
    END
    ELSE
    BEGIN
        SET @Luong = 25000000; -- Mặc định
    END

    -- Cập nhật lương cho nhân viên
    UPDATE NhanVien
    SET LuongNhanVien = @Luong
    WHERE MaNhanVien = @MaNhanVien;
END;
GO

-- Trigger [3]: Tính lương dược sĩ
GO
CREATE TRIGGER TinhLuongDuocSi
ON DuocSi
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNhanVien INT;
    DECLARE @TrinhDo VARCHAR(1);
    DECLARE @Luong DECIMAL(10, 2);

    -- Lấy giá trị từ bảng inserted
    SELECT @MaNhanVien = MaNhanVien, @TrinhDo = TrinhDo FROM inserted;

    -- Lương dược sĩ theo trình độ
    IF @TrinhDo = 'C' -- Cao đẳng
    BEGIN
        SET @Luong = 12000000; -- Dược sĩ cao đẳng có lương 12 triệu
    END
    ELSE IF @TrinhDo = 'D' -- Đại học
    BEGIN
        SET @Luong = 18000000; -- Dược sĩ đại học có lương 18 triệu
    END
    ELSE
    BEGIN
        SET @Luong = 15000000; -- Mặc định
    END

    -- Cập nhật lương cho nhân viên
    UPDATE NhanVien
    SET LuongNhanVien = @Luong
    WHERE MaNhanVien = @MaNhanVien;
END;
GO

GO 
-- Trigger tính tổng lương cho nhân viên
GO
CREATE TRIGGER tr_TinhTongLuongNhanVien ON NhanVien
AFTER INSERT, UPDATE AS 
BEGIN
    DECLARE @MaNhanVien INT;
    DECLARE @KinhNghiem INT;
    DECLARE @LuongCung DECIMAL(10, 2);
    DECLARE @LuongKinhNghiem DECIMAL(10, 2);
    DECLARE @LuongVaiTro DECIMAL(10, 2);
    DECLARE @LuongTrinhDo DECIMAL(10, 2);
    DECLARE @TongLuong DECIMAL(10, 2);

    -- Lấy giá trị từ bảng inserted (dùng khi chèn hoặc cập nhật)
    SELECT @MaNhanVien = MaNhanVien, 
           @KinhNghiem = CAST(KinhNghiem AS INT), 
           @LuongCung = LuongNhanVien
    FROM inserted;

    -- Tính lương theo kinh nghiệm (2 triệu đồng mỗi năm)
    SET @LuongKinhNghiem = @KinhNghiem * 2000000; 

    -- Lương theo vai trò (bác sĩ/dược sĩ)
    SET @LuongVaiTro = 0;

    -- Kiểm tra vai trò bác sĩ
    IF EXISTS (SELECT 1 FROM BacSi WHERE MaNhanVien = @MaNhanVien)
    BEGIN
        DECLARE @ChungChi VARCHAR(1);
        SELECT @ChungChi = ChungChi FROM BacSi WHERE MaNhanVien = @MaNhanVien;

        -- Lương bác sĩ theo chứng chỉ
        IF @ChungChi = 'A' -- Sơ cấp
        BEGIN
            SET @LuongVaiTro = 20000000; -- Bác sĩ sơ cấp có lương 20 triệu
        END
        ELSE IF @ChungChi = 'B' -- Nâng cao
        BEGIN
            SET @LuongVaiTro = 30000000; -- Bác sĩ nâng cao có lương 30 triệu
        END
        ELSE
        BEGIN
            SET @LuongVaiTro = 25000000; -- Mặc định
        END
    END
    -- Kiểm tra vai trò dược sĩ
    ELSE IF EXISTS (SELECT 1 FROM DuocSi WHERE MaNhanVien = @MaNhanVien)
    BEGIN
        DECLARE @TrinhDo VARCHAR(1);
        SELECT @TrinhDo = TrinhDo FROM DuocSi WHERE MaNhanVien = @MaNhanVien;

        -- Lương dược sĩ theo trình độ
        IF @TrinhDo = 'C' -- Cao đẳng
        BEGIN
            SET @LuongVaiTro = 12000000; -- Dược sĩ cao đẳng có lương 12 triệu
        END
        ELSE IF @TrinhDo = 'D' -- Đại học
        BEGIN
            SET @LuongVaiTro = 18000000; -- Dược sĩ đại học có lương 18 triệu
        END
        ELSE
        BEGIN
            SET @LuongVaiTro = 15000000; -- Mặc định
        END
    END

    -- Tổng lương = Lương cứng + Lương kinh nghiệm + Lương theo vai trò
    SET @TongLuong = @LuongCung + @LuongKinhNghiem + @LuongVaiTro;

    -- Cập nhật tổng lương cho nhân viên
    UPDATE NhanVien
    SET LuongNhanVien = @TongLuong
    WHERE MaNhanVien = @MaNhanVien;
END;
GO

-- Insert vào bảng NhanVien trước khi chèn vào DuocSi và BacSi
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien)
VALUES
(8, 'Tran Minh BCADE', '1985-04-15', 'M', 'tranminhb@example.com', '09076543', '9', 1);
GO


INSERT INTO BacSi (MaNhanVien, ChungChi, ChuyenMon)
VALUES(8, 'B', 'Y');  -- Chứng chỉ nâng cao, Y học
GO

SELECT * FROM BacSi
SELECT * FROM NhanVien

-- Truy vấn để kiểm tra loại nhân viên
SELECT 
    N.MaNhanVien, 
    N.TenNhanVien, 
    CASE 
        WHEN B.MaNhanVien IS NOT NULL THEN 'BacSi'
        WHEN D.MaNhanVien IS NOT NULL THEN 'DuocSi'
        ELSE 'KhongXacDinh' -- Nếu không có trong cả 2 bảng
    END AS LoaiNhanVien
FROM NhanVien N
LEFT JOIN BacSi B ON N.MaNhanVien = B.MaNhanVien
LEFT JOIN DuocSi D ON N.MaNhanVien = D.MaNhanVien;

SELECT * FROM NhanVien

