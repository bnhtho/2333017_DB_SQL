-- Thêm dữ liệu vào bảng ChiNhanh
INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongDanhMucSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh)
VALUES 
(1, 101, 100, 10, 50, N'123 Đường A, Quận 1, TP.HCM', N'Chi Nhánh 1'),
(2, 102, 120, 15, 60, N'456 Đường B, Quận 2, TP.HCM', N'Chi Nhánh 2');

-- Thêm dữ liệu vào bảng NhanVien
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien, MaChiNhanh, ChungChi, ChuyenMon, GiayPhepHanhNghe, TrinhDo)
VALUES 
(101, N'Nguyễn Văn A', '1990-01-01', 'M', N'van.a@example.com', '0901234567', N'10', 15000000, 1, N'Y', N'Y', N'12345678', N'D'),
(102, N'Nguyễn Thị B', '1992-02-02', 'F', N'thi.b@example.com', '0907654321', N'8', 12000000, 2, N'N', N'N', N'', N'C');

-- Thêm dữ liệu vào bảng NguoiPhuThuoc
INSERT INTO NguoiPhuThuoc (MaNguoiPhuThuoc, MaNhanVien, TenNguoiPhuThuoc, NgaySinh, GioiTinh, MoiQuanHe)
VALUES 
(1, 101, N'Nguyễn Văn C', '2010-01-01', 'M', N'Con'),
(2, 102, N'Nguyễn Văn D', '2000-05-05', 'M', N'Em');

-- Thêm dữ liệu vào bảng KhuyenMai
INSERT INTO KhuyenMai (MaKhuyenMai, MaChiNhanh)
VALUES 
(N'KM01', 1),
(N'KM02', 2);

-- Thêm dữ liệu vào bảng ChuongTrinhKhuyenMai
INSERT INTO ChuongTrinhKhuyenMai (MaKhuyenMai, NgayBatDau, NgayKetThuc, MoTa, LoaiGiam, GiaTriGiam)
VALUES 
(N'KM01', '2024-01-01', '2024-01-31', N'Giảm giá đầu năm', 1, 10.00),
(N'KM02', '2024-02-01', '2024-02-28', N'Giảm giá Tết', 2, 50000.00);

-- Thêm dữ liệu vào bảng NhaCungCap
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi)
VALUES 
(N'NCC01', N'Công ty A', N'123 Đường A, TP.HCM'),
(N'NCC02', N'Công ty B', N'456 Đường B, TP.HCM');

-- Thêm dữ liệu vào bảng DanhMucSanPham
INSERT INTO DanhMucSanPham (MaSanPham, TenSanPham, DonViNhoNhat, MaNhaCungCap, SoLuong, GiaBan, MaChiNhanh)
VALUES 
(N'SP01', N'Thuốc A', N'Hộp', N'NCC01', 50, 100000, 1),
(N'SP02', N'Thuốc B', N'Lọ', N'NCC02', 30, 200000, 2);

-- Thêm dữ liệu vào bảng Ban
INSERT INTO Ban (MaSanPham, MaChiNhanh)
VALUES 
(N'SP01', 1),
(N'SP02', 2);

-- Thêm dữ liệu vào bảng KhachHang
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SoNha, TenDuong, SoDienThoai, MaGioiThieu, DiemTichLuy, Tinh)
VALUES 
(N'KH01', N'Nguyễn Văn E', N'12', N'Nguyễn Trãi', '0912345678', NULL, 100, N'TP.HCM'),
(N'KH02', N'Nguyễn Thị F', N'34', N'Lý Tự Trọng', '0918765432', N'KH01', 200, N'TP.HCM');

-- Thêm dữ liệu vào bảng DonHang
INSERT INTO DonHang (MaDonHang, ToaThuoc, TienThuoc, Ngay, NhanXet, MaKhachHang, MaNhanVien)
VALUES 
(N'DH01', N'Thuốc A: 2 hộp', 200000, '2024-01-15', N'Giao hàng nhanh', N'KH01', 101),
(N'DH02', N'Thuốc B: 1 lọ', 200000, '2024-01-20', N'Dịch vụ tốt', N'KH02', 102);

-- Thêm dữ liệu vào bảng BaoGom
INSERT INTO BaoGom (MaSanPham, MaDonHang, SoLuong)
VALUES 
(N'SP01', N'DH01', 2),
(N'SP02', N'DH02', 1);






-- Đừng đụng vào!
-- Cập nhật khóa ngoại MaNhanVienQuanLy sau
ALTER TABLE ChiNhanh
ADD CONSTRAINT FK_ChiNhanh_NhanVien FOREIGN KEY (MaNhanVienQuanLy) REFERENCES NhanVien(MaNhanVien);

