--Bai 05--

--C�u 1--
SELECT MASP, TENSP 
FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc';

--C�u 2--
SELECT MASP, TENSP 
FROM SANPHAM 
WHERE DVT IN ('cay', 'quyen');

--C�u 3--
SELECT MASP, TENSP 
FROM SANPHAM 
WHERE MASP LIKE 'B%01';

--C�u 4--
SELECT MASP, TENSP 
FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc' 
  AND GIA BETWEEN 30000 AND 40000;

 --C�u 5--
  SELECT MASP, TENSP 
FROM SANPHAM 
WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan') 
  AND GIA BETWEEN 30000 AND 40000;

--C�u 6--
SELECT SOHD, TRIGIA 
FROM HOADON 
WHERE NGHD IN ('2007-01-01', '2007-01-02');

--C�u 7--
SELECT SOHD, TRIGIA 
FROM HOADON 
WHERE NGHD BETWEEN '2007-01-01' AND '2007-01-31'
ORDER BY NGHD ASC, TRIGIA DESC;

--C�u 8--
SELECT DISTINCT KHACHHANG.MAKH, HOTEN 
FROM KHACHHANG, HOADON 
WHERE KHACHHANG.MAKH = HOADON.MAKH 
  AND NGHD = '2007-01-01';

--C�u 9--
SELECT SOHD, TRIGIA 
FROM HOADON 
WHERE MANV = (SELECT MANV FROM NHANVIEN WHERE HOTEN = 'Nguyen Van B') 
  AND NGHD = '2006-10-28';

--C�u 10--
SELECT DISTINCT CTHD.MASP, TENSP 
FROM CTHD, HOADON, SANPHAM, KHACHHANG 
WHERE CTHD.SOHD = HOADON.SOHD 
  AND CTHD.MASP = SANPHAM.MASP 
  AND HOADON.MAKH = KHACHHANG.MAKH 
  AND KHACHHANG.HOTEN = 'Nguyen Van A' 
  AND NGHD BETWEEN '2006-10-01' AND '2006-10-31';

 --C�u 11--
 SELECT DISTINCT SOHD 
FROM CTHD 
WHERE MASP IN ('BB01', 'BB02');
