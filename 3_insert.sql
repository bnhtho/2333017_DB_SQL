ALTER TABLE Ban NOCHECK CONSTRAINT fk_ban_masanpham
ALTER TABLE Ban NOCHECK CONSTRAINT fk_ban_machinhanh
INSERT INTO dbo.Ban (MaSanPham,MaChiNhanh) VALUES
	 ('SP001',1),
	 ('SP008',1),
	 ('SP015',1),
	 ('SP021',1),
	 ('SP027',1),
	 ('SP031',1),
	 ('SP036',1),
	 ('SP041',1),
	 ('SP046',1),
	 ('SP051',1);
INSERT INTO dbo.Ban (MaSanPham,MaChiNhanh) VALUES
	 ('SP056',1),
	 ('SP002',2),
	 ('SP009',2),
	 ('SP016',2),
	 ('SP022',2),
	 ('SP026',2),
	 ('SP032',2),
	 ('SP037',2),
	 ('SP042',2),
	 ('SP047',2);
INSERT INTO dbo.Ban (MaSanPham,MaChiNhanh) VALUES
	 ('SP052',2),
	 ('SP057',2),
	 ('SP003',3),
	 ('SP010',3),
	 ('SP017',3),
	 ('SP023',3),
	 ('SP028',3),
	 ('SP033',3),
	 ('SP038',3),
	 ('SP043',3);
INSERT INTO dbo.Ban (MaSanPham,MaChiNhanh) VALUES
	 ('SP048',3),
	 ('SP053',3),
	 ('SP058',3),
	 ('SP004',4),
	 ('SP011',4),
	 ('SP018',4),
	 ('SP024',4),
	 ('SP030',4),
	 ('SP034',4),
	 ('SP039',4);
INSERT INTO dbo.Ban (MaSanPham,MaChiNhanh) VALUES
	 ('SP044',4),
	 ('SP049',4),
	 ('SP054',4),
	 ('SP059',4),
	 ('SP005',5),
	 ('SP012',5),
	 ('SP019',5),
	 ('SP025',5),
	 ('SP029',5),
	 ('SP035',5);
INSERT INTO dbo.Ban (MaSanPham,MaChiNhanh) VALUES
	 ('SP040',5),
	 ('SP045',5),
	 ('SP050',5),
	 ('SP055',5),
	 ('SP060',5),
	 ('SP006',6),
	 ('SP013',6),
	 ('SP020',6),
	 ('SP007',7),
	 ('SP014',7);

ALTER TABLE Ban CHECK CONSTRAINT fk_ban_masanpham
ALTER TABLE Ban CHECK CONSTRAINT fk_ban_machinhanh
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE BaoGom NOCHECK CONSTRAINT fk_baogom_ma_sp
ALTER TABLE BaoGom NOCHECK CONSTRAINT fk_baogom_ma_donhang
INSERT INTO dbo.BaoGom (MaSanPham,MaDonHang,SoLuong) VALUES
	 ('SP001','DH001',3),
	 ('SP001','DH017',4),
	 ('SP001','DH021',3),
	 ('SP001','DH022',4),
	 ('SP001','DH024',2),
	 ('SP001','DH025',3),
	 ('SP001','DH026',1),
	 ('SP001','DH028',5),
	 ('SP002','DH001',2),
	 ('SP002','DH018',3);
INSERT INTO dbo.BaoGom (MaSanPham,MaDonHang,SoLuong) VALUES
	 ('SP002','DH021',1),
	 ('SP002','DH023',1),
	 ('SP002','DH024',3),
	 ('SP002','DH027',1),
	 ('SP003','DH002',4),
	 ('SP003','DH019',2),
	 ('SP003','DH021',2),
	 ('SP003','DH023',4),
	 ('SP003','DH024',1),
	 ('SP003','DH027',2);
INSERT INTO dbo.BaoGom (MaSanPham,MaDonHang,SoLuong) VALUES
	 ('SP003','DH029',4),
	 ('SP004','DH003',2),
	 ('SP004','DH022',2),
	 ('SP004','DH027',3),
	 ('SP005','DH004',2),
	 ('SP005','DH019',1),
	 ('SP005','DH022',3),
	 ('SP005','DH026',2),
	 ('SP005','DH028',3),
	 ('SP006','DH005',5);
INSERT INTO dbo.BaoGom (MaSanPham,MaDonHang,SoLuong) VALUES
	 ('SP006','DH020',5),
	 ('SP006','DH023',2),
	 ('SP006','DH026',5),
	 ('SP007','DH005',3),
	 ('SP007','DH025',4),
	 ('SP007','DH028',2),
	 ('SP008','DH006',1),
	 ('SP008','DH025',2),
	 ('SP009','DH007',4),
	 ('SP010','DH008',2);
INSERT INTO dbo.BaoGom (MaSanPham,MaDonHang,SoLuong) VALUES
	 ('SP011','DH009',1),
	 ('SP012','DH010',3),
	 ('SP013','DH003',3),
	 ('SP013','DH011',4),
	 ('SP015','DH011',2),
	 ('SP016','DH012',5),
	 ('SP017','DH013',3),
	 ('SP018','DH014',4),
	 ('SP019','DH015',3),
	 ('SP020','DH016',2);
ALTER TABLE BaoGom CHECK CONSTRAINT fk_baogom_ma_sp
ALTER TABLE BaoGom CHECK CONSTRAINT fk_baogom_ma_donhang
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO dbo.ChiNhanh (MaChiNhanh,MaNhanVienQuanLy,SoLuongSanPham,SoLuongDanhMucSanPham,SoLuongNhanVien,DiaChi,TenChiNhanh) VALUES
	 (1,1001,NULL,NULL,NULL,'Quận 1, TP.HCM','Chi Nhánh 1'),
	 (2,1019,NULL,NULL,NULL,'Quận 3, TP.HCM','Chi Nhánh 2'),
	 (3,1024,NULL,NULL,NULL,'Quận 5, TP.HCM','Chi Nhánh 3'),
	 (4,1030,NULL,NULL,NULL,'Quận 10, TP.HCM','Chi Nhánh 4'),
	 (5,1033,NULL,NULL,NULL,'Quận 7, TP.HCM','Chi Nhánh 5'),
	 (6,1039,NULL,NULL,NULL,'Quận 1, TP.HCM','Chi Nhánh 6'),
	 (7,1041,NULL,NULL,NULL,'Quận 8, TP.HCM','Chi Nhánh 7');

------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE ChiTietHoaDon NOCHECK CONSTRAINT fk_hoadon_donhang
INSERT INTO dbo.ChiTietHoaDon (MaHoaDon,SoTienKhuyenMai,ThoiGianXuatHoaDon,TongTien,MaDonHang) VALUES
	 ('HD001',5000.00,'2024-11-01 10:00:00',75000.00,'DH001'),
	 ('HD002',10000.00,'2024-11-01 14:00:00',90000.00,'DH002'),
	 ('HD003',5000.00,'2024-11-05 15:00:00',75000.00,'DH003'),
	 ('HD004',3000.00,'2024-11-05 16:00:00',27000.00,'DH004'),
	 ('HD005',6000.00,'2024-11-05 14:00:00',114000.00,'DH005'),
	 ('HD006',8000.00,'2024-11-05 10:00:00',82000.00,'DH006'),
	 ('HD007',2500.00,'2024-11-13 11:00:00',47500.00,'DH007'),
	 ('HD008',7500.00,'2024-11-19 12:00:00',67500.00,'DH008'),
	 ('HD009',6500.00,'2024-11-19 13:00:00',58500.00,'DH009'),
	 ('HD010',8500.00,'2024-11-19 14:00:00',76500.00,'DH010');
