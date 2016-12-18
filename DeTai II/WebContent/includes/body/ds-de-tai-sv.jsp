<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ############################ form bao cao ############################## -->
<div class="modal fade" id="fbaocao">
	<div class="modal-dialog" style="width: 75%; height: 70%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h2 class="form-signin-heading">
					<p align="center">
						<font size="4">Form Báo Cáo</font>
					</p>
				</h2>
			</div>
			<form id="frmBaoCao" 
				enctype="multipart/form-data" acceptcharset="UTF-8">
				<div id="err"></div>
				<table class="table" id="table-form">
					<tr>
						<td>Tên đề tài:</td>
						<td>${requestScope.detai.getTenDeTai()}</td>
					</tr>
					<tr>
						<td>MSSV:</td>
						<td class="sizeInput" name="maSV">${requestScope.detai.getMaSo()}</td>
					</tr>
					<tr>
						<td>Sinh Viên:</td>
						<td class="sizeInput">${requestScope.detai.getHoTen()}</td>
					</tr>
					<tr>
						<td>Giáo Viên Hướng Dẫn:</td>
						<td class="sizeInput">${requestScope.gvhd.getGiangVienHD()}</td>
					</tr>
					<tr>
						<td>Mô Tả Đề Tài:</td>
						<td><textarea name="mota" rows="6" cols="90" id="tomtat"></textarea></td>
					</tr>
					<tr>
						<td>Nộp file:</td>
						<td><input id="fileBaoCao" type="file" name="file" value=""></td>
					</tr>
				</table>
				<p style="margin-left: 184px;">
					
				</p>
				<div id="footer-form">
					<p align="right">
						<button class="btnNop btn btn-success " id="btnNopBaoCao"
							type="submit">Nộp báo cáo</button>
					</p>
				</div>

			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!--Các bản tin-->
<table class="table" border="1">
	<tr>
		<td class="tt_detaiSV">Sinh viên báo cáo:</td>
		<td>${requestScope.detai.getHoTen()}</td>
	</tr>
	<tr>
		<td class="tt_detaiSV">Tên đề tài:</td>
		<td>${requestScope.detai.getTenDeTai()}</td>
	</tr>
	<tr>
		<td class="tt_detaiSV">Thời gian báo cáo:</td>
		<td>${requestScope.detai.getThoiLuongBaoCao()}</td>
	</tr>
	<tr>
		<td class="tt_detaiSV">Ngày báo cáo:</td>
		<td>${requestScope.detai.getNgayBaoCao()}</td>
	</tr>
	<tr>
		<td class="tt_detaiSV">Giờ báo cáo:</td>
		<td>${requestScope.detai.getThoiGianBaoCao()}</td>
	</tr>
	<tr>
		<td class="tt_detaiSV">Nộp báo cáo</td>
		<td>${requestScope.detai.getTrangThai()} </td>
	</tr>
</table>
<table class="table table-bordered" border="1" align="center"
	style="width: 50%;">
	<caption>
		<font size="4" class=""> Hội Đồng Báo Cáo</font>
	</caption>
	<tr style="background-color: gray;">
		<th class="">Giảng Viên</th>
		<th class="">Vai trò</th>
	</tr>
	<tr>
		<td>${requestScope.gvhd.getGiangVienHD()}</td>
		<td>Giáo viên hướng dẫn</td>
	</tr>
	<tr>
		<td>${requestScope.gvpb.getPhanBien()}</td>
		<td>Giảng Viên Phản Biện</td>
	</tr>
	<tr>
		<td>${requestScope.uyvien.getUyVien()}</td>
		<td>Ủy Viên</td>
	</tr>
	<tr>
		<td>${requestScope.chutich.getChuTich()}</td>
		<td>Chủ Tịch</td>
	</tr>
</table>
<br>
<c:choose>
	<c:when test="${requestScope.detai.getTrangThai()=='Chưa nộp'}">
		<a data-toggle="modal" href="#fbaocao" style="margin-left: 45%"
			type="button" class="btnNopBaoCao btn btn-primary" id="btNopform">Nộp
			báo cáo</a>
	</c:when>
	<c:otherwise>
		<a data-toggle="modal" href="#fbaocao" style="margin-left: 45%"
			type="button" class="btnNopBaoCao btn btn-primary disabled"
			id="btNopform">Nộp báo cáo</a>
	</c:otherwise>
</c:choose>
</div>
<!--end bản tin-->
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/ajax/submitTopic.js"></script>