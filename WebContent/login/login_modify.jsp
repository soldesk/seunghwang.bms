<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="seunghwang.bms.login.domain.User"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // íììì ê²ìê²°ê³¼ í­ëª©ì í´ë¦­íìë ì¤íí  ì½ëë¥¼ ìì±íë ë¶ë¶.

                // ê° ì£¼ìì ë¸ì¶ ê·ì¹ì ë°ë¼ ì£¼ìë¥¼ ì¡°í©íë¤.
                // ë´ë ¤ì¤ë ë³ìê° ê°ì´ ìë ê²½ì°ì ê³µë°±('')ê°ì ê°ì§ë¯ë¡, ì´ë¥¼ ì°¸ê³ íì¬ ë¶ê¸° íë¤.
                var fullAddr = ''; // ìµì¢ ì£¼ì ë³ì
                var extraAddr = ''; // ì¡°í©í ì£¼ì ë³ì

                // ì¬ì©ìê° ì íí ì£¼ì íìì ë°ë¼ í´ë¹ ì£¼ì ê°ì ê°ì ¸ì¨ë¤.
                if (data.userSelectedType === 'R') { // ì¬ì©ìê° ëë¡ëª ì£¼ìë¥¼ ì ííì ê²½ì°
                    fullAddr = data.roadAddress;

                } else { // ì¬ì©ìê° ì§ë² ì£¼ìë¥¼ ì ííì ê²½ì°(J)
                    fullAddr = data.jibunAddress;
                }

                // ì¬ì©ìê° ì íí ì£¼ìê° ëë¡ëª íìì¼ë ì¡°í©íë¤.
                if(data.userSelectedType === 'R'){
                    //ë²ì ëëªì´ ìì ê²½ì° ì¶ê°íë¤.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // ê±´ë¬¼ëªì´ ìì ê²½ì° ì¶ê°íë¤.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ì¡°í©íì£¼ìì ì ë¬´ì ë°ë¼ ììª½ì ê´í¸ë¥¼ ì¶ê°íì¬ ìµì¢ ì£¼ìë¥¼ ë§ë ë¤.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // ì°í¸ë²í¸ì ì£¼ì ì ë³´ë¥¼ í´ë¹ íëì ë£ëë¤.
                document.getElementById('sample6_postcode').value = data.zonecode; //5ìë¦¬ ìì°í¸ë²í¸ ì¬ì©
                document.getElementById('sample6_address').value = fullAddr;

                // ì»¤ìë¥¼ ìì¸ì£¼ì íëë¡ ì´ëíë¤.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>/*hotpink*/
  	.container-fluid{width: 1580px;	max-width: none !important;	background-color: hotpink;}
  	.table {max-width: none !important; max-height: none !important;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
    body {position: relative;}
    #freeBoard_title{margin-left: 350px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3));	width: 150px; height: 30px; padding-left: 40px; padding-top: 5px;
	color: white;
	background-color: hotpink;
	border-top-left-radius: 1em; /*ì¼ìª½ ìë¨ ì½ëë¥¼ ë¶ëë½ê² */
	border-bottom-left-radius: 1em; /*ì¼ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-top-right-radius: 1em; /*ì¤ë¥¸ì¡± ìë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-bottom-right-radius: 1em; /*ì¤ë¥¸ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	font-size: 18px;
	font-weight: bold;
	}
    #userInfoSection {height: 600px;color: black; background-color: white;}
	#user_info_body{border: 1px solid #eee; margin-left: 350px; margin-top: 25px; width: 600px; padding: 50px; padding-left: 30px; border-top: 2px solid #eee; border-bottom: 2px solid #eee;}
	.button-address{margin-left: 10px;}
	.user-modify{margin-left: 290px; margin-top: 20px; width: 150px;}
	#input-addressPos{margin-left: 10px;}
	#addr_size{width: 300px;}
.form-group input[type=text]{
	border-top-left-radius: .5em; /*ì¼ìª½ ìë¨ ì½ëë¥¼ ë¶ëë½ê² */
	border-bottom-left-radius: .5em; /*ì¼ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-top-right-radius: .5em; /*ì¤ë¥¸ì¡± ìë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-bottom-right-radius: .5em; /*ì¤ë¥¸ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
.left_subCategory{float: left;}
.left_subCategory_list{height: 790px; width: 250px; margin-top: 10px; margin-left: 20px;}
.panel-default{border-color: #fff;}
.panel-default>.panel-heading {
    background-color: hotpink;
    color: white;
    filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
    border-top-left-radius: .5em; /*ì¼ìª½ ìë¨ ì½ëë¥¼ ë¶ëë½ê² */
	border-bottom-left-radius: .5em; /*ì¼ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-top-right-radius: .5em; /*ì¤ë¥¸ì¡± ìë¨ ì½ëë¥¼ ë¶ëë½ê²*/
	border-bottom-right-radius: .5em; /*ì¤ë¥¸ìª½ íë¨ ì½ëë¥¼ ë¶ëë½ê²*/
}
.category_accordion_button{background-color: hotpink; border-color: hotpink; font-size: 16px; font-weight: bold;}
a.list-group-item:focus, a.list-group-item:hover, button.list-group-item:focus, button.list-group-item:hover {
    color: white;
    text-decoration: none;
    background-color: hotpink;
    font-size: 16px;
    font-weight: bold;
} 
a.item-green-hover:hover, a.item-green-hover:focus{ background-color: #EAEAEA;}
  </style>
</head>
<body>
<div id="userInfoSection" class="container-fluid">
	<h3 id="freeBoard_title">내 정보</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c1">내 정보수정</a>
        </h4>
      </div>
      <div id="c1" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="login_info.jsp" class="list-group-item item-green-hover">내 정보</a>
        	<a href="login_password.jsp" class="list-group-item item-green-hover">비밀번호 변경</a>
        	<a href="login_drop.jsp" class="list-group-item item-green-hover">회원탈퇴</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c2">주문</a>
        </h4>
      </div>
      <div id="c2" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="/seunghwang.bms/order/orderHistory.do" class="list-group-item item-green-hover">주문목록</a>
        	<a href="/seunghwang.bms//order/listCart.ct" class="list-group-item item-green-hover">장바구니</a>
        </div>
      </div>
    </div>
  </div>
		</div>
	</div>
	
	<c:set var="user" value="${sessionScope.authUser}" />
	
	<form action="loginUserModifyAction.login" method="post">
		<div id="user_info_body">
		<table class="table table-hover">
			<tbody>
				<tr>
					<td><strong>이름</strong></td>
					<td>${user.getUserName() }</td>
				</tr>
				<tr>
					<td><strong>ID</strong></td>
					<td>${user.getUserId() }</td>
				</tr>
				<tr>
					<td><strong>이메일</strong></td>
					<td><input type="text" name="userEmail" placeholder="이메일" required/></td>
				</tr>
				<tr>
					<td rowspan="2"><strong>우편번호</strong></td>
					<td><input type="text" id="sample6_postcode" name="userPost" placeholder="우편번호"/> <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색" required/></td>

				</tr>
				<tr>
						<td> <input type="text" id="sample6_address" name="userAddress1" placeholder="주소" required> </td>
					  <td> 	<input type="text" id="sample6_address2"  name="userAddress2" placeholder="상세주소" required> </td> 

				</tr>
				<tr>
					<td><strong>광고 수신여부</strong></td>
					<td><label>수신 <input type="radio" name="agree"/></label><label id="input-addressPos">수신거부 <input type="radio" name="agree" /></label></td>
				</tr>
			</tbody>
		</table>
		</div>
		<input type="submit" class="btn btn-default user-modify" value="수정" >
		</form>
</div>
</body>
</html>
<!-- onclick="location.href='user_modify.jsp'" -->