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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Website Hỗ trợ báo cáo online, báo cáo onlie</title>

<!-- Bootstrap CSS -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">

<!-- hi?n logo trên tab -->
<link rel="icon" href="image/it_spkt.png" type="image/x-icon" />
<link rel="shortcut icon" href="image/it_spkt.png" />
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
			autoclose : true,
			todayHighlight : true
		}).datepicker('update', new Date());
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#datepicker").change(dateChanged).on('changeDate', dateChanged);
	});
	function dateChanged(ev) {
		//Dùng ajax d?y time v? servlet
	}
</script>
<link rel="stylesheet prefetch"
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
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
			select detai.MaDeTai,detai.TenDeTai,sinhvien.MSSV,sinhvien.HoTen
 			from detai,sinhvien 
			where detai.MaSV=sinhvien.MSSV and detai.MaDeTai=<%=MaDeTai%>
</sql:query>

<sql:query dataSource="${DBConn}" var="result2"> 
			select MSGV,HoTen from giaovien MSGV<16110000
        </sql:query>

<sql:query dataSource="${DBConn}" var="result5"> 
			 select HoTen from giaovien where MSGV=<%=tk.getId_TK()%>
</sql:query>
<%
	String loi = "";
	if (request.getAttribute("trungngay") != null) {
		loi = (String) request.getAttribute("trungngay");
	}
	if (request.getAttribute("gvhd") != null) {
		loi = (String) request.getAttribute("gvhd");
	}
	if (request.getAttribute("gvpb") != null) {
		loi = (String) request.getAttribute("gvpb");
	}
	if (request.getAttribute("uv") != null) {
		loi = (String) request.getAttribute("uv");
	}
	if (request.getAttribute("cthd") != null) {
		loi = (String) request.getAttribute("cthd");
	}
%>

<style>
label {
	margin-left: 20px;
}

#datepicker {
	width: 180px;
	margin: 0 0px 0px 0px;
}

