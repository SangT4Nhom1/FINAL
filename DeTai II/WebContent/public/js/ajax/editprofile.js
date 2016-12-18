$(document).ready(function() {
	$("#frm-profile").submit(function (e) {
		var err=[];
		err.length=0;
		
		if($('#hoten').val()==""){
			
			err.push("Họ tên không được bỏ trống");
			
		} 
		if($('#ngaysinh').val()== ""){
			
			err.push("Ngày sinh không được bỏ trống");
			
		} 
		if($('#diachi').val()==""){
			
			err.push("Địa chỉ không được bỏ trống");
			
		} 
		if($('#sdt').val()==""){
			
			err.push("Số điện thoại không được bỏ trống");
		}
		if($('#ngaysinh').val()!=""){
			
			var ns=new Date($('#ngaysinh').val());
			
			if(ns >new Date()){
				
				err.push("Ngày sinh phải nhỏ hơn ngày hiện tại");
			}
			
		}
		if(err.length != 0){
			showErr(err);
				return false;
		}else {
			 var form_data = {
			            hoten: $("#hoten").val(),
			            ngaysinh: $("#ngaysinh").val(),
			            diachi: $('#diachi').val(),
			            sdt: $('#sdt').val()
			        };
			 $.ajax({
		            url:'../editprofile',
		            type:'POST',
		            async:true,
		            data: form_data,
		            success:function(msg){
		                if (msg == 'error')
		                {
		                	 $('#alert-modal-body').html("Lỗi");
		            		 $('#alert-modal').modal('show');
		                    return false;
		                }
		                else
		                {
		                $('#alert-modal-title').html("");
		                $('#alert-modal-body').html("Chỉnh sửa thành công");
		            	$('#alert-modal').modal('show');
		                   setTimeout(function(){
		                	   window.location.href = ''+msg+'';

		                   },1000);
		                   
		                }
		            }
		            });
		            return false;
		}
	});
	$('#frm-changepassword').submit(function (ee){
		if($('#oldpassword').val()==""){
			
			$('#err_login').html('<div class="alert alert-danger">Password chưa nhập</div>');
	        $("#oldpassword").focus();
	        return false;
			
		} else if($('#newpassword').val()==""){
			$('#err_login').html('<div class="alert alert-danger">Password chưa nhập</div>');
	        $("#newpassword").focus();
	        return false;
		}else if($('#retypepassword').val()==""){
			$('#err_login').html('<div class="alert alert-danger">Password chưa nhập</div>');
	        $("#retypepassword").focus();
	        return false;
		}else if($('#newpassword').val() !== $('#retypepassword').val()){
			$('#err_login').html('<div class="alert alert-danger">Nhập lại password</div>');
	        $("#retypepassword").focus();
	        return false;
		}else {
			
			var form_data_p = {
		            newpassword: $("#newpassword").val(),
		            
		            oldpassword:$('#oldpassword').val()
		            
		        };
		        $.ajax({
		            url:'../editprofile',
		            type:'POST',
		            async:true,
		            data: form_data_p,
		            success:function(msg){
		                if (msg == 'error')
		                {
			                $('#err_login').html('<div class="alert alert-danger">Mật khẩu không chính xác</div>');
	                    	$("#password").val("");
	                    	$("#password").focus();
			                    return false;
		                }
		                else
		                {
			                $('#err_login').html('<div class="alert alert-success">Đổi mật khẩu thành công</div>');
			                   setTimeout(function(){
			                	   window.location.href = ''+msg+'';
			                   },1000);
		                   
		                }
		            }
		            });
		        return false;
		}
	});
	
	
	function showErr(err){
		var html = '<ul>';
		
		for (var i = 0; i < err.length; i++) {
		    html += '<li>'+err[i]+'</li>';
		}
		
		html += '</ul>';
		 $('#alert-modal-body').html(html);
		 $('#alert-modal').modal('show');
		 
	}
	
    $("#sdt").keydown(function (e) {
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
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
 })