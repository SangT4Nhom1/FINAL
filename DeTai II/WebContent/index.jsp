<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="css/stylemenu.css">
<link
	href="ajax.aspnetcdn.com/ajax/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/banerchuyendong.css" rel="stylesheet">
<link rel="stylesheet" href="css/w3.css">
<script src="js/angular.min.js"></script>
<script src="js/myUsers.js"></script>
<title>Website Hỗ trợ báo cáo online, báo cáo onlie</title>

<!-- Bootstrap CSS -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">

<!-- hiện logo trên tab -->
<link rel="icon" href="image/it_spkt.png" type="image/x-icon" />
<link rel="shortcut icon" href="image/it_spkt.png" />
<style>
.navbar-toggle .icon-bar {
	display: block;
	width: 22px;
	height: 2px;
	background-color: #cccccc;
	border-radius: 1px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-right">

				<div class="container-fluid">




					<div class="container-fluid">

						<ul class="nav navbar-nav navbar-right">
							<div id='ctl05_portlet_9b8ba9cf-dd1c-4b80-91fe-8787110cd93b'
								style="padding: 10px 0px 0px 0px; width: 1100px; float: left">
								<marquee direction="left">
									<span
										style="text-align: left; font-size: 40px; color: #FF0000;"><h2
											style="color: blue">ỨNG DỤNG BÁO CÁO VÀ PHẢN BIỆN
											ONLINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ỨNG
											DỤNG BÁO CÁO VÀ PHẢN BIỆN ONLINE</h2> </span>
								</marquee>
							</div>
							<li><a style="cursor: pointer; margin-right: 0px;"
								id="myBtn"><button type="button" class="btn btn-info">Đăng
										nhập</button> </a></li>
						</ul>
					</div>
				</div>

			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
	<!-- Phần Ảnh Logo -->


	<div class="container">
		<div id="logo" class="container-fluid">
			<img src="Image/Logo.jpg" height="163" width="713"
				class="img-responsive">
		</div>
		<hr width="100%" size="5px" align="center" />
	</div>

	<!-- Phần menu -->
	<div class="container">
		<nav class="navbar bg-primary" role="navigation">
			<div class="navbar-header navbar-right">
				<a class="navbar-brand" style="color: #FFF">PHẢN BIỆN/BÁO
					CÁO</a>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#demo">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
			</div>

			<div id="demo" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="trang-chu" style="color: #FFF"><span
							class="glyphicon glyphicon-home"></span> Trang chủ</a></li>
					<li><a href="" style="color: #FFF" id="btnGioithieu"><span
							class="glyphicon glyphicon-user"></span>Giới thiệu</a></li>
					<li><a href="" style="color: #FFF" id="btnLienhe"><span
							class="glyphicon glyphicon-user"></span>Liên hệ</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</div>

	<!-- phần silder-->

	<div id="slider" style="padding-top: 0px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 content">

					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="Image/logo2.jpg" alt="Chania" width="1150"
									height="201">
							</div>
							<div class="item">
								<img src="Image/Logo3.jpg" alt="Chania" width="1550"
									height="201">
							</div>
							<div class="item">
								<img src="Image/Logo4.jpg" alt="Chania" width="1550"
									height="201">
							</div>
							<div class="item">
								<img src="Image/Logo5.jpg" alt="Chania" width="1550"
									height="201">
							</div>
							<div class="item">
								<img src="Image/Logo6.jpg" alt="Chania" width="1550"
									height="201">
							</div>

						</div>
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>

				</div>
				<div class="col-md-4 content">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">BÀI MỚI</h3>
						</div>
						<table class="table">
							<tr>
								<td><a href="#">Hướng dẫn cách làm khóa luận</a></td>
							</tr>

							<tr>
								<td><a href="#">Những nguồn tài liệu tham khảo</a></td>
							</tr>

							<tr>
								<td><a href="#">Bài viết tham khảo</a></td>
							</tr>
							<tr>
								<td><a href="#">Bài viết tham khảo</a></td>
							</tr>
							<tr>
								<td><a href="#">Bài viết tham khảo</a></td>
							</tr>
							<tr>
								<td><a href="#">Bài viết tham khảo</a></td>
							</tr>
						</table>
					</div>

					<!--LỊCH-->


				</div>
			</div>
		</div>
	</div>




	<!-- Phần main -->
	<div style="padding-top: 0px">
		<div id="main">
			<div class="container">
				<div class="row">
					<div class="col-md-8 foder">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>THÔNG BÁO</h4>
							</div>
							<table class="table">
								<tr>
									<td><a href="#">Thông báo đăng ký đề tài tiểu
											luận chuyên ngành khóa 2013</a></td>
								</tr>

								<tr>
									<td><a href="#">Thông báo đăng ký đề tài tốt
											nghiệp và học môn tốt nghiệp khóa 2012</a></td>
								</tr>

								<tr>
									<td><a href="#">Đăng ký chuyên ngành khóa 2013</a></td>
								</tr>

								<tr>
									<td><a href="#">Thông báo đăng ký khóa luận tốt
											nghiệp và các môn học tốt nghiệp</a></td>
								</tr>

								<tr>
									<td><a href="#">Thông báo đăng ký đề tài tốt
											nghiệp và học môn tốt nghiệp khóa 2014</a></td>
								</tr>

								<tr>
									<td><a href="#">Thông báo đối với sinh viên làm
											đề tài thầy Lê</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>




			</div>
		</div>
	</div>

	<!-- --------------------------------- -->

	<section class="container" style="min-height: 0px">
		<!-- Modal đăng nhập-->
		<div class="modal fade" id="myModal" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<!-- <div class="row vertical-center-row">  -->
					<div class="col-md-10 col-center-block login-widget">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="panel-heading">
									<h4>ĐĂNG NHẬP</h4>
								</div>
							</div>
							<div class="panel-body">
								</form>
								<form class="form-horizonta" action="loginServelet"
									method="post">
									<div class="form-group">
										<label class="sr-only">USER</label> <input type="number"
											class="form-control" name="id_tk" placeholder="User" required>
									</div>
									<div class="form-group">
										<label class="sr-only">Password</label> <input
											type="password" class="form-control" name="pass"
											placeholder="Password" required>
									</div>
									<div class="checkbox" align="left">
										<label> <input type="checkbox"> Remember me
										</label>
									</div>
									<input type="hidden" value="login" name="command">
									<button type="submit" class="btn btn-info pull-right"
										style="padding-right: 20px; padding-left: 20px;">Sign
										in</button>
								</form>
</body>
</div>
<div></div>
</div>


</div>
<!--  </div>  -->

</div>

</div>
</div>
</section>
<!-- /////////////////////////////////-->
<footer class="site-footer">
	<div class="container">

		<div class="row">
			<div>
				<address>
					<hr>
					Trường Đại học Sư Phạm Kỹ Thuật TP. Hồ Chí Minh - Khoa Công Nghệ
					Thông Tin<br> Địa chỉ: Số 01 Võ Văn Ngân, Q. Thủ Đức, TP. Hồ
					Chí Minh
				</address>
			</div>

		</div>

	</div>
</footer>

<section class="container">
	<div class="modal fade" id="gioithieu" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-heading">
							<h2>GIỚI THIỆU</h2>
						</div>
					</div>
				</div>
				<h4>
					&nbsp;&nbsp;&nbsp;&nbsp;Website được tạo ra bởi nhóm 1 lớp thứ 4 đề
					tài: "<i>Phần mềm phản biện <br>&nbsp;&nbsp;&nbsp;&nbsp;và
						báo cáo online
					</i>". Phần mềm này hỗ trợ sinh viên và giảng viên có thể <br>&nbsp;&nbsp;&nbsp;&nbsp;báo
					cáo/phản biện online khóa luận tốt nghiệp tại mọi nơi thông qua <br>&nbsp;&nbsp;&nbsp;
					internet. giúp cho giảng viên và giáo viên có thể linh động hơn về
					thời <br> &nbsp;&nbsp;&nbsp; gian
				</h4>


			</div>
		</div>

	</div>
</section>
<section class="container">
	<div class="modal fade" id="lienhe" role="dialog">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-heading">
							<h3>LIÊN HỆ</h3>
						</div>
					</div>
				</div>
				<h4>&nbsp;&nbsp;&nbsp;&nbsp;Email: BacforWork@gmail.com</h4>
				<br>
				<h4>&nbsp;&nbsp;&nbsp;&nbsp;Số điện thoại: 01262567539</h4>



			</div>
		</div>

	</div>
	</div>
</section>
<!-- ====================================================-->

<script>
        $(document).ready(function () {
            $.ajaxSetup({ cache: false });
            $("#myBtn").click(function () {
                $("#myModal").modal();

            });
        });
    </script>
</script>
<script>
        $(document).ready(function () {
            $.ajaxSetup({ cache: false });
            $("#btnGioithieu").click(function () {
                $("#gioithieu").modal();

            });
        });
    </script>
<script>
        $(document).ready(function () {
            $.ajaxSetup({ cache: false });
            $("#btnLienhe").click(function () {
                $("#lienhe").modal();

            });
        });

    </script>



</body>
</html>