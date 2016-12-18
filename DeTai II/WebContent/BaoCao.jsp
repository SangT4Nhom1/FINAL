<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.lang.*"%>
<%@ page import="Model.*"%>
<%@ page import="Dao.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="msapplication-tap-highlight" content="no">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">
<%@include file="//includes/header.jsp"%>
<title>Website Hỗ trợ báo cáo online, báo cáo onlie</title>

<style>
* {
	word-wrap: break-word;
}

video {
	margin-left: 20%;
	object-fit: fill;
	width: 70%;
}

#videos-container {
	margin-left: 15%;
	position: fixed;
	bottom: 0%;
}

#streaming {
	margin: auto;
	width: 80%;
	border: 1px solid rgb(189, 189, 189);
	padding: 10px;
}
</style>
<!-- Bootstrap CSS -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">

<!-- hiện logo trên tab -->
<link rel="icon" href="Image/it_spkt.png" type="image/x-icon" />
<link rel="shortcut icon" href="Image/it_spkt.png" />
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
	String MaDeTai = "";
	if (request.getParameter("MaDeTai") != null) {
		MaDeTai = request.getParameter("MaDeTai");
	}
%>
<sql:query dataSource="${DBConn}" var="result5"> 
			 select HoTen from giaovien where MSGV=<%=tk.getId_TK()%>
</sql:query>

<sql:query dataSource="${DBConn}" var="result4"> 
			 select HoTen from sinhvien where MSSV=<%=tk.getId_TK()%>
</sql:query>

<sql:query dataSource="${DBConn}" var="result6"> 
			  select ThoiLuongBaoCao from detai where MaDeTai=<%=MaDeTai%>
</sql:query>

<sql:query dataSource="${DBConn}" var="result"> 
        select ChucVu 
        from nhanxet 
        where MaDeTai=<%=MaDeTai%> 
        	and MaGV=<%=tk.getId_TK()%>
		and ChucVu="Chủ Tịch Hội Đồng";
        </sql:query>

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 60%;
	margin: auto;
}

