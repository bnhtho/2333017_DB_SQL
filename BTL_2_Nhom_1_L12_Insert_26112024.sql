-- Dữ liệu cho bảng ChiNhanh
USE Medical
INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongDanhMucSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh) 
VALUES 
(1, 1001, 50, 5, 10, N'Quận 1, TP.HCM', N'Chi Nhánh 1'),
(2, 1002, 30, 4, 8, N'Quận 3, TP.HCM', N'Chi Nhánh 2'),
(3, 1003, 40, 6, 12, N'Quận 5, TP.HCM', N'Chi Nhánh 3'),
(4, 1004, 60, 7, 15, N'Quận 10, TP.HCM', N'Chi Nhánh 4'),
(5, 1005, 70, 8, 20, N'Quận 7, TP.HCM', N'Chi Nhánh 5');
SELECT * FROM ChiNhanh
-- Dữ liệu cho bảng NhanVien
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien, MaChiNhanh, LoaiNV, ChungChi, ChuyenMon, GiayPhepHanhNghe, TrinhDo, TinhTrang) 
VALUES 
(1001, N'Nguyễn Văn A', '1990-05-15', 'M', N'vana@abc.com', '0987654321', '2', 10000, 1, 1, N'Đại học', N'Tin học', N'GP1234', N'A', N'Đang làm việc'),
(1002, N'Trần Thị B', '1988-04-20', 'F', N'tranhb@xyz.com', '0987123456', '3', 12000, 2, 1, N'Cao đẳng', N'Kế toán', N'GP1235', N'B', N'Đang làm việc'),
(1003, N'Lê Minh C', '1985-02-10', 'M', N'leminhc@abc.com', '0976543210', '5', 15000, 3, 0, N'Thạc sĩ', N'Quản lý', N'GP1236', N'C', N'Đã nghỉ việc'),
(1004, N'Phan Thị G', '1992-01-10', 'F', N'phang@abc.com', '0978123456','3', 13000, 4, 1, N'Cao đẳng', N'Kế toán', N'GP1237', N'C', N'Đang làm việc'),
(1005, N'Vũ Đức H', '1989-12-05', 'M', N'vudh@xyz.com', '0967432189', '4', 14000, 5, 0, N'Thạc sĩ', N'Quản lý', N'GP1238', N'A', N'Đang làm việc');

-- Dữ liệu cho bảng NguoiPhuThuoc
INSERT INTO NguoiPhuThuoc (MaNguoiPhuThuoc, MaNhanVien, TenNguoiPhuThuoc, NgaySinh, GioiTinh, MoiQuanHe) 
VALUES 
(1, 1001, N'Nguyễn Thị D', '1992-09-01', 'F', N'Mẹ'),
(2, 1001, N'Nguyễn Văn E', '1994-10-12', 'M', N'Anh'),
(3, 1002, N'Trần Thị F', '1995-11-23', 'F', N'Em'),
(4, 1003, N'Lê Minh G', '1990-11-18', 'F', N'Mẹ'),
(5, 1004, N'Phan Thị H', '1991-06-15', 'F', N'Chị');

-- Dữ liệu cho bảng KhuyenMai
INSERT INTO KhuyenMai (MaKhuyenMai, MaChiNhanh) 
VALUES 
(N'KM001', 1),
(N'KM002', 2),
(N'KM003', 3),
(N'KM004', 4),
(N'KM005', 5);

-- Dữ liệu cho bảng ChuongTrinhKhuyenMai
INSERT INTO ChuongTrinhKhuyenMai (MaKhuyenMai, NgayBatDau, NgayKetThuc, MoTa, LoaiGiam, GiaTriGiam) 
VALUES 
(N'KM001', '2024-11-01', '2024-11-30', N'Khuyến mãi tháng 11', N'Phần trăm', 10),
(N'KM002', '2024-11-10', '2024-11-20', N'Giảm giá nhân viên', N'Số tiền', 50000),
(N'KM003', '2024-11-05', '2024-11-15', N'Khuyến mãi cuối tuần', N'Phần trăm', 5),
(N'KM004', '2024-11-15', '2024-11-25', N'Khuyến mãi đặc biệt', N'Số tiền', 100000),
(N'KM005', '2024-11-01', '2024-11-20', N'Giảm giá cho khách hàng mới', N'Phần trăm', 15);

-- Dữ liệu cho bảng NhaCungCap
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi) 
VALUES 
(N'NCC001', N'Công ty ABC', N'TP.HCM'),
(N'NCC002', N'Công ty XYZ', N'Hà Nội'),
(N'NCC003', N'Công ty DEF', N'Đà Nẵng'),
(N'NCC004', N'Công ty GHI', N'Hải Phòng'),
(N'NCC005', N'Công ty JKL', N'TP.HCM');

-- Dữ liệu cho bảng DanhMucSanPham
INSERT INTO DanhMucSanPham (MaSanPham, TenSanPham, DonViNhoNhat, MaNhaCungCap, SoLuong, GiaBan, MaChiNhanh) 
VALUES 
(N'SP001', N'Thuốc A', N'Hộp', N'NCC001', 100, 50000, 1),
(N'SP002', N'Thuốc B', N'Hộp', N'NCC002', 200, 30000, 2),
(N'SP003', N'Thuốc C', N'Chai', N'NCC003', 150, 45000, 3),
(N'SP004', N'Thuốc D', N'Hộp', N'NCC004', 120, 60000, 4),
(N'SP005', N'Thuốc E', N'Chai', N'NCC005', 90, 55000, 5);

