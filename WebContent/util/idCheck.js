
$("#submitCheck").val("1");


$(document).ready(function(){
	$("#idCheckButton").click(function(){//[ID중복확인]버튼 클릭
	
		if($("#idSize").val()){
		var query = {id:$("#idSize").val()};
		
	    $.ajax({
	    	type:"post",
	    	url:"/seunghwang.bms/findSameIdAction.login",
	    	data:query,
	    	success:function(data){
	    		 var str1 = '<p id="ck">';
		    	 var loc = data.indexOf(str1);
		        var len = str1.length;
		    	var check = data.substr(loc+len,1);
	    		if(check == "1"){//사용할 수 없는 아이디
	    			$("#submitCheck").val("2");
	    			alert("사용 할 수 있는 아이디입니다.");
	    			$("#idSize").attr("readonly",true); //활성화
	    	     }else//사용할 수 있는 아이디
	    	  	    alert("사용할 수 없는 아이디");
	    		$("#id").val("");
	    	}
	    });
	  }else{//아이디를 입력하지 않고 [ID중복확인]버튼을 클릭한 경우
		  alert("사용할 아이디를 입력");
		  $("#id").focus();
	  }
	});
	
	$("#registButton").click(function(event){//[가입하기]버튼 클릭
		var passWord1 = document.getElementById("user_pswd");
		var passWord2 = document.getElementById("user_pswd2");
		if(passWord1.value!=passWord2.value){
			alert("비밀번호 확인이 다릅니다.");
			$("#user_pswd").val("");
			$("#user_pswd").focus();
			event.preventDefault();
			return;
		}
		var passWord2 = document.getElementById("submitCheck");
		if(document.getElementById("submitCheck").value=="1"){
			alert("아이디 체크를 해주세요");
			event.preventDefault();
			return;
		}
		if(document.getElementById("checkPwd").value=="N"){
			alert("비밀번호를 확인해주세요");
			event.preventDefault();
			return;
		}
		
		
	});
	
	
	  $('.emailSelect').change(function(){
		   $(".emailSelect option:selected").each(function () {
		        
		        if($(this).val()== '1'){ //직접입력일 경우
		             $("#userEmail2").val('');//값 초기화
		             $("#userEmail2").attr("readonly",false); //활성화
		        }else{ //직접입력이 아닐경우
		             $("#userEmail2").val($(this).text());      //선택값 입력
		             $("#userEmail2").attr("readonly",true); //비활성화
		        }
		   });
		});


 });