---*** 1.Xuất ra thông tin nhân viên có giới tính nữ
SELECT * FROM NHANVIEN WHERE GioiTinh=N'Nữ'

---*** 2.Xuất ra danh sách nhân viên có số điện thoại là 11 chữ số và có  chức vụ là hướng dẫn viên
SELECT * FROM NHANVIEN NV,CHUCVU CV WHERE NV.MaCV=CV.MaCV AND LEN(SDT) =11 AND TenCV = N'Hướng dẫn viên' 

---*** 3.Xuất ra danh sách  các tour do nhân viên Doãn Chí Bình làm tài xế
SELECT TenTour FROM TOUR T,NHANVIEN NV ,PHUONGTIEN PT WHERE PT.MaPT=T.MaPT AND PT.MaNV=NV.MaNV AND NV.TenNV=N'Doãn Chí Bình'  

---*** 4.Tìm nhân viên hướng dẫn nhiều đoàn nhất
SELECT *FROM NHANVIEN NV INNER JOIN
(SELECT TOP 1 MaNV,Count(*) AS TONG FROM DOAN GROUP BY MaNV ORDER BY TONG DESC) S
ON NV.MANV = S.MaNV

---*** 5.Tìm nhân viên hướng dẫn chuyến nhiều nhất
SELECT *FROM NHANVIEN NV INNER JOIN
(SELECT TOP 1 MaNV,Count(*) AS TONG FROM CHUYEN GROUP BY MaNV ORDER BY TONG DESC) S
ON NV.MANV = S.MaNV;

---*** 6.Tìm nhân viên có họ Nguyễn
SELECT * FROM NHANVIEN WHERE TenNV LIKE N'Nguyễn%'

---***7.Tìm những hợp đồng được ký kết vào năm 2019
SELECT * FROM HOPDONG WHERE YEAR(NgayLapHD)=2019

---***8.Xuất ra địa điểm tham quan có khách sạn 4 sao trở lên
SELECT TenDD FROM DIADIEMTHAMQUAN WHERE MaKS IN (
SELECT MaKS FROM KHACHSAN WHERE LoaiKS='4' OR  LoaiKS='5' )

---***9.Xuất ra thông tin khách hàng tham gia đoàn du lịch trong khoảng tháng 3/2018 đến 5/2018
SELECT *FROM KHACHHANG WHERE MaKH IN (
SELECT MaKh FROM HOPDONG WHERE NgayDi BETWEEN '2018/03/01' AND '2018/05/30'
)
---***10.Cho biết  đoàn có số lượng khách lớn nhất của hợp đồng
SELECT TOP 1 D.MaDoan,Tong FROM DOAN D INNER JOIN(
SELECT D.MaDoan ,COUNT(*) AS 'Tong'
FROM DOAN D,HOPDONG HD 
WHERE D.MaDoan= HD.MaDoan
GROUP BY D.MaDoan
) AS T
ON T.MaDoan=D.MaDoan


---***11.Cho biết  chuyến có số lượng khách lớn nhất khi đăng ký

SELECT TOP 1 C.MaChuyen,Tong FROM CHUYEN C INNER JOIN(
SELECT C.MaChuyen ,COUNT(*) AS 'Tong'
FROM CHUYEN C,DANGKY DK 
WHERE C.MaChuyen= DK.MaChuyen
GROUP BY C.MaChuyen
) AS T
ON T.MaChuyen=C.MaChuyen

---***12.Danh sách các đoàn có địa điểm tham quan tại thành phố HCM
SELECT * FROM DOAN WHERE MaTour IN(
SELECT MaTour FROM CHITIETTHAMQUAN WHERE MADD IN (
SELECT MADD FROM DIADIEMTHAMQUAN WHERE ThanhPho=N'HCM')
)





(SELECT MaNV,Count(*) FROM CHUYEN GROUP BY MaNV) 
SELECT MaNV,Count(*) FROM DOAN GROUP BY MaNV)



SELECT * FROM CHITIETTHAMQUAN

SELECT * FROM DIADIEMTHAMQUAN

SELECT DISTINCT C.MaNV,D.MaNV FROM CHUYEN C,DOAN D

SELECT NV.MaNV FROM NHANVIEN NV,DOAN D,CHUYEN C WHERE NV.MaNV=D.MaNV OR NV.MaNV=C.MaNV 

SELECT MaNV,Count(*) FROM CHUYEN GROUP BY MaNV 
SELECT MaNV,Count(*) FROM DOAN GROUP BY MaNV

SELECT MaNV,Count(*) FROM CHUYEN GROUP BY MaNV
UNION(
SELECT MaNV,Count(*) FROM DOAN GROUP BY MaNV
)

SELECT * FROM NHANVIEN