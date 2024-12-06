



--2.1.
 -- Procedure ThemNhanVien
CREATE PROCEDURE ThemNhanVien
    @MaNhanVien INT,
    @TenNhanVien NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh CHAR(1),
    @Email NVARCHAR(50),
    @SoDienThoai VARCHAR(11),
    @KinhNghiem INT = NULL,
    @LuongNhanVien DECIMAL(10, 2) = NULL,
    @MaChiNhanh INT = NULL,
    @LoaiNV BIT = NULL,
    @ChungChi NVARCHAR(255) = NULL,
    @ChuyenMon NVARCHAR(15) = NULL,
    @GiayPhepHanhNghe NVARCHAR(8) = NULL,
    @TrinhDo NVARCHAR(1) = NULL,
@TinhTrang NVARCHAR(99) = 'Đang làm việc'
AS
BEGIN
    BEGIN TRY
        -- Kiểm tra tính hợp lệ
	IF EXISTS (SELECT * FROM NhanVien WHERE @MaNhanVien = MaNhanVien)
			THROW 51010, 'Mã nhân viên đã tốn tại.', 1;

	IF @NgaySinh >= GETDATE()
            THROW 51005, 'Ngày sinh phải nhỏ hơn ngày hiện tại.', 1;

     IF DATEDIFF(YEAR, @NgaySinh, GETDATE()) < 18
            THROW 51000, 'Nhân viên phải trên 18 tuổi.', 1;

     IF @GioiTinh NOT IN ('M', 'F')
            THROW 51001, 'Giới tính không hợp lệ. Chỉ chấp nhận M hoặc F.', 1;

	IF PATINDEX('%[A-Za-z0-9._%+-]@[A-Za-z0-9.-]%.[A-Za-z]%', @Email) = 0
        THROW 51002, 'Email không hợp lệ.', 1;
    
	
	IF @SoDienThoai IS NOT NULL AND ( PATINDEX('%[^0-9]%', @SoDienThoai) > 0)
        THROW 51003, 'Số điện thoại  không được chứa chữ cái.', 1;
		
	IF EXISTS (SELECT * FROM NhanVien WHERE @Email = Email)
		THROW 51010, 'Email đã tốn tại.', 1;

	IF EXISTS (SELECT * FROM NhanVien WHERE @SoDienThoai = SoDienThoai)
		THROW 51009, 'Số điện thoại đã tốn tại.', 1;

	IF @LuongNhanVien IS NOT NULL AND @LuongNhanVien <= 0
         THROW 51004, 'Lương nhân viên phải lớn hơn 0.', 1;

	IF CAST(@KinhNghiem AS FLOAT) <= 2 AND @LuongNhanVien > 20e6                        
		THROW 51009, 'Nhân viên có ít hơn 2 năm kinh nghiệm có lương tối đa là 20 triệu.', 1;

        -- Thêm dữ liệu vào bảng
	INSERT INTO NhanVien(MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien, MaChiNhanh, LoaiNV, ChungChi, ChuyenMon, GiayPhepHanhNghe, TrinhDo, TinhTrang)
		VALUES (@MaNhanVien, @TenNhanVien, @NgaySinh, @GioiTinh, @Email, @SoDienThoai, @KinhNghiem, @LuongNhanVien, @MaChiNhanh, @LoaiNV, @ChungChi, @ChuyenMon, @GiayPhepHanhNghe, @TrinhDo, @TinhTrang);

        PRINT 'Thêm nhân viên thành công!';
    END TRY
    BEGIN CATCH
          -- Xử lý lỗi, xuất thông báo lỗi chi tiết
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

-- Procedure SuaNhanVien

CREATE PROCEDURE SuaNhanVien
    @MaNhanVien INT,
    @TenNhanVien NVARCHAR(100) = NULL,
    @NgaySinh DATE = NULL,
    @GioiTinh CHAR(1) = NULL,
    @Email NVARCHAR(50) = NULL,
    @SoDienThoai VARCHAR(11) = NULL,
    @KinhNghiem INT = NULL,
    @LuongNhanVien DECIMAL(10, 2) = NULL,
    @MaChiNhanh INT = NULL,
    @LoaiNV BIT = NULL,
    @ChungChi NVARCHAR(255) = NULL,
    @ChuyenMon NVARCHAR(15) = NULL,
    @GiayPhepHanhNghe NVARCHAR(8) = NULL,
    @TrinhDo NVARCHAR(1) = NULL,
	@TinhTrang NVARCHAR(99) = NULL
