/*
SQLyog Enterprise - MySQL GUI v6.15
MySQL - 5.0.82-community-nt : Database - detai
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `detai`;

USE `detai`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `bainop` */

DROP TABLE IF EXISTS `bainop`;

CREATE TABLE `bainop` (
  `MaDeTai` bigint(10) NOT NULL,
  `TenDeTai` varchar(50) NOT NULL,
  `MaSV` bigint(10) NOT NULL,
  `TenSV` varchar(50) default NULL,
  `TenGVHD` varchar(50) default NULL,
  `TomTat` varchar(100) default NULL,
  `File` mediumblob,
  PRIMARY KEY  (`MaDeTai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bainop` */

/*Table structure for table `detai` */

DROP TABLE IF EXISTS `detai`;

CREATE TABLE `detai` (
  `MaDeTai` bigint(10) default NULL,
  `TenDeTai` varchar(50) default NULL,
  `MaSV` bigint(10) default NULL,
  `NgayBaoCao` varchar(50) NOT NULL,
  `GioBaoCao` varchar(50) NOT NULL,
  `ThoiLuongBaoCao` varchar(50) default NULL,
  PRIMARY KEY  (`NgayBaoCao`,`GioBaoCao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detai` */

insert  into `detai`(`MaDeTai`,`TenDeTai`,`MaSV`,`NgayBaoCao`,`GioBaoCao`,`ThoiLuongBaoCao`) values (11001,'Báo Cáo',14110079,'13-12-2016','22:59','45 Phút '),(11002,'Nhận Xét',14110080,'28-12-2016','00:00','30 Phút ');

/*Table structure for table `diem` */

DROP TABLE IF EXISTS `diem`;

CREATE TABLE `diem` (
  `MaDeTai` bigint(10) NOT NULL,
  `MaGV` bigint(10) NOT NULL,
  `Diem` bigint(10) default NULL,
  PRIMARY KEY  (`MaDeTai`,`MaGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diem` */

/*Table structure for table `giaovien` */

DROP TABLE IF EXISTS `giaovien`;

CREATE TABLE `giaovien` (
  `MSGV` bigint(10) NOT NULL,
  `HoTen` varchar(50) default NULL,
  `NgaySinh` varchar(20) default NULL,
  `NoiSinh` varchar(50) default NULL,
  `GioiTinh` varchar(10) default NULL,
  `CMND` varchar(50) default NULL,
  `Khoa` varchar(50) default NULL,
  `NamBatDau` varchar(50) default NULL,
  `TrinhDo` varchar(50) default NULL,
  `ChuyenNganh` varchar(50) default NULL,
  `SDT` varchar(50) default NULL,
  `Email` varchar(50) default NULL,
  `DiaChi` varchar(50) default NULL,
  PRIMARY KEY  (`MSGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `giaovien` */

insert  into `giaovien`(`MSGV`,`HoTen`,`NgaySinh`,`NoiSinh`,`GioiTinh`,`CMND`,`Khoa`,`NamBatDau`,`TrinhDo`,`ChuyenNganh`,`SDT`,`Email`,`DiaChi`) values (15110001,'Nguyễn Văn A','01/01/1892','HCM','Nam','123456','Công Nghệ Thông Tin','1998','Tiến Sĩ','Công Nghệ Phần Mềm','01218121772','huy05730@gmail.com','Biên Hòa'),(15110002,'Nguyễn Văn B','01/04/1886','A','Nam','111','Công Nghệ Thông Tin','1928','Tiến Sĩ','Công Nghệ Phần Mềm','11','huy05730@gmail.com','Biên Hòa'),(15110003,'Nguyễn Văn C','01/05/1886','B','Nam','222','Công Nghệ Thông Tin','1938','Tiến Sĩ','Công Nghệ Phần Mềm','22','huy05730@gmail.com','Biên Hòa'),(15110004,'Nguyễn Văn D','01/06/1886','C','Nam','333','Công Nghệ Thông Tin','1948','Tiến Sĩ','Mạng Máy Tính','33','huy05730@gmail.com','Biên Hòa'),(15110005,'Nguyễn Văn E','01/07/1886','D','Nam','444','Công Nghệ Thông Tin','1958','Tiến Sĩ','Mạng Máy Tính','44','huy05730@gmail.com','Biên Hòa'),(16110001,'Nguyễn Văn F','01/03/1886','HCM','Nữ','122234','Công Nghệ Thông Tin','1918','Tiến Sĩ','Mạng Máy Tính','01218121372','huy05730@gmail.com','Biên Hòa');

/*Table structure for table `nhanxet` */

DROP TABLE IF EXISTS `nhanxet`;

CREATE TABLE `nhanxet` (
  `MaDeTai` bigint(10) NOT NULL,
  `TenDeTai` varchar(50) default NULL,
  `MaGV` bigint(10) NOT NULL,
  `ChucVu` varchar(50) default NULL,
  `NhanXet` varchar(1000) default NULL,
  `BaoCao` varchar(20) default NULL,
  `XepLoai` varchar(20) default NULL,
  `TenGV` varchar(50) default NULL,
  PRIMARY KEY  (`MaDeTai`,`MaGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `nhanxet` */

/*Table structure for table `sinhvien` */

DROP TABLE IF EXISTS `sinhvien`;

CREATE TABLE `sinhvien` (
  `MSSV` bigint(10) NOT NULL,
  `HoTen` varchar(50) default NULL,
  `NgaySinh` varchar(20) default NULL,
  `NoiSinh` varchar(50) default NULL,
  `GioiTinh` varchar(10) default NULL,
  `CMND` varchar(50) default NULL,
  `DiaChi` varchar(50) default NULL,
  `Email` varchar(50) default NULL,
  `SDT` varchar(50) default NULL,
  `KhoaHoc` varchar(50) default NULL,
  `NienKhoa` varchar(50) default NULL,
  `NamNhapHoc` varchar(50) default NULL,
  `ChuongTrinh` varchar(50) default NULL,
  `Lop` varchar(50) default NULL,
  PRIMARY KEY  (`MSSV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sinhvien` */

insert  into `sinhvien`(`MSSV`,`HoTen`,`NgaySinh`,`NoiSinh`,`GioiTinh`,`CMND`,`DiaChi`,`Email`,`SDT`,`KhoaHoc`,`NienKhoa`,`NamNhapHoc`,`ChuongTrinh`,`Lop`) values (14110079,'Phùng Quang Huy','14/02/1996','Biên Hòa','Nam','272533738','uhbuhgekjgs','huy05730@gmail.com','0982773712','Khóa 2014','2014-2018','2014','K2014','141102'),(14110080,'Nguyen A B','14/02/1996','Đông Nai','Nữ','123123','rgr','Nguy05730@gmail.com','123123','Khóa 2015','2015-2019','2015','k2015','151102');

/*Table structure for table `taikhoan` */

DROP TABLE IF EXISTS `taikhoan`;

CREATE TABLE `taikhoan` (
  `Id_TK` bigint(10) NOT NULL,
  `Pass` varchar(15) default NULL,
  `Quyen` varchar(10) default NULL,
  PRIMARY KEY  (`Id_TK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taikhoan` */

insert  into `taikhoan`(`Id_TK`,`Pass`,`Quyen`) values (14110079,'123','sv'),(14110080,'123','sv'),(15110001,'123','gv'),(15110002,'123','gv'),(15110003,'123','gv'),(15110004,'123','gv'),(15110005,'123','gv'),(16110001,'123','tk');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
