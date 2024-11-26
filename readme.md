> [!NOTE] 
> **Cập nhật ngày 26/11/2024**
> - Cập nhật lại mục Created Table ngày 26/11/2024
> - Cập nhật dữ liệu mẫu ngày 26/11/2024
> - Readme.md : Cập nhật Readme.md

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

### Xoá sạch database rác 
```sql
use [master]

DECLARE 
@DATABASENAME nVARCHAR(20)

DECLARE
@TABLE TABLE
(NAME nVARCHAR(50))

Declare @SQL nvarchar(100)

INSERT INTO @TABLE

SELECT 
name 
FROM sys.databases 
WHERE name not in 
    ('master'
    ,'tempdb'
    ,'model'
    ,'msdb'
    ,'ReportServer'
    ,'ReportServerTempDB')


while (select COUNT(*) from @table) > 0

begin

select @DATABASENAME = (select top 1 (name) from @TABLE)

DECLARE @kill varchar(8000) = '';
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), spid) + ';'
FROM master..sysprocesses 
WHERE dbid = db_id(@DATABASENAME)

EXEC(@kill);

set @SQL = 'drop database ' + @DATABASENAME

exec sp_executesql @SQL, N'@databasename nvarchar(50)', @databasename; 

print @databasename + ' has been deleted'

delete from @TABLE where NAME = @DATABASENAME

end
```
