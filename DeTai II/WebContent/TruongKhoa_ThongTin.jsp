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
select * from giaovien where MSGV=<%=tk.getId_TK()%>;
</sql:query>


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
			<div class="col-md-5 well">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>THÔNG TIN GIẢNG VIÊN:</h4>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Mã số giảng viên:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.MSGV}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Họ và tên:</th>
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
								<th>Giới tính:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.GioiTinh}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Số CMND:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.CMND}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Khoa:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.Khoa}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Năm bắt đầu:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.NamBatDau}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Trình độ:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.TrinhDo}"></c:out></th>
								</c:forEach>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>Chuyên ngành:</th>
								<c:forEach var="rows" items="${result.rows }">
									<th><c:out value="${rows.ChuyenNganh}"></c:out></th>
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
					<br> <a href="TruongKhoa_Doi_MK.jsp" class="btn btn-info"
						role="button">Đổi MK</a> <a href="TruongKhoa_Doi_Thong_Tin.jsp"
						class="btn btn-info" role="button">Cập nhật</a>
				</div>
				<br>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>THÔNG TIN LIÊN LẠC:</h4>
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