<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="icon" href="<%=request.getContextPath()%>/public/images/it_spkt.png" type="image/x-icon" />
<link rel="shortcut icon" href="public/images/it_spkt.png" />
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/css/style.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/css/footable.core.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/css/footable.standalone.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/css/other.css"/>
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/css-footer/demo.css"/>
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/css-footer/footer-distributed-with-address-and-phones.css"/>
<link rel="stylesheet" media="all" type="text/css"
	href="<%=request.getContextPath()%>/public/css-footer/font-awesome-4.6.3/css/font-awesome.min.css"/>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/public/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/public/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/public/js/footable.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/public/js/my_script.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".list-group-item").click(function(){
		$(".list-group-item").removeClass("active");
		$(this).addClass("active");
	});
});
</script>
	