
--Tao Table va khoa chinh--
CREATE TABLE KHOA
(
	MAKHOA varchar(4) NOT NULL,
	TENKHOA varchar(40),
	NGTLAP smalldatetime,
	TRGKHOA char(4),
	CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
)

CREATE TABLE MONHOC
(
	MAMH varchar(10) NOT NULL,
	TENMH varchar(40),
	TCLT tinyint,
	TCTH tinyint,
	MAKHOA varchar(4),
	CONSTRAINT PK_MH PRIMARY KEY(MAMH)
)

CREATE TABLE DIEUKIEN
(
	MAMH varchar(10) NOT NULL,
	MAMH_TRUOC varchar(10) NOT NULL,
	CONSTRAINT PK_DK PRIMARY KEY(MAMH, MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN
(
	MAGV char(4) NOT NULL,
	HOTEN varchar(40),
	HOCVI varchar(10),
	HOCHAM varchar(10),
	GIOITINH varchar(3),
	NGSINH smalldatetime,
	NGVL smalldatetime,
	HESO numeric(4,2),
	MUCLUONG money,
	MAKHOA varchar(4),
	CONSTRAINT PK_GV PRIMARY KEY(MAGV)
)

CREATE TABLE LOP
(
	MALOP char(3) NOT NULL,
	TENLOP varchar(40),
	TRGLOP char(5),
	SISO tinyint,
	MAGVCN char(4),
	CONSTRAINT PK_LOP PRIMARY KEY(MALOP)
)

CREATE TABLE HOCVIEN
(
	MAHV char(5) NOT NULL,
	HO varchar(40),
	TEN varchar(10),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3),
	CONSTRAINT PK_HV PRIMARY KEY(MAHV)
)

CREATE TABLE GIANGDAY
(
	MALOP char(3) NOT NULL,
	MAMH varchar(10) NOT NULL,
	MAGV char(4),
	HOCKY tinyint,
	NAM smallint,
	TUNGAY smalldatetime,
	DENNGAY smalldatetime,
	CONSTRAINT PK_GD PRIMARY KEY(MALOP, MAMH)
)

CREATE TABLE KETQUATHI
(
	MAHV char(5) NOT NULL,
	MAMH varchar(10) NOT NULL,
	LANTHI tinyint NOT NULL,
	NGTHI smalldatetime,
	DIEM numeric(4,2),
	KQUA varchar(10),
	CONSTRAINT PK_KQT PRIMARY KEY(MAHV, MAMH, LANTHI)
)

--Thiet lap khoa ngoai--

--makhoa---
ALTER TABLE MONHOC ADD CONSTRAINT FK_MH_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)

ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GV_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)

--malop--
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)

ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HV_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)

--mamonhoc--
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD_MH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DK_MH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH),
CONSTRAINT FK_DK_MHT FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)

ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQT_MH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

--magv--
ALTER TABLE LOP ADD CONSTRAINT FK_LOP_GV FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV)

ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD_GV FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)

ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA_GV FOREIGN KEY(TRGKHOA) REFERENCES GIAOVIEN(MAGV)

--mahv--
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQT_HV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)

ALTER TABLE LOP ADD CONSTRAINT FK_LOP_HV FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)

--them thuoc tinh cho HOCVIEN--
ALTER TABLE HOCVIEN
ADD GHICHU varchar(20), DIEMTB numeric(4,2), XEPLOAI varchar(10)

--cau 3--
ALTER TABLE HOCVIEN
ADD CONSTRAINT CK_GT CHECK ((GIOITINH='Nam') or (GIOITINH='Nu'))

--cau 4--
ALTER TABLE KETQUATHI
ADD CONSTRAINT CK_DIEM CHECK ((DIEM>=0) and (DIEM<=10))

--cau 5--
ALTER TABLE KETQUATHI ADD CONSTRAINT CHK_KQ CHECK ((KQUA = 'Dat' AND Diem >=5) OR (KQUA = 'Khong Dat' AND Diem <5))

--cau 6--
ALTER TABLE KETQUATHI ADD CONSTRAINT CHK_LT CHECK(LANTHI<=3)