INSERT INTO dbo.ChiTietHoaDon (MaHoaDon,SoTienKhuyenMai,ThoiGianXuatHoaDon,TongTien,MaDonHang) VALUES
	 ('HD011',7000.00,'2024-08-13 10:00:00',63000.00,'DH011'),
	 ('HD012',4000.00,'2024-08-22 11:00:00',36000.00,'DH012'),
	 ('HD013',9500.00,'2024-08-22 12:00:00',85500.00,'DH013'),
	 ('HD014',3000.00,'2024-08-22 13:00:00',27000.00,'DH014'),
	 ('HD015',11000.00,'2024-08-22 14:00:00',99000.00,'DH015'),
	 ('HD016',6000.00,'2024-09-04 10:00:00',54000.00,'DH016'),
	 ('HD017',8000.00,'2024-09-04 11:00:00',72000.00,'DH017'),
	 ('HD018',4500.00,'2024-10-19 12:00:00',40500.00,'DH018'),
	 ('HD019',9500.00,'2024-10-10 13:00:00',85500.00,'DH019'),
	 ('HD020',10000.00,'2024-10-10 14:00:00',90000.00,'DH020');
INSERT INTO dbo.ChiTietHoaDon (MaHoaDon,SoTienKhuyenMai,ThoiGianXuatHoaDon,TongTien,MaDonHang) VALUES
	 ('HD021',8500.00,'2024-10-10 10:00:00',76500.00,'DH021'),
	 ('HD022',3000.00,'2024-10-10 11:00:00',27000.00,'DH022'),
	 ('HD023',9500.00,'2024-11-11 12:00:00',85500.00,'DH023'),
	 ('HD024',8000.00,'2024-11-11 13:00:00',72000.00,'DH024'),
	 ('HD025',5000.00,'2024-11-11 14:00:00',45000.00,'DH025'),
	 ('HD026',9000.00,'2024-11-11 10:00:00',81000.00,'DH026'),
	 ('HD027',10000.00,'2024-11-11 11:00:00',90000.00,'DH027'),
	 ('HD028',4000.00,'2024-11-11 12:00:00',36000.00,'DH028'),
	 ('HD029',7500.00,'2024-10-10 13:00:00',67500.00,'DH029'),
	 ('HD030',3500.00,'2024-10-10 14:00:00',31500.00,'DH030');
ALTER TABLE ChiTietHoaDon CHECK CONSTRAINT fk_hoadon_donhang
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO dbo.ChuongTrinhKhuyenMai (MaKhuyenMai,NgayBatDau,NgayKetThuc,MoTa,LoaiGiam,GiaTriGiam) VALUES
	 ('KM001','2024-11-01','2024-11-30','Khuyến mãi tháng 11','Phần trăm',10.00),
	 ('KM002','2024-11-10','2024-11-20','Giảm giá nhân viên','Số tiền',50000.00),
	 ('KM003','2024-11-05','2024-11-15','Khuyến mãi cuối tuần','Phần trăm',5.00),
	 ('KM004','2024-11-15','2024-11-25','Khuyến mãi đặc biệt','Số tiền',100000.00),
	 ('KM005','2024-11-01','2024-11-20','Giảm giá cho khách hàng mới','Phần trăm',15.00);
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE DanhMucSanPham NOCHECK CONSTRAINT fk_danhmucsanpham_nhacungcap
INSERT INTO dbo.DanhMucSanPham (MaSanPham,TenSanPham,DonViNhoNhat,MaNhaCungCap,SoLuong,GiaBan,MaChiNhanh) VALUES
	 ('SP001','Sữa rửa mặt ON','Tuýp','NCC001',50,12000.00,1),
	 ('SP002','Nước tẩy trang JMSolution','Chai','NCC002',80,15000.00,2),
	 ('SP003','Mặt nạ Marine','Cái','NCC003',30,20000.00,3),
	 ('SP004','Thuốc tẩy giun Fugacar','Hộp','NCC004',60,18000.00,4),
	 ('SP005','Thuốc bôi da Agiclovir','Tuýp','NCC005',75,10000.00,5),
	 ('SP006','Thuốc Alzental','Hộp','NCC001',40,14000.00,6),
	 ('SP007','Dầu gội Cyclopyrox','Chai','NCC002',90,16000.00,7),
	 ('SP008','Thuốc ZaroMax','Hộp','NCC003',55,21000.00,1),
	 ('SP009','Kem bôi Jetrai','Tuýp','NCC004',70,17000.00,2),
	 ('SP010','Dầu gội La Beauty','Chai','NCC005',65,95000.00,3);
INSERT INTO dbo.DanhMucSanPham (MaSanPham,TenSanPham,DonViNhoNhat,MaNhaCungCap,SoLuong,GiaBan,MaChiNhanh) VALUES
	 ('SP011','Tinh dầu Cocoon','Lọ','NCC001',85,83000.00,4),
	 ('SP012','Siro Canxi D3','Hộp','NCC002',45,19000.00,5),
	 ('SP013','Thuốc Omega 3-6-9','Hộp','NCC003',60,23000.00,6),
	 ('SP014','Multi Vitamin','Chai','NCC004',35,175000.00,7),
	 ('SP015','B Complex Vitamin','Vỉ','NCC005',50,24000.00,1),
	 ('SP016','Siro bổ phế LaBeBe','Chai','NCC001',80,57000.00,2),
	 ('SP017','Thuốc giải rượu LadoDetox','Hộp','NCC002',70,16000.00,3),
	 ('SP018','Bột SokiDeli','Hộp','NCC003',45,18000.00,4),
	 ('SP019','Sủi Optimax','Tuýp','NCC004',60,20000.00,5),
	 ('SP020','Cốm Galac','Hộp','NCC005',55,23000.00,6);
INSERT INTO dbo.DanhMucSanPham (MaSanPham,TenSanPham,DonViNhoNhat,MaNhaCungCap,SoLuong,GiaBan,MaChiNhanh) VALUES
	 ('SP021','Hỗn dịch uống Simegaz Plus OPV vị bạc hà','Gói','NCC001',500,4000.00,1),
	 ('SP022','Thuốc Đại Tràng Trường Phúc','Hộp','NCC002',200,105000.00,2),
	 ('SP023','Thuốc Bổ Gan Trường Phúc','Hộp','NCC003',150,95000.00,3),
	 ('SP024','Hỗn dịch uống Biviantac Kháng Acid','Gói','NCC004',400,4300.00,4),
	 ('SP025','Hỗn dịch uống Biviantac BRV','Gói','NCC005',300,4300.00,5),
	 ('SP026','Thuốc Glomoti-M Glomed','Viên','NCC001',1000,530.00,2),
	 ('SP027','Viên mật nghệ Cholapan OPC','Hộp','NCC002',120,45000.00,1),
	 ('SP028','Thuốc bột Smecta Beaufour Ipse','Hộp','NCC003',250,45000.00,3),
	 ('SP029','Thuốc Boganic Forte Traphaco','Hộp','NCC004',90,115000.00,5),
	 ('SP030','Trá Gừng Traphaco','Hộp','NCC005',300,12000.00,4);
