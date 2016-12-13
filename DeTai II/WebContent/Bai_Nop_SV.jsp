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
<link rel="shortcut icon" href="image/it_spkt.png">
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
	String MaDeTai = "";
	if (request.getParameter("MaDeTai") != null) {
		MaDeTai = request.getParameter("MaDeTai");
	}
%>
<sql:query dataSource="${DBConn}" var="result"> 
	select * from bainop where MaDeTai=<%=MaDeTai%>
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
				<li><a href="#">Chào, Nguyễn Văn A</a></li>
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
							<li class="active"><a href="GV_home.jsp"><i
									class="glyphicon glyphicon-home"></i> Home</a></li>
							<li class="active"><a href="GV_ThongTin.jsp"><i
									class="glyphicon glyphicon-user"></i> Thông Tin Cá Nhân</a></li>
							<li class="active"><a><i
									class="glyphicon glyphicon-modal-window"></i> Phản Biện</a></li>
							<li><a href="GV_Danh_Sach_De_Tai.jsp"><i
									class="glyphicon glyphicon-list"></i> Danh Sách Đề Tài</a></li>
							<li><a href="GV_DanhGiaDeTai.jsp"><i
									class="glyphicon glyphicon-edit"></i> Đánh giá</a></li>
							<li><a href="GV_PhanBien.jsp"><i
									class="glyphicon glyphicon-facetime-video"></i> Phản Biện</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-9 well">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Bài Nộp Sinh Viên</h4>
					</div>
					<table class="table table-bordered">
						<c:forEach var="rows" items="${result.rows }">
							<tbody>
								<tr>
									<th>Tên Đề Tài</th>
									<td><c:out value="${rows.TenDeTai}"></c:out></td>
								</tr>
								<tr>
									<th>Tên Sinh Viên</th>
									<td><c:out value="${rows.TenSV}"></c:out></td>
								</tr>
								<tr>
									<th>Tên Giáo Viên Hướng Dẫn</th>
									<td><c:out value="${rows.TenGVHD}"></c:out></td>
								</tr>
								<tr>
									<th>Tóm Tắt</th>
									<td><c:out value="${rows.TomTat}"></c:out></td>
								</tr>
								<tr>
									<th>File</th>
									<td>
										<form method="get" action="GetFileServlet">
											<table>
												<tr>
													<td><input type="hidden" class="form-control"
														name="MaDeTai" value=<%=MaDeTai%> readonly="readonly">
													</td>
												</tr>
												<tr>
													<td colspan="2"><input type="submit"
														class="btn btn-info" value="Bài Nộp" /></td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<div class="form-group"
					style="text-align: right; padding-top: 10px; padding-bottom: 10px">
					<a href=" GV_home.jsp " class="btn btn-info" role="button">
						BACK </a>
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