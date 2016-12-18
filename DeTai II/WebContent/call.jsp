<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">
	<%@include file="//includes/header.jsp"%>
		
    <title>Báo cáo</title>
<style>
	* {
		word-wrap: break-word;
	}
	
	video {
		margin-left:20%;
		object-fit: fill;
		width: 70%;
	}
	#videos-container {
		margin-left:15%;
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
</head>

<body>

	<nav class="navbar">
		<div class="container-fluid">
			<!-- 1 chức vụ -->
			<ul class="nav navbar-nav">
				<li><a class='btn' id="open-or-join">Phát trực tiếp màn hình</a></li>
				<li><a class='btn' id="join">Xem phát trực tiếp</a></li>
				<!--  
				<li><a class='btn' id="kick" ><b><font color="red">Dừng bài báo cáo</font></b></a></li>
				<c:if test="${sessionScope.user.getChucVu() == '1'}">
					<li><a class='btn' id="open-or-join">Phát trực tiếp màn hình</a></li>
				</c:if>
				<c:if test="${sessionScope.user.getChucVu() != '1'}">
					<li><a class='btn' id="join">Xem phát trực tiếp</a></li>
				</c:if>
				<c:if test="${sessionScope.user.getMaSo() == requestScope.machutich}">
					<li><a class='btn' id="kick" ><b><font color="red">Dừng bài báo cáo</font></b></a></li>
				</c:if>
				
				-->
				<li><a class='btn' target="_blank"  href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" >Cài đặt Extension cho Chrome</a></li>
				<li><a class='btn' target="_blank"  href="https://addons.mozilla.org/en-US/firefox/addon/enable-screen-capturing/">Cài đặt Extension cho Firefox</a></li>
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
                useDefaultDevices: true // if we don't need to force selection of specific devices
            });

            connection.enableScalableBroadcast = true;

            connection.maxRelayLimitPerUser = 1;

            connection.autoCloseEntireSession = true;

            connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

            connection.connectSocket(function(socket) {

                socket.on('join-broadcaster', function(hintsToJoinBroadcast) {
                    console.log('join-broadcaster', hintsToJoinBroadcast);
                    connection.session = hintsToJoinBroadcast.typeOfStreams;
                    connection.sdpConstraints.mandatory = {
                        OfferToReceiveVideo: true,
                        OfferToReceiveAudio: false
                    };
                    connection.join(hintsToJoinBroadcast.userid);
                });
                socket.on('rejoin-broadcast', function(broadcastId) {
                    console.log('rejoin-broadcast', broadcastId);
                    connection.attachStreams = [];
                    socket.emit('check-broadcast-presence', broadcastId, function(isBroadcastExists) {
                        if(!isBroadcastExists) {
                          
                            connection.userid = broadcastId;
                        }
                        socket.emit('join-broadcast', {
                            broadcastId: broadcastId,
                            userid: connection.userid,
                            typeOfStreams: connection.session
                        });
                    });
                });
                socket.on('broadcast-stopped', function(broadcastId) {
                   
                    console.error('broadcast-stopped', broadcastId);
                    alert('This broadcast has been stopped.');
                });
               
                socket.on('start-broadcasting', function(typeOfStreams) {
                    console.log('start-broadcasting', typeOfStreams);
                   
                    connection.sdpConstraints.mandatory = {
                        OfferToReceiveVideo: false,
                        OfferToReceiveAudio: false
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
                if(connection.isInitiator && event.type !== 'local') {
                    return;
                }
                if(event.mediaElement) {
                    event.mediaElement.pause();
                    delete event.mediaElement;
                }
                connection.isUpperUserLeft = false;
                videoPreview.src = URL.createObjectURL(event.stream);
                videoPreview.play();
                videoPreview.userid = event.userid;
                if(event.type === 'local') {
                    videoPreview.muted = true;
                }
                if (connection.isInitiator == false && event.type === 'remote') {
                    connection.dontCaptureUserMedia = true;
                    connection.attachStreams = [event.stream];
                    connection.sdpConstraints.mandatory = {
                        OfferToReceiveAudio: false,
                        OfferToReceiveVideo: false
                    };
                    var socket = connection.getSocket();
                    socket.emit('can-relay-broadcast');
                    if(connection.DetectRTC.browser.name === 'Chrome') {
                        connection.getAllParticipants().forEach(function(p) {
                            if(p + '' != event.userid + '') {
                                var peer = connection.peers[p].peer;
                                peer.getLocalStreams().forEach(function(localStream) {
                                    peer.removeStream(localStream);
                                });
                                peer.addStream(event.stream);
                                connection.dontAttachStream = true;
                                connection.renegotiate(p);
                                connection.dontAttachStream = false;
                            }
                        });
                    }
                    if(connection.DetectRTC.browser.name === 'Firefox') {

                        connection.getAllParticipants().forEach(function(p) {
                            if(p + '' != event.userid + '') {
                                connection.replaceTrack(event.stream, p);
                            }
                        });
                    }

                    if(connection.DetectRTC.browser.name === 'Chrome') {
                        repeatedlyRecordStream(event.stream);
                    }
                }
            };
          
            var btnJoin=document.getElementById('open-or-join');
            
            if (typeof(btnJoin) != 'undefined' && btnJoin != null)
            {
            	btnJoin.onclick= function(){
            		 var broadcastId = 'Group!1ItStre4ming';
                     connection.session = {
                         screen: true,
                         oneway: true
                     };
                     var socket = connection.getSocket();
                     socket.emit('check-broadcast-presence', broadcastId, function(isBroadcastExists) {
                         if(!isBroadcastExists) {
                             // the first person (i.e. real-broadcaster) MUST set his user-id
                             connection.userid = broadcastId;
                         }
                         console.log('check-broadcast-presence', broadcastId, isBroadcastExists);
                         socket.emit('join-broadcast', {
                             broadcastId: broadcastId,
                             userid: connection.userid,
                             typeOfStreams: connection.session
                         });
                     });
             	 };
            };
            connection.onstreamended = function() {};
            connection.onleave = function(event) {
                if(event.userid !== videoPreview.userid) return;
                var socket = connection.getSocket();
                socket.emit('can-not-relay-broadcast');
                connection.isUpperUserLeft = true;
                if(allRecordedBlobs.length) {
                    // playing lats recorded blob
                    var lastBlob = allRecordedBlobs[allRecordedBlobs.length - 1];
                    videoPreview.src = URL.createObjectURL(lastBlob);
                    videoPreview.play();
                    allRecordedBlobs = [];
                }
                else if(connection.currentRecorder) {
                    var recorder = connection.currentRecorder;
                    connection.currentRecorder = null;
                    recorder.stopRecording(function() {
                        if(!connection.isUpperUserLeft) return;
                        videoPreview.src = URL.createObjectURL(recorder.blob);
                        videoPreview.play();
                    });
                }
                if(connection.currentRecorder) {
                    connection.currentRecorder.stopRecording();
                    connection.currentRecorder = null;
                }
            };
            var allRecordedBlobs = [];
            function repeatedlyRecordStream(stream) {
                if(!enableRecordings) {
                    return;
                }
                connection.currentRecorder = RecordRTC(stream, {
                    type: 'video'
                });
                connection.currentRecorder.startRecording();
                setTimeout(function() {
                    if(connection.isUpperUserLeft || !connection.currentRecorder) {
                        return;
                    }
                    connection.currentRecorder.stopRecording(function() {
                        allRecordedBlobs.push(connection.currentRecorder.blob);
                        if(connection.isUpperUserLeft) {
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
                        screen_constraints = connection.modifyScreenConstraints(screen_constraints);
                        callback(error, screen_constraints);
                        return;
                    }
                    throw error;
                });
            };
            var broadcastId = 'Group!1ItStre4ming';
            if (localStorage.getItem(connection.socketMessageEvent)) {
                broadcastId = localStorage.getItem(connection.socketMessageEvent);
            } else {
                broadcastId = connection.token();
            }
            
            if(broadcastId && broadcastId.length) {
                localStorage.setItem(connection.socketMessageEvent, broadcastId);

                // auto-join-room
                (function reCheckRoomPresence() {
                    connection.checkPresence(broadcastId, function(isRoomExists) {
                        if(isRoomExists) {
                            document.getElementById('open-or-join').onclick();
                            return;
                        }
                        setTimeout(reCheckRoomPresence, 5000);
                    });
                })();
            }
            var btnKick=document.getElementById('kick');
          
            if (typeof(btnKick) != 'undefined' && btnKick != null)
            {
             	 btnKick.onclick= function(){
             		 if(confirm('Bạn chắc chắn muốn dừng bài bào cáo này?')){
             			connection.attachStreams.forEach(function(stream) {
                    	    stream.stop();
                    	});
             			
             			connection.stopPartOfScreenSharing();
             		 }
             	 
           		 }
            };
            
            var btnJoin=document.getElementById('join');
            
            if (typeof(btnJoin) != 'undefined' && btnJoin != null)
            {
             	 btnJoin.onclick= function(){
             		 var broadcastId = 'Group!1ItStre4ming';
                     connection.session = {
                         screen: true,
                         oneway: true
                     };
                     var socket = connection.getSocket();
                     socket.emit('check-broadcast-presence', broadcastId, function(isBroadcastExists) {
                    	 if(!isBroadcastExists){
                    		 alert("Sinh viên chưa phát trực tiếp");
                    		 return;
                    	 }
                    		
                         console.log('check-broadcast-presence', broadcastId, isBroadcastExists);
                         socket.emit('join-broadcast', {
                             broadcastId: broadcastId,
                             userid: connection.userid,
                             typeOfStreams: connection.session
                         });
                     });
             	 }
            }else {}
            
        </script>
        
    <script type="text/javascript">
        
       
         var connection_video = new RTCMultiConnection();

         connection_video.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
         connection_video.socketMessageEvent = 'video-conference';
         connection_video.session = {
             audio: true,
             video: true
         };
         connection_video.sdpConstraints.mandatory = {
             OfferToReceiveAudio: true,
             OfferToReceiveVideo: true
         };
         
         connection_video.videosContainer = document.getElementById('videos-container');
         
         connection_video.onstream = function(event) {
             var width = parseInt(/*connection_video.videosContainer.clientWidth */ 450/ 2) - 20;
             var mediaElement = getMediaElement(event.mediaElement, {
                 title: event.userid,
                 buttons: ['full-screen'],
                 width: width,
                 showOnMouseEnter: false
             });
             connection_video.videosContainer.appendChild(mediaElement);
             mediaElement.media.play();
             mediaElement.id = event.streamid;
         };
        
         connection_video.onstreamended = function(event) {
             var mediaElement = document.getElementById(event.streamid);
             if(mediaElement) {
                 mediaElement.parentNode.removeChild(mediaElement);
             }
         };
         
         var roomid = 'Group!1It_BaoCaoPhanBien';
         if (localStorage.getItem(connection_video.socketMessageEvent)) {
             roomid = localStorage.getItem(connection_video.socketMessageEvent);
         } else {
             roomid = connection_video.token();
         }

         if(roomid && roomid.length) {
         
             localStorage.setItem(connection_video.socketMessageEvent, roomid);

             // auto-join-room
             (function reCheckRoomPresence() {
                 connection_video.checkPresence(roomid, function(isRoomExists) {
                     if(isRoomExists) {
                         connection_video.join(roomid);
                         return;
                     }

                     setTimeout(reCheckRoomPresence, 5000);
                 });
             })();

         }
         connection_video.openOrJoin('Group!1It_BaoCaoPhanBien');
	</script>
	
	<%-- <c:if test="${sessionScope.user.getChucVu() != '1'}">
		<div class="modal fade" id="chodiem">
				<div class="modal-dialog" style="width: 75%; height: 50%;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h2 class="form-signin-heading">
								<p align="center">
									<font size="4">Cho Điểm</font>
								</p>
							</h2>
						</div>
						<form id="frmSubmitMark"  action="#" method="post">
							<div id="error"></div>
								<table class="table" id="table-form">
									<tr>
										<td>Mã đề tài:</td>
										<td id="madetai">${requestScope.madetai}</td>
									</tr>
									<tr>
										<td>Tên Đề Tài:</td>
										<td>${requestScope.tendetai}</td>
									</tr>
									<tr>
										<td>Ngày Báo Cáo:</td>
										<td>${requestScope.ngaybaocao}</td>
									</tr>
									<tr>
										<td>Giờ:</td>
										<td>${requestScope.thoigianbaocao}</td>
									</tr>
									<tr>
										<td>Điểm:</td>
										<td><input type="text" id="inputDiem"></td>
									</tr>
									<tr>
										<td>Nhận Xét:</td>
										<td><textarea rows="6" cols="80" id="inputNX"></textarea></td>
									</tr>
								</table>
								<div id="footer-form">
										<p align="center">
										<button type="submit" class="btn btn-success"
											>Xác Nhận</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</p>
								</div>
								
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<script type="text/javascript">
			$(document).ready(function(){

			    $("#frmSubmitMark").submit(function(e){	

			    if ($("#inputNX").val() == '')
			    {
			        $('#error').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Nhập nhận xét</div>');
			        $("#inputNX").focus();
			        return false;
			    }
			    if($("#inputDiem").val() == '')
			    {
			    		 $('#error').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Nhập điểm</div>');
				        $("#inputDiem").focus();
				        return false;
			    }
			    else
			    {
			    	var test=parseFloat($("#inputDiem").val());
			    	if(test>10 || test<0){
			    		$('#error').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Điểm phải trong khoảng 0-10</div>');
				        $("#inputDiem").focus();
				        return false;
			    	} 
			        var form_data= {
			            madetai: $("#madetai").html(),
			            diem: $("#inputDiem").val(),
			            nhanxet : $('#inputNX').val()
			         };
			    	 $.ajax({
			    	        url: "bao-cao",
			    	        type: 'POST',
			    	        data: form_data,
			    	        async: false,
			    	        success: function (data) {
			    	        	
			    	        	if (data == 'error')
			                    {
			    	        		 $('#error').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Thất bại..</div>');
			                        return false;
			                    }
			                    else
			                    {
			                        $("#footer-form").hide();
			                        $('#table-form').hide();
			                        $('#error').html('<div class="alert alert-success style="width:50%""><span> Cho điểm thành công :)</span></div>');
			                    	$('#btnMark').addClass('disabled');
			                    	setTimeout(1000);
			                    	$('#chodiem').modal('toggle');
			                    }
			    	        }
			    	    });
			    	    return false;
			    }
			    return false;
			    });
			});
			 $("#inputDiem").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))) {
            e.preventDefault();
        }
  	  });
			</script>
			
</c:if> --%>
</body>

</html>