AS
BEGIN
    BEGIN TRY
        -- Check if employee exists
        IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNhanVien = @MaNhanVien)
            THROW 51010, 'Nhân viên không tồn tại.', 1;

        -- Validation logic
        IF @NgaySinh IS NOT NULL AND @NgaySinh >= GETDATE()
            THROW 51011, 'Ngày sinh phải nhỏ hơn ngày hiện tại.', 1;

        IF @NgaySinh IS NOT NULL AND DATEDIFF(YEAR, @NgaySinh, GETDATE()) < 18
            THROW 51012, 'Nhân viên phải trên 18 tuổi.', 1;

        IF @GioiTinh IS NOT NULL AND @GioiTinh NOT IN ('M', 'F')
            THROW 51013, 'Giới tính không hợp lệ. Chỉ chấp nhận M hoặc F.', 1;

        IF @Email IS NOT NULL AND PATINDEX('%[A-Za-z0-9._%+-]@[A-Za-z0-9.-]%.[A-Za-z]%', @Email) = 0
            THROW 51014, 'Email không hợp lệ.', 1;

	 IF @SoDienThoai IS NOT NULL AND ( PATINDEX('%[^0-9]%', @SoDienThoai) > 0)
            THROW 51015, 'Số điện thoại phải không được có chữ cái.', 1;
		
	IF EXISTS (SELECT * FROM NhanVien WHERE @Email = Email)
			THROW 51010, 'Email đã tốn tại.', 1;

	IF EXISTS (SELECT * FROM NhanVien WHERE @SoDienThoai = SoDienThoai)
			THROW 51009, 'Số điện thoại đã tốn tại.', 1;

        IF @LuongNhanVien IS NOT NULL AND @LuongNhanVien <= 0
            THROW 51016, 'Lương nhân viên phải lớn hơn 0.', 1;

        IF @KinhNghiem IS NOT NULL AND CAST(@KinhNghiem AS FLOAT) <= 2 AND @LuongNhanVien IS NOT NULL AND @LuongNhanVien > 20000000
            THROW 51018, 'Nhân viên có ít hơn 2 năm kinh nghiệm có lương tối đa là 20 triệu.', 1;

        -- Update only non-NULL fields
        UPDATE NhanVien
        SET
            TenNhanVien = ISNULL(@TenNhanVien, TenNhanVien),
            NgaySinh = ISNULL(@NgaySinh, NgaySinh),
            GioiTinh = ISNULL(@GioiTinh, GioiTinh),
            Email = ISNULL(@Email, Email),
            SoDienThoai = ISNULL(@SoDienThoai, SoDienThoai),
            KinhNghiem = ISNULL(@KinhNghiem, KinhNghiem),
            LuongNhanVien = ISNULL(@LuongNhanVien, LuongNhanVien),
            MaChiNhanh = ISNULL(@MaChiNhanh, MaChiNhanh),
            LoaiNV = ISNULL(@LoaiNV, LoaiNV),
            ChungChi = ISNULL(@ChungChi, ChungChi),
            ChuyenMon = ISNULL(@ChuyenMon, ChuyenMon),
            GiayPhepHanhNghe = ISNULL(@GiayPhepHanhNghe, GiayPhepHanhNghe),
            TrinhDo = ISNULL(@TrinhDo, TrinhDo),
			TinhTrang = ISNULL(@TinhTrang, TinhTrang)
        WHERE MaNhanVien = @MaNhanVien;

        PRINT 'Cập nhật nhân viên thành công!';
    END TRY
    BEGIN CATCH
        -- Handle errors
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;


-- XoaNhanVien

CREATE PROCEDURE XoaNhanVien
    @MaNhanVien INT  -- Mã nhân viên cần xóa

