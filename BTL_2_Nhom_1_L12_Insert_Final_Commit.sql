USE Medical
-- Chèn dữ liệu mẫu cho bảng ChiNhanh
INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongDanhMucSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh)
VALUES 
(1, 101, 200, 10, 50, N'12 Lý Thường Kiệt, Hà Nội', N'Chi nhánh Hà Nội'),
(2, 102, 150, 8, 35, N'25 Nguyễn Huệ, TP.HCM', N'Chi nhánh TP.HCM'),
(3, 103, 180, 9, 40, N'67 Trần Phú, Đà Nẵng', N'Chi nhánh Đà Nẵng'),
(4, 104, 120, 7, 30, N'98 Nguyễn Thị Minh Khai, Cần Thơ', N'Chi nhánh Cần Thơ'),
(5, 105, 100, 6, 20, N'45 Lý Thái Tổ, Hải Phòng', N'Chi nhánh Hải Phòng');

-- Chèn dữ liệu mẫu cho bảng NhanVien
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien, MaChiNhanh, LoaiNV, ChungChi, ChuyenMon, GiayPhepHanhNghe, TrinhDo, TinhTrang)
VALUES 
(101, N'Lê Văn Hùng', '1990-05-15', 'M', N'levanhung@gmail.com', '0987654321', '5', 15000000, 1, 1, N'Bác sĩ nội', N'Nội khoa', N'N12345', 'D', N'Đang làm việc'),
(102, N'Nguyễn Thị Hoa', '1992-11-20', 'F', N'nguyenthih@gmail.com', '0978321456', '7', 17000000, 2, 0, N'Y tá chuyên ngành', N'Nhi khoa', N'N45678', 'D', N'Đang làm việc'),
(103, N'Trần Quốc Toản', '1985-07-09', 'M', N'tranquoctoan@gmail.com', '0908321789', '10', 20000000, 3, 1, N'Dược sĩ cao cấp', N'Dược học', N'N78901', 'D', N'Đang làm việc'),
(104, N'Phạm Thanh Tùng', '1994-03-25', 'M', N'phamthanht@gmail.com', '0928734562', '3', 12000000, 4, 1, N'Chuyên viên điều dưỡng', N'Y học dự phòng', N'N23456', 'D', N'Đang làm việc'),
(105, N'Hoàng Thị Vân', '1990-08-10', 'F', N'hoangthiv@gmail.com', '0965347890', '8', 18000000, 5, 1, N'Bác sĩ ngoại', N'Ngoại khoa', N'N34567', 'D', N'Đang làm việc');

-- Chèn dữ liệu mẫu cho bảng NguoiPhuThuoc
INSERT INTO NguoiPhuThuoc (MaNguoiPhuThuoc, MaNhanVien, TenNguoiPhuThuoc, NgaySinh, GioiTinh, MoiQuanHe)
VALUES 
(1, 101, N'Lê Minh An', '2015-01-01', 'M', N'Con'),
(2, 102, N'Nguyễn Thùy Linh', '2018-09-12', 'F', N'Con'),
(3, 103, N'Trần Thị Thanh', '1960-11-11', 'F', N'Mẹ'),
(4, 104, N'Phạm Minh Tú', '2000-05-22', 'M', N'Em'),
(5, 105, N'Hoàng Quốc Khánh', '2013-03-15', 'M', N'Con');

-- Chèn dữ liệu mẫu cho bảng KhuyenMai
INSERT INTO KhuyenMai (MaKhuyenMai, MaChiNhanh)
VALUES 
(N'KM01', 1),
(N'KM02', 2),
(N'KM03', 3),
(N'KM04', 4),
(N'KM05', 5);

