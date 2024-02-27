CREATE DATABASE QuanLyBanHang_HighlandsCoffee
use QuanLyBanHang_HighlandsCoffee
go 

--1. TẠO CÁC BẢNG
CREATE TABLE tbKhachHang
(
MaKH nchar(6) constraint pk_tbKhachHang primary key,
HoKH nvarchar(100) not null,
TenKH nvarchar(50) not null,
Phai nvarchar(20),
DiaChi nvarchar(50),
DienThoai nvarchar(30),
Email nvarchar(50)
)

CREATE TABLE tbNhanVien 
(
MaNV nchar(6) constraint pk_tbNhanVien primary key,
HoNV nvarchar(100) not null,
TenNV nvarchar(50) not null,
NgaySinh datetime,
GioiTinh nvarchar(20),
DiaChi nvarchar(150),
DienThoai nvarchar(30) not null,
Email nvarchar(50)
)

CREATE TABLE tbDonHang 
(
MaHD nchar(6) constraint pk_tbDonHang primary key,
MaKH nchar(6),
MaNV nchar(6),
MaShipper nchar(6),
ThoiGianDH datetime not null,
PTTT nvarchar(100),
ThoiGianTT datetime not null,
TongGiaTri float not null
)

CREATE TABLE tbCTDonHang 
(
MaHD nchar(6),
MaMH nchar(6),
SoLuong int not null,
DgBan float not null,
TongTien float not null,
)

CREATE TABLE tbMatHang
(
MaMH nchar(6) constraint pk_tbMatHang primary key,
TenMH nvarchar(150) not null,
DonViTinh nvarchar(20) not null,
DgBan float not null,
MaLoaiHang nchar(6),
MaNL nchar(6)
)

CREATE TABLE tbLoaiHang 
(
MaLoaiHang nchar(6) constraint pk_tbLoaiHang primary key,
TenLoaiHang nvarchar(50) not null
)

CREATE TABLE tbNguyenLieu 
(
MaNL nchar(6) constraint pk_tbNguyenLieu primary key,
TenNL nvarchar(150) not null,
DgNhap float not null,
TonKho float not null,
MaNCC nchar(6)
)

CREATE TABLE tbShipper 
(
MaShipper nchar(6) constraint pk_tbShipper primary key,
TenShipper nvarchar(150) not null
)

CREATE TABLE tbNCC 
(
MaNCC nchar(6) constraint pk_tbNCC primary key,
TenNCC Nvarchar(150) not null,
DiaChi nvarchar(150) not null,
DienThoai nvarchar(20) not null,
Email nvarchar(50)
)

--2. TẠO KHOÁ NGOẠI CHO CÁC BẢNG
alter table tbDonHang
add foreign key (MaKH) references tbKhachHang(MaKH);

alter table tbDonHang
add foreign key (MaNV) references tbNhanVien(MaNV);

alter table tbDonHang
add foreign key (MaShipper) references tbShipper(MaShipper);

alter table tbCTDonHang
add foreign key (MaHD) references tbDonHang(MaHD);

alter table tbCTDonHang
add foreign key (MaMH) references tbMatHang(MaMH);

alter table tbMatHang
add foreign key (MaLoaiHang) references tbLoaiHang(MaLoaiHang);

alter table tbNguyenLieu
add foreign key (MaNCC) references tbNCC(MaNCC);

alter table tbMatHang
add foreign key (MaNL) references tbNguyenLieu(MaNL)



