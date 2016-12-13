<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.lang.*"%>
<%@ page import="Model.*"%>
<%@ page import="Dao.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Website Hỗ trợ báo cáo online, báo cáo onlie</title>

<!-- Bootstrap CSS -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">

<!-- hiện logo trên tab -->
<link rel="icon" href="image/it_spkt.png" type="image/x-icon" />
<link rel="shortcut icon" href="image/it_spkt.png" />
</head>

<sql:setDataSource var="DBConn" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/detai" user="root" password="inspiron14" />

<%
            TaiKhoan tk = new TaiKhoan();
            if (session.getAttribute("tk") != null) {
                tk = (TaiKhoan) session.getAttribute("tk");
            }
        %>

<%
        	String MaDeTai="";
        if(request.getParameter("MaDeTai")!=null){
        	MaDeTai= request.getParameter("MaDeTai");
        }
        %>
<sql:query dataSource="${DBConn}" var="result1"> 
			 select sinhvien.HoTen,detai.TenDeTai,detai.NgayBaoCao,detai.GioBaoCao,detai.ThoiLuongBaoCao
			from detai,sinhvien 
			where detai.MaSV=sinhvien.MSSV and detai.MaDeTai=<%=MaDeTai%>
</sql:query>

<sql:query dataSource="${DBConn}" var="result2">
  select giaovien.HoTen,nhanxet.ChucVu 
  from nhanxet,giaovien 
  where nhanxet.MaGV=giaovien.MSGV and nhanxet.MaDeTai=<%=MaDeTai%>
</sql:query>

<sql:query dataSource="${DBConn}" var="result5"> 
			 select HoTen from giaovien where MSGV=<%=tk.getId_TK()%>
</sql:query>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<ul class="nav navbar-nav navbar-right">
				<c:forEach var="rows" items="${result5.rows }">
					<li><a href="#"><c:out value="Chào! ${rows.HoTen}"></c:out></a></li>
				</c:forEach>
				<li><a href="index.jsp">Đăng Xuất</a></li>
			</ul>
		</div>
	</nav>
	<!--Phần Logo-->
	<div class="container">
		<div id="logo" class="container-fluid">
			<img src="Image/Logo.jpg" height="163" width="713"
				class="img-responsive">
		</div>
		<hr width="100%" size="5px" align="center" />
	</div>
	<!-- Phần menu -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-primary" style="padding-top: 0px">
					<div class="panel-body" style="padding-top: 15px">
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="TruongKhoa_Home.jsp"><i
									class="glyphicon glyphicon-home"></i> Home</a></li>
							<li class="active"><a href="TruongKhoa_ThongTin.jsp"><i
									class="glyphicon glyphicon-user"></i> Thông Tin Cá Nhân</a></li>
							<li><a href="TruongKhoa_Danh_Sach_De_Tai.jsp"><i
									class="glyphicon glyphicon-list"></i> Danh Sách Đề Tài</a></li>
							<li><a href="truongkhoa_sapxep.jsp"><i
									class="glyphicon glyphicon-edit"></i> Sắp Xếp Hội Đồng</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-9 well">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>CHI TIẾT ĐỀ TÀI</h4>
					</div>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>Họ Tên Sinh Viên</td>
								<c:forEach var="rows" items="${result1.rows }">
									<td><c:out value="${rows.HoTen}"></c:out></td>
								</c:forEach>
							</tr>
							<tr>
								<td>Tên Đề Tài</td>
								<c:forEach var="rows" items="${result1.rows }">
									<td><c:out value="${rows.TenDeTai}"></c:out></td>
								</c:forEach>
							</tr>
							<c:forEach var="rows" items="${result2.rows }">
								<tr>
									<td><c:out value="${rows.ChucVu}"></c:out></td>
									<td><c:out value="${rows.HoTen}"></c:out></td>
								</tr>
							</c:forEach>
							<tr>
								<td>Thời Gian Báo Cáo:</td>
								<c:forEach var="rows" items="${result1.rows }">
									<td><c:out value="${rows.NgayBaoCao} ${rows.GioBaoCao}"></c:out></td>
								</c:forEach>
							</tr>
							<tr>
								<td>Thời Gian Báo Cáo Tối Đa:</td>
								<c:forEach var="rows" items="${result1.rows }">
									<td><c:out value="${rows.ThoiLuongBaoCao}"></c:out></td>
								</c:forEach>
							</tr>
						</tbody>

					</table>
				</div>
				<div class="form-group"
					style="text-align: right; padding-top: 10px; padding-bottom: 10px">
					<a href=" TruongKhoa_Danh_Sach_De_Tai.jsp " class="btn btn-info"
						role="button"> BACK </a>
				</div>
			</div>
		</div>
	</div>
</body>
<footer class="site-footer">
	<div class="container">

		<div class="row">
			<div>
				<address>
					<hr>
					Trường Đại học Sư Phạm Kỹ Thuật TP. Hồ Chí Minh - Khoa Công Nghệ
					Thông Tin<br> Địa chỉ: Số 01 Võ Văn Ngân, Q. Thủ Đức, TP. Hồ
					Chí Minh<br>
				</address>
			</div>
		</div>
	</div>
</footer>
</html>