SELECT * FROM ChiNhanh
SELECT * FROM NhanVien

--Thêm nhân viên để kiểm tra trigger cập nhật số lượng nhân viên
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien, MaChiNhanh, LoaiNV, ChungChi, ChuyenMon, GiayPhepHanhNghe, TrinhDo, TinhTrang) 
VALUES 
(1047, N'Phan Văn C', '1992-03-10', 'M', N'phanvc@abc.com', '0988000000', 1, 15000, 1, 0, N'CK 2', N'Nội tiết', NULL, NULL, N'Đang làm việc'),
(1048, N'Lê Minh D', '1990-06-20', 'M', N'leminhd@abc.com', '0988111222', 2, 12000, 1, 1, N'CK 1', N'Tiêu hóa', NULL, NULL, N'Đang làm việc'),
(1049, N'Nguyễn Thị E', '1987-12-05', 'F', N'nguyenthie@abc.com', '0988222333', 3, 18000, 2, 0, N'CK 2', N'Hô hấp', NULL, NULL, N'Đang làm việc'),
(1050, N'Trần Văn F', '1982-09-15', 'M', N'tranvanf@abc.com', '0988333444', 5, 22000, 3, 1, N'CK 2', N'Ngoại khoa', NULL, NULL, N'Đang làm việc');

--Thay đổi tình trạng làm việc
UPDATE NhanVien
SET TinhTrang = N'Đã nghỉ việc'
WHERE MaNhanVien = 1043;


-----------------------------------------------------------
SELECT * FROM DonHang
SELECT * FROM KhachHang

--Thay đổi mã chi nhánh
UPDATE NhanVien
SET MaChiNhanh = 7
WHERE MaNhanVien = 1050;


SELECT * FROM DonHang
SELECT * FROM KhachHang
select * from ChuongTrinhKhuyenMai
--Thêm đơn hàng để kiểm tra điểm tích lũy
INSERT INTO DonHang (MaDonHang, ToaThuoc, TienThuoc, Ngay, NhanXet, MaKhachHang, MaNhanVien, TrangThaiDonHang, MaKhuyenMai) 
VALUES 
(N'DH041', N'Thuốc A, Thuốc B', 90000, '2024-12-03', N'Chất lượng tốt', N'KH001', 1011, N'Chưa thanh toán', N'KM001'),  -- Chưa thanh toán
(N'DH042', N'Thuốc C, Thuốc D', 100000, '2024-12-04', N'Nhận hàng nhanh chóng', N'KH001', 1012, N'Đã thanh toán', N'KM002'),  -- Đã thanh toán
(N'DH043', N'Thuốc E', 60000, '2024-12-05', N'Phục vụ tốt', N'KH002', 1013, N'Chưa thanh toán', N'KM003'),  -- Chưa thanh toán
(N'DH044', N'Thuốc F', 75000, '2024-12-06', N'Giá cả hợp lý', N'KH003', 1014, N'Đã thanh toán', N'KM004'),  -- Đã thanh toán
(N'DH045', N'Thuốc G, Thuốc H', 85000, '2024-12-07', N'Chất lượng đảm bảo', N'KH004', 1015, N'Chưa thanh toán', N'KM005');  -- Chưa thanh toán
--Thay tình trạng đơn hàng
UPDATE DonHang
SET TrangThaiDonHang = N'Đã thanh toán'
WHERE MaDonHang IN (N'DH031', N'DH033', N'DH035');
—---------------------------------------------------------------------------------------
-- Procedure 2.1
-- ThemNhanVien
-- Trường hợp 1: Thêm nhân viên mới thành công

EXEC ThemNhanVien
    @MaNhanVien = 102,
    @TenNhanVien = N'Phạm Thị Hân',
    @NgaySinh = '1992-08-20',
    @GioiTinh = 'F',
    @Email = N'phamthihan@gmail.com',
    @SoDienThoai = '0987654325',
    @KinhNghiem = 3,
    @LuongNhanVien = 12000000,
    @MaChiNhanh = 1,
    @LoaiNV = 0,  -- Assuming 0 means doctor
    @ChungChi = N'Đại học',
    @ChuyenMon = N'Tim mạch',
    @GiayPhepHanhNghe = N'GP654321',
    @TrinhDo = NULL,
    @TinhTrang = N'Đang làm việc';