AS
BEGIN
    BEGIN TRY
        -- Kiểm tra xem nhân viên có tồn tại hay không
        IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNhanVien = @MaNhanVien)
            THROW 51010, 'Nhân viên không tồn tại trong hệ thống.', 1;
		
-- Thực hiện cập nhật tình trạng nhân viên
	UPDATE NhanVien
	SET TinhTrang = 'Đã nghỉ việc'
	WHERE MaNhanVien = @MaNhanVien
		
        PRINT 'Cập nhật nhân viên nghỉ việc thành công!';

    END TRY
    BEGIN CATCH
        -- Xử lý lỗi, xuất thông báo lỗi chi tiết
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

 --Trigger
-- Trigger 1: CapNhat_SoLuongNV
CREATE TRIGGER [dbo].[TR_CapNhat_SoLuongNV]
ON [dbo].[NhanVien]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Bảng tạm để ghi nhận thay đổi số lượng nhân viên
    DECLARE @ChiNhanh_Tang TABLE (MaChiNhanh INT, Tang INT);
    DECLARE @ChiNhanh_Giam TABLE (MaChiNhanh INT, Giam INT);

    -- **Thêm mới nhân viên** (TinhTrang = 'Đang làm việc')
    INSERT INTO @ChiNhanh_Tang(MaChiNhanh, Tang)
    SELECT 
        MaChiNhanh, 
        COUNT(*) AS Tang
    FROM inserted
    WHERE TinhTrang <> N'Đã nghỉ việc'
          AND NOT EXISTS (
              SELECT 1 FROM deleted d WHERE d.MaNhanVien = inserted.MaNhanVien
          ) -- Loại bỏ trường hợp cập nhật (chỉ thêm mới)
    GROUP BY MaChiNhanh;

    -- **Chuyển chi nhánh**
    INSERT INTO @ChiNhanh_Giam(MaChiNhanh, Giam)
    SELECT 
        d.MaChiNhanh, 
        COUNT(*) AS Giam
    FROM deleted d
    JOIN inserted i ON d.MaNhanVien = i.MaNhanVien
    WHERE d.MaChiNhanh <> i.MaChiNhanh
    GROUP BY d.MaChiNhanh;

    INSERT INTO @ChiNhanh_Tang(MaChiNhanh, Tang)
    SELECT 
        i.MaChiNhanh, 
        COUNT(*) AS Tang
    FROM deleted d
    JOIN inserted i ON d.MaNhanVien = i.MaNhanVien
    WHERE d.MaChiNhanh <> i.MaChiNhanh
    GROUP BY i.MaChiNhanh;

    -- **Nghỉ việc**
    INSERT INTO @ChiNhanh_Giam(MaChiNhanh, Giam)
    SELECT 
        d.MaChiNhanh, 
        COUNT(*) AS Giam
    FROM deleted d
    JOIN inserted i ON d.MaNhanVien = i.MaNhanVien
    WHERE i.TinhTrang = N'Đã nghỉ việc' AND d.TinhTrang <> N'Đã nghỉ việc'
    GROUP BY d.MaChiNhanh;

    -- **Cập nhật chi nhánh giảm**
    UPDATE ChiNhanh
    SET SoLuongNhanVien = SoLuongNhanVien - ISNULL(t.Giam, 0)
    FROM ChiNhanh c
    JOIN @ChiNhanh_Giam t ON c.MaChiNhanh = t.MaChiNhanh;

    -- **Cập nhật chi nhánh tăng**
    UPDATE ChiNhanh
    SET SoLuongNhanVien = SoLuongNhanVien + ISNULL(t.Tang, 0)
    FROM ChiNhanh c
    JOIN @ChiNhanh_Tang t ON c.MaChiNhanh = t.MaChiNhanh;

    SET NOCOUNT OFF;
END;

--  B. Trigger 2: TR_TinhDiemTichLuy

