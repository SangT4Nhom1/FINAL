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
<sql:query dataSource="${DBConn}" var="result">
 select * from sinhvien where MSSV=<%=tk.getId_TK()%>;
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
				<c:forEach var="rows" items="${result.rows }">
					<li><a href="#"><c:out value="Chào! ${rows.HoTen}"></c:out></a></li>
				</c:forEach>
				<li><a href="index.jsp">Đăng Xuất</a></li>
			</ul>
		</div>
	</nav>
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
							<li class="active"><a href="SV_home.jsp"><i
									class="glyphicon glyphicon-home"></i> Home</a></li>
							<li class="active"><a href="SV_ThongTin.jsp"><i
									class="glyphicon glyphicon-user"></i> Thông Tin Cá Nhân</a></li>
							<li class="active"><a><i
									class="glyphicon glyphicon-facetime-video"></i> Báo Cáo</a></li>
							<li><a href="SV_LichBaoCao.jsp"><i
									class="glyphicon glyphicon-list"></i>Lịch Báo Cáo</a></li>
							<li><a href="SV_NopBai.jsp"><i
									class="glyphicon glyphicon-edit"></i>Nộp Bài</a></li>
							<li><a href="SV_KetQua.jsp"><i
									class="glyphicon glyphicon-check"></i>Kết Quả</a></li>

						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-5 well">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>THÔNG TIN SINH VIÊN</h4>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Mã số sinh viên:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.MSSV}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Họ và vên:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.HoTen}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Ngày sinh:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.NgaySinh}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Nơi sinh:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.NoiSinh}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Giới sính:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.GioiTinh}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Số CMND:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.SCMND}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
					</table>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>THÔNG TIN KHÓA HỌC</h4>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Khóa học:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.KhoaHoc}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Niên khóa:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.NienKhoa}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Năm nhập nọc:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.NamNhapHoc}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Chương trình đào tạo:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.ChuongTrinh}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Lớp sinh viên:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.Lop}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="col-md-4 well">
				<div style="text-align: center;">
					<img src="2.jpg" alt="Pulpit Rock"
						style="width: 150px; height: 150px; border-radius: 10px;">
				</div>
				<div style="text-align: center;">
					<br> <a href="SV_Doi_MK.jsp" class="btn btn-info"
						role="button">Đổi MK</a> <a href="SV_DoiThongTin.jsp"
						class="btn btn-info" role="button">Cập Nhật</a>
				</div>
				<br>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>THÔNG TIN LIÊN LẠC</h4>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>SĐT:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.SDT}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Email:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.Email}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Địa chỉ:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.DiaChi}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Ghi chú:</th>
								<th></th>
							</tr>
					</table>


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