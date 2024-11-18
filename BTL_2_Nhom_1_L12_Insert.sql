use Medical

-----
-- Dữ liệu mẫu cho ChiNhanh
INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongDanhMucSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh)
VALUES 
(3, 101, 200, 20, 15, N'123 Lê Lợi, Quận 1, TP.HCM', N'Chi nhánh Lê Lợi'),
(4, 102, 150, 15, 10, N'45 Nguyễn Huệ, Quận 1, TP.HCM', N'Chi nhánh Nguyễn Huệ');
-- Dữ liệu mẫu cho NhanVien
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien, MaChiNhanh, ChungChi, ChuyenMon, GiayPhepHanhNghe, TrinhDo)
VALUES 
(103, N'Nguyễn Văn A', '1985-05-20', 'M', N'a.nguyen@gmail.com', '0912345678', N'5', 15000000.00, 1, N'Y', N'B', N'GP01', N'D'),
(104, N'Lê Thị C', '1990-08-15', 'F', N'b.le@gmail.com', '0923456789', N'3', 12000000.00, 2, N'N', N'A', N'GP02', N'C');
-- Dữ liệu mẫu cho NguoiPhuThuoc
INSERT INTO NguoiPhuThuoc (MaNguoiPhuThuoc, MaNhanVien, TenNguoiPhuThuoc, NgaySinh, GioiTinh, MoiQuanHe)
VALUES 
(1, 101, N'Nguyễn Văn C', '2010-06-01', 'M', N'Con'),
(2, 102, N'Lê Thị D', '2012-04-15', 'F', N'Con');

-- Dữ liệu mẫu cho KhuyenMai
INSERT INTO KhuyenMai (MaKhuyenMai, MaChiNhanh)
VALUES 
(N'KM01', 1),
(N'KM02', 2);

-- Dữ liệu mẫu cho ChuongTrinhKhuyenMai
INSERT INTO ChuongTrinhKhuyenMai (MaKhuyenMai, NgayBatDau, NgayKetThuc, MoTa, LoaiGiam, GiaTriGiam)
VALUES 
(N'KM01', '2024-11-01', '2024-11-30', N'Giảm giá 10% cho tất cả sản phẩm', 1, 10.00),
(N'KM02', '2024-12-01', '2024-12-31', N'Giảm trực tiếp 50,000 VND', 2, 50000.00);

-- Dữ liệu mẫu cho NhaCungCap
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi)
VALUES 
(N'NCC01', N'Công ty Dược A', N'456 Đống Đa, Đà Nẵng'),
(N'NCC02', N'Công ty Dược B', N'789 Phan Chu Trinh, Hà Nội');

-- Dữ liệu mẫu cho DanhMucSanPham
INSERT INTO DanhMucSanPham (MaSanPham, TenSanPham, DonViNhoNhat, MaNhaCungCap, SoLuong, GiaBan, MaChiNhanh)
VALUES 
(N'SP01', N'Paracetamol 500mg', N'Hộp', N'NCC01', 100, 20000.00, 1),
(N'SP02', N'Vitamin C', N'Hộp', N'NCC02', 50, 50000.00, 2);

-- Dữ liệu mẫu cho Ban
INSERT INTO Ban (MaSanPham, MaChiNhanh)
VALUES 
(N'SP01', 1),
(N'SP02', 2);

-- Dữ liệu mẫu cho KhachHang
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SoNha, TenDuong, SoDienThoai, MaGioiThieu, DiemTichLuy, Tinh)
VALUES 
(N'KH01', N'Nguyễn Minh E', N'12', N'Lê Lợi', N'0987654321', NULL, 200, N'TP.HCM'),
(N'KH02', N'Lê Văn F', N'34', N'Nguyễn Huệ', N'0987654322', NULL, 300, N'TP.HCM');

-- Dữ liệu mẫu cho DonHang
INSERT INTO DonHang (MaDonHang, ToaThuoc, TienThuoc, MaKhachHang, MaNhanVien)
VALUES 
(N'DH01', N'Toa thuốc số 1', 100000.00, N'KH01', 101),
(N'DH02', N'Toa thuốc số 2', 200000.00, N'KH02', 102);

-- Dữ liệu mẫu cho DonViGiaoHang
INSERT INTO DonViGiaoHang (MaDonVi, TenDonVi)
VALUES 
(N'DVGH01', N'Giao hàng nhanh'),
(N'DVGH02', N'Giao hàng tiết kiệm');

-- Dữ liệu mẫu cho ChiTietDonHang
INSERT INTO ChiTietDonHang (MaVanDon, TinhTrang, DiaChiDonHang, MaDonViVanChuyen, ChiPhiGiaoHang)
VALUES 
(N'VD01', N'Đang giao', N'123 Lê Lợi, TP.HCM', N'DVGH01', 30000.00),
(N'VD02', N'Hoàn tất', N'45 Nguyễn Huệ, TP.HCM', N'DVGH02', 25000.00);

-- Dữ liệu mẫu cho ChiTietHoaDon
INSERT INTO ChiTietHoaDon (MaHoaDon, SoTienKhuyenMai, ApDungKhuyenMai, ThoiGianXuatHoaDon, TongTien)
VALUES 
(N'HD01', 10000.00, 1, '2024-11-15 14:00:00', 90000.00),
(N'HD02', 5000.00, 1, '2024-11-16 10:30:00', 195000.00);

-- Dữ liệu mẫu cho ThanhToan
INSERT INTO ThanhToan (MaDonHang, MaChiNhanh, MaKhachHang)
VALUES 
(N'DH01', 1, N'KH01'),
(N'DH02', 2, N'KH02');