INSERT INTO dbo.DanhMucSanPham (MaSanPham,TenSanPham,DonViNhoNhat,MaNhaCungCap,SoLuong,GiaBan,MaChiNhanh) VALUES
	 ('SP031','Thuốc Silygamma 150mg Worwag','Viên','NCC001',500,5400.00,1),
	 ('SP032','Hỗn dịch uống Varogel Shinpoong Deawoo','Gói','NCC002',450,2525.00,2),
	 ('SP033','Thuốc bột pha hỗn dịch Smecta vị cam','Gói','NCC003',600,4100.00,3),
	 ('SP034','Dung dịch Rectiofar Pharmedic','Ống','NCC004',800,2800.00,4),
	 ('SP035','Thuốc Pruzena Davipharm','Viên','NCC005',200,3200.00,5),
	 ('SP036','Hỗn dịch uống Phosphalugel Sanofi','Gói','NCC001',500,4192.00,1),
	 ('SP037','Viên nhuận tràng Ovalax 5mg Traphaco','Viên','NCC002',100,800.00,2),
	 ('SP038','Thuốc Normagut MEGA We care','Viên','NCC003',300,7000.00,3),
	 ('SP039','Viên nang cứng Loperamide Stella 2mg','Viên','NCC004',500,500.00,4),
	 ('SP040','Hỗn dịch Gaviscon Reckitt Benckiser','Gói','NCC005',400,8000.00,5);
INSERT INTO dbo.DanhMucSanPham (MaSanPham,TenSanPham,DonViNhoNhat,MaNhaCungCap,SoLuong,GiaBan,MaChiNhanh) VALUES
	 ('SP041','Viên nhuận tràng Ovalax 5mg Traphaco','Viên','NCC001',500,800.00,1),
	 ('SP042','Thuốc Normagut MEGA We care','Viên','NCC002',300,7000.00,2),
	 ('SP043','Viên nang cứng Loperamide Stella 2mg','Viên','NCC003',400,500.00,3),
	 ('SP044','Hỗn dịch Gaviscon Reckitt Benckiser','Gói','NCC004',200,8000.00,4),
	 ('SP045','Bột Fortrans Ipsen','Gói','NCC005',150,37000.00,5),
	 ('SP046','Bột Forlax Ipsen','Gói','NCC001',250,5000.00,1),
	 ('SP047','Dung dịch thụt trực tràng Fleet Enema','Chai','NCC002',300,59000.00,2),
	 ('SP048','Nhũ dịch Espumisan L Menarini','Chai','NCC003',150,63000.00,3),
	 ('SP049','Duphalac (Lactulose)','Gói','NCC004',500,5500.00,4),
	 ('SP050','Nhũ tương Colicare Meyer','Chai','NCC005',100,44000.00,5);
INSERT INTO dbo.DanhMucSanPham (MaSanPham,TenSanPham,DonViNhoNhat,MaNhaCungCap,SoLuong,GiaBan,MaChiNhanh) VALUES
	 ('SP051','Thuốc BisacodylDHG','Viên','NCC001',600,280.00,1),
	 ('SP052','Men tiêu hoá sống Biosubtyl DL Davac','Gói','NCC002',400,640.00,2),
	 ('SP053','Bột Bioflora 100mg Biocodex','Gói','NCC003',300,5850.00,3),
	 ('SP054','Thuốc lợi gan mật Bar Pharmedic','Hộp','NCC004',150,65000.00,4),
	 ('SP055','Viên nhai Air-X hương cam','Viên','NCC005',250,900.00,5),
	 ('SP056','Thuốc Creon 25000 Abbott','Viên','NCC001',100,15000.00,1),
	 ('SP057','Thuốc Boganic Traphaco','Hộp','NCC002',200,80000.00,2),
	 ('SP058','Thuốc VG-5 Danapha','Hộp','NCC003',300,40000.00,3),
	 ('SP059','Nhũ dịch uống Simethicon Stella','Chai','NCC004',150,22000.00,4),
	 ('SP060','Hỗn dịch uống men vi sinh Enterogermina','Hộp','NCC005',100,165000.00,5);
ALTER TABLE DanhMucSanPham CHECK CONSTRAINT fk_danhmucsanpham_nhacungcap
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE DonHang NOCHECK CONSTRAINT fk_donhang_makh
ALTER TABLE DonHang NOCHECK CONSTRAINT fk_donhang_manv
INSERT INTO dbo.DonHang (MaDonHang,ToaThuoc,TienThuoc,Ngay,NhanXet,MaKhachHang,MaNhanVien,TrangThaiDonHang,MaKhuyenMai) VALUES
	 ('DH001','Sữa rửa mặt ON, Nước tẩy trang JMSolution',66000.00,'2024-01-15','Dịch vụ tốt, giao hàng nhanh.','KH001',1001,'Đã thanh toán','KM003'),
	 ('DH002','Mặt nạ Marine',80000.00,'2024-01-17','Sản phẩm tốt, hiệu quả như quảng cáo.','KH002',1003,'Chưa thanh toán',NULL),
	 ('DH003','Thuốc tẩy giun Fugacar, Thuốc Omega 3-6-9',105000.00,'2024-02-01','Chất lượng sản phẩm tốt, giao hàng nhanh.','KH003',1010,'Đã thanh toán','KM001'),
	 ('DH004','Thuốc bôi da Agiclovir',20000.00,'2024-02-10','Tôi hài lòng với sản phẩm.','KH004',1020,'Chưa thanh toán',NULL),
	 ('DH005','Thuốc Alzental, Dầu gội Cyclopyrox',118000.00,'2024-02-14','Sản phẩm chất lượng, phục vụ nhiệt tình.','KH005',1005,'Đã thanh toán','KM005'),
	 ('DH006','Thuốc ZaroMax',21000.00,'2024-03-01','Tốt, đáng mua lại.','KH006',1003,'Chưa thanh toán','KM003'),
	 ('DH007','Kem bôi Jetrai',68000.00,'2024-03-05','Giá cả hợp lý, hiệu quả nhanh chóng.','KH007',1015,'Đã thanh toán',NULL),
	 ('DH008','Dầu gội La Beauty',190000.00,'2024-03-10','Sản phẩm tốt, dùng lâu dài.','KH008',1020,'Chưa thanh toán','KM004'),
	 ('DH009','Tinh dầu Cocoon',83000.00,'2024-03-18','Chất lượng tuyệt vời, giao hàng nhanh.','KH009',1035,'Đã thanh toán',NULL),
	 ('DH010','Siro Canxi D3',57000.00,'2024-04-01','Dễ uống, giúp con tôi khỏe mạnh.','KH010',1040,'Chưa thanh toán','KM001');