--cau 7--
ALTER TABLE GIANGDAY ADD CONSTRAINT CHK_HK CHECK (HOCKY IN (1,2,3))

--cau 8--
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHK_HV CHECK (HOCVI IN ('CN', 'KS', 'ThS', 'TS', 'PTS'))

ALTER TABLE KHOA NOCHECK CONSTRAINT ALL
ALTER TABLE LOP NOCHECK CONSTRAINT ALL
ALTER TABLE MONHOC NOCHECK CONSTRAINT ALL
ALTER TABLE DIEUKIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE HOCVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIANGDAY NOCHECK CONSTRAINT ALL
ALTER TABLE KETQUATHI NOCHECK CONSTRAINT ALL

delete from KHOA
delete from LOP
delete from MONHOC
delete from DIEUKIEN
delete from GIAOVIEN
delete from HOCVIEN
delete from GIANGDAY
delete from KETQUATHI

--Câu 2--
INSERT INTO KHOA(MAKHOA, TENKHOA,NGTLAP, TRGKHOA)
VALUES
('KHMT', 'Khoa hoc may tinh', '2005-06-07','GV01'),
('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
('MTT','Mang va truyen thong','2005-10-20','Gv03'),
('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL);

INSERT INTO LOP(MALOP, TENLOP, TRGLOP, SISO, MAGVCN)
VALUES
('K11','Lop 1 khoa 1', 'K1108',11,'GV07'),
('K12','Lop 2 khoa 1', 'K1205',12,'GV09'),
('K13','Lop 3 khoa 1', 'K1305',12,'GV14');

INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA)
VALUES 
('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
('CTRR', 'Cau truc roi rac', 5, 2, 'KHMT'),
('CSDL', 'Co so du lieu', 3, 1, 'KHMT'),
('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 1, 'KHMT'),
('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
('KTMT', 'Kien truc may tinh', 3, 1, 'KHMT'),
('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 3, 1, 'HTTT'),
('HDH', 'He dieu hanh', 3, 1, 'KHMT'),
('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 1, 'CNPM'),
('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');

INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
VALUES
('K11', 'THDC', 'GV07', 1, 2006, '2006-01-02', '2006-05-12'),
('K12', 'THDC', 'GV08', 1, 2006, '2006-01-02', '2006-05-12'),
('K13', 'THDC', 'GV15', 1, 2006, '2006-01-02', '2006-05-12'),
('K11', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K12', 'CTRR', 'GV08', 1, 2006, '2006-01-09', '2006-05-17'),
('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CSDL', 'GV05', 3, 2006, '2006-08-18', '2006-12-15'),
('K11', 'DHMT', 'GV07', 3, 2006, '2006-08-18', '2006-12-15'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-18', '2006-12-15'),
('K11', 'HDH', 'GV04', 1, 2007, '2007-01-18', '2007-03-18'),
('K12', 'HDH', 'GV05', 1, 2007, '2007-01-18', '2007-03-18'),
('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');

INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES 
('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-25', '2004-11-01', 5.00, 2250.00, 'KHMT'),
('GV02', 'Tan Tam Thanh', 'TS', 'PGS', 'Nam', '1985-12-17', '2004-12-24', 4.50, 2025.00, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'PGS', 'Nam', '1964-03-29', '2004-12-31', 4.00, 1800.00, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1985-12-21', '2005-12-24', 4.50, 2025.00, 'KHMT'),
('GV05', 'Mai Thanh Danh', 'TS', 'GV', 'Nam', '2004-12-14', '2005-12-15', 4.50, 2025.00, 'KHMT'),
('GV06', 'Tran Doanh Hung', 'TS', 'GV', 'Nam', '1985-12-13', '2005-12-15', 4.00, 2025.00, 'KHMT'),
('GV07', 'Nguyen Thi Lan', 'CN', 'GV', 'Nu', '1984-12-14', '2006-12-15', 3.19, 1800.00, 'KHMT'),
('GV08', 'Le Thi Trang', 'CN', 'Null', 'Nu', '1985-12-21', '2006-12-15', 3.19, 1860.00, 'KHMT'),
('GV09', 'Nguyen Tien Loan', 'ThS', 'Null', 'Nam', '1984-12-12', '2006-12-15', 3.50, 837.00, 'CNPM'),
('GV10', 'Nguyen Minh Son', 'ThS', 'Null', 'Nam', '1985-12-12', '2006-12-12', 3.50, 2100.00, 'KHMT'),
('GV11', 'Nguyen Van A', 'TS', 'GV', 'Nam', '2004-12-13', '2006-12-13', 1.50, 786.00, 'CNPM'),
('GV12', 'Nguyen Thi Minh Chau', 'CN', 'GV', 'Nu', '2005-12-15', '2007-01-12', 1.19, 837.00, 'KHMT'),
('GV13', 'Tran Van Anh', 'ThS', 'GV', 'Nam', '1985-12-14', '2007-12-14', 2.19, 1800.00, 'KHMT'),
('GV14', 'Nguyen Minh Thanh', 'CN', 'GV', 'Nu', '1984-12-12', '2007-12-15', 1.00, 2000.00, 'KHMT'),
('GV15', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1978-04-05', '2005-12-12', 3.00, 1350.00, 'KHMT');

INSERT INTO HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) VALUES
('K1101', 'Nguyen Van', 'A', '1986-11-27', 'Nam', 'TpHCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '1986-09-14', 'Nu', 'Kien Giang', 'K11'),
('K1103', 'Ha Duy', 'Lap', '1986-07-13', 'Nam', 'Kien Giang', 'K11'),
('K1104', 'Tran Ngoc', 'Lien', '1986-03-30', 'Nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran Minh', 'Long', '1986-07-27', 'Nam', 'Kien Giang', 'K11'),
('K1106', 'Le Nhat', ' ', '1986-04-24', 'Nam', 'TpHCM', 'K11'),
('K1107', 'Nguyen Van', 'Nhut', '1986-12-27', 'Nam', 'Kien Giang', 'K11'),
('K1108', 'Nguyen Manh', 'Hai', '1986-07-27', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '1986-07-19', 'Nu', 'Vinh Long', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '1986-05-02', 'Nu', 'Vinh Long', 'K11'),
('K1111', 'Le Ha', ' ', '1986-12-25', 'Nam', 'Vinh Long', 'K11'),
('K1201', 'Nguyen Van', 'B', '1986-11-27', 'Nam', 'TpHCM', 'K12'),
('K1202', 'Nguyen Thi Kim', 'Yen', '1986-01-18', 'Nu', 'TpHCM', 'K12'),
('K1203', 'Tran Thi', 'Hanh', '1986-09-17', 'Nu', 'Kien Giang', 'K12'),
('K1204', 'Nguyen Thi Truc', 'Duyen', '1986-07-19', 'Nu', 'TpHCM', 'K12'),
('K1205', 'Nguyen Thi Kim', 'Hanh', '1986-08-17', 'Nu', 'Kien Giang', 'K12'),
('K1206', 'Tran Thi Bich', ' ', '1986-02-07', 'Nu', 'Nghe An', 'K12'),
('K1207', 'Huynh Thi Kim', 'Thuy', '1986-08-10', 'Nu', 'Nghe An', 'K12'),
('K1208', 'Pham Thanh', 'Trieu', '1986-02-23', 'Nam', 'TpHCM', 'K12'),
('K1209', 'Ngo Thanh', 'Do', '1986-09-12', 'Nam', 'TpHCM', 'K12'),
('K1210', 'Nguyen Thi', 'Yen', '1986-08-12', 'Nu', 'TpHCM', 'K12'),
('K1211', 'Do Thi', ' ', '1986-03-12', 'Nu', 'Ha Noi', 'K12'),
('K1212', 'Le Thi', 'Phi', '1986-09-12', 'Nu', 'TpHCM', 'K12'),
('K1301', 'Nguyen Thi Kim', 'Cuc', '1986-07-02', 'Nu', 'TpHCM', 'K13'),
('K1302', 'Truong Thi My', 'Hien', '1986-03-18', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le Duc', 'Thanh', '1986-08-21', 'Nam', 'Nghe An', 'K13'),
('K1304', 'Nguyen Thi', 'Hoa', '1986-11-21', 'Nu', 'Kien Giang', 'K13'),
('K1305', 'Le Thi', 'Hong', '1986-02-27', 'Nu', 'Vinh Long', 'K13'),
('K1306', 'Tran Minh', 'Hung', '1986-05-28', 'Nam', 'TpHCM', 'K13'),
('K1307', 'Nguyen Van', 'A', '1986-08-18', 'Nam', 'TpHCM', 'K13'),
('K1308', 'Nguyen Trung', 'Hieu', '1986-11-18', 'Nam', 'TpHCM', 'K13'),
('K1309', 'Tran Thi Hong', ' ', '1986-12-24', 'Nu', 'TpHCM', 'K13'),
('K1310', 'Tran Minh', 'Tho', '1986-04-04', 'Nam', 'TpHCM', 'K13'),
('K1311', 'Nguyen Thi Kim', 'Yen', '1986-09-07', 'Nu', 'TpHCM', 'K13');

INSERT INTO KetQuaThi (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) VALUES
('K1101', 'CSDL', 1, '2006-07-20', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '2006-12-28', 9.00, 'Dat'),
('K1101', 'THDC', 1, '2006-05-25', 9.00, 'Dat'),
('K1102', 'CSDL', 1, '2006-05-13', 9.50, 'Dat'),
('K1102', 'CTDLGT', 1, '2006-07-20', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '2006-12-28', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '2007-01-15', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '2006-05-13', 8.00, 'Dat'),
('K1103', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '2006-05-25', 7.00, 'Dat'),
('K1104', 'CSDL', 1, '2006-12-28', 8.50, 'Dat'),
('K1201', 'CSDL', 1, '2006-07-20', 6.00, 'Dat'),
('K1201', 'CTDLGT', 1, '2006-12-28', 7.00, 'Dat'),
('K1201', 'THDC', 1, '2006-07-27', 8.00, 'Dat'),
('K1202', 'CSDL', 1, '2006-05-13', 7.00, 'Dat'),
('K1202', 'CTDLGT', 1, '2006-12-28', 8.50, 'Dat'),
('K1202', 'THDC', 1, '2006-05-20', 6.00, 'Dat'),
('K1203', 'CSDL', 1, '2006-05-13', 9.25, 'Dat'),
('K1203', 'CTDLGT', 1, '2006-12-28', 9.50, 'Dat'),
('K1203', 'THDC', 1, '2006-05-20', 10.00, 'Dat'),
('K1203', 'CTRR', 1, '2006-05-13', 6.00, 'Dat'),
('K1204', 'CSDL', 1, '2006-07-20', 8.50, 'Dat'),
('K1204', 'CTDLGT', 1, '2006-12-28', 6.75, 'Dat'),
('K1204', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1204', 'CTRR', 1, '2006-05-13', 6.00, 'Dat'),
('K1301', 'CSDL', 1, '2006-07-20', 4.25, 'Khong Dat'),
('K1301', 'CTDLGT', 1, '2006-07-25', 8.00, 'Dat'),
('K1301', 'THDC', 1, '2006-05-20', 7.75, 'Dat'),
('K1301', 'CTRR', 1, '2006-05-13', 6.50, 'Dat'),
('K1302', 'CSDL', 1, '2006-05-13', 6.75, 'Dat'),
('K1302', 'THDC', 1, '2006-05-20', 9.00, 'Dat'),
('K1303', 'CSDL', 1, '2006-12-20', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '2006-07-25', 4.50, 'Khong Dat'),
('K1303', 'THDC', 1, '2006-08-15', 4.25, 'Khong Dat'),
('K1303', 'CTRR', 1, '2006-05-20', 6.00, 'Dat'),
('K1304', 'CSDL', 1, '2006-05-20', 8.75, 'Dat'),
('K1304', 'CTDLGT', 1, '2006-05-13', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '2006-07-20', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '2006-07-25', 8.00, 'Dat'),
('K1305', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '2006-05-13', 10.00, 'Dat');