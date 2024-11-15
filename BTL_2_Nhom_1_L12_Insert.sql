use Medical
-- Insert
-- Insert nhân viên
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, GioiTinh, Email, SoDienThoai, KinhNghiem, LuongNhanVien)
VALUES
(1, 'Nguyen Van A', '1980-05-15', 'M', 'nguyenvana@gmail.com', '0912345678', '2', 15000000),
(2, 'Tran Thi B', '1990-08-25', 'F', 'tranthib@gmail.com', '0987654321', '3', 18000000);

-- Insert bác sĩ
INSERT INTO BacSi (MaNhanVien, ChungChi, ChuyenMon)
VALUES
(1, 'A', 'T'),
(2, 'B', 'N');

-- Insert dược sĩ
INSERT INTO DuocSi (MaNhanVien, GiayPhepHanhNghe, TrinhDo)
VALUES
(1, 'GP123456', 'C'),
(2, 'GP987654', 'D');
INSERT INTO NguoiPhuThuoc (MaNguoiPhuThuoc, MaNhanVien, TenNguoiPhuThuoc, NgaySinh, GioiTinh, MoiQuanHe)
VALUES
(1, 1, 'Nguyen Thi Lan', '2015-06-25', 'F', 'Con'),
(2, 1, 'Nguyen Minh Hoang', '2010-02-10', 'M', 'Con'),
(3, 2, 'Tran Thi Bich', '2000-07-18', 'F', 'Chị')
-- Insert chi nhánh
INSERT INTO ChiNhanh (MaChiNhanh, MaNhanVienQuanLy, SoLuongSanPham, SoLuongNhanVien, DiaChi, TenChiNhanh)
VALUES
(1, 1, 200, 20, '123 Main St, Hanoi', 'Chi nhánh Hà Nội'),
(2, 2, 150, 15, '456 Tran Hung Dao, HCMC', 'Chi nhánh TP.HCM');

-- Insert khuyến mãi
INSERT INTO KhuyenMai (MaKhuyenMai, MaChiNhanh)
VALUES
('KM001', 1),
('KM002', 2);

-- Insert chương trình khuyến mãi
INSERT INTO ChuongTrinhKhuyenMai (MaKhuyenMai, MaChiNhanh, NgayBatDau, NgayKetThuc, MoTa, LoaiGiam, GiaTriGiam)
VALUES
('KM001', 1, '2024-11-01', '2024-12-31', 'Giảm giá 10% cho sản phẩm', 1, 10),
('KM002', 2, '2024-11-15', '2024-11-30', 'Giảm giá 20% cho đơn hàng trên 500k', 1, 20);

-- Insert nhà cung cấp
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi)
VALUES
('NCC001', 'Công ty Dược phẩm A', '1 Phan Chu Trinh, Hà Nội'),
('NCC002', 'Công ty Dược phẩm B', '2 Le Loi, TP.HCM');

-- Insert danh mục sản phẩm
INSERT INTO DanhMucSanPham (MaSanPham, TenSanPham, DonViNhoNhat, SoSaoTrungBinh, MaChiNhanh, MaNhaCungCap)
VALUES
('SP001', 'Thuốc giảm đau A', 'Hộp', 4, 1, 'NCC001'),
('SP002', 'Thuốc cảm cúm B', 'Vỉ', 5, 2, 'NCC002');
SELECT * FROM DanhMucSanPham
-- Insert khách hàng
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SoNha, TenDuong, SoDienThoai, MaGioiThieu, DiemTichLuy, Tinh)
VALUES
('KH001', 'Le Thi C', '12', 'Nguyen Hue', '0912345678', 'KH002', 500, 'Hanoi'),
('KH002', 'Pham Minh D', '34', 'Le Duan', '0987654321', NULL, 300, 'HCMC');

-- Insert đơn hàng
INSERT INTO DonHang (MaDonHang, ToaThuoc, TienThuoc)
VALUES
('DH001', 'Toa thuốc cho bệnh nhân A', 300000),
('DH002', 'Toa thuốc cho bệnh nhân B', 150000);

-- Insert đơn vị giao hàng
INSERT INTO DonViGiaoHang (MaDonVi, TenDonVi)
VALUES
('DV001', 'DHL Express'),
('DV002', 'VNPost');

-- Insert đánh giá sản phẩm
INSERT INTO DanhGia (MaDanhGia, MaKhachHang, NoiDungDanhGia, MaSanPham)
VALUES
('DG001', 'KH001', 'Sản phẩm rất tốt!', 'SP001'),
('DG002', 'KH002', 'Thuốc cảm cúm hiệu quả!', 'SP002');
SELECT * FROM DanhGia
-- Insert chi tiết đơn hàng
INSERT INTO ChiTietDonHang (MaVanDon, TinhTrang, DiaChiDonHang, MaDonViVanChuyen, ChiPhiGiaoHang)
VALUES
('VD001', 'Đang giao', '12 Nguyen Hue, Hanoi', 'DV001', 30000),
('VD002', 'Đã giao', '34 Le Duan, HCMC', 'DV002', 20000);

-- Insert chi tiết hóa đơn
INSERT INTO ChiTietHoaDon (MaHoaDon, SoTienKhuyenMai, ApDungKhuyenMai, ThoiGianXuatHoaDon, TongTien)
VALUES
('HD001', 30000, 1, '2024-11-15 10:00:00', 270000),
('HD002', 0, 0, '2024-11-15 11:00:00', 150000);
