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
select ChucVu,HoTen 
from detai,nhanxet,giaovien 
where detai.MaDeTai=nhanxet.MaDetai 
and giaovien.MSGV=nhanxet.MaGV  
and  detai.MaSV=<%=tk.getId_TK()%>;</sql:query>

<sql:query dataSource="${DBConn}" var="result2"> 
select * from detai where MaSV=<%=tk.getId_TK()%>;
</sql:query>

<sql:query dataSource="${DBConn}" var="result5"> 
			 select HoTen from sinhvien where MSSV=<%=tk.getId_TK()%>
</sql:query>


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
			<div class="col-md-9 well">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>
							LỊCH BÁO CÁO
							<h4>
					</div>
					<table class="table table-bordered">
						<tbody>

							<tr>
								<th>TÊN DỀ TÀI</th>
								<c:forEach var="rows" items="${result2.rows }">
									<td><c:out value="${rows.TenDeTai}"></c:out></td>
								</c:forEach>
							</tr>

							<c:forEach var="rows" items="${result.rows }">
								<tr>
									<th><c:out value="${rows.ChucVu}"></c:out></th>
									<td><c:out value="${rows.HoTen}"></c:out></td>
								</tr>
							</c:forEach>
							<tr>

								<th>Ngày Báo Cáo</th>
								<c:forEach var="rows" items="${result2.rows }">
									<td><c:out value="${rows.NgayBaoCao}"></c:out></td>
								</c:forEach>
							</tr>
							<tr>

								<th>Giờ Báo Cáo</th>
								<c:forEach var="rows" items="${result2.rows }">
									<td><c:out value="${rows.GioBaoCao}"></c:out></td>
								</c:forEach>
							</tr>

							<tr>
								<th>Thời Gian Báo Cáo</th>
								<c:forEach var="rows" items="${result2.rows }">
									<td><c:out value="${rows.ThoiLuongBaoCao}"></c:out></td>
								</c:forEach>
							</tr>

						</tbody>
					</table>

				</div>
				<div class="form-group"
					style="text-align: right; padding-top: 10px; padding-bottom: 10px">
					<c:forEach var="rows" items="${result2.rows }">
						<a href=" BaoCao_SV.jsp?MaDeTai=${rows.MaDeTai} "
							class="btn btn-info" role="button"> Vào Báo Cáo </a>
					</c:forEach>
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