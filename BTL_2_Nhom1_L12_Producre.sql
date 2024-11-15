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