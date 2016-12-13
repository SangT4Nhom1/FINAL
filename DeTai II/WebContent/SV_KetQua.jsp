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
 select bainop.TenDeTai,bainop.TenSV,bainop.TenGVHD,bainop.TomTat,bainop.File 
 from detai,bainop 
 where  bainop.MaDeTai=detai.MaDeTai 
 and detai.MaSV=<%=tk.getId_TK()%>;
 </sql:query>

<sql:query dataSource="${DBConn}" var="result2">
  select nhanxet.MaGV,giaovien.HoTen,nhanxet.ChucVu
 	,nhanxet.NhanXet, nhanxet.BaoCao, nhanxet.XepLoai,detai.MaDeTai
 from nhanxet,giaovien,detai
 where detai.MaDeTai=nhanxet.MaDeTai
	and nhanxet.MaGV=nhanxet.MaGV
	and nhanxet.MaGV=giaovien.MSGV
	and detai.MaSV=<%=tk.getId_TK()%>;</sql:query>

<sql:query dataSource="${DBConn}" var="result3">
select AVG(Diem) as TBC
from diem,detai where detai.MaSV=<%=tk.getId_TK()%> group by diem.MaDeTai;
</sql:query>
<sql:query dataSource="${DBConn}" var="result4"> 
			select MaDeTai from bainop where MaSV=<%=tk.getId_TK()%>
</sql:query>

<sql:query dataSource="${DBConn}" var="result5"> 
			 select HoTen from sinhvien where MSSV=<%=tk.getId_TK()%>
</sql:query>
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
						<h4>KẾT QUẢ</h4>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Tên Giáo Viên</th>
								<th>Chức Vụ</th>
								<th>Nhận Xét</th>
								<th>Báo Cáo</th>
								<th>Xếp Loại</th>
								<th>Điểm</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="rows" items="${result2.rows }">
								<tr>
									<td><c:out value="${rows.HoTen}"></c:out></td>
									<td><c:out value="${rows.ChucVu}"></c:out></td>
									<td><c:out value="${rows.NhanXet}"></c:out></td>
									<td><c:out value="${rows.BaoCao}"></c:out></td>
									<td><c:out value="${rows.XepLoai}"></c:out></td>
									
									<sql:query dataSource="${DBConn}" var="result6">
									select Diem
										from diem,detai
										where detai.MaDeTai=diem.MaDeTai
										and diem.MaGV=${rows.MaGV};
									</sql:query>
									
									<c:forEach var="rows" items="${result6.rows }">
									<td><c:out value="${rows.Diem}"></c:out></td>
									</c:forEach>
								
								</tr>
							</c:forEach>

							<tr>
								<th colspan="5">Điểm Trung Bình</th>
								<td><c:forEach var="rows" items="${result3.rows }">
										<c:out value="${rows.TBC}">
										</c:out>
									</c:forEach></td>
							</tr>
						</tbody>
					</table>
				</div>

				<c:forEach var="rows" items="${result.rows }">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4>Bài Nộp</h4>
						</div>
						<table class="table table-bordered">
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
												<c:forEach var="rows" items="${result4.rows }">
													<input type="hidden" class="form-control" name="MaDeTai"
														value="${rows.MaDeTai}" readonly="readonly">
												</c:forEach>
												<tr>
													<td colspan="2"><input type="submit"
														class="btn btn-info" value="Bài Nộp" /></td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:forEach>

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