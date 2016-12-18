	$(document).ready(function(){
	    $("#xlbaocao").submit(function(e){
	    	if($("#uyvien").val()==$("#phanbien").val()){
	    		$('#alert-modal-body').html("Ủy viên với giáo viên phản biện trùng nhau!");
	    		$('#alert-modal').modal('show');
	    		return false;
	    	}else{
	    		//alert($('input[name=chucvu]:checked', '#xeplichbaocao').val())
	    		var form_data_login = {
		                MaDT: $("#maDT").html(),
		                TenDT: $("#tenDT").html(),
		                ThoiGianBaoCao:$("#thoigianbaocao").val(),
		                ThoiLuong:$("#thoiluong").val(),
		                GVHD:$("#GVHD").html(),
		                UyVien:$("#uyvien").val(),
		                PhanBien:$("#phanbien").val(),
		                ChuTich:$('input[name=chucvu]:checked', '#xlbaocao').val()     
				};
	    		
	    		if (confirm('Bạn chắc muốn xếp lịch không?')) {
	    	        $.ajax({
	    	            url:'UpdateXepLich',
	    	            type:'Post',
	    	            async:true,
	    	            data: form_data_login,
	    	            success:function(msg_login){
	    	                if (msg_login == 'error')
	    	                {
	    	                	 $('#alert-modal-body').html("Không xếp lịch được!");
			            		 $('#alert-modal').modal('show');
	    	                    return false;
	    	                }
	    	                else
	    	                {  	          
	    	                		
			                  	   window.location.href = ''+msg_login+'';
	    	                }
	    	            }
	    	            });
	    	        
	    			return false;
	    			
	    		} else {
	    		    return false;
	    		}
	    	}
	    	return false;
	})});