INSERT INTO dbo.DonHang (MaDonHang,ToaThuoc,TienThuoc,Ngay,NhanXet,MaKhachHang,MaNhanVien,TrangThaiDonHang,MaKhuyenMai) VALUES
	 ('DH011','Thuốc Omega 3-6-9, B Complex Vitamin',140000.00,'2024-04-03','Dịch vụ và sản phẩm rất tốt.','KH011',1008,'Đã thanh toán','KM003'),
	 ('DH012','Siro bổ phế LaBeBe',285000.00,'2024-04-10','Tôi sẽ mua lại sản phẩm này.','KH012',1009,'Chưa thanh toán',NULL),
	 ('DH013','Thuốc giải rượu LadoDetox',48000.00,'2024-04-12','Hỗ trợ rất tốt trong việc giải rượu.','KH013',1012,'Đã thanh toán','KM004'),
	 ('DH014','Bột SokiDeli',72000.00,'2024-04-14','Sản phẩm tuyệt vời, công dụng nhanh.','KH014',1021,'Chưa thanh toán',NULL),
	 ('DH015','Sủi Optimax',60000.00,'2024-05-01','Hài lòng với chất lượng sản phẩm.','KH015',1036,'Đã thanh toán','KM002'),
	 ('DH016','Cốm Galac',46000.00,'2024-05-05','Giá cả hợp lý, rất hiệu quả.','KH016',1007,'Chưa thanh toán','KM005'),
	 ('DH017','Sữa rửa mặt ON',48000.00,'2024-05-10','Tôi rất thích sản phẩm này.','KH017',1019,'Đã thanh toán',NULL),
	 ('DH018','Nước tẩy trang JMSolution',45000.00,'2024-06-01','Giao hàng nhanh, sản phẩm tốt.','KH018',1011,'Chưa thanh toán','KM001'),
	 ('DH019','Mặt nạ Marine, Thuốc bôi da Agiclovir',50000.00,'2024-06-10','Sản phẩm tốt, tôi rất thích.','KH019',1006,'Đã thanh toán',NULL),
	 ('DH020','Thuốc Alzental',70000.00,'2024-06-15','Sản phẩm rất tốt, sẽ giới thiệu cho bạn bè.','KH020',1022,'Chưa thanh toán','KM005');
INSERT INTO dbo.DonHang (MaDonHang,ToaThuoc,TienThuoc,Ngay,NhanXet,MaKhachHang,MaNhanVien,TrangThaiDonHang,MaKhuyenMai) VALUES
	 ('DH021','Viên nhuận tràng Ovalax 5mg Traphaco, Thuốc Normagut MEGA We care',95000.00,'2024-11-23','Chất lượng tuyệt vời','KH001',101,'Chưa thanh toán','KM003'),
	 ('DH022','Hỗn dịch Gaviscon Reckitt Benckiser, Bột Forlax Ipsen',130000.00,'2024-11-24','Nhận hàng nhanh chóng','KH002',888,'Đã thanh toán','KM005'),
	 ('DH023','Dung dịch thụt trực tràng Fleet Enema',59000.00,'2024-11-25','Giá cả hợp lý','KH003',12,'Chưa thanh toán','KM002'),
	 ('DH024','Viên nhai Air-X hương cam, Nhũ dịch Espumisan L Menarini',66000.00,'2024-11-26','Phục vụ nhanh chóng','KH004',4,'Đã thanh toán','KM004'),
	 ('DH025','Men tiêu hoá sống Biosubtyl DL Davac, Thuốc lợi gan mật Bar Pharmedic',110000.00,'2024-11-27','Nhân viên nhiệt tình','KH005',101,'Chưa thanh toán','KM001'),
	 ('DH026','Hỗn dịch uống men vi sinh Enterogermina',165000.00,'2024-11-28','Đóng gói kỹ càng','KH006',120,'Đã thanh toán','KM003'),
	 ('DH027','Duphalac (Lactulose), Viên nhuận tràng Ovalax 5mg Traphaco',55000.00,'2024-11-29','Giao hàng nhanh chóng','KH007',10,'Chưa thanh toán','KM002'),
	 ('DH028','Bột Bioflora 100mg Biocodex',85000.00,'2024-11-30','Chất lượng tốt','KH008',5,'Đã thanh toán','KM001'),
	 ('DH029','Nhũ dịch uống Simethicon Stella, Thuốc VG-5 Danapha',90000.00,'2024-12-01','Rất hài lòng','KH009',100,'Chưa thanh toán','KM005'),
	 ('DH030','Nhũ tương Colicare Meyer, Thuốc Boganic Traphaco',124000.00,'2024-12-02','Nhận hàng đúng hẹn','KH010',11,'Đã thanh toán','KM004');
INSERT INTO dbo.DonHang (MaDonHang,ToaThuoc,TienThuoc,Ngay,NhanXet,MaKhachHang,MaNhanVien,TrangThaiDonHang,MaKhuyenMai) VALUES
	 ('DH031','Viên nhuận tràng Ovalax 5mg Traphaco, Thuốc Normagut MEGA We care',96000.00,'2024-12-03','Giao hàng nhanh chóng','KH011',12,'Chưa thanh toán','KM002'),
	 ('DH032','Dung dịch uống Enterogermina',72000.00,'2024-12-04','Phục vụ tận tâm','KH012',5,'Đã thanh toán','KM003'),
	 ('DH033','Viên nhai Air-X hương cam',55000.00,'2024-12-05','Hài lòng với chất lượng','KH013',120,'Chưa thanh toán','KM001'),
	 ('DH034','Bột Forlax Ipsen, Duphalac (Lactulose)',145000.00,'2024-12-06','Đóng gói đẹp','KH014',100,'Đã thanh toán','KM005'),
	 ('DH035','Nhũ dịch uống Simethicon Stella, Thuốc VG-5 Danapha',90000.00,'2024-12-07','Nhận hàng đúng giờ','KH015',10,'Chưa thanh toán','KM004'),
	 ('DH036','Hỗn dịch Gaviscon Reckitt Benckiser',68000.00,'2024-12-08','Phục vụ chuyên nghiệp','KH016',888,'Đã thanh toán','KM002'),
	 ('DH037','Men tiêu hoá sống Biosubtyl DL Davac',125000.00,'2024-12-09','Rất đáng tin cậy','KH017',11,'Chưa thanh toán','KM003'),
	 ('DH038','Dung dịch thụt trực tràng Fleet Enema',58000.00,'2024-12-10','Giá cả hợp lý','KH018',101,'Đã thanh toán','KM001'),
	 ('DH039','Bột Bioflora 100mg Biocodex, Thuốc Normagut MEGA We care',75000.00,'2024-12-11','Chất lượng tuyệt vời','KH019',4,'Chưa thanh toán','KM005'),
	 ('DH040','Nhũ tương Colicare Meyer, Viên nhai Air-X hương cam',95000.00,'2024-12-12','Giao hàng đúng hẹn','KH020',12,'Đã thanh toán','KM004');