CREATE TRIGGER TR_TinhDiemTichLuy
ON DonHang
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Tăng điểm tích lũy khi trạng thái đơn hàng mới là "Đã thanh toán"
    UPDATE KhachHang
    SET DiemTichLuy = DiemTichLuy + ISNULL(CT.TongDiem, 0)
    FROM KhachHang
    INNER JOIN (
        SELECT MaKhachHang, SUM(CAST(TienThuoc AS INT) / 1000) AS TongDiem
        FROM inserted i
        WHERE i.TrangThaiDonHang = N'Đã thanh toán'
        GROUP BY MaKhachHang
    ) CT ON KhachHang.MaKhachHang = CT.MaKhachHang
    WHERE EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.MaKhachHang = KhachHang.MaKhachHang
        AND i.TrangThaiDonHang = N'Đã thanh toán'
    );
END;

-- 2.3 

-- 2.3 a) Lương nhân viên theo chi nhánh trên mức lương tối thiểu

IF OBJECT_ID('LuongNhanVienTheoChiNhanh', 'P') IS NOT NULL
    DROP PROCEDURE LuongNhanVienTheoChiNhanh;
GO

CREATE PROCEDURE LuongNhanVienTheoChiNhanh
    @LuongToiThieu DECIMAL(10, 2)
AS
BEGIN
    SELECT 
        CN.TenChiNhanh, 
        AVG(NV.LuongNhanVien) AS LuongTrungBinh, 
        COUNT(NV.MaNhanVien) AS SoLuongNhanVien
    FROM NhanVien NV
    JOIN ChiNhanh CN ON NV.MaChiNhanh = CN.MaChiNhanh
    GROUP BY CN.TenChiNhanh
    HAVING AVG(NV.LuongNhanVien) >= @LuongToiThieu
    ORDER BY LuongTrungBinh DESC;
END;

-- 2.3 b) Lấy ra bảng xếp hạng nhân viên xuất sắc
IF OBJECT_ID('BangXepHangNhanVien', 'P') IS NOT NULL
    DROP PROCEDURE BangXepHangNhanVien;
GO
CREATE PROCEDURE BangXepHangNhanVien
    @MaChiNhanh INT,
	@StartDate DATETIME,
	@EndDate DATETIME
AS
BEGIN
	SELECT TOP 10 NV.MaNhanVien, NV.TenNhanVien, COUNT(*) AS SoDonPhuTrach, SUM(HD.TongTien) AS DoanhThu
	FROM NhanVien NV
		JOIN ChiNhanh CN on NV.MaChiNhanh = CN.MaChiNhanh
		JOIN DonHang DH on DH.MaNhanVien = NV.MaNhanVien
		JOIN ChiTietHoaDon HD on HD.MaDonHang = DH.MaDonHang
	WHERE CN.MaChiNhanh = @MaChiNhanh 
		AND HD.ThoiGianXuatHoaDon BETWEEN @StartDate AND @EndDate
		AND NV.TinhTrang = ‘Đang làm việc’
	GROUP BY CN.MaChiNhanh, NV.MaNhanVien, NV.TenNhanVien
	ORDER BY DoanhThu DESC
END;

-- 2.3c)  Đánh giá khách hàng trên đơn hàng
IF OBJECT_ID(‘DanhGiaDonHang’, 'P') IS NOT NULL
    DROP PROCEDURE DanhGiaDonHang;
GO

CREATE PROCEDURE DanhGiaDonHang
    @MaKhachHang NVARCHAR(10)
AS
BEGIN
    SELECT 
	DH.Ngay,
	DH.NhanXet,
	DH.TienThuoc,
	DH.ToaThuoc,
	BG.SoLuong,
	DMSP.TenSanPham,
	DMSP.GiaBan,
	DMSP.DonViNhoNhat
    FROM KhachHang KH
    JOIN DonHang DH ON KH.MaKhachHang = DH.MaKhachHang
    JOIN BaoGom BG ON DH.MaDonHang = BG.MaDonHang
    JOIN DanhMucSanPham DMSP ON BG.MaSanPham = DMSP.MaSanPham
    WHERE KH.MaKhachHang = @MaKhachHang
    ORDER BY DH.Ngay ASC
END;

