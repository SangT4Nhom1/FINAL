<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.lang.*"%>
<%@ page import="Model.*"%>
<%@ page import="Dao.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="stylesheet" type="text/css" href="style/style.css">
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
		  String loi="";
		  if(request.getAttribute("error")!=null)
		  {
			  loi=(String) request.getAttribute("error");
		  }
		%>
<%
        	String MaDeTai="";
        if(request.getParameter("MaDeTai")!=null){
        	MaDeTai= request.getParameter("MaDeTai");
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
						<h4>Đánh Giá Đề Tài</h4>
					</div>

					<div class="modal-body">
						<form class="form-horizontal" action="NhanXetServlet"
							method="post">
							<input type="hidden" class="form-control" name="MaGV"
								value="<%=tk.getId_TK()%>" readonly="readonly"> <input
								type="hidden" class="form-control" name="MaDeTai"
								value="<%=MaDeTai%>" readonly="readonly">

							<div class="form-group">
								<label class="control-label col-sm-2">Tên Đề Tài:</label>
								<div class="col-md-10">
									<input type="text" class="form-control" name="TenDeTai"
										placeholder="Tên Đề Tài" required>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">GV Đánh Giá:</label>
								<div class="col-md-10">
									<input type="text" class="form-control" name="TenGV"
										placeholder="Ten GV" required>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">Nhận Xét:</label>
								<div class="col-md-10">
									<textarea class="form-control" rows="5" name="NhanXet"
										placeholder="... ..." required></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">Báo Cáo:</label> <input
									type="radio" name="BaoCao" value="Được" checked="checked">Được
								Phép Báo Cáo <input type="radio" name="BaoCao" value="Không">Không
								Được Báo Cáo
							</div>

							<div class="form-group">
								<label class="control-label col-sm-2">Xếp Loại:</label>
								<div class="col-md-10">
									<select class="form-control" name="XepLoai">
										<option value="Gioi">Giỏi</option>
										<option value="kha">Khá</option>
										<option value="trung binh" selected="selected">Trung
											Bình</option>
										<option value="yeu">Yếu</option>
									</select>
								</div>
							</div>
							<div class="form-group"
								style="text-align: right; padding-top: 10px; padding-bottom: 10px">
								<input type="hidden" value="insert" name="command">
								<button type="submit" class="btn btn-info"
									style="padding-right: 10px; padding-left: 20px;">Lưu</button>
								<a href=" GV_home.jsp " class="btn btn-info" role="button">
									Trở Về </a>
							</div>
						</form>
					</div>
				</div>
			</div>



		</div>
	</div>

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"
		type="text/javascript"></script>
	<script>
$('#contactform').bootstrapValidator();
</script>
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