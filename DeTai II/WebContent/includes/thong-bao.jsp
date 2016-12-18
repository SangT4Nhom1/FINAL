
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="tb" items="${requestScope.thongbaos}">
	<li class="article-area">
		<p>
			<span class="btn btn-primary btn-sm">${tb.getNgay()}</span>
			${tb.getTieuDe()}
			<c:if test="${tb.getMaThongBao() == requestScope.newestTB}">
				<img src="<%=request.getContextPath()%>/public/images/new1.gif">
			</c:if>
		</p>
		<p style="display: none" class='content-tb'>${tb.getNoiDung()}</p>
	</li>
</c:forEach>