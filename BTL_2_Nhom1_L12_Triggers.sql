-- [TRIGGER]
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
                - ISNULL(i.SoTienKhuyenMai, 0) -- Sử dụng ISNULL để tránh giá trị NULL
                + (SELECT ctdh.ChiPhiGiaoHang FROM ChiTietDonHang ctdh WHERE ctdh.MaVanDon = i.MaHoaDon)
            ELSE
                (SELECT dh.TienThuoc FROM DonHang dh WHERE dh.MaDonHang = i.MaHoaDon)
                + (SELECT ctdh.ChiPhiGiaoHang FROM ChiTietDonHang ctdh WHERE ctdh.MaVanDon = i.MaHoaDon)
        END
    FROM ChiTietHoaDon cthd
    INNER JOIN inserted i ON cthd.MaHoaDon = i.MaHoaDon
    WHERE cthd.TongTien IS NULL OR cthd.TongTien = 0; -- Cập nhật khi TongTien chưa được tính
END;
GO