#datepicker>span:hover {
	cursor: pointer;
}

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
				<li><a href="Home.jsp">Ðăng Xuất</a></li>
			</ul>
		</div>
	</nav>
	<!--Ph?n Logo-->
	<div class="container">
		<div id="logo" class="container-fluid">
			<img src="Image/Logo.jpg" height="163" width="713"
				class="img-responsive">
		</div>
		<hr width="100%" size="5px" align="center" />
	</div>
	<!-- Ph?n menu -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-primary" style="padding-top: 0px;">
					<div class="panel-body" style="padding-top: 15px;">
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="TruongKhoa_Home.jsp"><i
									class="glyphicon glyphicon-home"></i> Home</a></li>
							<li class="active"><a href="TruongKhoa_ThongTin.jsp"><i
									class="glyphicon glyphicon-user"></i> Thông Tin Cá Nhân</a></li>
							<li><a href="TruongKhoa_Danh_Sach_De_Tai.jsp"><i
									class="glyphicon glyphicon-list"></i> Danh Sách Đề Tài</a></li>
							<li><a href="truongkhoa_sapxep.jsp"><i
									class="glyphicon glyphicon-edit"></i> Săp Xếp Hội Đồng</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-9 well">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>SắP XếP Hội ÐồNG</h4>
					</div>
					<form class="form-horizontal" action="SapXepServlet" method="post">
						<c:forEach var="rows" items="${result.rows }">
							<input type="hidden" class="form-control" name="MaDeTai"
								value="${rows.MaDeTai}" readonly="readonly">
							<input type="hidden" class="form-control" name="TenDeTai"
								value="${rows.TenDeTai}" readonly="readonly">
						</c:forEach>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Danh Mục</th>
									<th>Thông Tin</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>MSSV</td>
									<c:forEach var="rows" items="${result.rows }">
										<td><c:out value="${rows.MSSV}"></c:out></td>
									</c:forEach>
								</tr>
								<tr>
									<td>Sinh Viên Thực Hiện</td>
									<c:forEach var="rows" items="${result.rows }">
										<td><c:out value="${rows.HoTen}"></c:out></td>
									</c:forEach>
								</tr>
								<tr>
									<td>Tên đề tài<br> 
									<%if (request.getAttribute("trungngay") != null) {%>
										<div class="">
											<p style="color: red"><%=request.getAttribute("trungngay")%><br>
											</p>
										</div> 
										<%}%>
									</td>
									<c:forEach var="rows" items="${result.rows }">
										<td><c:out value="${rows.TenDeTai}"></c:out></td>
									</c:forEach>
								</tr>
								<tr>
									<td>Ngày Báo Cáo</td>
									<td>
										<div id="datepicker" class="input-group date"
											data-date-format="dd-mm-yyyy">
											<input id="date-daily" name="NgayBaoCao" class="form-control"
												type="text" required> <span
												class="input-group-addon"> <i
												class="glyphicon glyphicon-calendar"></i></span>
										</div>

									</td>
									</div>
								</tr>
								<tr>
									<td>Giờ Báo Cáo</td>
									<td><input type="time" name="GioBaoCao" required>
									</td>
								</tr>
								<tr>
									<td>Thời Luợng Báo Cáo</td>
									<td><select class="form-control" name="ThoiLuongBaoCao">
											<option value="30 Phút " selected="selected">30 Phút</option>
											<option value="45 Phút ">45 Phút</option>
											<option value="60 Phút">60 Phút</option>
									</select></td>

								</tr>
								<tr>
									<td>Giáo Viên Hướng Dẫn<br> 
									<%if (request.getAttribute("gvhd") != null) {%>
										<div class="">
											<p style="color: red"><%=request.getAttribute("gvhd")%><br>
											</p>
										</div> 
										<%}%>
									</td>
									<td><select class="form-control required" name="GVHD">
											<c:forEach var="rows" items="${result2.rows }">
												<option value="${rows.MSGV}"><c:out
														value="${rows.HoTen}"></c:out>
												</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td>GV Phản Biện<br> 
									<%if (request.getAttribute("gvpb") != null) {%>
										<div class="">
											<p style="color: red"><%=request.getAttribute("gvpb")%><br>
											</p>
										</div> 
										<%}%>
									</td>
									<td>
									<select class="form-control required" name="GVPB">
											<c:forEach var="rows" items="${result2.rows }">
												<option value="${rows.MSGV}"><c:out
														value="${rows.HoTen}"></c:out>
												</option>
											</c:forEach>
									</select>
									</td>
								</tr>
								<tr>
									<td>Ủy Viên<br> 
									<%if (request.getAttribute("uv") != null) {%>
										<div class="">
											<p style="color: red"><%=request.getAttribute("uv")%><br>
											</p>
										</div> 
										<%}%>
									</td>
									<td><select class="form-control required" name="UV">
											<c:forEach var="rows" items="${result2.rows }">
												<option value="${rows.MSGV}"><c:out
														value="${rows.HoTen}"></c:out>
												</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td>Chủ Tịch Hội Đồng<br> 
									<%if (request.getAttribute("cthd") != null) {%>
										<div class="">
											<p style="color: red"><%=request.getAttribute("cthd")%><br>
											</p>
										</div> 
										<%}%>
									</td>
									<td><select class="form-control required" name="CTHD">
											<c:forEach var="rows" items="${result2.rows }">
												<option value="${rows.MSGV}"><c:out
														value="${rows.HoTen}"></c:out>
												</option>
											</c:forEach>
									</select></td>
								</tr>
							</tbody>
						</table>
						<div class="form-group"
							style="text-align: right; padding-right: 20px; padding-left: 10spx; padding-top: 5px; padding-bottom: 5px">
							<input type="hidden" value="insert" name="command">
							<button type="submit" class="btn btn-info" >SAVE</button>
							<a href=" TruongKhoa_Home.jsp" class="btn btn-info" role="button">Back </a>
						</div>
					</form>

				</div>
			</div>
			
		</div>
	</div>
	</div>
	<div style="padding-left: 100px; padding-right: 100px;">
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