-- Chèn dữ liệu mẫu cho bảng ChuongTrinhKhuyenMai
INSERT INTO ChuongTrinhKhuyenMai (MaKhuyenMai, NgayBatDau, NgayKetThuc, MoTa, LoaiGiam, GiaTriGiam)
VALUES 
(N'KM01', '2024-01-01', '2024-01-31', N'Giảm giá tết', N'Phần trăm', 10),
(N'KM02', '2024-02-01', '2024-02-28', N'Khuyến mãi tháng 2', N'Số tiền', 200000),
(N'KM03', '2024-03-01', '2024-03-31', N'Giảm giá mùa xuân', N'Phần trăm', 15),
(N'KM04', '2024-04-01', '2024-04-30', N'Ưu đãi mùa hè', N'Số tiền', 300000),
(N'KM05', '2024-05-01', '2024-05-31', N'Giảm giá cuối mùa', N'Phần trăm', 20);

-- Chèn dữ liệu mẫu cho bảng NhaCungCap
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi)
VALUES 
(N'NCC01', N'Công ty Dược Hà Nội', N'123 Nguyễn Trãi, Hà Nội'),
(N'NCC02', N'Công ty Dược Sài Gòn', N'56 Cộng Hòa, TP.HCM'),
(N'NCC03', N'Công ty Dược Miền Trung', N'45 Lê Lợi, Đà Nẵng'),
(N'NCC04', N'Công ty Dược Cần Thơ', N'67 Lý Tự Trọng, Cần Thơ'),
(N'NCC05', N'Công ty Dược Hải Phòng', N'89 Tô Hiệu, Hải Phòng');

-- Chèn dữ liệu mẫu cho bảng DanhMucSanPham
INSERT INTO DanhMucSanPham (MaSanPham, TenSanPham, DonViNhoNhat, MaNhaCungCap, SoLuong, GiaBan, MaChiNhanh)
VALUES 
(N'SP01', N'Thuốc A', N'Viên', N'NCC01', 500, 15000, 1),
(N'SP02', N'Thuốc B', N'Viên', N'NCC02', 300, 20000, 2),
(N'SP03', N'Thuốc C', N'Hộp', N'NCC03', 100, 50000, 3),
(N'SP04', N'Thuốc D', N'Hộp', N'NCC04', 50, 70000, 4),
(N'SP05', N'Thuốc E', N'Viên', N'NCC05', 200, 10000, 5);



-- Chèn dữ liệu mẫu cho bảng Ban
INSERT INTO Ban (MaSanPham, MaChiNhanh)
VALUES 
(N'SP01', 1),
(N'SP02', 2),
(N'SP03', 3),
(N'SP04', 4),
(N'SP05', 5);

-- Chèn dữ liệu mẫu cho bảng KhachHang
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SoNha, TenDuong, Tinh, SoDienThoai, MaGioiThieu, DiemTichLuy)
VALUES 
(N'KH01', N'Trần Quốc Anh', N'12', N'Trần Hưng Đạo', N'Hà Nội', N'0987123456', NULL, 100),
(N'KH02', N'Lê Thị Bích Ngọc', N'56', N'Lê Duẩn', N'TP.HCM', N'0978567890', N'KH01', 200),
(N'KH03', N'Nguyễn Văn Nam', N'34', N'Phan Bội Châu', N'Đà Nẵng', N'0907345678', NULL, 150),
(N'KH04', N'Hoàng Minh Châu', N'78', N'Tôn Đức Thắng', N'Cần Thơ', N'0918123456', N'KH02', 300),
(N'KH05', N'Phạm Thu Hằng', N'90', N'Hải Phòng', N'Hải Phòng', N'0922345678', NULL, 250);

-- Chèn dữ liệu mẫu cho bảng KhachHangSDT
INSERT INTO KhachHangSDT (MaKhachHang, SoDienThoai)
VALUES 
(N'KH01', N'0987123456'),
(N'KH02', N'0978567890'),
(N'KH03', N'0907345678'),
(N'KH04', N'0918123456'),
(N'KH05', N'0922345678');

