<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="banner-desktop">
	<div class="container">
		<div id="banner">
			<div id="login-area">
				<c:if test="${sessionScope.user == null}">
					<a data-toggle="modal" href="#dang_nhap">Đăng nhập</a>
				</c:if>
				<c:if test="${sessionScope.user != null}">
					<c:choose>
						<c:when test="${sessionScope.user.getChucVu() == '1'}">
							<a data-toggle="modal" href="#thongtin">Sinh
								Viên:${sessionScope.user.getHoTen()}</a>
						</c:when>
						<c:when test="${sessionScope.user.getChucVu()== '2'}">
							<a data-toggle="modal" href="#thongtin">Giảng
								Viên:${sessionScope.user.getHoTen()}</a>
						</c:when>
						<c:when test="${sessionScope.user.getChucVu() == '3'}">
							<a data-toggle="modal" href="#thongtin">Trưởng
								Khoa:${sessionScope.user.getHoTen()}</a>
						</c:when>
						<c:otherwise>
							<a data-toggle="modal" href="#dang_nhap">Đăng nhập</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- ############################ Đăng nhập ############################## -->
<div class="modal fade" id="dang_nhap">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">Đăng nhập</h4>
			</div>
			<!-- action='login' -->
			<form id="frm-login" action="#" method="post">
				<div class="modal-body">
					<div id="err_login"></div>
					<div id="login_here">
						<div class="radio-btn-area">
							<span><input type="radio" name='chucvu' value="1"
								checked="true">Sinh Viên</span> <span><input
								type="radio" name='chucvu' value="2">Giảng Viên</span> <span><input
								type="radio" name='chucvu' value="3">Trưởng khoa</span>

						</div>
						<label>Username : </label> <input type="text" class="form-control"
							name="username" id="username" placeholder="Enter username" /> <span
							class="help-block">Tài khoản</span><label>Password : </label> <input
							type="password" class="form-control" name="password"
							id="password" placeholder="Enter password" /><span
							class="help-block">Mật khẩu</span> <br /> <a
							href="quen-mat-khau" class="text-danger">Quên mật khẩu</a>

					</div>
					<br />
					<div id="waiting" style="display: none;">
						<div class="progress progress-striped active">
							<div class="progress-bar" role="progressbar" aria-valuenow="45"
								aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary " id="login_btn">Đăng
						nhập</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/ajax/login.js"></script>

<!-- ############################Thông tin cá nhân ######################### -->
<div class="modal fade" id="thongtin">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">Thông tin người dùng</h4>
			</div>
			<form method="post" action="#" id="frm-login">
				<div class="modal-body">

					<p>
						Tên người dùng : <span class="text-info">${sessionScope.user.getHoTen()}</span>
					</p>
					<p>
						MS: <span class="text-info">${sessionScope.user.getMaSo()}</span>
					</p>
					<p>
						Chuyên ngành : <span class="text-info">${sessionScope.user.getChuyenNganh()}</span>
					</p>
				</div>
				<div class="modal-footer">
					<a href="<%=request.getContextPath() %>/logout" type="button" class="btn btn-default">Đăng
						xuất</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<style>
.radio-btn-area {
	margin-left: 25%;
}
</style>

