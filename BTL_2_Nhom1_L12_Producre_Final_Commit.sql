CREATE PROCEDURE KiemTraNhanVienSanPham
    @MaChiNhanh INT
AS
BEGIN
    DECLARE @SoLuongNhanVien INT;
    DECLARE @SoLuongSanPham INT;
    DECLARE @NhanVienToiThieu INT;

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

    -- Tính số lượng nhân viên tối thiểu dựa trên số lượng sản phẩm
    IF @SoLuongSanPham < 100
        SET @NhanVienToiThieu = CEILING(@SoLuongSanPham / 15.0); -- 1 nhân viên quản lý 50 sản phẩm
    ELSE IF @SoLuongSanPham BETWEEN 100 AND 500
        SET @NhanVienToiThieu = CEILING(@SoLuongSanPham / 30.0); -- 1 nhân viên quản lý 100 sản phẩm
    ELSE
        SET @NhanVienToiThieu = CEILING(@SoLuongSanPham / 50.0); -- 1 nhân viên quản lý 150 sản phẩm

    -- Kiểm tra điều kiện số lượng nhân viên
    IF @SoLuongNhanVien < @NhanVienToiThieu
    BEGIN
        PRINT 'Số lượng nhân viên không đủ để quản lý số lượng sản phẩm.';
        PRINT 'Yêu cầu tối thiểu: ' + CAST(@NhanVienToiThieu AS VARCHAR) + ' nhân viên.';
    END
    ELSE
    BEGIN
        PRINT 'Số lượng nhân viên đủ để quản lý số lượng sản phẩm.';
    END
END;
GO


-- Produre 2.4.1 do Đình Hoàn làm
-- PROCEDURE kiểm tra số lượng nhân viên và sản phẩm.
DELIMITER $$
CREATE PROCEDURE KiemTraSoLuongNhanVien(IN chiNhanhID INT)
BEGIN
    IF chiNhanhID IS NULL OR chiNhanhID <= 0 THEN
        SELECT 'Mã chi nhánh không hợp lệ. Vui lòng nhập lại' AS ErrorMessage;
        LEAVE; 
    END IF;

    DECLARE done INT DEFAULT FALSE;
    DECLARE nhanVienNum, sanPhamNum INT;
    DECLARE conTroChiNhanh CURSOR FOR 
        SELECT SoLuongNhanVien, SoLuongSanPham FROM ChiNhanh WHERE MaChiNhanh = chiNhanhID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN conTroChiNhanh;

    read_loop: LOOP
        FETCH conTroChiNhanh INTO nhanVienNum, sanPhamNum;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF nhanVienNum < (sanPhamNum / 100) THEN
            SELECT 'Cần thêm nhân viên để quản lý số sản phẩm hiện có.' AS Warning;
        ELSE
            SELECT 'Số lượng nhân viên đã đủ để quản lý sản phẩm.' AS Info;
        END IF;
    END LOOP;

    CLOSE conTroChiNhanh;
END$$
DELIMITER ;
-- End