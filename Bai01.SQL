CREATE DATABASE QLBH
GO
-----------------------------------------------------
-----------------------------------------------------
---------------------------------------------
-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
-----------------------------------------------------

INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) VALUES 
('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '1960-10-22', '2006-07-22', 13600000),
('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-03-04', '2006-03-30', 840000),
('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-12-16', '2006-08-05', 365000),
('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-03-09', '2006-09-25', 250000),
('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08241608', '1950-10-03', '2006-03-19', 500000),
('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1951-12-31', '2006-11-01', 245000),
('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-06-14', '2007-01-01', 315000),
('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-10-01', '2007-01-10', 365000),
('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-09-03', '2007-01-14', 70000),
('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983-05-25', '2007-01-16', 510000);

INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES 
('NV01', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13'),
('NV02', 'Le Thi Phi Yen', '0985767390', '2006-04-14'),
('NV03', 'Nguyen Van B', '0997047382', '2006-04-21'),
('NV04', 'Ngo Thanh Tuan', '0913758492', '2006-06-24'),
('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');

INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES 
('BC01', 'But chi', 'cay', 'Singapore', 3000),
('BC02', 'But chi', 'cay', 'Singapore', 5000),
('BC03', 'But chi', 'cay', 'Viet Nam', 3500),
('BC04', 'But chi', 'hop', 'Viet Nam', 30000),
('BB01', 'But bi', 'cay', 'Viet Nam', 5000),
('BB02', 'But bi', 'cay', 'Trung Quoc', 7000),
('BB03', 'But bi', 'hop', 'Trung Quoc', 100000),
('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500),
('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500),
('TV03', 'Tap 100 giay toi', 'quyen', 'Viet Nam', 3000),
('TV04', 'Tap 200 giay toi', 'quyen', 'Viet Nam', 5500),
('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000),
('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000),
('TV07', 'Tap 100 trang', 'chuc', 'Viet Nam', 34000),
('ST01', 'So tay 50 trang', 'quyen', 'Viet Nam', 2500),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 3500),
('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
('ST09', 'But long', 'cay', 'Viet Nam', 5000),
('ST10', 'But long', 'cay', 'Trung Quoc', 7000);

INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES 
(1001, '2006-07-23', 'KH01', 'NV01', 320000),
(1002, '2006-08-12', 'KH02', 'NV01', 840000),
(1003, '2006-08-23', 'KH02', 'NV01', 100000),
(1004, '2006-09-01', 'KH02', 'NV01', 180000),
(1005, '2006-10-20', 'KH01', 'NV02', 3800000),
(1006, '2006-10-16', 'KH01', 'NV03', 2430000),
(1007, '2006-10-28', 'KH03', 'NV03', 510000),
(1008, '2006-10-28', 'KH03', 'NV04', 440000),
(1009, '2006-11-28', 'KH01', 'NV05', 5200000),
(1010, '2006-04-11', 'KH04', 'NV03', 250000),
(1011, '2006-04-11', 'KH05', 'NV03', 21000),
(1012, '2006-12-12', 'KH06', 'NV05', 5000),
(1013, '2006-12-31', 'KH07', 'NV05', 315000),
(1014, '2007-01-01', 'KH07', 'NV02', 12500),
(1015, '2007-01-10', 'KH08', 'NV03', 330000),
(1016, '2007-01-14', 'KH09', 'NV03', 67500),
(1017, '2007-01-02', 'KH08', 'NV03', 35000),
(1018, '2007-01-03', 'KH10', 'NV03', 330000),
(1019, '2007-01-13', 'KH01', 'NV05', 30000),
(1020, '2007-01-14', 'KH09', 'NV04', 70000),
(1021, '2007-01-16', 'KH10', 'NV03', 67500),
(1022, '2007-01-16', NULL, 'NV03', 97000),
(1023, '2007-01-16', NULL, 'NV01', 330000);

INSERT INTO CTHD (SOHD, MASP, SL) VALUES
(1001, 'TV02', 10),
(1001, 'ST01', 5),
(1001, 'BC01', 5),
(1001, 'BC02', 10),
(1001, 'ST08', 10),
(1002, 'BC04', 20),
(1002, 'BB01', 20),
(1002, 'BB02', 20),
(1003, 'BB03', 10),
(1004, 'TV01', 20),
(1004, 'TV02', 10),
(1004, 'TV03', 10),
(1004, 'TV04', 10),
(1005, 'TV05', 50),
(1005, 'TV06', 50),
(1006, 'TV07', 20),
(1006, 'ST01', 30),
(1006, 'ST02', 10),
(1007, 'ST03', 10),
(1008, 'ST04', 8),
(1009, 'ST05', 10),
(1010, 'TV07', 50),
(1010, 'ST07', 50),
(1010, 'ST08', 100),
(1010, 'ST04', 50),
(1010, 'TV03', 100),
(1011, 'ST06', 50),
(1012, 'ST07', 3),
(1013, 'ST08', 5),
(1014, 'BC02', 80),
(1014, 'BB02', 100),
(1014, 'BC04', 60),
(1014, 'BB01', 50),
(1015, 'BB02', 30),
(1015, 'BB03', 7),
(1016, 'TV01', 5),
(1017, 'TV02', 1),
(1017, 'TV03', 1),
(1017, 'TV04', 5),
(1018, 'ST04', 6),
(1019, 'ST05', 1),
(1019, 'ST06', 2),
(1020, 'ST07', 10),
(1021, 'ST08', 5),
(1021, 'TV01', 7),
(1021, 'TV02', 10),
(1022, 'ST07', 1),
(1023, 'ST04', 6);