-- Thông báo lỗi emal đã tồn tại
EXEC ThemNhanVien
    @MaNhanVien = 105,
    @TenNhanVien = N'Nguyễn Hồng Nhung',
    @NgaySinh = '1993-12-10',
    @GioiTinh = 'F',
    @Email = N'nguyenthinhung0420@gmail.com',  -- Existing email
    @SoDienThoai = '0912345678',
    @KinhNghiem = 4,
    @LuongNhanVien = 13000000,
    @MaChiNhanh = 1,
    @LoaiNV = 0,  -- Bác sĩ
    @ChungChi =N'Đại học',
    @ChuyenMon = N'Da liễu',
    @GiayPhepHanhNghe = N'GP987654',
    @TrinhDo = NULL ,
    @TinhTrang = N'Đang làm việc';


--  Số điện thoại không hợp lệ
EXEC ThemNhanVien
    @MaNhanVien = 106,
    @TenNhanVien = N'Trần Văn Bình',
    @NgaySinh = '1995-08-25',
    @GioiTinh = 'M',
    @Email = N'tranvanbinh@example.com',  -- New email
    @SoDienThoai = '098765a4321',
    @KinhNghiem = 3,
    @LuongNhanVien = 15e6,
    @MaChiNhanh = 2,
    @LoaiNV = 0,  -- Bac sĩ
    @ChungChi = N'Đại Học',
    @ChuyenMon = N'Ngoại khoa',
    @GiayPhepHanhNghe = N'GP456123',
    @TrinhDo = NULL,
    @TinhTrang = N'Đang làm việc';


-- Nhân viên có ít hơn 2 năm kinh nghiệm có lương không vượt quá 20 triệu
EXEC ThemNhanVien
    @MaNhanVien = 105,
    @TenNhanVien = N'Nguyễn Thị Lan',
    @NgaySinh = '2001-03-15',
    @GioiTinh = 'F',
    @Email = N'nguyenthilan@gmail.com',  -- New email
    @SoDienThoai = '0912345670',
    @KinhNghiem = 1,  -- 1 nam kinh nghiem
    @LuongNhanVien = 25e6,
    @MaChiNhanh = 1,
    @LoaiNV = 1,  -- Dược sĩ
    @ChungChi =N'Cao Đẳng',
    @ChuyenMon = N'Dược học',
    @GiayPhepHanhNghe = N'GP987654',
    @TrinhDo = NULL,
    @TinhTrang = N'Đang làm việc';


-- SuaNhanVien
EXEC SuaNhanVien
    @MaNhanVien = 4,
    @LuongNhanVien = 30e6,
    @KinhNghiem = 5;

-- Số điện thoại đã tồn tại
EXEC SuaNhanVien
    @MaNhanVien = 5,
	@SoDienThoai='0987654325';


-- XoaNhanVien
EXEC XoaNhanVien @MaNhanVien = 10
-- XoaNhanVien co mã nv không tồn tại

EXEC XoaNhanVien @MaNhanVien = 0

--2.3
--HÀM 1
EXEC LuongNhanVienTheoChiNhanh @LuongToiThieu = 7000.00
--HÀM 2
EXEC BangXepHangNhanVien 
    @MaChiNhanh = 1,  
    @StartDate = '2024-11-01 00:00:00',  
    @EndDate = '2024-11-30 23:59:59'
--HÀM 3
EXEC DanhGiaDonHang @MaKhachHang = 'KH001'


-- Hàm 2.4
--Hàm a
EXEC CalculateTotalAmount @MaDonHang = 'DH001';
--Hàm b
EXEC SanPhamBanChay '2024-01-01', '2024-01-31';