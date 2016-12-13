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
<script src="http://code.angularjs.org/1.2.5/angular.js"
	data-semver="1.2.5" data-require="angular.js@1.2.5"></script>
<script data-require="jquery@*" data-semver="2.0.3"
	src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<link rel="stylesheet" href="style.css" />
<script src="script.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Website Hỗ trợ báo cáo online, báo cáo onlie</title>

<!-- Bootstrap CSS -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">

<!-- hiện logo trên tab -->
<link rel="icon" href="Image/it_spkt.png" type="Image/x-icon" />
<link rel="shortcut icon" href="Image/it_spkt.png" />
</head>


<sql:setDataSource var="DBConn" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/detai" user="root" password="inspiron14" />

<%
            TaiKhoan tk = new TaiKhoan();
            if (session.getAttribute("tk") != null) {
                tk = (TaiKhoan) session.getAttribute("tk");
            }
        %>
<sql:query dataSource="${DBConn}" var="result5"> 
			 select HoTen from giaovien where MSGV=<%=tk.getId_TK()%>
</sql:query>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>
<body ng-app="app" ng-controller="NewUserController">
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
							<li class="active"><a href="TruongKhoa_ThongTin."><i
									class="glyphicon glyphicon-user"></i> Thông Tin Cá Nhân</a></li>
							<li><a href="TruongKhoa_Danh_Sach_De_Tai.jsp"><i
									class="glyphicon glyphicon-list"></i> Danh Sách Đề Tài</a></li>
							<li><a href="truongkhoa_sapxep.jsp"><i
									class="glyphicon glyphicon-edit"></i> Sắp Xếp Hội Đồng</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-7 well">
				<div class="panel panel-primary"
					style="background-color: rgb(192, 192, 192)">
					<div class="panel-heading">
						<h4>ĐỔI THÔNG TIN TRƯỞNG KHOA</h4>
					</div>
					<div class="form-group">
						<div class="col-md-12 well">

							<form class="form" method="post" action="ThongTinServlet">
								<%--Lấy id hiện tại --%>
								<input type="hidden" class="form-control" name="id_tk"
									value="<%=tk.getId_TK()%>" readonly="readonly"> <input
									type="hidden" class="form-control" name="quyen"
									value="<%=tk.getQuyen()%>" readonly="readonly">
								<div class="form-group">
									<label class="control-label">SDT</label> <input type="number"
										class="form-control" name="SDT" required
										placeholder="Nhập SDT mới" />
								</div>
								<div></div>
								<div class="form-group">
									<label class="control-label">Email</label> <input type="email"
										class="form-control" name="Email" required
										placeholder="Nhập Email Mới" />
								</div>
								<div class="form-group">
									<label class="control-label">Địa Chỉ </label> <input
										type="text" class="form-control" name="DiaChi" required
										placeholder="Nhập Địa Chỉ Mới" />
								</div>
								<div class="form-group"
									style="text-align: right; padding-top: 10px; padding-bottom: 10px">
									<input type="hidden" value="updategiaovien" name="command">
									<button type="Submit" class="btn btn-primary">Xác Nhận</button>
									<a href=" SV_home.jsp " class="btn btn-primary" role="button">
										Trở Về </a>
								</div>
							</form>


						</div>

					</div>
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