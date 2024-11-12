Chứa sql bài tập lớn Số 2 môn Cơ Sở Dữ Liệu 
- Chủ đề: Medical
- Học kì 241 - Lớp thực hành chính quy L12 HCMUT

## Truy vấn nhanh
> [!NOTE]  
> Những câu truy vấn hữu dụng khi làm bài (Vẫn trong quá trình hoàn thiện)

### Tìm thông tin nhân viên là bác sĩ hay nhân viên
```sql
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
```

### Xoá sạch bảng
```sql

-- Disable all referential integrity constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
GO

-- Drop all PKs and FKs
declare @sql nvarchar(max)
SELECT @sql = STUFF((SELECT '; ' + 'ALTER TABLE ' + Table_Name  +'  drop constraint ' + Constraint_Name  from Information_Schema.CONSTRAINT_TABLE_USAGE ORDER BY Constraint_Name FOR XML PATH('')),1,1,'')
EXECUTE (@sql)
GO

-- Drop all tables
EXEC sp_MSforeachtable 'DROP TABLE ?'
GO
```

## Kiểm tra SQL nhanh . Chi nhánh áp dụng các loại khuyến mãi nào, mô tả 
```
SELECT 
    cn.TenChiNhanh,
    km.MaKhuyenMai,
    ctkm.NgayBatDau,
    ctkm.NgayKetThuc,
    ctkm.MoTa
FROM ChiNhanh cn
JOIN KhuyenMai km ON cn.MaChiNhanh = km.MaChiNhanh
JOIN ChuongTrinhKhuyenMai ctkm ON km.MaKhuyenMai = ctkm.MaKhuyenMai;
```
## Triggers
### Tính lương nhân viên

```sql
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
```
### Tính lương bác sĩ
```sql 
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
```
### Tính lương cho dược dĩ
```sql 
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
```

### Tính tổng lương cho nhân viên 
```sql
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

```
### Tính lương nhân viên dựa theo kinh nghiệm
Đơn vị là (năm)

```sql

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
```

### Số lượng nhân viên và sản phẩm hợp lệ 
> [!NOTE]  
> Số lượng nhân viên không được ít khi so với số lượng sản phẩm

```sql
CREATE TRIGGER trg__CheckSoLuongSP_Nhan_Vien
ON ChiNhanh
AFTER INSERT, UPDATE
AS
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
```
