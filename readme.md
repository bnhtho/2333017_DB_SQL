## Thay đổi so với ERD
> [!NOTE]
> - Trong thực thể `DanhGia`, xoá đánh giá theo sao vì nó đã có sẵn trong thực thể `DanhMucSanPham` (nếu có sự thay đổi gì thì sẽ sửa lại và bổ sung sau)
> - Thay đổi mối quan hệ `Được Giao Bởi` thành `ChiTietDonHang`
> - Thay đổi thực thể `Hoá Đơn` thành `ChiTietHoaDon`
> - Thêm cột id `MaNguoiPhuThuoc` để dễ truy vấn hơn (trong trường hợp bắt buộc)

### Thuộc tính Giá trị đầu vào
| Thực thể   |Thuộc tính|
| -------- | ------- |
| Khách hàng  | Điểm tích luỹ |
| Đơn hàng | Tiền thuốc |
| Hoá đơn | số tiền khuyến mãi |
| Danh mục sản phẩm | Số sao trung bình |
| Chi nhánh | Số lượng nhân viên và sản phẩm | 

## Cấu trúc file
| File    | Nội dung |
| -------- | ------- |
| BTL_2_Nhom_1_L12.sql  | Chứa các bảng hiện thực từ `ERD`    |
| BTL_2_Nhom_1_L12_Insert.sql | Insert Dữ liệu mẫu     |
| BTL_2_Nhom1_L12_Producre.sql   | Phần 2.4.1 trong bài |
| BTL_2_Nhom1_L12_Trigger.sql   | Trigger |

## Truy vấn nhanh
> [!NOTE]  
> Những câu truy vấn hữu dụng khi làm bài (Vẫn trong quá trình hoàn thiện)
### Truy vấn danh sách đánh giá từ khách hàng và sản phẩm

```sql
SELECT * FROM KhachHang
SELECT 
    KH.TenKhachHang,
    KH.SoDienThoai,
    DG.MaSanPham,
    DG.NoiDungDanhGia
FROM 
    KhachHang KH
JOIN 
    DanhGia DG ON KH.MaKhachHang = DG.MaKhachHang;
```

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
## Truy vấn danh sách sản phẩm và nhà cung cấp
```sql
SELECT 
    SP.MaSanPham, 
    SP.TenSanPham, 
    SP.DonViNhoNhat, 
    SP.SoSaoTrungBinh,
    CN.TenChiNhanh,
    NCC.TenNhaCungCap
FROM DanhMucSanPham SP
JOIN ChiNhanh CN ON SP.MaChiNhanh = CN.MaChiNhanh
JOIN NhaCungCap NCC ON SP.MaNhaCungCap = NCC.MaNhaCungCap;

```
### Truy vấn chi nhánh áp dụng mã khuyến mãi kèm mô tả
```sql
SELECT 
    CN.TenChiNhanh, 
    KM.MaKhuyenMai, 
    KMCT.NgayBatDau, 
    KMCT.NgayKetThuc, 
    KMCT.MoTa
FROM ChiNhanh CN
JOIN KhuyenMai KM ON CN.MaChiNhanh = KM.MaChiNhanh
JOIN ChuongTrinhKhuyenMai KMCT ON KM.MaKhuyenMai = KMCT.MaKhuyenMai;
```
### Truy vấn Chi nhánh áp dụng các loại khuyến mãi nào, mô tả 
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
### Produces
```sql
use Medical
-- Phần 2.4.1
-- Câu 1
-- Create PROCEDURE KiemTraNhanVienSanPham
CREATE PROCEDURE KiemTraNhanVienSanPham
    @MaChiNhanh INT
AS
BEGIN
    DECLARE @SoLuongNhanVien INT;
    DECLARE @SoLuongSanPham INT;
    
    -- Kiểm tra tham số đầu vào
    IF @MaChiNhanh IS NULL
    BEGIN
        PRINT 'Mã chi nhánh không hợp lệ.';
        RETURN;
    END
	 -- Kiểm tra sự tồn tại của mã chi nhánh trong bảng ChiNhanh
    IF NOT EXISTS (SELECT 1 FROM ChiNhanh WHERE MaChiNhanh = @MaChiNhanh)
    BEGIN
        PRINT 'Mã chi nhánh không tồn tại trong hệ thống.';
        RETURN;
    END
    -- Lấy số lượng nhân viên và sản phẩm từ bảng ChiNhanh
    SELECT @SoLuongNhanVien = SoLuongNhanVien, @SoLuongSanPham = SoLuongSanPham
    FROM ChiNhanh
    WHERE MaChiNhanh = @MaChiNhanh;

    -- Kiểm tra điều kiện số lượng nhân viên
    IF @SoLuongNhanVien < @SoLuongSanPham / 10
    BEGIN
        PRINT 'Số lượng nhân viên không đủ để quản lý số lượng sản phẩm.';
    END
    ELSE
    BEGIN
        PRINT 'Số lượng nhân viên đủ để quản lý số lượng sản phẩm.';
    END
END;
GO
EXEC KiemTraNhanVienSanPham @MaChiNhanh = 5;
GO
```

## Ghi chú
### Công thức tính tổng tiền
```
Tổng tiền = tiền thuốc + tiền khuyến mãi + chi phí giao hàng  
```
