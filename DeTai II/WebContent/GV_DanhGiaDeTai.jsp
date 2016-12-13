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
 select detai.MaDeTai,detai.TenDeTai,sinhvien.MSSV,sinhvien.HoTen,nhanxet.ChucVu 
from sinhvien,detai,nhanxet 
where sinhvien.MSSV=detai.MaSV and nhanxet.MaDeTai=detai.MaDeTai 
and nhanxet.MaGV=<%=tk.getId_TK() %>
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
						<h4>ĐÁNH GIÁ ĐỀ TÀI</h4>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>MSSV</th>
								<th>Tên Sinh Viên</th>
								<th>Tên Đề Tài</th>
								<th>Chi Tiết Bài Báo Cáo</th>
								<th>Vai Trò</th>
								<th>Đánh Giá</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rows" items="${result.rows }">
								<tr>
									<td><c:out value="${rows.MSSV}"></c:out></td>
									<td><c:out value="${rows.HoTen} "></c:out></td>
									<td><c:out value="${rows.TenDeTai}"></c:out></td>
									<td><a href="Bai_Nop_SV.jsp?MaDeTai=${rows.MaDeTai}">Chi
											Tiết</a></td>
									<td><c:out value="${rows.ChucVu}"></c:out></td>
									<td><a
										href="GV_Danh_Gia_De_Tai.jsp?MaDeTai=${rows.MaDeTai}"
										class="btn btn-info" role="button">Đánh Giá</a></td>
								</tr>
							</c:forEach>
						</tbody>
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