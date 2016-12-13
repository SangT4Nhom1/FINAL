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
						<div class="panel-heading">
							<h4>Thông Báo</h4>
						</div>
					</div>
					<div class="panel-body">
						<!--Các bản tin-->
						<ul class="list-unstyled">

							<a
								href="tin-tu-giao-vu/thong-bao-dang-ky-de-tai-tot-nghiep-va-hoc-mon-tot-nghiep-khoa-2012-201602251456389427.jsp">
								<li class="article-area">
									<p>
							<li class="active"><a href="#"><i
										class="glyphicon glyphicon-hand-right"></i> Thông báo giờ báo
										cáo tốt nghiệp khoá </a></li>
								</p>
								<p>Thông báo về việc xét cấp học bổng khuyến khích học tập
									học kỳ I năm học 2016-2017</p>
								<hr width="100%" size="5px" align="center" />
								</li>


								<li class="article-area">
									<p>
							<li class="active"><a href="#"><i
										class="glyphicon glyphicon-hand-right"></i> Thông báo giờ báo
										cáo tốt nghiệp khoá </a></li>
								</p>
								<p>Thông báo về việc xét cấp học bổng khuyến khích học tập
									học kỳ I năm học 2016-2017</p>
								<hr width="100%" size="5px" align="center" />
								</li>

							</a>

						</ul>
					</div>
					<div></div>
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