.article-slide .carousel-indicators {
	bottom: 0;
	left: 0;
	margin-left: 0px;
	width: 100%;
	height: 20%;
}
/* Indicators list style */
.article-slide .carousel-indicators li {
	border: medium none;
	border-radius: 0;
	float: center;
	height: 54px;
	margin-bottom: 5px;
	margin-left: 0;
	margin-right: 5px !important;
	margin-top: 0;
	width: 100px;
}
/* Indicators images style */
.article-slide .carousel-indicators img {
	border: 2px solid #FFFFFF;
	float: left;
	height: 100px;
	left: 0px;
	width: 100px;
}
/* Indicators active image style */
.article-slide .carousel-indicators .active img {
	border: 2px solid #428BCA;
	opacity: 0.7;
	padding-left: 0px;
}
</style>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
		
			<!-- Brand and toggle get grouped for better mobile display -->
			<!-- Collect the nav links, forms, and other content for toggling -->

			<ul class="nav navbar-nav navbar-right">
				<c:forEach var="rows" items="${result5.rows }">
					<li><a href="#"><c:out value="${rows.HoTen}"></c:out></a></li>
				</c:forEach>
				<c:forEach var="rows" items="${result4.rows }">
					<li><a href="#"><c:out value="${rows.HoTen}"></c:out></a></li>
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

		<div style="text-align: center;">
			<h1>Báo Cáo Phản Biện Online</h1>

		</div>
		<div>
			<nav class="navbar">
				<div class="container-fluid">
					<!-- 1 chức vụ -->
					<ul class="nav navbar-nav">

						<c:forEach var="rows" items="${result5.rows }">
							<li><a class='btn' href="GV_home.jsp">Trở Về</a></li>
						</c:forEach>
						<c:forEach var="rows" items="${result4.rows }">
							<li><a class='btn' href="SV_home.jsp">Trở Về</a></li>
						</c:forEach>
						<li><a style="cursor: pointer; margin-right: 0px;">
								<li><a class='btn' id="myBtn">Thời Lượng Báo Cáo</a></li>
						</a></li>
						<li><a class='btn' id="open-or-join">Phát trực tiếp màn hình</a></li>
						<li><a class='btn' id="join">Xem phát trực tiếp</a></li>

						<c:forEach var="rows" items="${result5.rows }">
							<li><a style="cursor: pointer; margin-right: 0px;">
									<li><a class='btn' id="myBtndiem" name="${rows.HoTen}">Chấm Điểm</a></li>
							</a></li>
						</c:forEach>

						<c:forEach var="rows" items="${result.rows }">
							<li><a class='btn' id="kick"><b><font color="red">
											Dừng bài báo cáo</font></b> </a></li>
						</c:forEach>
						<br>
						<li><a class='btn' target="_blank"
							href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk">Cài
								đặt Extension cho Chrome</a></li>
						<li><a class='btn' target="_blank"
							href="https://addons.mozilla.org/en-US/firefox/addon/enable-screen-capturing/">Cài
								đặt Extension cho Firefox</a></li>
					</ul>
				</div>
			</nav>
			<section class="experiment">
				<div id="streaming">
					<video id="video-preview" controls loop></video>
				</div>

				<div id="videos-container"
					style="border: 1px solid rgb(189, 189, 189);"></div>
			</section>

			<script
				src="<%=request.getContextPath()%>/public/js/videoConference/RTCMultiConnection.min.js"></script>

			<!-- custom layout for HTML5 audio/video elements -->
			<script
				src="<%=request.getContextPath()%>/public/js/videoConference/getMediaElement.js"></script>

			<!-- socket.io for signaling -->
			<script
				src="<%=request.getContextPath()%>/public/js/videoConference/socket.io.js"></script>

			<script
				src="<%=request.getContextPath()%>/public/js/videoConference/getScreenId.js"></script>

			<script type="text/javascript">
				var enableRecordings = false;
				var connection = new RTCMultiConnection(null, {
					useDefaultDevices : true
				// if we don't need to force selection of specific devices
				});

				connection.enableScalableBroadcast = true;

				connection.maxRelayLimitPerUser = 1;

				connection.autoCloseEntireSession = true;

				connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

				connection
						.connectSocket(function(socket) {

							socket
									.on(
											'join-broadcaster',
											function(hintsToJoinBroadcast) {
												console.log('join-broadcaster',
														hintsToJoinBroadcast);
												connection.session = hintsToJoinBroadcast.typeOfStreams;
												connection.sdpConstraints.mandatory = {
													OfferToReceiveVideo : true,
													OfferToReceiveAudio : false
												};
												connection
														.join(hintsToJoinBroadcast.userid);
											});
							socket
									.on(
											'rejoin-broadcast',
											function(broadcastId) {
												console.log('rejoin-broadcast',
														broadcastId);
												connection.attachStreams = [];
												socket
														.emit(
																'check-broadcast-presence',
																broadcastId,
																function(
																		isBroadcastExists) {
																	if (!isBroadcastExists) {

																		connection.userid = broadcastId;
																	}
																	socket
																			.emit(
																					'join-broadcast',
																					{
																						broadcastId : broadcastId,
																						userid : connection.userid,
																						typeOfStreams : connection.session
																					});
																});
											});
							socket
									.on(
											'broadcast-stopped',
											function(broadcastId) {

												console.error(
														'broadcast-stopped',
														broadcastId);
												alert('This broadcast has been stopped.');
											});

							socket.on('start-broadcasting', function(
									typeOfStreams) {
								console
										.log('start-broadcasting',
												typeOfStreams);

								connection.sdpConstraints.mandatory = {
									OfferToReceiveVideo : false,
									OfferToReceiveAudio : false
								};
								connection.session = typeOfStreams;

								connection.open(connection.userid);
							});
						});
				window.onbeforeunload = function() {

					document.getElementById('open-or-join').disabled = false;
				};
				var videoPreview = document.getElementById('video-preview');
				connection.onstream = function(event) {
					if (connection.isInitiator && event.type !== 'local') {
						return;
					}
					if (event.mediaElement) {
						event.mediaElement.pause();
						delete event.mediaElement;
					}
					connection.isUpperUserLeft = false;
					videoPreview.src = URL.createObjectURL(event.stream);
					videoPreview.play();
					videoPreview.userid = event.userid;
					if (event.type === 'local') {
						videoPreview.muted = true;
					}
					if (connection.isInitiator == false
							&& event.type === 'remote') {
						connection.dontCaptureUserMedia = true;
						connection.attachStreams = [ event.stream ];
						connection.sdpConstraints.mandatory = {
							OfferToReceiveAudio : false,
							OfferToReceiveVideo : false
						};
						var socket = connection.getSocket();
						socket.emit('can-relay-broadcast');
						if (connection.DetectRTC.browser.name === 'Chrome') {
							connection
									.getAllParticipants()
									.forEach(
											function(p) {
												if (p + '' != event.userid + '') {
													var peer = connection.peers[p].peer;
													peer
															.getLocalStreams()
															.forEach(
																	function(
																			localStream) {
																		peer
																				.removeStream(localStream);
																	});
													peer
															.addStream(event.stream);
													connection.dontAttachStream = true;
													connection.renegotiate(p);
													connection.dontAttachStream = false;
												}
											});
						}
						if (connection.DetectRTC.browser.name === 'Firefox') {

							connection.getAllParticipants().forEach(
									function(p) {
										if (p + '' != event.userid + '') {
											connection.replaceTrack(
													event.stream, p);
										}
									});
						}

						if (connection.DetectRTC.browser.name === 'Chrome') {
							repeatedlyRecordStream(event.stream);
						}
					}
				};

				var btnJoin = document.getElementById('open-or-join');

				if (typeof (btnJoin) != 'undefined' && btnJoin != null) {
					btnJoin.onclick = function() {
						var broadcastId = 'Group!1ItStre4ming';
						connection.session = {
							screen : true,
							oneway : true
						};
						var socket = connection.getSocket();
						socket.emit('check-broadcast-presence', broadcastId,
								function(isBroadcastExists) {
									if (!isBroadcastExists) {
										// the first person (i.e. real-broadcaster) MUST set his user-id
										connection.userid = broadcastId;
									}
									console.log('check-broadcast-presence',
											broadcastId, isBroadcastExists);
									socket.emit('join-broadcast', {
										broadcastId : broadcastId,
										userid : connection.userid,
										typeOfStreams : connection.session
									});
								});
					};
				};
				connection.onstreamended = function() {
				};
				connection.onleave = function(event) {
					if (event.userid !== videoPreview.userid)
						return;
					var socket = connection.getSocket();
					socket.emit('can-not-relay-broadcast');
					connection.isUpperUserLeft = true;
					if (allRecordedBlobs.length) {
						// playing lats recorded blob
						var lastBlob = allRecordedBlobs[allRecordedBlobs.length - 1];
						videoPreview.src = URL.createObjectURL(lastBlob);
						videoPreview.play();
						allRecordedBlobs = [];
					} else if (connection.currentRecorder) {
						var recorder = connection.currentRecorder;
						connection.currentRecorder = null;
						recorder.stopRecording(function() {
							if (!connection.isUpperUserLeft)
								return;
							videoPreview.src = URL
									.createObjectURL(recorder.blob);
							videoPreview.play();
						});
					}
					if (connection.currentRecorder) {
						connection.currentRecorder.stopRecording();
						connection.currentRecorder = null;
					}
				};
				var allRecordedBlobs = [];
				function repeatedlyRecordStream(stream) {
					if (!enableRecordings) {
						return;
					}
					connection.currentRecorder = RecordRTC(stream, {
						type : 'video'
					});
					connection.currentRecorder.startRecording();
					setTimeout(function() {
						if (connection.isUpperUserLeft
								|| !connection.currentRecorder) {
							return;
						}
						connection.currentRecorder.stopRecording(function() {
							allRecordedBlobs
									.push(connection.currentRecorder.blob);
							if (connection.isUpperUserLeft) {
								return;
							}
							connection.currentRecorder = null;
							repeatedlyRecordStream(stream);
						});
					}, 30 * 1000); // 30-seconds
				};
				// Using getScreenId.js to capture screen from any domain
				// You do NOT need to deploy Chrome Extension YOUR-Self!!
				connection.getScreenConstraints = function(callback) {
					getScreenConstraints(function(error, screen_constraints) {
						if (!error) {
							screen_constraints = connection
									.modifyScreenConstraints(screen_constraints);
							callback(error, screen_constraints);
							return;
						}
						throw error;
					});
				};
				var broadcastId = 'Group!1ItStre4ming';
				if (localStorage.getItem(connection.socketMessageEvent)) {
					broadcastId = localStorage
							.getItem(connection.socketMessageEvent);
				} else {
					broadcastId = connection.token();
				}

				if (broadcastId && broadcastId.length) {
					localStorage.setItem(connection.socketMessageEvent,
							broadcastId);

					// auto-join-room
					(function reCheckRoomPresence() {
						connection.checkPresence(broadcastId, function(
								isRoomExists) {
							if (isRoomExists) {
								document.getElementById('open-or-join')
										.onclick();
								return;
							}
							setTimeout(reCheckRoomPresence, 5000);
						});
					})();
				}

				var btnKick = document.getElementById('kick');

				if (typeof (btnKick) != 'undefined' && btnKick != null) {
					btnKick.onclick = function() {
						if (confirm('Bạn chắc chắn muốn dừng bài bào cáo này?')) {
							connection.attachStreams.forEach(function(stream) {
								stream.stop();
							});

							connection.stopPartOfScreenSharing();
						}

					}
				};

				var btnJoin = document.getElementById('join');

				if (typeof (btnJoin) != 'undefined' && btnJoin != null) {
					btnJoin.onclick = function() {
						var broadcastId = 'Group!1ItStre4ming';
						connection.session = {
							screen : true,
							oneway : true
						};
						var socket = connection.getSocket();
						socket.emit('check-broadcast-presence', broadcastId,
								function(isBroadcastExists) {
									if (!isBroadcastExists) {
										alert("Chưa phát trực tiếp");
										return;
									}

									console.log('check-broadcast-presence',
											broadcastId, isBroadcastExists);
									socket.emit('join-broadcast', {
										broadcastId : broadcastId,
										userid : connection.userid,
										typeOfStreams : connection.session
									});
								});
					}
				} else {
				}
			</script>

			<script type="text/javascript">
				var connection_video = new RTCMultiConnection();

				connection_video.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
				connection_video.socketMessageEvent = 'video-conference';
				connection_video.session = {
					audio : true,
					video : true
				};
				connection_video.sdpConstraints.mandatory = {
					OfferToReceiveAudio : true,
					OfferToReceiveVideo : true
				};

				connection_video.videosContainer = document
						.getElementById('videos-container');

				connection_video.onstream = function(event) {
					var width = parseInt(/*connection_video.videosContainer.clientWidth */450 / 2) - 20;
					var mediaElement = getMediaElement(event.mediaElement, {
						title : event.userid,
						buttons : [ 'full-screen' ],
						width : width,
						showOnMouseEnter : false
					});
					connection_video.videosContainer.appendChild(mediaElement);
					mediaElement.media.play();
					mediaElement.id = event.streamid;
				};

				connection_video.onstreamended = function(event) {
					var mediaElement = document.getElementById(event.streamid);
					if (mediaElement) {
						mediaElement.parentNode.removeChild(mediaElement);
					}
				};

				var roomid = 'Group!1It_BaoCaoPhanBien';
				if (localStorage.getItem(connection_video.socketMessageEvent)) {
					roomid = localStorage
							.getItem(connection_video.socketMessageEvent);
				} else {
					roomid = connection_video.token();
				}

				if (roomid && roomid.length) {

					localStorage.setItem(connection_video.socketMessageEvent,
							roomid);

					// auto-join-room
					(function reCheckRoomPresence() {
						connection_video.checkPresence(roomid, function(
								isRoomExists) {
							if (isRoomExists) {
								connection_video.join(roomid);
								return;
							}

							setTimeout(reCheckRoomPresence, 5000);
						});
					})();

				}
				connection_video.openOrJoin('Group!1It_BaoCaoPhanBien');
			</script>

			<script>
				$(document).ready(function() {
					$.ajaxSetup({
						cache : false
					});
					$("#myBtn").click(function() {
						$("#myModal").modal();

					});
				});
			</script>
			<script>
				$(document).ready(function() {
					$.ajaxSetup({
						cache : false
					});
					$("#myBtndiem").click(function() {
						$("#myModaldiem").modal();

					});
				});
			</script>
		</div>
	</div>

	<section class="container" style="min-height: 0px">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- <div class="row vertical-center-row">  -->
					<div class="col-md-10 col-center-block login-widget">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>Thời Lượng Báo Cáo</h4>
							</div>

							<div class="panel-body">

								<div class="col-lg-6" style="text-align: center;">
									<c:forEach var="rows" items="${result6.rows }">
										<h3>
											<c:out value="${rows.ThoiLuongBaoCao}"></c:out>
										</h3>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="container" style="min-height: 0px">
		<div class="modal fade" id="myModaldiem" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- <div class="row vertical-center-row">  -->
					<div class="col-md-10 col-center-block login-widget">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>Chấm Điểm</h4>
							</div>

							<div class="panel-body">

								<form class="form" action="DiemServlet" method="post">
									<div class="form-group">
										<input type="hidden" class="form-control" name="MaDeTai"
											value=<%=MaDeTai%> readonly="readonly"> <input
											type="hidden" class="form-control" name="MaGV"
											value=<%=tk.getId_TK()%> readonly="readonly">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" name="Diem"
											placeholder="Điểm ..." required>
									</div>
									<div class="form-group">
										<input type="hidden" value="insert" name="command">
										<button type="submit" class="btn btn-primary">Điểm</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<div class="container">

	<div class="row">
		<div>
			<address>
				<hr>
				<br> <br> <br> <br> <br>
			</address>
		</div>
	</div>
</div>
</html>