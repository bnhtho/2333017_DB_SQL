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