-- Chèn dữ liệu mẫu cho bảng DonHang
INSERT INTO DonHang (MaDonHang, ToaThuoc, TienThuoc, Ngay, NhanXet, MaKhachHang, MaNhanVien, TrangThaiDonHang, MaKhuyenMai)
VALUES 
(N'DH01', N'Toa A', 500000, '2024-01-05', N'Tốt', N'KH01', 101, N'Đã thanh toán', N'KM01'),
(N'DH02', N'Toa B', 300000, '2024-01-10', N'Bình thường', N'KH02', 102, N'Chưa thanh toán', NULL),
(N'DH03', N'Toa C', 700000, '2024-02-15', N'Tốt', N'KH03', 103, N'Đã thanh toán', N'KM02'),
(N'DH04', N'Toa D', 1000000, '2024-03-01', N'Xuất sắc', N'KH04', 104, N'Chưa thanh toán', NULL),
(N'DH05', N'Toa E', 250000, '2024-04-10', N'Không hài lòng', N'KH05', 105, N'Đã thanh toán', N'KM03');

-- Chèn dữ liệu mẫu cho bảng DonViGiaoHang
INSERT INTO DonViGiaoHang (MaDonVi, TenDonVi)
VALUES 
(N'DVG01', N'Giao hàng nhanh'),
(N'DVG02', N'Giao hàng tiết kiệm'),
(N'DVG03', N'Viettel Post'),
(N'DVG04', N'VNPost'),
(N'DVG05', N'J&T Express');

-- Chèn dữ liệu mẫu cho bảng ChiTietDonHang
INSERT INTO ChiTietDonHang (MaVanDon, TinhTrang, DiaChiDonHang, MaDonViVanChuyen, ChiPhiGiaoHang, MaDonHang)
VALUES 
(N'VD01', N'Đã giao', N'12 Trần Hưng Đạo, Hà Nội', N'DVG01', 50000, N'DH01'),
(N'VD02', N'Đang giao', N'56 Lê Duẩn, TP.HCM', N'DVG02', 45000, N'DH02'),
(N'VD03', N'Đã giao', N'34 Phan Bội Châu, Đà Nẵng', N'DVG03', 60000, N'DH03'),
(N'VD04', N'Đã hủy', N'78 Tôn Đức Thắng, Cần Thơ', N'DVG04', 40000, N'DH04'),
(N'VD05', N'Đã giao', N'90 Hải Phòng, Hải Phòng', N'DVG05', 55000, N'DH05');
-- Chèn dữ liệu mẫu cho bảng ChiTietHoaDon
INSERT INTO ChiTietHoaDon (MaHoaDon, SoTienKhuyenMai, ThoiGianXuatHoaDon, TongTien, MaDonHang)
VALUES 
(N'HD01', 50000, '2024-01-05 10:30:00', 450000, N'DH01'),
(N'HD02', 0, '2024-01-10 15:00:00', 300000, N'DH02'),
(N'HD03', 100000, '2024-02-15 14:00:00', 600000, N'DH03'),
(N'HD04', 0, '2024-03-01 16:45:00', 1000000, N'DH04'),
(N'HD05', 50000, '2024-04-10 09:00:00', 200000, N'DH05');

-- Chèn dữ liệu mẫu cho bảng ThanhToan
INSERT INTO ThanhToan (MaDonHang, MaChiNhanh, MaKhachHang)
VALUES 
(N'DH01', 1, N'KH01'),
(N'DH02', 2, N'KH02'),
(N'DH03', 3, N'KH03'),
(N'DH04', 4, N'KH04'),
(N'DH05', 5, N'KH05');

-- Chèn dữ liệu mẫu cho bảng BaoGom
INSERT INTO BaoGom (MaSanPham, MaDonHang, SoLuong)
VALUES 
(N'SP01', N'DH01', 10),
(N'SP02', N'DH02', 5),
(N'SP03', N'DH03', 7),
(N'SP04', N'DH04', 20),
(N'SP05', N'DH05', 15);