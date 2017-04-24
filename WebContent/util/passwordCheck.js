  $(function() {
   $(document).ready(function() {
    // user_pswd 텍스트박스에 값이 입력되는 경우 유효성 검사
    $("#user_pswd").css("ime-mode", "disabled").keyup(pwdCheck);
   });
 
   // 비밀번호 유효성 검사
   pwdCheck = function(event)
   {
    if($(this).val()!="" ){
     $("#checkPwd").val("N");
     document.getElementById("user_pswd").fontcolor("red");
     var msg;
     
     // 입력값이 8자 이하인 경우
     if ( $(this).val().length < 8 )
     {
    	 $("#checkPwd").
      msg = "비밀번호는 8자 이상 12자여야 합니다..";
     }
     // 입력값에 0~9를 제외한 문자가 포함되지 않은 경우, 즉 숫자만 입력된 경우
     else if ( $(this).val().match(/[^0-9]/g) == null )
     {
      msg = "비밀번호는 문자를 포함하여야 합니다.";
     }
     // 입력값에 0~9에 해당하는 문자가 포함되지 않은 경우, 즉 문자만 입력된 경우
     else if ( $(this).val().match(/[0-9]/g) == null )
     {
      msg = "비밀번호는 숫자를 포함하여야 합니다.";
     }
     else
     {
      msg = "사용 가능한 비밀번호 입니다.";
      document.getElementById("user_pswd").fontcolor("black");
      $("#checkPwd").val("Y");
     }
     
     // 동일한 문자가 4회 이상 반복되는 경우
     var val = $(this).val();
     var ch = '';
     var cnt = 0;
     for ( var i = 0 ; i < val.length ; i++ )
     {
      if ( ch == val.charAt(i) )
      {
       cnt++;
       
       if ( cnt > 3 )
       {
        msg = "동일한 문자가 4번이상 반복되었습니다.";
        $("#checkPwd").val("N");
        break;
       }
      }
      else
      {
       ch = val.charAt(i);
       cnt = 1;
      }
     }     
     
     $("#pwdMsg").html(msg);
     
     $(this).focus();
    }
   };
  });