ALTER TABLE DonHang CHECK CONSTRAINT fk_donhang_makh
ALTER TABLE DonHang CHECK CONSTRAINT fk_donhang_manv
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO dbo.KhachHang (MaKhachHang,TenKhachHang,SoNha,TenDuong,Tinh,SoDienThoai,MaGioiThieu,DiemTichLuy) VALUES
	 ('KH001','Nguyễn Văn Nam','123','Đường Lê Lợi','Hà Nội','0901234567',NULL,150),
	 ('KH002','Trần Thị Dương','456','Đường Nguyễn Trãi','TP.HCM','0902345678','KH003',120),
	 ('KH003','Lê Minh Thịnh','789','Đường Bà Triệu','Đà Nẵng','0903456789','KH004',180),
	 ('KH004','Phạm Thị Định','101','Đường Nguyễn Huệ','Hà Nội','0904567890','KH002',110),
	 ('KH005','Vũ Tiến Luật','202','Đường Phạm Ngọc Thạch','Hải Phòng','0905678901','KH003',200),
	 ('KH006','Hoàng Minh Trọng','303','Đường Trần Phú','Cần Thơ','0906789012','KH007',90),
	 ('KH007','Bùi Thị Kiều','404','Đường Điện Biên Phủ','TP.HCM','0907890123',NULL,150),
	 ('KH008','Đặng Tuấn Hưng','505','Đường Bùi Hữu Nghĩa','Hà Nội','0908901234','KH009',170),
	 ('KH009','Ngô Thị Linh','606','Đường Võ Thị Sáu','TP.HCM','0909012345','KH008',130),
	 ('KH010','Nguyễn Hữu Sang','707','Đường Đinh Tiên Hoàng','Hải Phòng','0900123456',NULL,160);
INSERT INTO dbo.KhachHang (MaKhachHang,TenKhachHang,SoNha,TenDuong,Tinh,SoDienThoai,MaGioiThieu,DiemTichLuy) VALUES
	 ('KH011','Trần Thị Kiều Oanh','808','Đường Ngô Quyền','Đà Nẵng','0901234560','KH010',140),
	 ('KH012','Lê Quang Linh','909','Đường Nguyễn Thị Minh Khai','Hà Nội','0902345671','KH011',110),
	 ('KH013','Phạm Thị Linh','1010','Đường Lý Thái Tổ','Cần Thơ','0903456782','KH012',120),
	 ('KH014','Vũ Minh Nhật','1111','Đường Thanh Niên','TP.HCM','0904567893',NULL,190),
	 ('KH015','Hoàng Thị Phượng','1212','Đường Lê Duẩn','Đà Nẵng','0905678904','KH014',130),
	 ('KH016','Bùi Minh Nhật','1313','Đường Hồng Bàng','Hà Nội','0906789015','KH015',170),
	 ('KH017','Đặng Tuấn Dương','1414','Đường Phan Đình Phùng','TP.HCM','0907890126',NULL,100),
	 ('KH018','Ngô Hữu Phương','1515','Đường Trường Chinh','Hải Phòng','0908901237','KH017',160),
	 ('KH019','Nguyễn Thị Lợi','1616','Đường Lê Đại Hành','Cần Thơ','0909012348','KH018',150),
	 ('KH020','Trần Quang Liêm','1717','Đường Phan Văn Trị','Đà Nẵng','0900123459','KH019',180);
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO dbo.KhachHangSDT (MaKhachHang,SoDienThoai) VALUES
	 ('KH001','0901234567'),
	 ('KH002','0902345678'),
	 ('KH003','0903456789'),
	 ('KH004','0904567890'),
	 ('KH005','0905678901'),
	 ('KH006','0906789012'),
	 ('KH007','0907890123'),
	 ('KH008','0908901234'),
	 ('KH009','0909012345'),
	 ('KH010','0900123456');
INSERT INTO dbo.KhachHangSDT (MaKhachHang,SoDienThoai) VALUES
	 ('KH011','0901234560'),
	 ('KH012','0902345671'),
	 ('KH013','0903456782'),
	 ('KH014','0904567893'),
	 ('KH015','0905678904'),
	 ('KH016','0906789015'),
	 ('KH017','0907890126'),
	 ('KH018','0908901237'),
	 ('KH019','0909012348'),
	 ('KH020','0900123459');
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO dbo.KhuyenMai (MaKhuyenMai,MaChiNhanh) VALUES
	 ('KM001',1),
	 ('KM002',2),
	 ('KM003',3),
	 ('KM004',4),
	 ('KM005',5);
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE NguoiPhuThuoc NOCHECK CONSTRAINT fk_nguoiphuthuoc_nhanvien
INSERT INTO dbo.NguoiPhuThuoc (MaNguoiPhuThuoc,MaNhanVien,TenNguoiPhuThuoc,NgaySinh,GioiTinh,MoiQuanHe) VALUES
	 (1,1001,'Nguyễn Thị D','1992-09-01','F','Mẹ'),
	 (2,1001,'Nguyễn Văn E','1994-10-12','M','Anh'),
	 (3,1041,'Trần Thị F','1995-11-23','F','Em'),
	 (4,1027,'Lê Minh G','1990-11-18','F','Mẹ'),
	 (5,1015,'Phan Thị H','1991-06-15','F','Chị'),
	 (6,4,'Nguyễn Thị Lan','1990-05-15','F','Chị'),
	 (7,5,'Phạm Minh Tuấn','1985-07-22','M','Anh'),
	 (8,10,'Vũ Thị Mai','2000-03-10','F','Con'),
	 (9,11,'Lê Thanh Bình','1988-12-05','M','Em'),
	 (10,12,'Nguyễn Mạnh Hùng','1972-09-20','M','Cha');
INSERT INTO dbo.NguoiPhuThuoc (MaNguoiPhuThuoc,MaNhanVien,TenNguoiPhuThuoc,NgaySinh,GioiTinh,MoiQuanHe) VALUES
	 (11,100,'Trần Thị Bình','1975-01-30','F','Mẹ'),
	 (12,101,'Hoàng Hải Yến','1998-11-05','F','Chị'),
	 (13,120,'Nguyễn Đình Quang','1983-10-11','M','Anh'),
	 (14,888,'Bùi Thị Lan','1991-06-12','F','Con'),
	 (15,998,'Phan Quang Hiếu','1976-04-25','M','Cha'),
	 (16,1001,'Nguyễn Quang Hòa','1987-03-12','M','Anh'),
	 (17,1002,'Hoàng Thanh Hương','1992-07-19','F','Chị'),
	 (18,1003,'Phan Hữu Tài','1994-08-05','M','Em'),
	 (19,1004,'Trần Lệ Lan','1996-10-15','F','Con'),
	 (20,1005,'Nguyễn Thị Thu','1973-02-03','F','Mẹ');
INSERT INTO dbo.NguoiPhuThuoc (MaNguoiPhuThuoc,MaNhanVien,TenNguoiPhuThuoc,NgaySinh,GioiTinh,MoiQuanHe) VALUES
	 (21,1006,'Vũ Minh Tuấn','1960-11-25','M','Cha'),
	 (22,1007,'Phạm Hữu Trung','1991-05-22','M','Anh'),
	 (23,1008,'Nguyễn Thị Lan','1995-06-18','F','Chị'),
	 (24,1009,'Bùi Minh Hòa','1988-01-17','M','Con'),
	 (25,1010,'Nguyễn Đức Hải','1977-04-30','M','Cha'),
	 (26,1011,'Trần Minh Hoàng','1989-09-12','M','Anh'),
	 (27,1012,'Phan Bích Trâm','1996-05-20','F','Chị'),
	 (28,1013,'Nguyễn Văn Quân','1990-10-22','M','Con'),
	 (29,1014,'Vũ Quỳnh Anh','1994-02-14','F','Em'),
	 (30,1015,'Hoàng Thị Lan','1997-07-10','F','Con');
