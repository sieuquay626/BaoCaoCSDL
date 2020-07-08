create database Tour 
use Tour

create table CHUCVU(
	MaCV varchar(5) primary key not null,
	TenCV nvarchar(50)
	)

create table NHANVIEN(
	MaNV varchar(5) primary key not null,
	TenNV nvarchar(50),
	GioiTinh nvarchar(3) check(GioiTinh = N'Nam' or GioiTinh =N'Nữ'),
	SDT char(11) check ( SDT like '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or SDT like '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	MaCV varchar(5) constraint FK_NV_CV foreign key references CHUCVU(MaCV) not null,
)

create table PHUONGTIEN(
	MaPT varchar(5) primary key not null,
	TenPT nvarchar(50),
	BienSo nvarchar(20) unique,
	MaNV varchar(5) constraint FK_PT_NV foreign key references NHANVIEN(MaNV) not null,
)

create table KHACHSAN(
	MaKS varchar(5) primary key not null,
	TenKS nvarchar(50),
	LoaiKS char(1) check ( LoaiKS like '[1-5]') not null ,
	DiaChi nvarchar(50),
	SDT char(11) check ( SDT like '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or SDT like '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null
)

create table DIADIEMTHAMQUAN(
	MaDD varchar(5) primary key not null,
	TenDD nvarchar(50) ,
	ThanhPho nvarchar(50),
	MaKS varchar(5) constraint FK_DDTQ_KS foreign key references KHACHSAN(MaKS) not null,
)

create table TOUR(
	MaTour varchar(5) primary key not null,
	TenTour nvarchar(50) ,
	SoNgay int,
	SoDem int,
	MaPT varchar(5) constraint FK_TOUR_PT foreign key references PHUONGTIEN(MaPT) not null,
)

create table CHITIETTHAMQUAN(
	MaDD varchar(5) constraint FK_CTTQ_DDTQ foreign key references DIADIEMTHAMQUAN(MaDD) not null,
	MaTour varchar(5) constraint FK_CTTQ_TOUR foreign key references TOUR(MaTour) not null,
	constraint PK_MaDD_MaTour primary key (MaDD,MaTour)
)

create table KHACHHANG(
	MaKH varchar(5) primary key not null,	
	TenKH nvarchar(50) ,
	DiaChi nvarchar(50),
	SDT char(11) check ( SDT like '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or SDT like '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null
)

create table DOAN(
	MaDoan varchar(5) primary key not null,
	TenDoan nvarchar(50) ,
	MaTour varchar(5) constraint FK_DOAN_TOUR foreign key references TOUR(MaTour) not null,
	MaNV varchar(5) constraint FK_DOAN_NV foreign key references NHANVIEN(MaNV) not null,
	MaNDD varchar(5) constraint FK_DOAN_KH foreign key references KHACHHANG(MaKH) not null
)

create table HOPDONG(
	MaKH varchar(5) constraint FK_HD_KH foreign key references KHACHHANG(MaKH) not null,
	MaDoan varchar(5) constraint FK_HD_DOAN foreign key references DOAN(MaDoan) not null,
	NgayLapHD smalldatetime not null,
	NgayDi smalldatetime not null,
	NoiDon nvarchar(50),
	constraint PK_MaKH_MaDoan primary key (MaKH,MaDoan),
	constraint check_HD check (Ngaydi > NgayLapHD)
)

create table CHUYEN(
	MaChuyen varchar(5) primary key not null,
	TenChuyen nvarchar(50) ,
	MaTour varchar(5) constraint FK_CHUYEN_TOUR foreign key references TOUR(MaTour) not null,
	MaNV varchar(5) constraint FK_CHUYEN_NV foreign key references NHANVIEN(MaNV) not null
)

create table DANGKY(
	MaKH varchar(5) constraint FK_DK_KH foreign key references KHACHHANG(MaKH) not null,
	MaChuyen varchar(5) constraint FK_DK_CHUYEN foreign key references Chuyen(MaChuyen) not null,
	NgayDi smalldatetime not null,
	NoiKhoiHanh nvarchar(50),
	constraint PK_MaKH_MaChuyen primary key (MaKH,MaChuyen),
)