-- 2.4 HÀM
-- - - Hàm 1: Tính tổng tiền đơn hàng cuối cùng
CREATE PROCEDURE CalculateTotalAmount @MaDonHang NVARCHAR(10) AS BEGIN DECLARE @TienThuoc DECIMAL(10, 2),
@ChiPhiGiaoHang DECIMAL(10, 2),
@LoaiGiam NVARCHAR(10),
@GiaTriGiam DECIMAL(10, 2),
@TotalAmount DECIMAL(10, 2),
@TienKhuyenMai DECIMAL(10, 2);
SELECT
  @TienThuoc = TienThuoc
FROM
  DonHang
WHERE
  MaDonHang = @MaDonHang;
SELECT
  @ChiPhiGiaoHang = ChiPhiGiaoHang
FROM
  ChiTietDonHang
WHERE
  MaDonHang = @MaDonHang;
SELECT
  @LoaiGiam = LoaiGiam,
  @GiaTriGiam = GiaTriGiam
FROM
  ChuongTrinhKhuyenMai
WHERE
  MaKhuyenMai = (
	SELECT
  	MaKhuyenMai
	FROM
  	DonHang
	WHERE
  	MaDonHang = @MaDonHang
  );
IF @TienThuoc IS NULL
OR @ChiPhiGiaoHang IS NULL
OR @LoaiGiam IS NULL
OR @GiaTriGiam IS NULL BEGIN PRINT 'Thiếu dữ liệu của Mã đơn hàng: ' + @MaDonHang;
RETURN;
END IF @LoaiGiam = 'Phần Trăm' BEGIN
SET
  @TienKhuyenMai = @TienThuoc * @GiaTriGiam / 100;
END ELSE IF @LoaiGiam = 'Số Tiền' BEGIN
SET
  @TienKhuyenMai = @GiaTriGiam;
END IF @LoaiGiam = 'Phần Trăm' BEGIN
SET
  @TotalAmount = (@TienThuoc - @TienKhuyenMai) + @ChiPhiGiaoHang;
END ELSE IF @LoaiGiam = 'Số Tiền' BEGIN
SET
  @TotalAmount = @TienThuoc - @TienKhuyenMai + @ChiPhiGiaoHang;
END PRINT 'Mã đơn hàng: ' + @MaDonHang;
PRINT 'Tiền thuốc: ' + CAST(
  @TienThuoc AS NVARCHAR(20)
);
PRINT 'Chi phí giao hàng: ' + CAST(
  @ChiPhiGiaoHang AS NVARCHAR(20)
);
PRINT 'Tiền khuyến mãi: ' + CAST(
  @TienKhuyenMai AS NVARCHAR(20)
);
PRINT 'Tổng giá trị của đơn hàng: ' + CAST(
  @TotalAmount AS NVARCHAR(20)
);
END;
GO
--  - - Hàm 2: Xuất danh sách sản phẩm bán chạy
CREATE PROCEDURE SanPhamBanChay
@StartDate DATE,
@EndDate DATE
AS
BEGIN
	-- Truy vấn: Danh mục sản phẩm đã bán được
	SELECT
    	DanhMucSanPham.TenSanPham,
    	DanhMucSanPham.MaSanPham,
    	SUM(BaoGom.SoLuong) AS TongSoLuongDaBan,
    	DanhMucSanPham.GiaBan -- TongSoLuongDaBan là số sản phẩm đã bán được nếu đơn hàng đó mua cùng một loại sản phẩm.
	FROM BaoGom
	-- Join bảng BaoGom với DonHang [1] và JOIN bảng DanhMucSanPham với BaoGom [2]
	INNER JOIN DonHang ON DonHang.MaDonHang = BaoGom.MaDonHang -- [1]
	INNER JOIN DanhMucSanPham ON DanhMucSanPham.MaSanPham = BaoGom.MaSanPham -- [2]
	WHERE DonHang.Ngay BETWEEN @StartDate AND @EndDate
	AND DonHang.TrangThaiDonHang = N'Đã thanh toán' -- Điều kiện chỉ lấy đơn hàng đã thanh toán
	GROUP BY DanhMucSanPham.MaSanPham, DanhMucSanPham.TenSanPham, DanhMucSanPham.GiaBan
	ORDER BY TongSoLuongDaBan DESC;
END;
GO

