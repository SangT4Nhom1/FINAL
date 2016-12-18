$(document).ready(function(){
    $("#frmBaoCao").submit(function(e){	
    	
    if ($("#tomtat").val() == '')
    {
        $('#err').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Nhập tóm tắt đề tài</div>');
        $("#tomtat").focus();
        return false;
    }
    else
    {
    	
    	 var formData = new FormData($(this)[0]);
    	 console.log(formData);
    	 $.ajax({
    	        url: "SubmitTopic",
    	        type: 'POST',
    	        data: formData,
    	        async: false,
    	        success: function (data) {
    	        	
    	        	if (data == 'error')
                    {
    	        		 $('#err').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Nộp đề tài thất bại....</div>');
                        return false;
                    }
                    else
                    {
                        $("#footer-form").hide();
                        $('#table-form').hide();
                        $('#err').html('<div class="alert alert-success style="width:50%""><span> Nộp báo cáo thành công :)</span></div>');
                        setTimeout(function(){
                    	   window.location.href = ''+data+'';

                       },1500);
                    }
    	        },
    	        cache: false,
    	        contentType: false,
    	        processData: false
    	    });
    	    return false;
    }
    return false;
    });
})

