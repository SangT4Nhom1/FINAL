<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="mobile-bar">
	<span style="cursor: pointer;" class="pull-left" href="javascript:;"
		onclick="slideMenu(); return false;" id="slideicon"><i
		class="icon-reorder"></i></span>
	<c:if test="${sessionScope.user == null}">
		<span data-toggle="modal" href="#dang_nhap"
			class="pull-right btn btn-default btn-sm" id="#">Đăng nhập</span>
		<p style="text-align: center; font-weight: bold;">Báo cáo phản
			biện online</p>
	</c:if>
	<c:if test="${sessionScope.user != null}">
		 <span data-toggle="modal" href="#thongtin" class="pull-right btn btn-default btn-sm" id="#">Thông tin</span>

		<c:choose>
			<c:when test="${sessionScope.user.getChucVu() == '1'}">

				<p style="text-align: center; font-weight: bold;">SV:${sessionScope.user.getHoTen()}</p>
			</c:when>
			<c:when test="${sessionScope.user.getChucVu()== '2'}">

				<p style="text-align: center; font-weight: bold;">GV:${sessionScope.user.getHoTen()}</p>
			</c:when>
			<c:when test="${sessionScope.user.getChucVu() == '3'}">
				<p style="text-align: center; font-weight: bold;">TK:${sessionScope.user.getHoTen()}</p>
			</c:when>
			<c:otherwise>
				<span data-toggle="modal" href="#dang_nhap"
					class="pull-right btn btn-default btn-sm" id="#">Đăng nhập</span>
				<p style="text-align: center; font-weight: bold;">Báo cáo phản
					biện online</p>
			</c:otherwise>
		</c:choose>
	</c:if>
</div>