INSERT INTO dbo.NguoiPhuThuoc (MaNguoiPhuThuoc,MaNhanVien,TenNguoiPhuThuoc,NgaySinh,GioiTinh,MoiQuanHe) VALUES
	 (31,1016,'Trần Thị Lan','1988-12-01','F','Chị'),
	 (32,1017,'Nguyễn Hữu Tài','1993-05-30','M','Em'),
	 (33,1018,'Phan Hồng Khoa','1991-09-09','M','Anh'),
	 (34,1019,'Vũ Minh Khoa','1994-04-25','M','Con'),
	 (35,1020,'Hoàng Thị Thu','1986-08-07','F','Mẹ'),
	 (36,1021,'Trần Minh Sơn','1978-01-20','M','Cha'),
	 (37,1022,'Nguyễn Thị Thu','1987-11-17','F','Chị'),
	 (38,1023,'Vũ Hữu Tâm','2005-06-03','M','Em'),
	 (39,1024,'Phan Thanh Lan','1999-07-08','F','Con'),
	 (40,1025,'Nguyễn Hữu Thi','1973-02-19','M','Cha');
ALTER TABLE NguoiPhuThuoc CHECK CONSTRAINT fk_nguoiphuthuoc_nhanvien
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO dbo.NhaCungCap (MaNhaCungCap,TenNhaCungCap,DiaChi) VALUES
	 ('NCC001','HPRA','Dublin2. Ireland'),
	 ('NCC002','CTCP Dược Hậu Giang','Ninh Kiều, TP.Cần Thơ'),
	 ('NCC003','CTCP Traphaco','Ba Đình, Hà Nội'),
	 ('NCC004','CTCP Pymerphaco','Tuy Hòa, Phú Yên'),
	 ('NCC005','CTCP Dược phẩm ImexPharm','TP.Cao Lãnh, Tỉnh Đồng Tháp');
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO dbo.NhanVien (MaNhanVien,TenNhanVien,NgaySinh,GioiTinh,Email,SoDienThoai,KinhNghiem,LuongNhanVien,MaChiNhanh,LoaiNV,ChungChi,ChuyenMon,GiayPhepHanhNghe,TrinhDo,TinhTrang) VALUES
	 (4,'Nguyễn Văn Khải','1998-01-15','M','khainguyen@gmail.com','0913988772',1,16000000.00,2,0,'DH','Tim mạch','GP001','A','Đang làm việc'),
	 (5,'Đinh Văn Toàn','1990-01-01','M','dinhvantoan0101@gmail.com','0913988775',6,19999999.00,2,1,'Chung Chi ABC','Tim mạch','GP123456','A','Đã nghỉ việc'),
	 (10,'Nguyễn Thị Hương','2002-01-01','F','nguyenthihuong0101@gmail.com','0978123452',2,111111.00,1,1,'DH','Dược','GP001','A','Đã nghỉ việc'),
	 (11,'Phạm Văn Trung','2000-02-10','M','phamvantrung1002@gmail.com','0981234567',2,10000000.00,2,1,'DH','Nội Khoa','GPLX001','A','Đã nghỉ việc'),
	 (12,'Trần Văn Sơn','1992-02-12','M','tranvanson1202@gmail.com','0981123456',12,12000000.00,3,1,'TS','Dược','GP001','A','Đang làm việc'),
	 (100,'Trần Thị Thảo','1998-12-22','F','tranthithao2212@gmail.com','0978123451',1,11111111.00,2,1,'DH','Dược','GPLX005','A','Đang làm việc'),
	 (101,'Nguyễn Văn Khải','2000-01-23','M','nguyenvankhai2301@gmail.com','0981231567',15,16222000.00,5,1,'DH','Dược','GPLX005','A','Đang làm việc'),
	 (120,'Bùi Văn Huy','2004-07-22','M','buivanhuy2207@gmail.com','0981234561',2,11111333.00,3,1,'DH','Dược','GPLX005','A','Đang làm việc'),
	 (888,'Phạm Văn Phát','1990-01-01','M','phamvanphat0101@gmail.com','0123456888',5,29000000.00,1,0,'CK1','Da liễu','GP001','1','Đang làm việc'),
	 (998,'Trần Văn Long','1990-01-01','M','tranvanlong0101@gmail.com','0123456987',5,29000000.00,1,0,'CK1','Da liễu','GP001','1','Đang làm việc');
INSERT INTO dbo.NhanVien (MaNhanVien,TenNhanVien,NgaySinh,GioiTinh,Email,SoDienThoai,KinhNghiem,LuongNhanVien,MaChiNhanh,LoaiNV,ChungChi,ChuyenMon,GiayPhepHanhNghe,TrinhDo,TinhTrang) VALUES
	 (999,'Vũ Văn Quân','1990-01-01','M','vuvanquan0909@gmail.com','0123456799',5,15000000.00,1,0,'CK1','Da liễu','GP001','1','Đang làm việc'),
	 (1001,'Trần Văn Vũ','1990-01-01','M','tranvanvu0101@gmail.com','0123456789',5,15000000.00,1,0,'CK1','Da liễu','GP001','1','Đã nghỉ việc'),
	 (1002,'Nguyễn Thị Nhung','1988-04-20','F','nguyenthinhung0420@gmail.com','0987123456',3,12000000.00,1,1,NULL,NULL,'GP1235','3','Đã nghỉ việc'),
	 (1003,'Đinh Văn Tân','1985-02-10','M','dinhvantan1002@gmail.com','0976543210',5,15000000.00,1,1,NULL,NULL,'GP1236','2','Đang làm việc'),
	 (1004,'Phạm Thị Mai','1992-01-10','F','phamthimai1001@gmail.com','0978123456',3,13000000.00,1,0,'CK2','Tai mũi họng',NULL,NULL,'Đang làm việc'),
	 (1005,'Nguyễn Văn Tân','1989-12-05','M','nguyenvantan1205@gmail.com','0967432189',4,14000000.00,1,1,NULL,NULL,'GP1238','4','Đang làm việc'),
	 (1006,'Trần Thị Phương','1991-06-10','F','tranthiphuong1006@gmail.com','0978123123',1,11000000.00,1,0,'CK1','Tim mạch',NULL,NULL,'Đang làm việc'),
	 (1007,'Trần Văn Tiến','1993-07-15','M','tranvantien1507@gmail.com','0967123456',2,10500000.00,1,1,NULL,NULL,'GP1240','1','Đang làm việc'),
	 (1008,'Phạm Văn Cường','1994-08-20','M','phamvancuong2008@gmail.cm','0987654322',3,11500000.00,1,0,'CK2','Nội tiết',NULL,NULL,'Đang làm việc'),
	 (1009,'Lê Văn Hoàng','1995-09-30','M','levanhoang3009@gmail.com','0978234567',4,12500000.00,1,1,NULL,NULL,'GP1241','2','Đang làm việc');