--3. NHẬP DỮ LIỆU CHO CÁC BẢNG
--Bảng tbKhachHang
insert into tbKhachHang values('KH0001',N'Nguyễn Minh',N'Hà',N'Nữ',null,'098123123',null)
insert into tbKhachHang values('KH0002', N'Nguyễn Thị Minh', N'Ngọc', N'Nữ', N'123/6 bis Lê Thánh Tôn,
								Q1, Tp.HCM', '098123123', N'ngocntm@gmail.com')
insert into tbKhachHang values('KH0003', N'Trần Anh', N'Tuấn', N'Nam', N'49/12B Nguyễn Thị Minh Khai,
								Q1', '091321321', N'tuanta@yahoo.com')
insert into tbKhachHang values('KH0004', N'Lê Nam', N'Anh', N'Nam', N'Ngõ6, phố thanh xuân, Hà Nội',
								'090312312', N'anhln@gamil,com.com')
insert into tbKhachHang values('KH0005', N'Nguyễn Quốc', N'Khánh', N'Nam', N'67 bis Nguyễn Thượng Hiền,
								Q.BT, Tp HCM', '090812812', N'khanhnq@gmail.com')
insert into tbKhachHang values('KH0006', N'Nguyễn Nhật', N'Huyền', N'Nữ', N'32 Lý Tự Trọng, Q9, Tp HCM',
								'09785677', N'huyennguyen@gmail.com')
insert into tbKhachHang values('KH0007',N'Lê Thị',N'Hoa',N'Nữ',null,'098123189',null)
insert into tbKhachHang values('KH0008',N'Lâm Văn',N'Thái',N'Nam',null,'098123564',null)
insert into tbKhachHang values('KH0009',N'Nguyễn Nhật',N'Hào',N'Nam',null,'098123854',null)
insert into tbKhachHang values('KH0010',N'Nguyễn Thị Khánh',N'Linh',N'Nữ',null,'098123152',null)
insert into tbKhachHang values('KH0011',N'Võ Văn',N'Toàn',N'Nam',null,'098123236',null)
insert into tbKhachHang values('KH0012',N'Hứa Cẩm',N'Bình',N'Nữ',null,'098123782',null)
insert into tbKhachHang values('KH0013',N'Hứa Thiên',N'Ngân',N'Nữ',null,'098123956',null)
insert into tbKhachHang values('KH0014',N'Trần Văn',N'Đệ',N'Nam',null,'098123236',null)
insert into tbKhachHang values('KH0015',N'Nguyễn Thanh',N'Tâm',N'Nữ',null,'098123963',null)
insert into tbKhachHang values('KH0016',N'Nguyễn Nhất',N'Thái',N'Nam',null,'098123128',null)
insert into tbKhachHang values('KH0017',N'Lê Hoàng Thảo',N'Tâm',N'Nữ',null,'098123964',null)
insert into tbKhachHang values('KH0018',N'Lâm Văn',N'Bình',N'Nam',null,'098123258',null)

--Bảng tbNhanVien
insert into tbNhanVien values('NV0001', N'Lê Thị', N'Cúc', '05-04-1999' ,N'Nữ', N'Lô C ,phòng 28', 
								'092987987',N' cuclt@gmail.com')
insert into tbNhanVien values('NV0002', N'Mai Minh', N'Mẫn', '07-03-1996' ,N'Nữ', N'78/12/8/Tân Hội', 
								'098789789',N'manmm@gmail.com' )
insert into tbNhanVien values('NV0003', N'Võ Tú', N'Hoàng', '08-09-2000' ,N'Nam', N'178/97 An Dương...',
 								'091234234',N'hoangvt@yahoo.com' )
insert into tbNhanVien values('NV0004', N'Trần Hữu', N'Thắng', '12-05-1995' ,N'Nam', N'50 Nguyễn Du',
 								'092678678',N' thangth@yahoo.com' )
insert into tbNhanVien values('NV0005', N'Nguyễn Duy', N'Hung', '05-03-1997' ,N'Nam', N'67 Kỳ Đồng',
								'098456654',N' hungnd@gmail.com' )

--Bảng tbDonHang
insert into tbDonHang values ('DH0001', 'KH0002', 'NV0003', 'GH0001', '10-03-2022 8:23:56 AM', N'Tiền mặt', '10-03-2022 8:23:56 AM', 435000)
insert into tbDonHang values ('DH0002', 'KH0003', 'NV0003', null, '10-03-2022 8:40:56 AM', N'Tiền mặt', '10-03-2022 8:40:56 AM', 354000)
insert into tbDonHang values ('DH0003', 'KH0005', 'NV0002', 'GH0001', '10-03-2022 9:20:56 AM', N'Tiền mặt', '10-03-2022 9:20:56 AM', 233000)
insert into tbDonHang values ('DH0004', 'KH0004', 'NV0001', 'GH0002', '10-04-2022 9:46:00 AM', N'Tiền mặt', '10-04-2022 9:46:00 AM', 80000)
insert into tbDonHang values ('DH0005', 'KH0002', 'NV0002', null, '10-04-2022 10:33:56 AM', N'Tiền mặt', '10-04-2022 10:33:56 AM', 145000)
insert into tbDonHang values ('DH0006', 'KH0003', 'NV0001', null, '10-05-2022 10:43:56 AM', N'Chuyển khoản', '10-05-2022 10:43:56 AM', 179000)
insert into tbDonHang values ('DH0007', 'KH0002', 'NV0002', 'GH0003', '10-05-2022 11:10:56 AM', N'Chuyển khoản', '10-05-2022 11:10:56 AM', 219000)
insert into tbDonHang values ('DH0008', 'KH0005', 'NV0003', 'GH0003', '10-05-2022 2:23:26 PM', N'Chuyển khoản', '10-05-2022 2:23:26 PM', 222000)
insert into tbDonHang values ('DH0009', 'KH0005', 'NV0001', null, '10-06-2021 8:25:52 AM', N'Chuyển khoản', '10-06-2021 8:25:52 AM', 96000)
insert into tbDonHang values ('DH0010','KH0001', 'NV0005', null, '10-06-2021 8:23:56 AM', N'Chuyển khoản', '10-06-2021 8:34:21 AM', 160000)
insert into tbDonHang values ('DH0011', 'KH0007', 'NV0003', null, '10-06-2021 8:40:56 AM', N'Tiền mặt', '10-06-2021 8:51:21 AM', 145000)
insert into tbDonHang values ('DH0012', 'KH0008', 'NV0001', 'GH0002', '10-06-2021 9:20:56 AM', N'Tiền mặt', '10-06-2021 9:31:21 AM', 96000)
insert into tbDonHang values ('DH0013', 'KH0009', 'NV0003', 'GH0002', '10-06-2021 9:46:00 AM', N'Chuyển khoản', '10-06-2021 9:56:25 AM', 60000)
insert into tbDonHang values ('DH0014', 'KH0010', 'NV0002', 'GH0002', '10-07-2019 10:33:56 AM', N'Chuyển khoản', '10-07-2019 10:44:21 AM', 195000)
insert into tbDonHang values ('DH0015', 'KH0011', 'NV0001', null, '10-07-2019 10:43:56 AM', N'Chuyển khoản', '10-07-2019 10:54:21 AM', 29000)
insert into tbDonHang values ('DH0016', 'KH0012', 'NV0005', null, '10-07-2019 11:10:56 AM', N'Tiền mặt', '10-07-2019 11:21:21 AM', 210000)
insert into tbDonHang values ('DH0017', 'KH0013', 'NV0002', null, '10-07-2019 2:23:26 PM', N'Tiền mặt', '10-07-2019 2:33:51 PM', 117000)
insert into tbDonHang values ('DH0018', 'KH0014', 'NV0001', null, '10-08-2019 8:25:52 PM', N'Chuyển khoản', '10-08-2019 8:36:17 PM', 39000)
insert into tbDonHang values ('DH0019', 'KH0015', 'NV0005', 'GH0001', '10-08-2018 9:20:56 PM', N'Chuyển khoản', '10-08-2018 9:31:21 PM', 35000)
insert into tbDonHang values ('DH0020', 'KH0016', 'NV0003', 'GH0002', '10-08-2018 9:46:00 PM', N'Tiền mặt', '10-08-2018 9:56:25 PM', 90000)
insert into tbDonHang values ('DH0021', 'KH0017', 'NV0002', 'GH0003', '10-09-2018 10:33:56 PM', N'Tiền mặt', '10-09-2018 10:44:21 PM', 87000)
insert into tbDonHang values ('DH0022', 'KH0018', 'NV0001', null, '10-09-2018 10:43:56 PM', N'Tiền mặt', '10-09-2018 10:54:21 PM', 72000)
insert into tbDonHang values ('DH0025', 'KH0018', 'NV0001', null, '10-09-2021 10:43:56 PM', N'Tiền mặt', '10-09-2013 10:54:21 PM', 72000)

--Bảng tbCTDonHang
insert into tbCTDonHang values ('DH0001', 'ST0001', 5, 29000, 145000)
insert into tbCTDonHang values ('DH0001', 'BN0001', 5, 28000, 140000)
insert into tbCTDonHang values ('DH0001', 'TT0001', 5, 30000, 150000)
insert into tbCTDonHang values ('DH0002', 'ST0003', 3, 38000, 114000)
insert into tbCTDonHang values ('DH0002', 'VP0002', 2, 40000, 80000)
insert into tbCTDonHang values ('DH0002', 'PD0003', 5, 32000, 160000)
insert into tbCTDonHang values ('DH0003', 'BN0001', 1, 29000, 29000)
insert into tbCTDonHang values ('DH0003', 'ST0002', 3, 32000, 96000)
insert into tbCTDonHang values ('DH0003', 'BN0002', 3, 36000, 108000)
insert into tbCTDonHang values ('DH0004', 'TT0001', 2, 40000, 80000)
insert into tbCTDonHang values ('DH0005', 'ST0003', 5, 29000, 145000)
insert into tbCTDonHang values ('DH0006', 'ST0003', 3, 35000, 105000)
insert into tbCTDonHang values ('DH0006', 'TT0001', 1, 39000, 39000)
insert into tbCTDonHang values ('DH0006', 'VP0001', 1, 35000, 35000)
insert into tbCTDonHang values ('DH0007', 'ST0003', 3, 36000, 108000)
insert into tbCTDonHang values ('DH0007', 'TT0001', 3, 37000, 111000)
insert into tbCTDonHang values ('DH0008', 'TT0001', 2, 38000, 76000)
insert into tbCTDonHang values ('DH0008', 'VP0002', 2, 35000, 70000)
insert into tbCTDonHang values ('DH0008', 'FD0003', 2, 38000, 76000)
insert into tbCTDonHang values ('DH0009', 'PD0001', 3, 32000, 96000)
insert into tbCTDonHang values ('DH0010', 'BN0001', 5, 32000, 160000)
insert into tbCTDonHang values ('DH0011', 'TT0001', 5, 29000, 145000)
insert into tbCTDonHang values ('DH0012', 'ST0003', 3, 32000, 96000)
insert into tbCTDonHang values ('DH0013', 'VP0002', 2, 30000, 60000)
insert into tbCTDonHang values ('DH0014', 'PD0003', 5, 39000, 195000)
insert into tbCTDonHang values ('DH0015', 'BN0001', 1, 29000, 29000)
insert into tbCTDonHang values ('DH0016', 'ST0003', 5, 42000, 210000)
insert into tbCTDonHang values ('DH0017', 'ST0003', 3, 39000, 117000)
insert into tbCTDonHang values ('DH0018', 'TT0001', 1, 39000, 39000)
insert into tbCTDonHang values ('DH0019', 'VP0001', 1, 35000, 35000)
insert into tbCTDonHang values ('DH0020', 'ST0003', 3, 30000, 90000)
insert into tbCTDonHang values ('DH0021', 'TT0001', 3, 29000, 87000)
insert into tbCTDonHang values ('DH0022', 'TT0001', 2, 36000, 72000)


--Bảng tbMatHang
insert into tbMatHang values ( N'ST0001', N'Freeze trà xanh ', N'ly' , 59000, 'DX', 'MC0001')
insert into tbMatHang values ( N'ST0002', N'Freeze chocolate', N'ly' , 50000, 'DX','MC0002')
insert into tbMatHang values ( N'ST0003', N'Caramel phin Freeze ', N'ly' ,46000 , 'DX','MC0003')
insert into tbMatHang values ( N'ST0004', N'Classic phin Freeze', N'ly' , 49000 , 'DX','MC0004')
insert into tbMatHang values ( N'ST0005', N'Cookie & Cream', N'ly' , 65000 , 'DX','DA0001')
insert into tbMatHang values ( N'TT0001', N'Trà sen vàng', N'ly', 39000, 'TR','DA0002')
insert into tbMatHang values ( N'TT0002', N'Trà thạch đào', N'ly', 35000, 'TR','DA0003')
insert into tbMatHang values ( N'TT0003', N'Trà thạch đào', N'ly', 29000, 'TR','CH0001')
insert into tbMatHang values ( N'TT0004', N'Trà thạch vải', N'ly', 29000, 'TR','CH0002')
insert into tbMatHang values ( N'TT0005', N'Trà xanh đậu đỏ', N'ly', 39000, 'TR','CH0003')
insert into tbMatHang values ( N'VP0001', N'Phin sữa đá', N'ly', 35000, 'CF','TC0001')
insert into tbMatHang values ( N'VP0002', N'Phin đen đá', N'ly', 35000, 'CF','TC0002')
insert into tbMatHang values ( N'VP0003', N'Bạc xỉu đá', N'ly', 29000, 'CF','TC0003')
insert into tbMatHang values ( N'VP0004', N'Espresso', N'ly', 39000, 'CF','TC0001')
insert into tbMatHang values ( N'VP0005', N'Latte', N'ly', 29000, 'CF','TC0002')
insert into tbMatHang values ( N'PD0001', N'PhinDi kem sữa', N'ly', 50000, 'FD','TC0003')
insert into tbMatHang values ( N'PD0001', N'PhinDi choco', N'ly', 50000, 'FD','TC0004')
insert into tbMatHang values ( N'PD0003', N'PhinDi hạnh nhân', N'ly', 50000, 'FD','TC0005')
insert into tbMatHang values ( N'BN0001', N'Tiramisu', N'cái', 29000, 'BN','TC0006')
insert into tbMatHang values ( N'BN0002', N'Bánh chuối', N'cái', 29000, 'BN','TN0001')
insert into tbMatHang values ( N'BN0003', N'Mousse Đào', N'cái', 29000, 'BN','TN0002')
insert into tbMatHang values ( N'BN0004', N'Mousse cacao', N'cái', 29000, 'BN','TN0003')
insert into tbMatHang values ( N'BN0005', N'Phô mai trà xanh', N'cái', 29000, 'BN','TN0004')
insert into tbMatHang values ( N'BN0006', N'Phô mai chanh dây', N'cái', 29000, 'BN','TN0005')
insert into tbMatHang values ( N'BN0007', N'Phô mai cà phê', N'cái', 29000, 'BN','TN0006')

--Bảng tbLoaiHang
insert into tbLoaiHang values ('DX', N'Đá xay')
insert into tbLoaiHang values ('TR', N'Trà')
insert into tbLoaiHang values ('CF', N'Cà phê')
insert into tbLoaiHang values ('FD', N'Fhindi')
insert into tbLoaiHang values ('BN', N'Bánh')

--Bảng tbNguyenLieu
insert into tbNguyenLieu values ('MC0001',N'Bột matcha', 30000, 170,'NCC001')
insert into tbNguyenLieu values ('MC0002',N'Cà phê', 20000, 190,'NCC002')
insert into tbNguyenLieu values ('MC0003',N'Hạt sen', 20000, 270,'NCC001')
insert into tbNguyenLieu values ('MC0004',N'Phô mai', 15000, 270,'NCC002')
insert into tbNguyenLieu values ('DA0001',N'Hồng trà', 20000, 350,'NCC001')
insert into tbNguyenLieu values ('DA0002',N'Lục trà', 20000, 370,'NCC003')
insert into tbNguyenLieu values ('DA0003',N'Kem chese', 17000, 400,'NCC003')
insert into tbNguyenLieu values ('CH0001',N'Chuối', 10000, 180,'NCC004')
insert into tbNguyenLieu values ('CH0002',N'Chanh dây', 30000, 530,'NCC004')
insert into tbNguyenLieu values ('CH0003',N'Bột cacao', 15000, 370,'NCC005')
insert into tbNguyenLieu values ('TC0001',N'Trân châu', 20000, 0,'NCC005')
insert into tbNguyenLieu values ('TC0002',N'Trân châu trắng', 20000, 0,'NCC005')
insert into tbNguyenLieu values ('TC0003',N'Trân châu vải', 20000, 50,'NCC005')
insert into tbNguyenLieu values ('TV0001',N'Thạch vải', 20000, 30,'NCC005')
insert into tbNguyenLieu values ('TV0002',N'Thạch táo', 20000, 60,'NCC005')
insert into tbNguyenLieu values ('TV0003',N'Thạch trái cây', 20000, 200,'NCC005')
insert into tbNguyenLieu values ('TV0004',N'Thạch xoài', 20000, 600,'NCC005')
insert into tbNguyenLieu values ('TV0005',N'Thạch nhãn', 20000, 300,'NCC005')
insert into tbNguyenLieu values ('TV0006',N'Thạch nho', 20000, 70,'NCC005')
insert into tbNguyenLieu values ('TN0001',N'Thạch shocola', 20000, 30,'NCC005')
insert into tbNguyenLieu values ('TN0002',N'Thạch thuỷ tinh', 20000, 60,'NCC005')
insert into tbNguyenLieu values ('TN0003',N'Thạch dâu', 20000, 200,'NCC005')
insert into tbNguyenLieu values ('TN0004',N'Thạch bạc hà', 20000, 600,'NCC005')
insert into tbNguyenLieu values ('TN0005',N'Thạch mật ong', 20000, 300,'NCC005')
insert into tbNguyenLieu values ('TN0006',N'Thạch đào', 20000, 70,'NCC005')
--Bảng tbShipper
insert into tbShipper values ('GH0001', N'Nguyễn Văn Quyết')
insert into tbShipper values ('GH0002', N'Trần Quốc Toản')
insert into tbShipper values ('GH0003', N'Đinh Gia Bảo')
insert into tbShipper values ('GV004', N'Trần Đình Huy')
insert into tbShipper values ('GV001', N'Ngô Văn Liêm')

--Bảng tbNCC
insert into tbNCC values ('NCC001', N'Beemart',N'102 Võ Thị Sáu', 
							'019003467','support@beemart.vn' )
insert into tbNCC values ('NCC002', N'BAbby',N'766/6, CMT8,P5, Q.Tân Bình', 
							'019004567', 'info@abby.vn')
insert into tbNCC values ('NCC003', N'Siêu thị DVP',N'239b Hai Bà Trưng, P6, Q3, TPHCM', 
							'019003456', 'dvpmarket@dvp.com')
insert into tbNCC values ('NCC004', N'Vietblend',N'105 Hai Bà Trung, TPHCM', 
							'019002345','contact@vietblend.vn')
insert into tbNCC values ('NCC005', N'Lo-supply',N'30 Ngô Quyền, Q2, TPHCM', 
							'019004562','support@losupply.vn' )


--THỰC HIỆN TRUY VẤN
/*1. Cho biết danh sách các nhân viên nữ, sắp xếp theo thứ tự năm sinh tăng dần*/
	select *
	from tbNhanVien
	where GioiTinh=N'Nữ'
	order by YEAR(NgaySinh) 

/*2. Cho biết danh sách nhân viên gồm mã nhân viên, họ tên và tuổi của họ*/
select MaNV, HoNV + ' ' +TenNV as HoTenNV, year(getdate()) - year(NgaySinh) as Tuoi
from tbNhanVien 


/*3. Cho biết danh sách các nhân viên nữ có sinh nhật trong tháng 5*/
select *
from tbNhanVien
where GioiTinh=N'Nữ' and MONTH(NgaySinh)=5


/*4. Cho biết các nhân viên có năm sinh trong khoảng 1997 đến 2000*/
select *
from tbNhanVien
where year(NgaySinh) between 1997 and 2000

/*5. Cho biết mỗi khách hàng đã thực hiện giao dịch bao nhiêu hóa đơn*/
select tbDonHang.MaKH, HoKH+' '+ TenKH as HoTenKH,count(MaHD) as SoLuongHD
from tbDonHang join tbKhachHang on tbDonHang.MaKH=tbKhachHang.MaKH
group by tbDonHang.MaKH, TenKH, HoKH

/*6. Cho biết tổng số lượng hóa đơn trong ngày 7 tháng 10*/
select COUNT(MaHD) as N'Số lượng hóa đơn trong ngày 7 tháng 10'
from tbDonHang
where MONTH(ThoiGianDH)=10 and DAY(ThoiGianDH)=7

/*7.Cho biết tổng số nhân viên nam, tổng số nhân viên nữ*/
select GioiTinh ,count(MaNV) as N'Số lượng'
from tbNhanVien
group by GioiTinh

/*8.Cho biết các nhân viên (mã nhân viên, họ tên) lập trên 5 hóa đơn*/
select dh.MaNV, HoNV +' '+TenNV as HoTenNV, count(*) as N'Số lượng'
from tbNhanVien nv join tbDonHang dh on nv.MaNV=dh.MaNV
group by dh.MaNV, HoNV +' '+TenNV 
having count(MaHD)>5


/*9.Cho biết các khách hàng (mã khách hàng, họ tên) có trên 2 hóa đơn*/
select ddh.MaKH, HoKH+' '+ TenKH as HoTenKH, count(*) as N'Số lượng'
from tbDonHang ddh join tbKhachHang kh on ddh.MaKH=kh.MaKH
group by ddh.MaKH, HoKH +' '+TenKH
having count(MaHD)>2

/*10.Cho biết mặt hàng (mã hàng, tên hàng) được đặt nhiều lần nhất*/
select mh.MaMH, TenMH, count(*) as SoLuong
from tbMatHang mh join tbCTDonHang ctdh on mh.MaMH=ctdh.MaMH
group by mh.MaMH, TenMH 
having count(*) = (select top(1) count(*) 
						from tbCTDonHang 
						group by MaMH
						order by count(*) desc)

/*11.Cho biết nhân viên (mã nhân viên, họ, tên) lập nhiều hóa đơn nhất*/
select nv.MaNV, HoNV +' '+TenNV as HoTenNV, count(*) as SoLuong
from tbNhanVien nv join tbDonHang ddh on nv.MaNV=ddh.MaNV
group by nv.MaNV, HoNV +' '+TenNV
having count(*) >= all (select count(*) 
						from tbDonHang 
						group by MaNV)

/*12.Cho biết khách hàng (mã khách hàng, họ tên) thực hiện 
giao dịch mua hàng nhiều nhất*/
select kh.MaKH, HoKH +' '+TenKH as HoTenKH, count(*) as SoLuong
from tbKHachHang kh join tbDonHang ddh on KH.MaKH=ddh.MaKH
group by KH.MaKH, HoKH +' '+TenKH
having count(*) >= all (select count(*) 
						from tbDonHang 
						group by MaKH)

/*13.Cho biết mặt hàng (mã hàng, tên hàng) được đặt ít lần nhất*/
select mh.MaMH, TenMH, count(*) as SoLuong
from tbMatHang mh join tbCTDonHang ctdh on mh.MaMH=ctdh.MaMH
group by mh.MaMH, TenMH 
having count(*) <= all (select count(*) 
						from tbCTDonHang 
						group by MaMH)

/*14.Cho biết danh sách các khách hàng gồm mã khách hàng, họ tên khách hàng, số
lượng hóa đơn đã mua*/
select kh.MaKH, HoKH +' '+TenKH as HoTenKH, count(MaHD) as SoLuong
from tbKhachHang kh left join tbDonHang ddh on kh.MaKH=ddh.MaKH
group by kh.MaKH, HoKH +' '+TenKH

/*15.Cho biết hóa đơn có tổng trị giá lớn nhất trong tháng 10/2022 gồm các thông tin: 
mã hóa đơn, ngày hóa đơn, họ tên khách hàng, địa chỉ khách hàng, tổng giá trị của 
hóa đơn*/
select ddh.MaHD, ThoiGianDH, HoKH +' '+TenKH as HoTenKH, DiaChi, TongGiaTri
from tbDonHang ddh join tbKhachHang kh on ddh.MaKH=kh.MaKH
group by ddh.MaHD, ThoiGianDH, HoKH, TenKH , DiaChi, TongGiaTri
having TongGiaTri = (select top(1) TongGiaTri
						from tbDonHang 
						group by TongGiaTri
						order by TongGiaTri desc) 
		and MONTH(ThoiGianDH)=10 and YEAR(ThoiGianDH)=2022



--SYNONYM
--1.Tạo synonym cho bảng tbKhachHang
create synonym KH
for dbo.tbKhachHang
--Kiểm thử
select *
from KH

--2.Tạo synonym cho bảng tbNhanVien
create synonym NV
for dbo.tbNhanVien
--Kiểm thử
select *
from NV

--3.Tạo synonym cho bảng tbDonHang
create synonym DH
for dbo.tbDonHang
--Kiểm thử
select *
from DH

--4.Tạo synonym cho bảng tbMatHang
create synonym MH
for dbo.tbMatHang
--Kiểm thử
select *
from MH


--INDEX
/*1.tạo chỉ mục cho tên mặt hàng*/
create index idx_TenMH_MH
on tbMatHang(TenMH)
--Kiểm thử
select TenMH
from MH

/*2.tạo chỉ mục cho tên khách hàng*/
create index idx_TenKH_KH
on tbKhachHang(TenKH)
--Kiểm thử
select TenKH
from KH

/*3.tạo chỉ mục cho tên nhân viên*/
create index idx_TenNV_NV
on tbNhanVien(TenNV)
--Kiểm thử
select TenNV
from NV


--VIEW
/*1. Tạo view vwMatHang với các thông tin: mã mặt hàng, tên mặt hàng, đơn giá bán*/
create view vwMatHang
as
select MaMH, TenMH, DgBan
from MH
group by MaMH, TenMH, DgBan
--kiểm thử: 
select * from vwMatHang

/*2. Tạo view vwCafe với các thông tin: mã mặt hàng, tên mặt hàng, 
đơn giá bán, tên loại hàng của các mặt hàng loại cafe*/
create view vwCafe
as
select MaMH, TenMH, DgBan, TenLoaiHang
from MH join tbLoaiHang lh on MH.MaLoaiHang=lh.MaLoaiHang
group by MaMH, TenMH, DgBan, TenLoaiHang
having TenLoaiHang=N'Cà phê'
--kiểm thử:
select * from vwCafe

/*3.Tạo view vwDonHangTTTienMat với các thông tin: mã hóa đơn, họ và tên khách 
hàng, họ và tên nhân viên, thời gian đặt hàng của những hóa đơn thanh toán bằng 
tiền mặt.*/
create view vwDonHangTTTienMat
as
select MaHD, HoKH+' '+ TenKH as HoTenKH, HoNV +' '+TenNV as HoTenNV, ThoiGianDH, PTTT
from KH join DH on KH.MaKH=DH.MaKH join NV on DH.MaNV=NV.MaNV
where PTTT=N'Tiền mặt'
--kiểm thử:
select * from vwDonHangTTTienMat

/*4.Tạo view vwTongSoNguyenLieu cho biết tổng số nguyên liệu được cung cấp 
bởi từng nhà cung cấp với các thông tin: tên nhà cung cấp, tổng số nguyên liệu*/
create view vwTongSoNguyenLieu
as
select TenNCC, count(MaNL) as TongSoNguyenLieu
from tbNCC ncc join tbNguyenLieu nl on ncc.MaNCC=nl.MaNCC
group by TenNCC
--kiểm thử:
select * from vwTongSoNguyenLieu

/*5.Tạo view vwTongNLLonNhat cho biết loại hàng nào có tổng số lượng tồn lớn 
nhất với các thông tin: tên loại hàng, số lượng tồn*/
create view vwTongNLLonNhat
as
select top (1) TenNCC,  count(MaNL) as TongSoNguyenLieu
from tbNCC ncc join tbNguyenLieu nl on ncc.MaNCC=nl.MaNCC
group by TenNCC
order by count(MaNL) desc
--kiểm thử:
select * from vwTongNLLonNhat


/*6.Tạo view vwSLHoaDonTTTienMat để xem tổng số lượng đơn hàng thanh toán 
bằng tiền mặt với thông tin: Tổng số đơn hàng*/
create view vwSLHoaDonTTTienMat
as
select count(PTTT) as TongsoDH
from tbDonHang
group by PTTT
having PTTT=N'Tiền mặt'
--kiểm thử: xem lại
select * from vwSLHoaDonTTTienMat


--FUNCTION
/*1.Tạo hàm cho biết số lượng đơn hàng theo từng nhân viên
(gồm thông tin Mã nhân viên, Họ tên nhân viên, Số lượng đơn hàng)*/
create function f_SLDonHangTungNV()
returns table
as
return (select nv.MaNV, HoNV+' '+TenNV as HotenNV, count(MaHD) as SLHD
from nv join DH on NV.MaNV =DH.MaNV
group by nv.MaNV, HoNV, TenNV)

--Kiểm thử
select * from f_SLDonHangTungNV()

/*2.Tạo hàm cho biết tổng số lượng hàng trong từng hóa đơn (gồm thông tin Mã hóa đơn, 
Họ tên nhân viên, Họ tên khách hàng, Tổng số lượng)*/
create function f_TongSLHangTungHD()
returns table
as
return (select ctdh.MaHD, HoNV+' '+TenNV as HotenNV, HoKH+' '+TenKH as HotenKH,
		sum(SoLuong) as TongSL
		from KH join DH on KH.MaKH=DH.MaKH join NV on DH.MaNV = NV.MaNV 
				join tbCTDonHang ctdh on ctdh.MaHD = DH.MaHD
		group by ctdh.MaHD, HoNV, TenNV, HoKH, TenKH)

--Kiểm thử
select * from f_TongSLHangTungHD()

/*3.Tạo hàm cho biết tổng số lượng hàng trong hóa đơn với
 tham số truyền vào là mã hóa đơn*/
create function f_TongSLHangTheoMaHD(@MaHoaDon nchar(6))
returns int
as
begin
declare @TongSL int
select @TongSL = sum(SoLuong)
from tbCTDonHang
where MaHD=@MaHoaDon
return @TongSL
end
--Kiểm thử
select dbo.f_TongSLHangTheoMaHD('DH0002')


/*4.Tạo hàm cho biết trong từng hóa đơn có bao nhiêu mặt hàng
 với tham số truyền vào là mã hóa đơn*/
create function f_TongSLMatHangTungHDTheoMaHD(@MaHoaDon nchar(6))
returns int
as
begin
declare @TongSLT int
select @TongSLT = count(MaMH)
from tbCTDonHang
where MaHD=@MaHoaDon
return @TongSLT 
end
--Kiểm thử
select dbo.f_TongSLMatHangTungHDTheoMaHD('DH0002')



--STORE PROCEDURE
/*1.Xem số lượng tồn của một nguyên liệu*/
create proc sp_SLT
as
	select MaNL, TenNL, TonKho
	from tbNguyenLieu
--Kiểm thử
	exec sp_SLT

/*2.Cho biết danh sách 5 nguyên liệu có số lượng tồn nhiều nhất*/
create proc sp_Top5SLTon
as	
	select top(5) * from tbNguyenLieu order by TonKho desc
--Kiểm thử
	exec sp_Top5SLTon

/*3.Cho biết danh sách 3 đơn hàng có tổng trị giá lớn nhất*/
create proc sp_Top3DH
as
	select top(3) DH.MaHD,MaKH,MaNV,ThoiGianDH,PTTT,TongGiaTri 
	from DH, tbCTDonHang ct
	where DH.MaHD = ct.MaHD 
	group by DH.MaHD,MaKH,MaNV,ThoiGianDH,PTTT,TongGiaTri 
	order by DH.TongGiaTri desc
--Kiểm thử
	exec sp_Top3DH

/*4.Xem thông tin khách hàng với mã khách hàng do người dùng nhập*/
create proc sp_TTKH @MaKhachHang nchar(6)
as
	select *
	from tbKhachHang
	where MaKH=@MaKhachHang
--Kiểm thử
	exec sp_TTKH 'KH0002'

/*5.Xem đơn giá của một mặt hàng với mã mặt hàng do người dùng nhập*/
create proc sp_DGBMH @MMH nchar(6)
as
	select MaMH, TenMH, DgBan
	from tbMatHang
	where MaMH = @MMH
--Kiểm thử
	exec sp_DGBMH 'PD0003'

/*6.Xem thông tin hóa đơn gồm có: mã hóa đơn, mã nhân viên, họ tên  nhân  viên,  mã khách hàng, 
họ tên khách hàng, thời gian đặt hàng với mã số hóa đơn do người dùng yêu cầu.*/
create proc sp_TTDH @MHD nchar(6)
as
	select dh.MaHD, dh.MaNV, HoNV+' '+TenNV as HoTenNV, dh.MaKH, HoKH+' '+TenKH as HoTenKH, ThoiGianDH
	from DH, NV, KH
	where DH.MaNV = NV.MaNV and DH.MaKH = KH.MaKH and DH.MaHD=@MHD
--Kiểm thử
	exec sp_TTDH 'DH0006'

/*7.Xem thông tin đơn hàng gồm mã hóa đơn, mã hàng, tên hàng, sốlượng bán, đơn giá bán theo khoảng 
thời gian từ ngày đến ngày do người dùng yêu cầu.   */
create proc sp_TTDHTime @Tu datetime2(7), @Den datetime2(7)
as
	select dh.MaHD, ct.MaMH, TenMH, SoLuong, ct.DGBan
	from DH, tbCTDonHang ct, MH
	where DH.MaHD = ct.MaHD and ct.MaMH = MH.MaMH and (ThoiGianDH between @Tu and @Den)
--Kiểm thử
	exec sp_TTDHTime '2022-10-03', '2022-10-05'

/*8.Xem số lượng tồn của một nguyên liệu, nếu số lượng tồn >=0 thì thông báo “còn hàng”,
ngược lại thông báo “đã hết hàng”, với mã nguyên liệu do người dùng nhập */
create proc sp_SLTNL @MNL nchar(6)
as
	declare @SLT int
	select @SLT=TonKho
	from tbNguyenLieu
	where MaNL = @MNL
	if @SLT > 0
		begin
		print N'Còn hàng'
		print N'Số lượng tồn: '+cast(@SLT as nvarchar(10))
		end
		else
		print N'Hết hàng'
--Kiểm thử
	exec sp_SLTNL 'TC0001'



--TRIGGER
--1.Thời gian thanh toán không được sớm hơn thời gian đặt hàng
	create trigger tg_THTT
	on tbDonHang
	for insert, update
	as
	if exists (select * from inserted
				where ThoiGianTT<ThoiGianDH)
	
	begin 
		print (N'Thời gian thanh toán không được sớm hơn thời gian đặt hàng')
		rollback tran
	end
	--Kiểm thử 1
	insert into tbDonHang values ('DH0023', 'KH0002', 'NV0003', 'GH0001',
				 '10-03-2022 8:23:56 PM', N'Tiền mặt', '10-03-2022 8:23:56 AM', 435000)
	go
	--Kiểm thử 2
	update tbDonHang set ThoiGianTT = '2022-10-03 07:23:56.000' where MaHD = 'DH0001'

--2.Trong bảng MatHang, đơn giá bán phải lớn hơn 0
	create trigger tg_DonGiaNhap
	on tbMatHang
	for insert, update
	as
	if exists (select * from inserted 
				where DgBan<=0)
	
	begin 
		print (N'Đơn giá bán phải lớn hơn 0')
		rollback tran
	end
	--Kiểm thử 1
	insert into tbMatHang values ( N'BN0008', N'Phô mai bánh flan', N'cái', 0, 'BN')	
	go
	--Kiểm thử 2
	update tbMatHang set DgBan = 0 where MaMH = 'BN0007'

--3.Giới tính nhân viên có giá trị Nam hoặc Nữ
	create trigger tg_GioiTinhNV
	on tbNhanVien
	for insert, update
	as
	if exists (select * from inserted 
				where GioiTinh not in('Nam', N'Nữ'))
	
	begin 
		print (N'Giới tính nhân viên có giá trị Nam hoặc Nữ')
		rollback tran
	end
	--Kiểm thử 1
	insert into tbNhanVien values('NV0006', N'Nguyễn Thanh', N'Huyền', '05-03-1999',
	N'Củ Khoai Tây', N'29/9/5','098456654',N' huyennt@gmail.com' )	
	go
	--Kiểm thử 2
	update tbNhanvien set GioiTinh = N'Củ Hành Tím' where MaNV = 'NV0002'

--4.Giới tính khách hàng có giá trị Nam hoặc Nữ
	create trigger tg_GioiTinhKH
	on tbKhachHang
	for insert, update
	as
	if exists (select * from inserted 
				where Phai not in('Nam', N'Nữ'))
	
	begin 
		print (N'Giới tính khách hàng có giá trị Nam hoặc Nữ')
		rollback tran
	end
	--Kiểm thử 1
	insert into tbKhachHang values
		('KH0019',N'Nguyễn Thanh',N'Huyền',N'Chim cánh cụt',null,'098123189',null)
	go
	--Kiểm thử 2
	update tbKhachHang set Phai = N'Rái cá' where MaKH = 'KH0018'

--Xoá đơn hàng khi khách huỷ đơn
	create trigger tg_XoaDonHang 
	on tbDonHang 
	for delete 
	as 
	begin 
	declare @MHD nchar(6) 
	select @MHD = MaHD from deleted 
	Delete from tbCTDonHang where MaHD = @MHD 
	print (N'Đã xoá đơn hàng bị huỷ') 
	end

	--Kiểm thử 
	delete from tbDonHang where MaHD='DH0001'
	
	select * from tbDonHang
	go
	select * from tbCTDonHang


	--USER
	--Tạo tài khoản đăng nhập cho QuanLy
	Create login QuanLy1
	with password = 'QL111',
	default_database = QuanLyBanHang_HighlandsCoffee
	--Tạo người dùng QuanLy1
	Create user QuanLy1 for login QuanLy1
	--Cấp các quyền cho QuanLy1
	grant select, insert, update, delete to QuanLy1

	--Tạo tài khoản đăng nhập cho NhanVien
	Create login NhanVien1
	with password = 'NV111',
	default_database = QuanLyBanHang_HighlandsCoffee
	--Tạo người dùng NhanVien1
	Create user NhanVien1 for login NhanVien1
	--Cấp các quyền cho NhanVien1
	grant select, insert, update, delete on tbDonHang to NhanVien1
	grant select, insert, update, delete on tbCTDonHang to NhanVien1
	grant select, insert, update, delete on tbKhachHang to NhanVien1
	grant select, update (TonKho) on tbNguyenLieu to NhanVien1
	grant select on tbLoaiHang to NhanVien1
	grant select on tbMatHang to NhanVien1
	grant select on tbNCC to NhanVien1
	grant select on tbShipper to NhanVien1
	deny select(DiaChi, DienThoai, Email) on tbNCC to NhanVien1
	grant select on vwDonHangTTTienMat to NhanVien1
	grant select on vwSLHoaDonTTTienMat to NhanVien1
	grant select on vwTongNLLonNhat to NhanVien1
	grant select on vwTongSoNguyenLieu to NhanVien1
	grant select on vwMatHang to NhanVien1

	--Tạo tài khoản đăng nhập cho Shipper
	Create login Shipper1
	with password = 'SP111',
	default_database = QuanLyBanHang_HighlandsCoffee
	--Tạo người dùng Shipper1
	Create user Shipper1 for login Shipper1
	--Cấp các quyền cho Shipper1
	grant select on tbKhachHang to Shipper1
	grant select on tbMatHang to Shipper1
	grant select on tbCTDonHang to Shipper1
	grant select, update (ThoiGianTT,PTTT) on tbDonHang to Shipper1




	--REPORT
	 --Tạo report thống kê số lượng khách hàng theo năm
	select Format(ThoiGianDH, 'yyyy') as Nam,
	count (distinct [MaKH]) as SoLuongKH
	into Report_SoLuongKHTheoNam
	from tbDonHang
	group by Format(ThoiGianDH, 'yyyy')
	order by Nam desc

	--Kiểm thử
	select*
	from Report_SoLuongKHTheoNam


	 --Tạo report thống kê số lượng đơn hàng được tạo theo từng nhân viên
	 select NV.MaNV, HoNV+' '+TenNV as HoTenNV, count(MaHD) as SoLuongHD
	 into Report_SoLuongDHTheoNV
	 from NV left join DH on NV.MaNV=DH.MaNV
	 group by NV.MaNV, HoNV, TenNV
	 order by SoLuongHD desc

	 --Kiểm thử
	 select*
	 from Report_SoLuongDHTheoNV

	 --Tạo report thống kê doanh số từng khách hàng
	 select KH.MaKH, HoKH+' '+ TenKH as HoTenKH, sum(TongGiaTri) as DoanhSo
	 into Report_DoanhSoTungKH
	 from DH join KH on DH.MaKH=KH.MaKH
	 group by KH.MaKH, HoKH, TenKH
	 order by DoanhSo desc
	 
	 --Kiểm thử
	 select*
	 from Report_DoanhSoTungKH

	 --Tạo report thống kê số lượng mua của các mặt hàng
	 select  MH.MaMH, TenMH, sum(SoLuong) as SoLuongMua
	 into Report_SoLuongMuaTungMH
	 from MH join tbCTDonHang ct on MH.MaMH=ct.MaMH
	 group by MH.MaMH, TenMH
	 order by SoLuongMua desc
	 
	 --Kiểm thử
	 select*
	 from Report_SoLuongMuaTungMH