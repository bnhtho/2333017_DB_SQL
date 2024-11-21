-- Theo đúng thứ tự
-- Chèn dữ liệu vào bảng ChiNhanh
INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongDanhMucSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh)
VALUES
(1, 1, 100, 10, 5, N'123 Đường ABC, Quận 1, TP.HCM', N'Chi Nhánh 1'),
(2, 2, 150, 15, 6, N'456 Đường DEF, Quận 2, TP.HCM', N'Chi Nhánh 2');

-- Chèn dữ liệu vào bảng NhanVien
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien, MaChiNhanh, LoaiNV, ChungChi, ChuyenMon, GiayPhepHanhNghe, TrinhDo)
VALUES
(1, N'Trần Văn A', '1985-03-12', 'M', N'a.tran@email.com', '0901234567', N'2', 10000.00, 1, 1, N'Y', N'Y', N'GP123456', N'D'),
(2, N'Nguyễn Thị B', '1990-07-22', 'F', N'b.nguyen@email.com', '0912345678', N'3', 12000.00, 2, 0, N'N', N'N', N'GP654321', N'C');

-- Chèn dữ liệu vào bảng NguoiPhuThuoc
INSERT INTO NguoiPhuThuoc (MaNguoiPhuThuoc, MaNhanVien, TenNguoiPhuThuoc, NgaySinh, GioiTinh, MoiQuanHe)
VALUES
(1, 1, N'Trần Thị A', '2010-05-15', 'F', N'Mẹ'),
(2, 2, N'Nguyễn Thị C', '2012-11-30', 'F', N'Con');

-- Chèn dữ liệu vào bảng KhuyenMai
INSERT INTO KhuyenMai (MaKhuyenMai, MaChiNhanh)
VALUES
(N'KM001', 1),
(N'KM002', 2);

-- Chèn dữ liệu vào bảng ChuongTrinhKhuyenMai
INSERT INTO ChuongTrinhKhuyenMai (MaKhuyenMai, NgayBatDau, NgayKetThuc, MoTa, LoaiGiam, GiaTriGiam)
VALUES
(N'KM001', '2024-11-01', '2024-11-30', N'Khuyến mãi tháng 11', 1, 10000.00),
(N'KM002', '2024-11-15', '2024-11-25', N'Khuyến mãi Black Friday', 2, 15.00);

-- Chèn dữ liệu vào bảng NhaCungCap
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi)
VALUES
(N'NC001', N'Công ty TNHH ABC', N'789 Đường GHI, TP.HCM'),
(N'NC002', N'Công ty TNHH XYZ', N'123 Đường JKL, TP.HCM');

-- Chèn dữ liệu vào bảng DanhMucSanPham
INSERT INTO DanhMucSanPham (MaSanPham, TenSanPham, DonViNhoNhat, MaNhaCungCap, SoLuong, GiaBan, MaChiNhanh)
VALUES
(N'SP001', N'Thuốc A', N'Viên', N'NC001', 500, 15000.00, 1),
(N'SP002', N'Thuốc B', N'Chai', N'NC002', 300, 25000.00, 2);

-- Chèn dữ liệu vào bảng Ban
INSERT INTO Ban (MaSanPham, MaChiNhanh)
VALUES
(N'SP001', 1),
(N'SP002', 2);

-- Chèn dữ liệu vào bảng KhachHang
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SoNha, TenDuong, Tinh, SoDienThoai, MaGioiThieu, DiemTichLuy)
VALUES
(N'KH001', N'Nguyễn Văn X', N'123', N'Đường ABC', N'TP.HCM', N'0901234567', N'0912345678', 100),
(N'KH002', N'Phạm Thị Y', N'456', N'Đường DEF', N'TP.HCM', N'0912345678', NULL, 150);

-- Chèn dữ liệu vào bảng KhachHangSDT
INSERT INTO KhachHangSDT (MaKhachHang, SoDienThoai)
VALUES
(N'KH001', N'0901234567'),
(N'KH002', N'0912345678');

-- Chèn dữ liệu vào bảng DonHang
INSERT INTO DonHang (MaDonHang, ToaThuoc, TienThuoc, Ngay, NhanXet, MaKhachHang, MaNhanVien)
VALUES
(N'DH001', N'Toa thuốc cho KH001', 200000.00, '2024-11-20', N'Khách hàng hài lòng', N'KH001', 1),
(N'DH002', N'Toa thuốc cho KH002', 300000.00, '2024-11-21', N'Khách hàng vui vẻ', N'KH002', 2);

-- Chèn dữ liệu vào bảng DonViGiaoHang
INSERT INTO DonViGiaoHang (MaDonVi, TenDonVi)
VALUES
(N'DV001', N'Giao Hàng Nhanh'),
(N'DV002', N'Viettel Post');

-- Chèn dữ liệu vào bảng ChiTietDonHang
INSERT INTO ChiTietDonHang (MaVanDon, TinhTrang, DiaChiDonHang, MaDonViVanChuyen, ChiPhiGiaoHang)
VALUES
(N'VD001', N'Đang giao', N'123 Đường ABC, TP.HCM', N'DV001', 30000.00),
(N'VD002', N'Đã giao', N'456 Đường DEF, TP.HCM', N'DV002', 20000.00);

-- Chèn dữ liệu vào bảng ChiTietHoaDon
INSERT INTO ChiTietHoaDon (MaHoaDon, SoTienKhuyenMai, ApDungKhuyenMai, ThoiGianXuatHoaDon, TongTien)
VALUES
(N'HD001', 10000.00, 1, '2024-11-20 10:30:00', 190000.00),
(N'HD002', 15000.00, 1, '2024-11-21 14:00:00', 285000.00);

-- Chèn dữ liệu vào bảng ThanhToan
INSERT INTO ThanhToan (MaDonHang, MaChiNhanh, MaKhachHang)
VALUES
(N'DH001', 1, N'KH001'),
(N'DH002', 2, N'KH002');

-- Chèn dữ liệu vào bảng BaoGom
INSERT INTO BaoGom (MaSanPham, MaDonHang, SoLuong)
VALUES
(N'SP001', N'DH001', 2),
(N'SP002', N'DH002', 3);