INSERT INTO dbo.NhanVien (MaNhanVien,TenNhanVien,NgaySinh,GioiTinh,Email,SoDienThoai,KinhNghiem,LuongNhanVien,MaChiNhanh,LoaiNV,ChungChi,ChuyenMon,GiayPhepHanhNghe,TrinhDo,TinhTrang) VALUES
	 (1010,'Nguyễn Văn Thịnh','1996-10-15','M','nguyenvanthinh1510@gmail.com','0978432165',5,13500000.00,1,0,'CK1','Nhi khoa',NULL,NULL,'Đang làm việc'),
	 (1011,'Vũ Văn Quang','1991-01-01','M','vuvanquang0101@gmail.com','0987123456',4,12000000.00,2,0,'CK1','Da liễu',NULL,NULL,'Đang làm việc'),
	 (1012,'Nguyễn Thị Tuyết','1992-02-02','F','nguyenthituyet0202@gmail.com','0978123456',3,12500000.00,2,1,NULL,NULL,'GP2001','3','Đang làm việc'),
	 (1013,'Bùi Văn Minh','1993-03-03','M','buivanminh0303@gmail.com','0967123456',2,11500000.00,2,1,NULL,NULL,'GP2002','2','Đang làm việc'),
	 (1014,'Lê Thị Hồng','1994-04-04','F','lethihong0404@gmail.com','0957123456',1,11000000.00,2,0,'CK2','Tai mũi họng',NULL,NULL,'Đang làm việc'),
	 (1015,'Đinh Văn Thắng','1995-05-05','M','dinhvanthang0505@gmail.com','0947123456',5,13000000.00,2,1,NULL,NULL,'GP2003','4','Đang làm việc'),
	 (1016,'Phạm Thị Minh','1996-06-06','F','phamthiminh0606@gmail.com','0937123456',3,12000000.00,2,0,'CK1','Nội tiết',NULL,NULL,'Đang làm việc'),
	 (1017,'Nguyễn Văn Vinh','1997-07-07','M','nguyenvanvinh0707@gmail.com','0927123456',4,12500000.00,2,1,NULL,NULL,'GP2004','2','Đang làm việc'),
	 (1018,'Đinh Thị Xuân','1998-08-08','F','dinhthixuan0808@gmail.com','0917123456',3,11000000.00,2,0,'CK2','Tim mạch',NULL,NULL,'Đang làm việc'),
	 (1019,'Phạm Văn Duy','1999-09-09','M','phamvanduy0909@gmail.com','0907123456',1,10500000.00,2,1,NULL,NULL,'GP2005','1','Đang làm việc');
INSERT INTO dbo.NhanVien (MaNhanVien,TenNhanVien,NgaySinh,GioiTinh,Email,SoDienThoai,KinhNghiem,LuongNhanVien,MaChiNhanh,LoaiNV,ChungChi,ChuyenMon,GiayPhepHanhNghe,TrinhDo,TinhTrang) VALUES
	 (1020,'Lê Văn Lợi','1990-10-10','M','levanloi1010@gmail.com','0897123456',2,12000000.00,2,0,'CK1','Nhi khoa',NULL,NULL,'Đang làm việc'),
	 (1021,'Bùi Văn Hùng','1990-01-15','M','buivanhung1501@gmail.com','0987654322',3,11500000.00,3,0,'CK1','Tai mũi họng',NULL,NULL,'Đang làm việc'),
	 (1022,'Nguyễn Thị Hà','1992-03-25','F','nguyenthiha2503@gmail.com','0977654322',2,11000000.00,3,1,NULL,NULL,'GP3001','3','Đang làm việc'),
	 (1023,'Đinh Văn Khang','1989-06-30','M','dinhvankhang3006@gmail.com','0967654322',5,12500000.00,3,1,NULL,NULL,'GP3002','4','Đang làm việc'),
	 (1024,'Trần Thị Mỹ','1995-09-10','F','tranthymy1901@gmail.com','0957654322',1,10500000.00,3,0,'CK2','Nội tiết',NULL,NULL,'Đang làm việc'),
	 (1025,'Nguyễn Văn Khương','1993-12-20','M','nguyenvankhuong2012@gmail.com','0947654322',3,12000000.00,3,0,'CK1','Tim mạch',NULL,NULL,'Đang làm việc'),
	 (1026,'Nguyễn Văn Hùng','1991-02-14','M','nguyenvanhung1402@gmail.com','0937654322',4,13000000.00,4,1,NULL,NULL,'GP4001','4','Đang làm việc'),
	 (1027,'Phạm Thị Ngọc','1994-07-18','F','phamthingoc1807@gmail.com','0927654322',2,11500000.00,4,0,'CK2','Da liễu',NULL,NULL,'Đang làm việc'),
	 (1028,'Lê Văn Thành','1990-10-05','M','levanthanh0510@gmail.com','0917654322',3,12000000.00,4,0,'CK1','Nhi khoa',NULL,NULL,'Đang làm việc'),
	 (1029,'Lê Thị Thanh','1988-12-12','F','lethithanh1212@gmail.com','0907654322',5,13500000.00,4,1,NULL,NULL,'GP4002','3','Đang làm việc');
INSERT INTO dbo.NhanVien (MaNhanVien,TenNhanVien,NgaySinh,GioiTinh,Email,SoDienThoai,KinhNghiem,LuongNhanVien,MaChiNhanh,LoaiNV,ChungChi,ChuyenMon,GiayPhepHanhNghe,TrinhDo,TinhTrang) VALUES
	 (1030,'Vũ Văn Tuấn','1993-03-09','M','vuvantoan0903@gmail.com','0897654322',4,11000000.00,4,1,NULL,NULL,'GP4003','2','Đang làm việc'),
	 (1031,'Đinh Văn Nam','1987-05-21','M','dinhvannam2105@gmail.com','0887654322',5,14000000.00,5,0,'CK2','Tim mạch',NULL,NULL,'Đang làm việc'),
	 (1032,'Bùi Thị Diệu','1990-08-11','F','buithidieu1108@gmail.com','0877654322',4,13000000.00,5,1,NULL,NULL,'GP5001','4','Đang làm việc'),
	 (1033,'Phạm Văn Đức','1992-04-24','M','phamvanduc2404@gmail.com','0867654322',3,12500000.00,5,1,NULL,NULL,'GP5002','3','Đang làm việc'),
	 (1034,'Đinh Thị Tâm','1994-09-17','F','dinhthitam1709@gmail.com','0857654322',2,11500000.00,5,0,'CK1','Da liễu',NULL,NULL,'Đang làm việc'),
	 (1035,'Lê Văn Hậu','1989-06-02','M','levanhau0206@gmail.com','0847654322',4,13000000.00,5,0,'CK2','Nội tiết',NULL,NULL,'Đang làm việc'),
	 (1036,'Bùi Văn Phong','1991-07-19','M','buivanphong1907@gmail.com','0837654322',3,12500000.00,6,0,'CK1','Tai mũi họng',NULL,NULL,'Đang làm việc'),
	 (1037,'Nguyễn Thị Tươi','1993-01-15','F','nguyenthituoi1501@gmail.com','0827654322',2,11500000.00,6,1,NULL,NULL,'GP6001','3','Đang làm việc'),
	 (1038,'Nguyễn Văn Hải','1988-09-09','M','nguyenvanhai0909@gmail.com','0817654322',5,14000000.00,6,1,NULL,NULL,'GP6002','4','Đang làm việc'),
	 (1039,'Phạm Thị Duyên','1990-12-20','F','phamthiduyen2012@gmail.com','0807654322',4,12000000.00,6,0,'CK2','Nhi khoa',NULL,NULL,'Đang làm việc');
