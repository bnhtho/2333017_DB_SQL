-- [TRIGGER[1]]
USE Medical
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
-- Thọ

use Medical 
/****** Object:  Trigger [dbo].[TR_CapNhat_SoLuongNV]    Script Date: 11/18/2024 2:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER TR_CapNhat_SoLuongNV
ON NhanVien
AFTER INSERT, DELETE
AS
BEGIN
    -- Cập nhật khi thêm nhân viên mới
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        UPDATE ChiNhanh
        SET SoLuongNhanVien = SoLuongNhanVien + 1
        WHERE MaChiNhanh IN (SELECT MaChiNhanh FROM inserted)
    END

    -- Cập nhật khi xóa nhân viên
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        UPDATE ChiNhanh
        SET SoLuongNhanVien = SoLuongNhanVien - 1
        WHERE MaChiNhanh IN (SELECT MaChiNhanh FROM deleted)
    END
END;
GO

INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien)
VALUES
(8, 'Nguyen Van A', '1990-05-20', 'M', 'vana@example.com', '0901234567', '10', 20000000.00),
(9, 'Le Thi B', '1992-08-15', 'F', 'lethib@example.com', '0912345678', '8', 18000000.00),
(10, 'Tran Van C', '1985-02-10', 'M', 'tranvc@example.com', '0923456789', '15', 19000000.00);

INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh)
VALUES 
(200, 1, 200, 15, '123 Đường A, Quận B', 'Chi nhánh Hà Nội'),
(300, 2, 150, 10, '456 Đường C, Quận D', 'Chi nhánh TP.HCM'),
(400, 3, 180, 12, '789 Đường E, Quận F', 'Chi nhánh Đà Nẵng'),
(500, 1, 100, 8, '321 Đường G, Quận H', 'Chi nhánh Hải Phòng'),
(600, 8, 100, 8, '321 Đường G, Quận H', 'Chi nhánh Hải Phòng');