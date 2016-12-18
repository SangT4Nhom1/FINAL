$(document).ready(function(){
    $("#frm-login").submit(function(e){
    if ($("#username").val() == '')
    {
        $('#err_login').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Username chưa nhập</div>');
        $("#username").focus();
        return false;
    }
    else if ($("#password").val() == '')
    {
        $('#err_login').html('<div class="alert alert-danger"> <span class="glyphicon glyphicon-remove form-control-feedback"></span>Password chưa nhập</div>');
        $("#password").focus();
        return false;
    }
    else
    {		
        var form_data_login = {
            username: $("#username").val(),
            password: $("#password").val(),
            chucvu : $('input[type="radio"]:checked').val()
        };
        $.ajax({
            url:'login',
            type:'POST',
            async:true,
            data: form_data_login,
            success:function(msg_login){
                if (msg_login == 'error')
                {
                    $('#err_login').html('<div class="alert alert-danger">Tên hoặc mật khẩu không chính xác</div>');
                    $("#password").val("");
                    $("#password").focus();
                    return false;
                }
                else
                {
                    $("#login_here").hide();
                    $(".modal-footer").hide();
                    $('#err_login').html('<div class="alert alert-success"><strong>Đăng nhập thành công</strong><span> Hệ thống tự chuyển sau vài giây ...</span></div>');
                   setTimeout(function(){
                	   window.location.href = ''+msg_login+'';

                   },1000);
                }
            }
            });
            return false;
           
    }
});
})
//Load wating bar
 $(document).ajaxStart(function () {
        $("#waiting").show();
    }).ajaxStop(function () {
        $("#waiting").hide();
        });