INSERT INTO dbo.NhanVien (MaNhanVien,TenNhanVien,NgaySinh,GioiTinh,Email,SoDienThoai,KinhNghiem,LuongNhanVien,MaChiNhanh,LoaiNV,ChungChi,ChuyenMon,GiayPhepHanhNghe,TrinhDo,TinhTrang) VALUES
	 (1040,'Lê Văn Bảo','1995-11-03','M','levanbao1103@gmail.com','0797654322',1,11000000.00,6,0,'CK1','Nội tiết',NULL,NULL,'Đang làm việc'),
	 (1041,'Bùi Văn Khánh','1989-03-22','M','buinvankhanh2203@gmail.com','0787654322',5,14000000.00,7,0,'CK1','Tim mạch',NULL,NULL,'Đang làm việc'),
	 (1042,'Trần Thị Trà','1991-07-14','F','tranthiha1407@gmai.com','0777654322',3,12500000.00,7,0,'CK2','Da liễu',NULL,NULL,'Đang làm việc');
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO dbo.ThanhToan (MaDonHang,MaChiNhanh,MaKhachHang) VALUES
	 ('DH001',3,'KH001'),
	 ('DH003',1,'KH003'),
	 ('DH005',2,'KH005'),
	 ('DH007',4,'KH007'),
	 ('DH009',5,'KH009'),
	 ('DH011',3,'KH011'),
	 ('DH013',1,'KH013'),
	 ('DH015',2,'KH015'),
	 ('DH017',4,'KH017'),
	 ('DH019',5,'KH019');
INSERT INTO dbo.ThanhToan (MaDonHang,MaChiNhanh,MaKhachHang) VALUES
	 ('DH022',3,'KH002'),
	 ('DH024',4,'KH004'),
	 ('DH026',2,'KH006'),
	 ('DH028',5,'KH008'),
	 ('DH030',1,'KH010'),
	 ('DH032',3,'KH012'),
	 ('DH034',5,'KH014'),
	 ('DH036',2,'KH016'),
	 ('DH038',4,'KH018'),
	 ('DH040',1,'KH020');
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO DonViGiaoHang (MaDonVi, TenDonVi) VALUES
('DV001', 'Viettel Post'),
('DV002', 'Giao Hàng Nhanh'),
('DV003', 'Bưu Điện Việt Nam'),
('DV004', 'GHN Express'),
('DV005', 'J&T Express');
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ChiTietDonHang (MaVanDon, TinhTrang, DiaChiDonHang, MaDonViVanChuyen, ChiPhiGiaoHang, MaDonHang) VALUES
('VD001', 'Đang giao', '123 Đường ABC, TP.HCM', 'DV001', 30000.00, 'DH001'),
('VD002', 'Đã giao', '456 Đường XYZ, Hà Nội', 'DV002', 40000.00, 'DH002'),
('VD003', 'Đang giao', '789 Đường PQR, Đà Nẵng', 'DV003', 35000.00, 'DH003'),
('VD004', 'Đã giao', '101 Đường LMN, Cần Thơ', 'DV004', 25000.00, 'DH004'),
('VD005', 'Đang giao', '202 Đường GHI, TP.HCM', 'DV005', 45000.00, 'DH005'),
('VD006', 'Đã giao', '303 Đường STU, Hà Nội', 'DV001', 35000.00, 'DH006'),
('VD007', 'Đang giao', '404 Đường VWX, Đà Nẵng', 'DV002', 30000.00, 'DH007'),
('VD008', 'Đã giao', '505 Đường YZ, TP.HCM', 'DV003', 40000.00, 'DH008'),
('VD009', 'Đang giao', '606 Đường A1, Cần Thơ', 'DV004', 35000.00, 'DH009'),
('VD010', 'Đã giao', '707 Đường B2, TP.HCM', 'DV005', 50000.00, 'DH010'),
('VD011', 'Đang giao', '808 Đường C3, Hà Nội', 'DV001', 45000.00, 'DH011'),
('VD012', 'Đã giao', '909 Đường D4, Đà Nẵng', 'DV002', 30000.00, 'DH012'),
('VD013', 'Đang giao', '1010 Đường E5, Cần Thơ', 'DV003', 35000.00, 'DH013'),
('VD014', 'Đã giao', '1111 Đường F6, TP.HCM', 'DV004', 40000.00, 'DH014'),
('VD015', 'Đang giao', '1212 Đường G7, Hà Nội', 'DV005', 25000.00, 'DH015'),
('VD016', 'Đã giao', '1313 Đường H8, Đà Nẵng', 'DV001', 30000.00, 'DH016'),
('VD017', 'Đang giao', '1414 Đường I9, TP.HCM', 'DV002', 45000.00, 'DH017'),
('VD018', 'Đã giao', '1515 Đường J10, Cần Thơ', 'DV003', 35000.00, 'DH018'),
('VD019', 'Đang giao', '1616 Đường K11, Hà Nội', 'DV004', 40000.00, 'DH019'),
('VD020', 'Đã giao', '1717 Đường L12, Đà Nẵng', 'DV005', 50000.00, 'DH020'),
('VD021', 'Đang giao', '1818 Đường M13, TP.HCM', 'DV001', 35000.00, 'DH021'),
('VD022', 'Đã giao', '1919 Đường N14, Cần Thơ', 'DV002', 40000.00, 'DH022'),
('VD023', 'Đang giao', '2020 Đường O15, Hà Nội', 'DV003', 45000.00, 'DH023'),
('VD024', 'Đã giao', '2121 Đường P16, Đà Nẵng', 'DV004', 25000.00, 'DH024'),
('VD025', 'Đang giao', '2222 Đường Q17, TP.HCM', 'DV005', 35000.00, 'DH025'),
('VD026', 'Đã giao', '2323 Đường R18, Hà Nội', 'DV001', 40000.00, 'DH026'),
('VD027', 'Đang giao', '2424 Đường S19, Đà Nẵng', 'DV002', 50000.00, 'DH027'),
('VD028', 'Đã giao', '2525 Đường T20, Cần Thơ', 'DV003', 35000.00, 'DH028'),
('VD029', 'Đang giao', '2626 Đường U21, TP.HCM', 'DV004', 45000.00, 'DH029'),
('VD030', 'Đã giao', '2727 Đường V22, Hà Nội', 'DV005', 30000.00, 'DH030'),
('VD031', 'Đang giao', '2828 Đường W23, Đà Nẵng', 'DV001', 35000.00, 'DH031'),
('VD032', 'Đã giao', '2929 Đường X24, TP.HCM', 'DV002', 40000.00, 'DH032'),
('VD033', 'Đang giao', '3030 Đường Y25, Cần Thơ', 'DV003', 45000.00, 'DH033'),
('VD034', 'Đã giao', '3131 Đường Z26, Hà Nội', 'DV004', 35000.00, 'DH034'),
('VD035', 'Đang giao', '3232 Đường A27, Đà Nẵng', 'DV005', 50000.00, 'DH035'),
('VD036', 'Đã giao', '3333 Đường B28, TP.HCM', 'DV001', 40000.00, 'DH036'),
('VD037', 'Đang giao', '3434 Đường C29, Hà Nội', 'DV002', 30000.00, 'DH037'),
('VD038', 'Đã giao', '3535 Đường D30, Đà Nẵng', 'DV003', 35000.00, 'DH038'),
('VD039', 'Đang giao', '3636 Đường E31, Cần Thơ', 'DV004', 45000.00, 'DH039'),
('VD040', 'Đã giao', '3737 Đường F32, TP.HCM', 'DV005', 35000.00, 'DH040');