-- Dữ liệu cho bảng Ban
INSERT INTO Ban (MaSanPham, MaChiNhanh) 
VALUES 
(N'SP001', 1),
(N'SP001', 2),
(N'SP002', 1),
(N'SP003', 3),
(N'SP004', 4),
(N'SP005', 5);

-- Dữ liệu cho bảng KhachHang
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SoNha, TenDuong, Tinh, SoDienThoai, MaGioiThieu, DiemTichLuy) 
VALUES 
(N'KH001', N'Nguyễn Văn D', N'Số 12', N'Đường A', N'TP.HCM', N'0987654321', N'KH002', 100),
(N'KH002', N'Trần Thị E', N'Số 25', N'Đường B', N'Hà Nội', N'0976543210', NULL, 200),
(N'KH003', N'Nguyễn Hoàng K', N'Số 45', N'Đường C', N'TP.HCM', N'0901234567', N'KH004', 50),
(N'KH004', N'Trần Ngọc L', N'Số 12', N'Đường D', N'Hà Nội', N'0907654321', NULL, 150),
(N'KH005', N'Phan Thị M', N'Số 30', N'Đường E', N'TP.HCM', N'0912345678', N'KH006', 120);

-- Dữ liệu cho bảng KhachHangSDT
INSERT INTO KhachHangSDT (MaKhachHang, SoDienThoai) 
VALUES 
(N'KH001', N'0987654321'),
(N'KH002', N'0976543210'),
(N'KH003', N'0901234567'),
(N'KH004', N'0907654321'),
(N'KH005', N'0912345678');
-- Dữ liệu cho bảng DonViGiaoHang
INSERT INTO DonViGiaoHang (MaDonVi, TenDonVi) 
VALUES 
(N'DV001', N'Giao Hàng Tiết Kiệm'),
(N'DV002', N'Giao Hàng Nhanh');
-- Dữ liệu cho bảng DonHang
INSERT INTO DonHang (MaDonHang, ToaThuoc, TienThuoc, Ngay, NhanXet, MaKhachHang, MaNhanVien, TrangThaiDonHang, MaKhuyenMai) 
VALUES 
(N'DH001', N'Thuốc A, Thuốc B', 80000, '2024-11-01', N'Tốt', N'KH001', 1001, N'Chưa thanh toán', N'KM001'),
(N'DH002', N'Thuốc C, Thuốc D', 100000, '2024-11-02', N'Tốt', N'KH002', 1002, N'Đã thanh toán', N'KM002'),
(N'DH003', N'Thuốc A, Thuốc B', 80000, '2024-11-05', N'Chất lượng tốt', N'KH003', 1004, N'Chưa thanh toán', N'KM003'),
(N'DH004', N'Thuốc B', 30000, '2024-11-06', N'Tốt', N'KH004', 1005, N'Đã thanh toán', N'KM004'),
(N'DH005', N'Thuốc A, Thuốc B, Thuốc C', 120000, '2024-11-07', N'Nhận hàng nhanh chóng', N'KH003', 1004, N'Chưa thanh toán', N'KM005');


-- Dữ liệu cho bảng ChiTietDonHang
INSERT INTO ChiTietDonHang (MaVanDon, TinhTrang, DiaChiDonHang, MaDonViVanChuyen, ChiPhiGiaoHang, MaDonHang) 
VALUES 
(N'VD001', N'Đang giao', N'Số 12 Đường A, TP.HCM', N'DV001', 20000, N'DH001'),
(N'VD002', N'Đã giao', N'Số 25 Đường B, Hà Nội', N'DV002', 15000, N'DH002'),
(N'VD003', N'Đang giao', N'Số 45 Đường C, TP.HCM', N'DV001', 25000, N'DH003'),
(N'VD004', N'Đã giao', N'Số 12 Đường D, Hà Nội', N'DV002', 10000, N'DH004'),
(N'VD005', N'Đang giao', N'Số 30 Đường E, TP.HCM', N'DV001', 15000, N'DH005');

-- Dữ liệu cho bảng ChiTietHoaDon
INSERT INTO ChiTietHoaDon (MaHoaDon, SoTienKhuyenMai, ThoiGianXuatHoaDon, TongTien, MaDonHang) 
VALUES 
(N'HD001', 5000, '2024-11-01 10:00', 75000, N'DH001'),
(N'HD002', 10000, '2024-11-02 14:00', 90000, N'DH002'),
(N'HD003', 5000, '2024-11-05 15:00', 75000, N'DH003'),
(N'HD004', 3000, '2024-11-06 16:00', 27000, N'DH004'),
(N'HD005', 6000, '2024-11-07 14:00', 114000, N'DH005');

-- Dữ liệu cho bảng ThanhToan
INSERT INTO ThanhToan (MaDonHang, MaChiNhanh, MaKhachHang) 
VALUES 
(N'DH001', 1, N'KH001'),
(N'DH002', 2, N'KH002'),
(N'DH003', 3, N'KH003'),
(N'DH004', 4, N'KH004'),
(N'DH005', 5, N'KH003');

-- Dữ liệu cho bảng BaoGom
INSERT INTO BaoGom (MaSanPham, MaDonHang, SoLuong) 
VALUES 
(N'SP001', N'DH001', 2),
(N'SP002', N'DH001', 1),
(N'SP003', N'DH001', 1),
(N'SP001', N'DH002', 3),
(N'SP002', N'DH002', 2),
(N'SP003', N'DH002', 1),
(N'SP001', N'DH003', 1),
(N'SP002', N'DH003', 2),
(N'SP003', N'DH003', 1),
(N'SP001', N'DH004', 5),
(N'SP002', N'DH004', 3),
(N'SP003', N'DH004', 2),
(N'SP001', N'DH005', 4),
(N'SP002', N'DH005', 3),
(N'SP003', N'DH005', 2);
