<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="seunghwang.bms.admin.domain.Admin" %>
<%@ page import= "seunghwang.bms.login.domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script>
	 function reLoad(){
	 	window.location.reload(true);
	}
	 
	 function checkPassword(){
		 
	 }
</script> -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="icon" href="img/logo2.png">
<title>BOOKING</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>/*hotpink*/
  	  	/*부트스트랩 유동성 비활성화*/
	.container-fluid{width: 1580px; max-width: none !important; max-height: none !important; background-color: hotpink;}
    body {position: relative; height: 100%;}
    /*고정바*/
    #top_menu {padding-top:50px;height:10%;color: #fff; background-color: #fff;}
    #category_sub{background-color: #F6F6F6; border-top: 1px solid #D5D5D5; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
    #category_sub a{color: #747474; font-size: 15px;}
    #iframeSection {height: 1500px; color: hotpink; background-color: white;}
    #logo {margin-left: 230px; font-weight:bold; color:#fff; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 26px; margin-top:-15px;}
    #logo:hover{color:#9d9d9d; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
    #id {font-weight:bold; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 22px; color: white; margin-left: 400px;}
    #id:hover{text-decoration: underline; cursor: pointer;}
    #search{margin-left: 6px; margin-top: 8px;height:35px; border:1px solid white;padding:10px; width:250px; border-top-left-radius: .5em; border-bottom-left-radius: .5em;
    border-top-right-radius: .5em; border-bottom-right-radius: .5em;}
    a {color:white; font-size: 15px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
    a:hover{text-decoration: none;}
    #allList{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); padding-top: 12px;}
    #search_button{margin-top: 8px; margin-left: 6px;}
    #search_button a{font-size: 15px; color: #747474;}
    #search_button a:focus{text-decoration: none;}
    .selectSearch{margin-top: 8px; height: 35px;}	
      /*카테고리*/
	#category{margin-left:220px;width:80%; border:2px solid white; background-color:#fff; margin-top: 10px;}
	.hiddenList a{color: hotpink;}
	.hiddenList a:hover{color: #62CEDB;}
	#navbar{border:0px solid;}
	.nav-tabs>li>a {margin-right: 0px;}
	.navbar-inverse .navbar-toggle:focus, .navbar-inverse .navbar-toggle:hover {background-color: hotpink;border:1px solid white;}
	.navbar-inverse .navbar-toggle {border-color: hotpink;}
	.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {border-color: hotpink;}
	.navbar-inverse{background-color: hotpink;}
	.navbar-fixed-bottom .navbar-collapse, .navbar-fixed-top .navbar-collapse {max-height: none !important;}
	.navbar {min-height: none !important;}
	.modal-dialog{color: hotpink;}
	#faq{margin-left: 165px;}
	/*로그인*/
	#idSize{width: 300px; height:30px;}
	#usr{width: 550px; height:40px;}
	#pwd{width: 550px; height:40px; margin-top: -12px;}
	#logon{font-weight:normal;}
	.loginButt{width: 550px; height:60px;}
	.loginGroup{border-top:1px solid #e5e5e5;padding-top:15px;}
	.requireFont{color: hotpink; font-size: 14px;}
	.logMenu{background-color:white; float:right; margin-top:-50px;}
	#idFind{margin-left: 260px; font-size: 14px; color: hotpink;}
	#pwFind{font-size: 14px; color: hotpink;}
	#joiner textarea{width:550px; height: 150px; color:black; resize:none;}
	.joinButt{width: 350px; height:30px;margin-right:120px; background-color: transparent; color: hotpink;}
	#novelCategory a{font-size:14px;}
	#novelCategory>li>a {padding: 7px 9px;}
	#humanismCategory a{font-size:14px; }
	#socialCategory a{font-size:14px; }
	.categoryList{background-color: white;}
	.category_sub_right{margin-top: -50px; margin-left: 1150px;}
	#mypage{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-weight: bold; color:white; font-size: 21px;}
	/*바닥글*/
	#footer{border-top: 1px solid  #e5e5e5; margin-top: 230px;height: 130px; padding-left: 680px; padding-top: 20px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-weight: bold; background: white;}
	#footer0{width: 170px; max-width: none !important; }
	#footer1{width: 100px;margin-left: 45px; max-width: none !important; }
	#footer2{width: 100px; margin-left: 45px; max-width: none !important;}
	.category_sub_list{margin-left: 240px; width: 700px;}
	.btn-danger {color: #fff; background-color: hotpink; border-color: hotpink;}
	.btn-danger:hover {color: #FFB2F5; background-color: hotpink; border-color: hotpink;}
	.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 34px;
	color: black;
}
	.form-group {color: black;}
	/*프레임*/
	iframe{width: 1585px; margin-left: -20px; border: 0px solid black; height: 120%;}
	.right_main_category{float: right; margin-right: 80px; margin-top: -47px;}
	/*전체분야 목록 디자인*/
	.panel-default>.panel-heading {
    color: #333;
    background-color: #fff;
    border-color: #ddd;
}
.ease{
	width: 130px;
	height: 30px;
	padding: 5px;
	color: hotpink;
	background-color: #fff;
	border-radius: 5px;
	text-align:center;
	font-weight: bold;
	z-index: 99;
	font-size: 20px;
	position: absolute;
	transition: 0.1s ease;
}
#allCategory{
	filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
	font-size: 15px;
	font-weight: normal;
	margin-top: 5px;
}
.ease1 {margin-left: 60px; margin-top: 30px; padding-top: 20px;}
.ease1 a{width: 120px;}
.ease2 {margin-left: 205px; margin-top: -260px;}
.ease2 a{width: 120px;}
.ease3 {margin-left: 350px; margin-top: -301px;}
.ease3 a{width: 120px;}
.ease4 {margin-left: 500px; margin-top: -217px;}
.ease4 a{width: 120px;}
.ease5 {margin-left: 650px; margin-top: -260px;}
.ease5 a{width: 120px;}
.ease6 {margin-left: 800px; margin-top: -260px;}
.ease6 a{width: 120px;}
.ease7 {margin-left: 945px; margin-top: -303px;}
.ease7 a{width: 130px;}
#ex:hover .ease{
	height: 395px;
	width: 1130px;
	z-index: 99;
	border: 1px solid hotpink;
	background: hotpink;
	color: white;
	position: absolute;
}
.ease:hover div{
	visibility: visible;
}
.ease div{
	visibility: hidden;
	position: relative;
}
.ease p{
	font-size: 15px;
	filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
	font-weight: normal;
	margin-top: 4px;
}
#item-main {background-color: hotpink; color: white;}
.item-hover{font-size: 16px;}
#left-subcategory-margin-left{margin-left: 130px;}
.all-ease{background-color: white; width: 0px; height: 0px; margin-left: -7px; transition: 0.1s ease; margin-top: 80px;}
.all-ease a{color: hotpink;}
#ease:hover .all-ease{width:1110px; height: 347px; margin-top: -20px; margin-left: 3px;}
#circle{margin-top: -55px; margin-left: -60px; position: absolute; z-index: -1; width: 2000px;}
#circle div{
	display: inline-block;
	width: 35px; 
	height: 70px;
	background-color: hotpink;
	border-radius: 50px;
}
#userWelcome{
	margin-left: 200px;
}
#userWelcome a{
	color: white;
	font-weight: bold;
}
#userWelcome a:hover{
	text-decoration: underline;
}
.navbar-inverse
.navbar-brand{
	color: #fff;
	font-weight: bold;
	font-size: 21px;
}
#readAdmin{
	font-size: 17.5px;
	margin-top: 2px;
}
#userEmail{width: 150px; float:left; margin-top: 10px;}
#userEmail2{width: 150px; margin-top: -34px; margin-left: 180px;}
#userAt{margin-top: 15px; margin-left: 155px;}
#selectHeight{margin-left: 350px; height:30px; margin-top: -30px;}
#birthYear{margin-top: 10px;}
  </style>
</head>
<body data-spy="scroll" data-target=".navbar">	
<nav class="navbar navbar-inverse navbar-fixed-top" id="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
   </button>
        <a class="navbar-brand" href="index.jsp" id="logo"><img src="/seunghwang.bms/img/logo1.png"/></a>
    </div>
	<div>
	 <div class="collapse navbar-collapse" id="myNavbar">
    	<form action="book/searchBookList.jsp" method="post" target="content">
    	<ul class="nav navbar-nav">
    		<li>
    			<select class="selectSearch" name="searchType">
					<option value="total">전체</option>
					<option value="bookName">책이름</option>
					<option value="bookPublisher">출판사</option>
					<option value="bookWriter">작가</option>
					<option value="publicationDate">출판일 기준</option>
				</select>
			</li>
 	   		<li><input type="text" name="searchBook" id="search" placeholder="검색"/></li>
 	   		<li><input type="submit" class="btn btn-default" id="search_button" value="검색"/>
		</ul>
		</form>
	 	<% 
			HttpSession sess = request.getSession(false);
	 		if (sess == null || sess.getAttribute("authUser") == null){ %>
	 		<ul class="nav navbar-nav">
				<li><a class="navbar-brand" id="id" data-toggle="modal" data-target="#login">로그인</a></li>
			</ul>
	 	
	 	<% } else if(sess.getAttribute("authUser").getClass().getSimpleName().equals("Admin")){ %>
	 		<ul class="nav navbar-nav" id="userWelcome">
	 		<li class="navbar-brand" id="readAdmin">관리자님</li> 
	 			<li><a class="navbar-brand" id="mypage" href="admin/userManage.jsp" target="content">관리페이지</a></li>
	 			<li><a class="navbar-brand" onclick="reLoad()" href="/seunghwang.bms/signOut.login">로그아웃</a></li> 
	 		</ul>
	 	<%} else if(sess.getAttribute("authUser")!=null) { 	 		
	 	%>
			<ul class="nav navbar-nav" id="userWelcome">
				<li class="navbar-brand">
					<% User user = (User)sess.getAttribute("authUser"); %>
					<%= user.getUserName()%>님
					</li> 
				<li> <a class="navbar-brand" id="mypage" href="/seunghwang.bms/login/login_info.jsp" target="content">MyPage</a> </li>
				<li><a class="navbar-brand" onclick="reLoad()" href="/seunghwang.bms/signOut.login">로그아웃</a></li>
			</ul>
		<% } %>
	<%@ include file="login/alert.jsp" %>
	</div>
    </div>
    <div id="circle">
		<div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div>
		<div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div>
	</div>
  </div>
</nav>
<div id="top_menu" class="container-fluid">
<div class="container-fluid" id="category">
		<ul class="nav nav-pills">
		<li><div id="ex">
		<div class="ease" id="ease"><p><span class="glyphicon glyphicon-align-justify"></span> 전체분야</p>
		<div class="all-ease">
			<div class="ease1">
			<a class="list-group-item item-hover disabled" id="item-main">소설</a>
        	<a href="book/middleCategory.jsp?categoryId=NK" class="list-group-item item-hover" target="content">한국소설</a>
        	<a href="book/middleCategory.jsp?categoryId=NA" class="list-group-item item-hover" target="content">영미소설</a>
        	<a href="book/middleCategory.jsp?categoryId=NJ" class="list-group-item item-hover" target="content">일본소설</a>
        	<a href="book/middleCategory.jsp?categoryId=NF" class="list-group-item item-hover" target="content">프랑스소설</a>
        	<a href="book/middleCategory.jsp?categoryId=NC" class="list-group-item item-hover" target="content">중국소설</a>
		</div>
		<div class="ease2">
			<a class="list-group-item item-hover disabled" id="item-main">경제/경영</a>
        	<a href="book/middleCategory.jsp?categoryId=MG" class="list-group-item item-hover" target="content">경영일반</a>
        	<a href="book/middleCategory.jsp?categoryId=MT" class="list-group-item item-hover" target="content">경영이론</a>
        	<a href="book/middleCategory.jsp?categoryId=BM" class="list-group-item item-hover" target="content">경영관리</a>
        	<a href="book/middleCategory.jsp?categoryId=EG" class="list-group-item item-hover" target="content">경제일반</a>
        	<a href="book/middleCategory.jsp?categoryId=ET" class="list-group-item item-hover" target="content">경제이론</a>
        	<a href="book/middleCategory.jsp?categoryId=CE" class="list-group-item item-hover" target="content">기업경제</a>
		</div>
		<div class="ease3">
			<a class="list-group-item item-hover disabled" id="item-main">인문</a>
        	<a href="book/middleCategory.jsp?categoryId=HP" class="list-group-item item-hover" target="content">심리학</a>
        	<a href="book/middleCategory.jsp?categoryId=HPD" class="list-group-item item-hover" target="content">교육학</a>
        	<a href="book/middleCategory.jsp?categoryId=HPS" class="list-group-item item-hover" target="content">철학</a>
        	<a href="book/middleCategory.jsp?categoryId=HG" class="list-group-item item-hover" target="content">인문학일반</a>
		</div>
		<div class="ease4">
			<a class="list-group-item item-hover disabled" id="item-main">역사/문화</a>
        	<a href="book/middleCategory.jsp?categoryId=HSG" class="list-group-item item-hover" target="content">역사일반</a>
        	<a href="book/middleCategory.jsp?categoryId=HWH" class="list-group-item item-hover" target="content">세계사</a>
        	<a href="book/middleCategory.jsp?categoryId=HOH" class="list-group-item item-hover" target="content">동양사</a>
        	<a href="book/middleCategory.jsp?categoryId=HKH" class="list-group-item item-hover" target="content">한국사</a>
        	<a href="book/middleCategory.jsp?categoryId=HM" class="list-group-item item-hover" target="content">신화</a>
		</div>
		<div class="ease5">
			<a class="list-group-item item-hover disabled" id="item-main">정치/사회</a>
        	<a href="book/middleCategory.jsp?categoryId=PP" class="list-group-item item-hover" target="content">정치/외교</a>
        	<a href="book/middleCategory.jsp?categoryId=PA" class="list-group-item item-hover" target="content">행정/정책</a>
        	<a href="book/middleCategory.jsp?categoryId=PD" class="list-group-item item-hover" target="content">국방/군사</a>
        	<a href="book/middleCategory.jsp?categoryId=PL" class="list-group-item item-hover" target="content">법학</a>
        	<a href="book/middleCategory.jsp?categoryId=PS" class="list-group-item item-hover" target="content">사회학</a>
		</div>
		<div class="ease6">
			<a class="list-group-item item-hover disabled" id="item-main">과학</a>
        	<a href="book/middleCategory.jsp?categoryId=ST" class="list-group-item item-hover" target="content">과학이론</a>
        	<a href="book/middleCategory.jsp?categoryId=SR" class="list-group-item item-hover" target="content">교양과학</a>
        	<a href="book/middleCategory.jsp?categoryId=SP" class="list-group-item item-hover" target="content">물리학</a>
        	<a href="book/middleCategory.jsp?categoryId=SC" class="list-group-item item-hover" target="content">화학</a>
        	<a href="book/middleCategory.jsp?categoryId=SB" class="list-group-item item-hover" target="content">생물학</a>
        	<a href="book/middleCategory.jsp?categoryId=SE" class="list-group-item item-hover" target="content">지구과학</a>
		</div>
		<div class="ease7">
			<a class="list-group-item item-hover disabled" id="item-main">컴퓨터/IT</a>
        	<a href="book/middleCategory.jsp?categoryId=CC" class="list-group-item item-hover" target="content">컴퓨터공학</a>
        	<a href="book/middleCategory.jsp?categoryId=CO" class="list-group-item item-hover" target="content">OS</a>
        	<a href="book/middleCategory.jsp?categoryId=CN" class="list-group-item item-hover" target="content">네트워크</a>
        	<a href="book/middleCategory.jsp?categoryId=CD" class="list-group-item item-hover" target="content">데이터베이스</a>
        	<a href="book/middleCategory.jsp?categoryId=CS" class="list-group-item item-hover" target="content">보안</a>
        	<a href="book/middleCategory.jsp?categoryId=CW" class="list-group-item item-hover" target="content">웹프로그래밍</a>
		</div>
			</div>
		</div>
	</div></li>
			<li class="hiddenList" id="left-subcategory-margin-left">
				<a href="book/largeCategory.jsp?largeCategory=소설" target="content">
					<span class="glyphicon glyphicon-leaf"></span> 소설
				</a>
			</li>
			<li class="hiddenList">
				<a href="book/largeCategory.jsp?largeCategory=경제/경영" target="content">
					<span class="glyphicon glyphicon-usd"></span> 경제/경영
				</a>
			</li>
			<li class="hiddenList">
				<a href="book/largeCategory.jsp?largeCategory=인문" target="content">
					<span class="glyphicon glyphicon-user"></span> 인문
				</a>
			</li>
			<li class="hiddenList">
				<a href="book/largeCategory.jsp?largeCategory=역사/문화" target="content">
					<span class="glyphicon glyphicon-header"></span> 역사/문화
				</a>
			</li>
			<li class="hiddenList">
				<a href="book/largeCategory.jsp?largeCategory=정치/사회" target="content">
					<span class="glyphicon glyphicon-comment"></span> 정치/사회
				</a>
			</li>
			<li class="hiddenList">
				<a href="book/largeCategory.jsp?largeCategory=과학" target="content">
					<span class="glyphicon glyphicon-magnet"></span> 과학
				</a>
			</li>
			<li class="hiddenList">
				<a href="book/largeCategory.jsp?largeCategory=컴퓨터/IT" target="content">
					<span class="glyphicon glyphicon-phone"></span> 컴퓨터/IT
				</a>
			</li>
			<li class="hiddenList" id="faq"><a href="customerService/faq/faqList.jsp" target="content"><span class="glyphicon glyphicon-phone-alt"></span> 고객센터</a></li>
		</ul>
	</div>
	<div class="container-fluid logMenu">
	
	<div class="modal fade" id="login">

    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">로그인</h4>
        </div>
  
        <div class="modal-body">
         <form action="/seunghwang.bms/signin.login" method="post">
    		<div class="form-group">
      			<input type="text" class="form-control" name="id" required  placeholder="아이디" tabindex=1>
    		</div>
    		<div class="form-group">
      			<input type="password" class="form-control" name="pw"  placeholder="비밀번호" tabindex=2 required>
    		</div>
    		<div class="form-group">
      			 <label id="logon"><input type="checkbox" name="logon" value="로그인상태유지">로그인 상태유지</label>
      			 <a href="/seunghwang.bms/login/id_find.html" id="idFind">아이디찾기</a>
      			 <a href="/seunghwang.bms/login/pw_find.jsp" id="pwFind">비밀번호찾기</a>
    		</div>
			<div class="btn-group btn-group-lg loginGroup">
				<button type="submit" class="btn btn-danger loginButt" tabindex=3>Login</button>
			</div>
		</form>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-default joinButt" data-toggle="modal" data-target="#joiner" data-dismiss="modal">
		        아직 HAWNG 회원이 아니세요? 회원가입 <span class="glyphicon glyphicon-hand-right"></span>
        </button>
        </div>
      </div>      
    </div>
  </div>
  	<div class="modal fade" id="joiner">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">이용약관</h4>
        </div>
        <div class="modal-body">
        <form>
    		<div class="form-group">
    			<textarea readonly>
    			 이용약관 v2.7 
제1장 총 칙
제1조 [목 적]
본 약관은 리디 주식회사(이하 “회사”라 합니다)가 운영하는 리디북스(www.ridibooks.com), 페이퍼샵(paper.ridibooks.com)을 통하여 제공하는 상품 및 디지털콘텐츠 서비스(이하 “서비스”라 합니다)의 이용과 관련하여 이용자의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
제2조 [정 의]
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
“리디북스”란 회사가 디지털콘텐츠를 이용자에게 제공하기 위하여 운영하는, 정보통신설비(인터넷, 전화 등)를 이용하여 디지털콘텐츠를 거래할 수 있도록 설정한 가상의 전자상거래 웹사이트를 말합니다.
“페이퍼샵” 이란 회사가 디지털 기기, 콘텐츠, 휴대전화 개통 서비스 등을 이용자에게 제공하기 위하여 운영하는, 정보통신설비(인터넷, 전화 등)를 이용하여 디지털콘텐츠를 거래할 수 있도록 설정한 가상의 전자상거래 웹사이트를 말합니다.
“이용자”란 회사의 웹사이트에 접속하여 본 약관에 따라 회사가 제공하는 콘텐츠 및 제반 서비스를 이용하는 회원 및 비회원을 말합니다.
“회원”이란 본 약관에 동의하고 개인정보를 제공하여 회원 등록을 한 자로서, 회사가 제공하는 정보와 서비스를 지속적으로 이용할 수 있는 자를 말합니다.
“비회원”이란 회원에 가입하지 않고 회사가 제공하는 정보와 서비스를 이용하는 자를 말합니다.
“콘텐츠”라 함은 회사가 제공하는 전자책, 수강권, 이용권 등 디지털 콘텐츠 및 기타 관련 정보를 의미하며, 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호, 문자, 음성, 음향, 이미지, 영상 등으로 표현된 자료 또는 정보를 말합니다.
"전자책 선물 서비스"라 함은 회사가 운영하는 리디북스 서점(www.ridibooks.com) 또는 제휴하는 유선인터넷 또는 무선인터넷을 통해 리디북스 전자책 또는 리디캐시 상품을 선물할 수 있는 서비스를 말합니다.
"수신자"라 함은 전자책 선물 서비스를 회원으로부터 전송 받은 자를 말합니다.
전항 각호에 해당하는 정의 이외의, 기타 용어의 정의에 대하여는 거래 관행 및 관계 법령에 따릅니다.
제3조 [약관의 명시 및 개정]
회사는 이용자가 별도의 연결화면을 통하여 본 약관의 내용과 상호, 영업소 소재지, 대표자 성명, 사업자 등록번호, 연락처 등을 확인할 수 있도록 리디북스 웹사이트에 게시합니다.
회사는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률 등 관계 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여, 개정 전 약관과 함께 적용일자 7일 전부터 웹사이트에서 확인할 수 있도록 게시하며, 기존 회원에게는 본 약관 제5조의 방법을 통하여 약관 개정사실을 통지합니다. 다만, 회원의 권리 또는 의무에 관한 중요한 규정의 변경은 최소한 30일전에 공지하고 개정약관을 회원이 등록한 이메일로 발송하여 통지합니다.
본 약관에서 명시하지 않은 사항과 본 약관의 해석에 관하여는 정부가 제정한 소비자보호지침, 전자거래소비자보호지침 및 관계법령, 또는 상관례에 따릅니다.
제4조 [약관의 효력]
본 약관은 이용자가 회원가입 시 약관의 내용에 동의하고, 회사가 그 회원가입 신청에 대하여 승낙함으로써 효력이 발생합니다.
회사는 기존 회원이 본 약관 제5조에 따른 공지 또는 통지에도 불구하고, 동 기간 내에 이의를 제기하지 않는 경우에는 변경된 약관을 승인한 것으로 봅니다.
제5조 [회원에 대한 통지]
회사는 회원에게 알려야 할 사항이 발생하는 경우, 회원가입 시 회원이 공개한 전자우편주소, 팝업, 알림센터(웹/애플리케이션), 푸시알림, 전화, 유무선 등의 방법으로 통지할 수 있습니다.
회사는 회원 전체에 대한 통지의 경우 10일 이상 회사 웹사이트 게시판에 게시함으로써 전항의 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 전항과 동일한 방법으로 별도 통지할 수 있습니다.
제6조 [서비스의 변경 및 중단]
회사는 재화의 품절 또는 기술적 사양의 변경 등의 불가피한 경우에는 장차 체결되는 계약에 의해 제공할 재화와 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화, 용역의 내용 및 제공일자를 명시하여 현재의 재화, 용역의 내용을 게시한 곳에 즉시 공지합니다.
회사는 제1항의 사유로 서비스 내용이 변경되는 경우, 이로 인하여 이용자가 입은 손해에 대하여는 배상하지 아니합니다.
회사는 정보통신 설비의 보수점검 교체 및 고장, 통신의 두절, 천재지변 등의 불가항력적 사유가 발생한 경우에는 서비스 제공을 일시 중단할 수 있습니다.
제3항의 사유로 서비스가 일시적으로 중단되는 경우 회사는 제5조에 정한 방법으로 이용자에게 통지합니다.
회사와 계약한 출판사와의 계약 종료 및 변경 등의 사유로 서비스의 내용이 변경되거나, 서비스가 중단될 수 있습니다.
제5항의 사유로 서비스가 일시적으로 중단되는 경우 회사는 제5조에 정한 방법으로 이용자에게 통지합니다.
회사의 귀책사유로 인하여 회원이 자유이용권(정액제) 서비스 이용기간 동안 서비스를 제공받을 수 없게 되는 경우, 회사는 회원이 그 기간만큼 이용할 수 있는 동일, 유사한 컨텐츠를 다시 제공합니다.
사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 회사는 제5조에 정한 방법으로 이용자에게 통지하고 당초 회사에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, 회사가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 않습니다.
제7조 [회사의 의무]
회사는 법령과 본 약관에 반하는 행위를 하지 않으며, 본 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하는 데 최선을 다합니다.
회사는 이용자가 안전하게 서비스를 이용할 수 있도록 회사의 [개인정보보호정책]을 마련, 준수하고 이용자의 개인정보보호를 위한 보안 시스템을 갖추어 이용자의 개인정보보호에 최선을 다합니다.
제2장 회원
제8조 [회원가입]
회원으로 회사 서비스의 이용을 희망하는 자는 약관의 내용에 동의함을 표시하고, 회사가 제시하는 회원가입 양식에 관련 사항을 기재하여 회원가입을 신청하여야 합니다.
허위 정보를 기재한 회원은 법적인 보호를 받을 수 없으며, 본 약관의 관련 규정에 따라 서비스 사용에 제한을 받을 수 있습니다.
회사는 다음 각 호에 해당되지 않는 한 회원 등록을 승인합니다.
이용자의 귀책사유로 인하여 승인이 불가능한 경우
허위로 또는 오기로 정보를 기재하거나 타인의 명의 또는 개인 정보를 도용하는 경우
상업적 또는 홍보/광고, 악의적인 목적으로 서비스의 시스템 취약점을 이용하여 가입/활동하는 경우
임시 이메일 서비스(일회용 이메일 서비스, 시스템에 의한 계정 생성 포함)를 이용하여 가입하는 경우
회사의 재정적, 기술적 문제로 서비스 제공에 문제가 있다고 판된되는 경우
본 약관 및 관계법령을 위반하는 경우
회원으로 등록하는 것이 회사의 기술상 현저히 지장이 있다고 판단되는 경우
회원은 회원 가입 시 등록한 사항에 변경이 있는 경우, 직접 서비스에서 수정하거나 이메일, 고객센터를 통하여 회사에 알려야 합니다.
회원의 이름, E-Mail 등의 정보가 변경되었을 경우에는 사전에 통지하거나 변경해야 하며 변경하지 않아서 발생하는 사고에 대한 책임은 회원 본인에게 있습니다.
제9조 [회원 탈퇴 및 자격 상실 등]
회원은 회사에 언제든지 서비스 이용을 중단하고 탈퇴를 요청할 수 있으며 회사는 즉시 회원 탈퇴를 처리합니다.
회사는 회원이 다음 각 호에 해당하는 경우 별도의 통보 절차 없이 서비스 이용을 제한하거나 회원 자격을 상실시킬 수 있습니다.
회원 가입 신청서에 기재 사항을 허위로 작성한 허위로 또는 오기로 정보를 기재하거나 타인의 명의 또는 개인 정보를 도용한 것이 확인된 경우
임시 이메일 서비스(일회용 이메일 서비스, 시스템에 의한 계정 생성 포함)를 이용하는 등 부정한 방법으로 가입한 것이 확인된 경우
상업적 또는 홍보/광고, 악의적인 목적으로 활동한 것이 확인된 경우
이벤트의 참여를 위해 여러 개의 계정을 생성하여 가입한 것이 확인된 경우
다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
회사를 이용하여 법령과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하는 경우
회사가 회원 자격을 제한 또는 정지한 후 동일한 행위를 2회 이상 반복하거나 30일 이내에 그 사유를 시정하지 아니하는 경우, 회사는 회원 자격을 상실시킬 수 있습니다.
회사가 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.
제10조 [이용자의 의무]
회원 본인의 과실로 타인이 사용하게 되어 일어날 수 있는 금전적 손실 등 각종 손해에 대한 관리 책임은 회원 본인에게 있습니다.
ID, 비밀번호는 본인이 직접 사용하여야 하며 제 3자에게 이용하게 해서는 안됩니다.
회원의 이름, E-Mail 등의 정보가 변경되었을 경우에는 사전에 통지하거나 변경해야 하며 변경하지 않아서 발생하는 사고에 대한 책임은 회원 본인에게 있습니다.
회원이 자신의 ID, 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내를 따라야 합니다.
회원은 다음 행위를 해서는 안됩니다.
회원 등록 또는 회원정보 변경 시 허위 또는 타인의 정보를 무단으로 기재
불특정 다수를 대상으로 회사의 서비스를 이용하여 영리활동을 하는 행위
회사와 제3자의 저작권을 침해하고 명예를 손상시키거나 업무를 방해하는 행위
외설, 폭력적 표현, 기타 미풍양속에 반하는 정보를 리디북스에 공개 또는 게시하는 행위
제3장 서비스 이용
제11조 [거래조건에 대한 정보의 표시]
회사는 다음 각호에 해당하는 사항을 해당 재화, 콘텐츠 또는 관련 게시물에 표시합니다.
재화, 콘텐츠의 명칭, 종류, 내용, 가격, 이용기간
콘텐츠 이용에 필요한 전자매체의 최소한의 기술사양
환불기준 등 서비스 이용계약의 해지방법 및 효과
이용약관 및 개인정보처리방침
회사는 전항 각 호의 사항을 회사 웹사이트, 본 이용약관, 개인정보보호정책 등에서 이미 고지하고 있는 경우 별도로 표시하지 않을 수 있습니다.
제12조 [주문 및 결제]
회원은 회사가 제공하는 다음 각호 또는 이와 유사한 절차에 의하여 재화, 콘텐츠 구매를 신청을 합니다.
재화, 콘텐츠의 검색, 목록 열람 및 구매 대상 선택
재화, 콘텐츠 상세정보 확인
성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력 및 결제하기 클릭
결제금액 확인, 결제수단 선택 및 결제하기 (환불규정 안내)
결제금액 재확인 및 결제
회원은 회사에서 정하고 있는 방법으로 유료서비스의 결제가 가능합니다. 단, 미성년 회원의 결제는 원칙적으로 보호자(법정대리인)의 명의 또는 동의 하에 이루어져야 하고, 보호자(법정대리인)는 본인 동의 없이 체결된 자녀(미성년자)의 계약을 취소할 수 있습니다.
제13조 [계약의 성립]
회사는 다음 각호에 해당하지 않는 한 구매 신청을 승낙합니다.
신청 내용에 허위, 누락, 오기가 있는 경우
미성년자가 청소년 보호법에서 금지하는 콘텐츠를 구매하는 경우
유료 서비스 신청금액 총액과 입금총액이 일치하지 않은 경우
구매신청에 승낙하는 것이 회사의 기술상 현저히 지장이 있다고 판단하는 경우
기타 합리적인 이유가 있는 경우로서 회사가 필요하다고 인정되는 경우
제14조 [거래 성립 통지]
회사는 회원이 본조 위 조항의 절차에 따라 유료서비스 이용을 신청할 경우, 승낙의 의사표시로써 본 약관 제5조의 방법을 통하여 회원에게 통지하고, 승낙의 통지가 회원에게 도달한 시점에 계약이 성립한 것으로 봅니다.
회사의 승낙의 의사표시에는 회원의 이용신청에 대한 확인 및 서비스제공 가능여부, 이용신청의 정정, 취소 등에 관한 정보 등을 포함합니다.
제15조 [재화의 공급]
회사는 재화의 공급시기에 관하여 이용자와 맺은 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문, 포장 등 기타의 필요한 조치를 취합니다. 이때 회사는 이용자가 재화의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
회사는 이용자가 구매한 재화에 대해 배송 수단, 수단별 배송비용 부담자, 배송기간 등을 명시합니다.
제16조 [부정이용 금지]
회사는 다음 각호에 해당하는 경우를 부정 이용행위로 봅니다.
동일한 ID로 6대를 초과하여 기기(스마트폰, 태블릿PC 등)에서 동시 접속해서 서비스를 이용하는 경우
자신의 ID 및 전차책, 이용권, 쿠폰, 리디캐시, 리디포인트 등을 타인에게 판매, 대여, 양도하는 행위 및 이를 광고하는 행위
서비스 이용 중, 복제프로그램을 실행하거나 화면을 캡쳐, 또는 녹화를 하는 경우
콘텐츠의 DRM(Digital Rights Management)을 무력화하는 일체의 행위
결재를 통한 회사와 회원 간의 정당한 계약이 성립되지 아니한 상태에서 콘텐츠를 불법으로 사용하려는 일체의 행위
타인의 개인정보, 금융정보를 불법으로 취득하거나 본인의 동의 없이 이용하여 리디캐시, 디지털콘텐츠, 상품을 구매한 일체의 행위
선물하기 이용약관에 반하는 일체의 행위
리디북스 서점에서 진행되는 이벤트의 참여 조건에 반하여 참여한 일체의 행위
회사가 제공하는 이벤트를 통해 부정한 방법으로 참여하여 캐시와 포인트를 적립하고 이용한 경우
기타 다음과 같은 행위 등을 반복하여 회사의 건전한 운영을 해하거나 회사의 서비스 운영을 고의로 방해하는 경우
회사의 운영에 관련하여 허위 사실을 적시하거나 유포하여 회사의 명예를 실추시키거나 회사의 신뢰성을 해하는 경우
회사의 운영 과정에서 폭언, 음란한 언행, 협박, 인과 관계가 입증되지 않는 피해에 대한 보상 (적립금, 현금, 상품 등) 및 요구 등으로 업무 환경을 심각히 해하는 경우
회사를 통해 구입한 재화 또는 서비스에 특별한 하자가 없음에도 불구하고, 일부 사용 후 일부 또는 전부의 반품을 지속적으로 요구하는 경우
임시 이메일 서비스(일회용 이메일 서비스, 시스템에 의한 계정 생성 포함)를 통하여 가입하여 리디북스 서비스를 이용하는 경우
회사명 또는 리디북스 임직원이나 운영진을 사칭하여 타인을 속이거나 이득을 취하는 등 피해와 혼란을 주는 경우
회사는 전항에 따른 부정 이용자가 발견 되었을 경우, 다음 각호에 따른 조치를 취할 수 있습니다.
[1차 발견 시] 회사는 전자우편, 팝업 등 제5조의 방법을 통하여 해당 위반 사실을 사전 경고합니다. 경고와 동시에 이용제한 ID로 등록되어 서비스 이용을 정지시킴과 동시에 부정이용을 통해 취득한 콘텐츠, 리디캐시, 리디포인트의 이용을 중지할 수 있습니다. 실물 상품의 경우 회수 조치 또는 배상을 요구할 수 있습니다.
[2차 발견 시] 회사는 위반 내용을 제5조의 방법을 통하여 고지하고, 필요시 법적인 대응을 할 수 있습니다. 회사는 회원에게 30일 간의 소명기간을 부여하고, 회원이 소명기간 내 정당한 사유를 제시하지 못할 경우 회원 등록을 말소시키고 구입한 콘텐츠, 상품의 사용권한을 강제 종료할 수 있습니다.
회원은 회사로부터의 본 조 제1,2항의 조치에 이의가 있는 경우, 회사 고객지원팀에 해당 사실에 대하여 소명할 수 있으며 그에 따라 이용에 관한 별도의 조치를 받을 수 있습니다.
제17조 [게시물 관리]
회사는 건전한 토론, 리뷰 문화를 위해 노력하고 있습니다.
다음에 해당하는 내용의 글이 리디북스 리뷰, 페이퍼샵 리뷰 및 질문 게시판에 게시된 경우 예고 없이 노출을 제한될 수 있습니다.
해당 상품 및 콘텐츠의 내용과 관련 없는 글
타인의 저작권을 침해하거나 불법자료 유통과 관련된 글
욕설, 비방으로 인해 불쾌감을 일으키는 글
음란성 글 (비정상적인 성적 표현을 포함한 글)
타인의 사생활을 침해하거나 개인정보를 본인의 동의 없이 게시하는 글
타인/타지역/타국가/타민족을 모욕하거나 비방하는 글
사회 소수계층이나 특정 종교 등을 비하하는 글
홍보성 글 (도박, 돈 벌기 사이트, 윤락, 경품 지급, 상품 광고, 사이트 홍보 등)
폭력, 비행, 사행심을 조장하는 글
도배 글 (같은 내용의 글 반복 게시)
악성코드 배포나 시스템 장애를 유도하는 글
서비스 운영자 및 관계자를 사칭하는 글
청소년 보호위원회 심의 규정에 부적합한 글
부적합 게시물을 게시한 회원에 대한 이용 제한
운영자에 의한 게시물 삭제 횟수가 3회 이상 누적이 되어서 이용제한 ID로 등록되는 경우, 정도에 따라서 30일, 무기한으로 글쓰기가 제한되거나 사용 중인 IP에 대한 제한이 이루어질 수 있습니다.
단, 위반 정도가 중한 경우, 누적 정도와 관계 없이 즉시 일시정지 또는 영구 이용정지될 수 있습니다.
제18조 [전자책 선물 서비스]
“선물하기 사용자 약관에 동의하며, 결제를 진행합니다." 라는 이용 신청시의 물음에 이용자가 동의하면(체크 박스에 체크) 약관에 동의하는 것으로 간주됩니다.
전자책 선물 서비스 이용 계약은 회원의 이용신청에 대해 회사가 승낙함으로써 성립합니다.
전자책 선물 서비스 전송 및 수신내역 관리
전자책 선물 서비스 전송 내역과 수신 내역은 리디북스 서점 구매 내역을 통해 그 내용을 확인할 수 있습니다.
회원의 고의 또는 과실로 전자책 선물 서비스 전송내역 또는 수신내역이 노출되어 발생하는 손해에 대해 회사는 책임을 지지 않습니다.
전자책 선물 서비스의 이용
전자책 선물 서비스는 이용자가 SMS, MMS, 이메일, 리디북스ID를 통해 전송할 수 있습니다.
수신자의 전화번호 또는 이메일 주소를 회원이 잘못 입력하여 전자책 선물 서비스가 오발송된 후 수신자에 의해 전자책 선물 서비스가 수령된 경우 회사에서는 오발송에 대해 책임지지 않습니다. 단, 전자책 선물 서비스가 수령되기 전에 이용자가 고객센터를 통해 오발송 정정 신청을 할 경우 수신자를 정정하여 발송할 수 있습니다.
사용자 부주의로 인한 계정 도용 시 피해 방지 목적, 부정이용 방지 목적으로 콘텐츠, 사이버머니(캐시,포인트)를 선물받을 수 있는 횟수가 30일간 15회 이하로 제한됩니다.
전자책 선물 서비스의 이용 제한
회사는 다음 각 호에 해당하는 경우 선물 서비스의 전부 또는 일부에 대한 교환 제한, 선물 취소, 사용자 아이디 이용 중지 등의 조치를 취할 수 있습니다.
회사가 제공하는 서비스가 아닌 불법 또는 부정한 방법, 다른 수신자로부터 재송신(재판매)된 전자책 선물 서비스를 수신 받아 수령하고자 하는 경우
30일간 15회를 초과하는 횟수로 선물을 수령한 경우
서비스 이용 약관의 부정사용에 해당하는 일체의 행위를 통해 콘텐츠, 사이버머니를 이용 또는 수신하려는 경우
회원이 타인 명의로 서비스를 이용하는 경우
서비스의 시스템을 무단으로 침범하여 서비스를 이용한 경우
천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우
서비스용 설비의 장애 및 보수, 정전, 이용량의 폭주 등 기술상 서비스 제공이 불가능한 경우
회사의 서비스 정책 또는 본 이용약관에 위반하여 서비스를 이용하거나, 본 약관에서 정한 전자책 선물 서비스의 교환 제한 사유가 발생한 경우
본 조에 따른 서비스 제한이나 중단의 경우에는 회사가 회원에게 통지합니다. 다만, 회사가 통제할 수 없는 사유로 인한 서비스의 중단(회사의 고의, 과실이 없는 서버 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다.
전자책 선물 서비스가 전산상의 문제 또는 기타 회사의 귀책사유로 인하여 수령할 수 없는 경우가 발생할 경우, 회사는 서비스가 불가능했던 기간만큼 전자책 선물 서비스의 유효 기간을 연장하거나 환불 규정에 따라 전자책 선물 서비스를 환불합니다.
회사는 전항에 따른 부정 이용자가 발견되었을 경우, 다음 각호에 따른 조치를 취할 수 있습니다.
[1차 발견 시] 회사는 해당 위반 사실을 사전 경고합니다. 경고와 동시에 부정이용을 통해 취득한 콘텐츠 및 사이버머니의 이용을 중지할 수 있습니다.
[2차 발견 시] 회사는 위반 내용을 고지하고 서비스 이용을 정지시킴과 동시에, 필요시 법적인 대응을 할 수 있습니다. 회사는 회원에게 30일 간의 소명기간을 부여하고, 회원이 소명기간 내 정당한 사유를 제시하지 못할 경우 회원등록이 말소시키고 구입한 콘텐츠의 사용권한을 강제 종료합니다.
회원은 회사로부터의 본 조 제2항의 조치에 이의가 있는 경우, 회사 고객지원팀에 해당 사실에 대하여 소명할 수 있으며, 그에 따라 이용에 관한 별도의 조치를 받을 수 있습니다.
전자책 선물 서비스를 위한 개인정보의 수집 및 이용
회사는 서비스의 원활한 제공을 위한 목적으로 회원이 서비스와 관련하여 회사에 제공하는 개인정보를 수집, 이용하며, 회원은 이에 동의합니다.
회사는 회원이 제공한 개인정보를 회원의 동의 없이 서비스 제공 이외의 목적으로 이용하지 아니합니다.
회사가 수집하는 개인정보 및 개인정보의 이용목적은 다음 각 호와 같습니다.
이동전화번호 : 서비스의 제공, 서비스 이용에 따른 본인(또는 실사용자) 식별 절차 등에 이용, 고지사항 전달, 리디북스 상품 정보 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보
이메일 주소 : 서비스의 제공, 서비스 이용에 따른 본인(또는 실사용자) 식별 절차 등에 이용, 고지사항 전달, 리디북스 상품 정보 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보
회사는 다음 각 호에 경우에는 회원의 개인정보를 제3자에게 제공할 수 있으며 회원은 이에 동의합니다.
전자책 선물 서비스 제공을 위해 이용자가 가입한 연계 서비스 제공자에게 제공하는 경우
통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
기타 법률의 규정에 따라 불가피하게 제공하는 경우
전자책 선물 서비스 주문 취소 및 환불
전자책 선물 서비스의 상품 유효기간 내에서, 전자책 선물 서비스의 수신자가 해당 전자책 선물 서비스를 수령하기 전에는 회원은 주문을 취소할 수 있습니다.
환불 신청은 회원이 해야 하며, 회사는 본인 확인 절차 후 당 회원에게 환불해 주는 것을 원칙으로 합니다. 다만, 수신자가 환불받고자 하는 경우에는 수신자가 선물 발신 회원으로부터 환불에 관한 동의서를 받아 회사에 제시할 경우 수신자에게도 환불이 가능합니다.
선물 수신자가 선물 발송일로부터 14일 이내에 선물을 수령하지 않을 경우 구매가 자동으로 취소됩니다. 단, 휴대폰 소액결제는 이월 결제취소가 불가한 이동통신사의 결제 정책으로 인하여, 결제 취소일이 결제일 기준 다음 달인 경우 결제가 취소되지 않습니다.
제4장 환불 및 변경
제19조 [리디북스 환불]
회원은 환불에 관하여 유, 무선의 방법을 통하여 회사에 의사를 표시하여야 하며, 회사는 환불요청을 접수하고 회원의 요청과 환불규정 확인 후 신속하게 환불 처리합니다.
회원은 다음 각 호의 사항에 따라 리디북스에서 구입한 콘텐츠의 환불 또는 변경을 요청할 수 있습니다. 단, 디지털 콘텐츠를 다운로드 또는 실시간 스트리밍 서비스를 통해 열어보았다면 제공한 콘텐츠를 이미 이용한 것으로 간주하여 환불이 불가능합니다.
구매한 콘텐츠의 환불 :e
다운로드 또는 스트리밍으로 이용하지 않은 콘텐츠에 대한 환불을, 청약(구매, 결제) 일로부터 7일이내에 요청하시면 전액환불이 가능합니다. 단, 다음 각 호의 경우에는 이용자가 환불을 요청할 수 없습니다.
디지털 콘텐츠를 다운로드 또는 실시간 스트리밍 서비스를 통해 열어본 경우
타사에서 결제 후, 동일 콘텐츠 결제에 대해 리디북스에 환불을 요청하는 경우
서비스 업데이트를 통한 문제 해결이 가능함에도 회원의 의사로 이를 거부하여 서비스를 이용하지 못하는 경우
회원의 실수로 해당 서비스를 이용하지 못하는 경우
사이버머니
회원이 유료로 청약(결제, 충전)한 사이버머니(리디캐시)는 청약 후 한 번도 사용하지 않은 경우, 청약일로부터 7일 이내에 청약 철회(결제,충전 취소) 및 환불 받으실 수 있습니다. 일부 사용한 사이버머니(리디캐시)의 경우. 환불을 요청하면 이를 환불 받을 수 있으나, 결제수단에 따라 제한이 될 수 있습니다. 환불 시에는 은행이체 및 결제대행 수수료 등의 사유로, 해당 사이버머니로 무료 지급받은 리디포인트 및 환불수수료(10%)를 공제하고 남은 금액을 환불하여 드립니다.
회사가 회원에게 무료로 지급한 사이버머니(리디캐시, 리디포인트, 쿠폰 등)는 유효기간 내에만 사용이 가능하며(유효기간이 없을 경우 해당없음), 환불은 되지 않습니다. 무료 사이버머니의 유효기간은 회사정책에 의한 기준을 따르며 유효 기간 이후에는 자동으로 소멸됩니다.
회원이 사용한 사이버머니는 환불이 되지 않습니다. 단, 회사가 회원의 기기 환경에 따라 부득이하게 콘텐츠 이용이 불가능하다고 판단할 경우 환불이 가능합니다.
회원이 유료로 결제한 사이버머니 및 무상으로 지급받은 사이버 머니는 마지막 이용일로부터 5년 경과 시까지 이용하지 않을 경우, 상법 상사소멸시효에 따라 소멸될 수 있습니다. 다만, 무상으로 제공하는 이벤트 성 사이버머니의 경우는 회사의 정책에 따라 소멸될 수 있습니다.
재화 등의 내용이 표시, 광고 내용과 다르거나 계약내용과 다르게 이행된 경우 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내 (결제일로부터 3개월 이내) 환불을 요청 할 수 있습니다.
서비스의 중단에 따른 환불
회사가 부득이한 사유로 서비스를 지속할 수 없을 경우에는 이를 회원에게 공지한 후 신속하게 잔여 이용금액(리디포인트 제외)을 환불하여 드립니다.
강제탈퇴
회원이 관계법령 및 본 약관의 규정을 위반하여 회사로부터 강제탈퇴 처리가 되는 경우에는 본 조의 환불규정이 적용되지 않습니다.
과오금 환급
회사는 과오금이 발생한 경우 이용대금의 결제와 동일한 방법으로 과오금 전액을 환불합니다. 단, 동일한 방법으로 환불이 불가능할 경우에는 사전에 고지합니다.
회사 책임의 사유로 과오금이 발생한 경우 회사는 계약비용, 수수료 등에 관계없이 과오금 전액을 환불합니다. 단, 회원 책임의 사유로 과오금이 발생한 경우에는 회사가 과오금을 환불하는 데 소요되는 비용은 합리적인 범위 내에서 회원이 부담합니다.
회사는 회원이 주장하는 과오금에 대해 환불을 거부할 경우 정당하게 이용대금이 부과되었음을 입증할 책임을 집니다.
회사는 과오금의 환불절차는 [디지털 컨텐츠 이용자 보호지침]에 따릅니다.
제20조 [페이퍼샵 반품, 교환 및 환불]
리디㈜는 품목별 소비자 분쟁해결기준(공정거래위원회 고시)을 준수합니다.
리디북스 페이퍼 교환/반품
정상적인 사용 중 발생한 제품의 고장 및 불량에 대해, 다음의 경우 제품을 교환 및 반품 받을 수 있습니다.
구입 후 10일 이내에 중요한 수리를 해야 할 경우
교환된 제품이 30일 이내에 중요한 수리를 해야 하는 경우
제품 교환이 불가능한 경우
동일한 원인으로 고장이 3회 이상 발생한 경우
동일한 또는 서로 다른 원인으로 고장이 5회 이상 발생한 경우
단순 변심
배송 완료일 기준, 7일 이내에 반품 가능
제품의 전원을 작동시키지 않고 제품에 손상(스크래치 포함)이 없으며 구성품이 모두 갖춰진 상태에서만 반품이 가능합니다.
반품 접수된 제품이 반품 기준에 부합되지 않을 경우, 제품의 반품 및 환불이 불가할 수 있습니다.
배송비용 : 소비자 부담
디스플레이 깨짐은 유상 수리에 의한 A/S 서비스만 가능합니다.
소비자 고의 및 과실로 인한 제품 고장은 반품, 교환, 구입가 환급(환불)이 불가합니다.
화면의 색온도 차이, 일부 불량 화소, 커튼 현상 등은 전자잉크 디스플레이의 자연스러운 특성입니다.
리디북스 페이퍼 반품/교환 시 이미 부착, 착용한 필름, 케이스 등 액세서리는 교환/반품이 되지 않습니다. 부착, 착용 전 페이퍼의 불량 여부를 꼭 확인해주세요.
액세서리 교환/반품
액세서리는 상품 별 품질보증 기준이 상이합니다. 자세한 기준은 상품 별 상세소개 페이지를 참고하세요.
리디북스 페이퍼 반품/교환 시 이미 부착, 착용한 필름, 케이스 등 액세서리는 교환/반품이 되지 않습니다. 부착, 착용 전 페이퍼의 불량 여부를 꼭 확인해주세요.
회사는 이용자의 반품 및 교환 요청을 접수하고 반품 및 교환 규정 확인 후 각 호의 사항에 따라 신속하게 처리합니다.
회사는 이용자의 반품 및 환불 요청에 대해 회사의 해당 재화의 공급 및 배송 협력사가 이용자로부터 재화 등을 반환받았다는 확인을 받은 이후, 3영업일 이내에 이미 지급받은 재화 등의 대금을 환불합니다.
회사는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
공급 받은 재화의 반환에 필요한 비용은 이용자가 부담함을 원칙으로 합니다. 회사는 이용자에게 청약 철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다.
이용자가 재화 등을 제공 받을 때 배송비를 부담한 경우에 회사는 청약 철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
제5장 기타
제21조 [저작권]
회사가 작성한 모든 콘텐츠에 대한 저작권은 회사에 있습니다.
회원은 회사를 통하여 입수한 정보를 회사의 사전 동의 없이 복제, 판매, 출판, 편집, 전시, 전송, 배포, 판매, 방송, 공연하는 등의 행위로 회사의 저작권을 침해 하여서는 안됩니다.
회원이 창작하여 리디북스에 게재 또는 등록한 게시물에 대한 저작권은 회원에게 있으며 해당 게시물이 타인의 지적 재산권을 침해하여 발생하는 모든 책임은 회원 본인에 귀속됩니다. 회원의 게시물에 대해 제3자로부터 저작권 및 기타 권리의 침해로 이의가 제기된 경우, 회사는 해당 게시물을 임의로 삭제할 수 있습니다.
회원은 자신이 게재 또는 등록한 게시물을 회사가 리디북스의 서비스를 운영 또는 홍보를 위해 사용할 경우 사용료 없는 사용권을 회사에 부여합니다. 사용권은 회사가 리디북스 서비스를 운영하는 동안에만 유효하며, 회원 탈퇴 후에도 유효합니다.
회사가 상기 사용권 외에 회원의 게시물을 상업적으로 이용하고자 할 경우 회원의 사전 동의를 얻어야 하며, 이 경우 회사는 별도의 보상제도를 운영할 수 있습니다.
제22조 [책임과 면책]
회사와 회원이 이 규약을 위반함으로써 발생하는 모든 책임은 위반한 자가 부담하며, 이로 인해 상대방에게 손해를 입힌 경우에는 손해를 입힌 자가 배상하여야 합니다.
회원의 이름, E-Mail 등의 정보가 변경되었을 경우에는 사전에 통지하거나 변경해야 하며 변경하지 않아서 발생하는 사고에 대한 책임은 회원 본인에게 있습니다.
회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
제23조 [분쟁의 해결]
회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 고객서비스팀을 설치 운영합니다.
회사와 이용자 간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.
제24조 [이용약관 고지의 의무]
현 이용약관의 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다.
이용약관 버전번호 : 2.7
이용약관 변경 공고일자 : 2016년 11월 01일
변경 이용약관 시행일자 : 2016년 11월 11일
본 약관에 대한 저작권은 리디 주식회사에 있으며, 무단복제 및 배포를 금합니다.
</textarea>
				<br>
				<label class="requireFont"><input type="checkbox" name="logon" value="이용약관"> 위에 해당하는 이용약관을 모두 읽고 이에 동의합니다.</label>
    		</div>
			<div class="btn-group btn-group-lg loginGroup">
				<button type="button" class="btn btn-danger loginButt" data-toggle="modal" data-target="#userJoin" data-dismiss="modal">다음단계</button>
			</div>
  		</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>      
    </div>
  </div>
</div>
<div class="modal fade" id="userJoin" >
    				<div class="modal-dialog">    
      				<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">×</button>
          				<h4 class="modal-title">회원가입</h4>
        			</div>
        			<div class="modal-body">
        			<form name="submitAction" action="/seunghwang.bms/loginSignUpAction.login" method="post">
		    		<div class="form-group">
		      			<input type="text" id="idSize" name="userId" placeholder="아이디" tabindex=1 required>
		      			<input type="button"  id="idCheckButton" value="중복확인" required />
		    		</div>
		    		<div class="form-group">
		      			<input type="password" class="form-control"  id="user_pswd" name="userPw" required placeholder="비밀번호" tabindex=2>
		      			<span id="pwdMsg"></span>
		      			
		      			<input type="password" class="form-control"   id="user_pswd2"name="userPw2" required placeholder="비밀번호 확인" tabindex=3/>
		    			<span id="pwdMsg2"></span>
		    		</div>	
		    		<div class="form-group">	
		    		<input type="text" id="sample6_postcode" id="userPost" name="userPost" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required><br>
						<input type="text" id="sample6_address" id="userAddress1" name="userAddress1" placeholder="주소" required>
						<input type="text" id="sample6_address2" id="userAddress2" name="userAddress2"  placeholder="상세주소" required>
		    		
		    		
		      		<!-- 	<input type="text" class="form-control" name="userEmail" placeholder="이메일주소" tabindex=4><br>
		      			<input type="text" id="sample2_postcode" name="userPost" placeholder="우편번호">
						<input type="button" class="btn btn-default"onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample2_address" placeholder="한글주소">
						<input type="text" id="sample2_addressEnglish" placeholder="영문주소"> -->
		    		</div>
		    		<div class="form-group">
		      			<input type="text" class="form-control" id="userName" name="userName" placeholder="이름" tabindex=5 required>
		      			<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일주소"    tabindex=6 required><p id="userAt">@</p>
		      			<input type="text" class="form-control" id="userEmail2" name="userEmail2" placeholder="이메일주소" tabindex=6 required>
		      					<select class="emailSelect" name="userEmail3" id="selectHeight">
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="korea.com">korea.com</option>
										<option value="1">직접입력</option>
									</select>
		      			<input type="text" class="form-control" placeholder="출생년도" tabindex=7 id="birthYear"required/>
		      			<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="핸드폰번호" tabindex=8 required>
		      			
		    		</div>
		    		<div class="form-group">
		    		<table class="table table-hover">
						<tbody>
							<tr>
								<td><strong>성별</strong></td>
								<td>
									<label>남 <input type="radio" name="gender" value="male" checked></label>
									<label>여 <input type="radio" name="gender" value="female"></label>
								</td>
							</tr>
							<tr>
								<td><strong>문자 광고수신 여부</strong></td>
								<td>
									<label>수신 <input type="radio" name="messageAd" value="messageAgree" checked></label>
									<label>미수신 <input type="radio" name="messageAd" value="messageDiss"></label>
								</td>
							</tr>
							<tr>
								<td><strong>이메일 광고수신 여부</strong></td>
								<td>
									<label>수신 <input type="radio" name="emailAd" value="emailAgree" checked></label>
									<label>미수신 <input type="radio" name="emailAd" value="emailDiss"></label>
								</td>
							</tr>

						</tbody>
					</table>
		    		</div>
					<div class="btn-group btn-group-lg loginGroup">
						<button type="submit"  class="btn btn-danger loginButt" tabindex=7>가입 완료</button>
					</div>
  					</form>
        		</div>
				<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>      
		</div>
	</div>
</div>
<div class="container-fluid" id="category_sub">
	<ul class="nav nav-pills category_sub_list">
		<li><a href="book/newBookList.jsp" target="content">신간 도서</a></li>
		<li><a href="book/bestSellerList.jsp" target="content">베스트 셀러</a></li>
		<li><a href="book/steadySellerList.jsp" target="content">스테디 셀러</a></li>
		<li><a href="/seunghwang.bms/event/event_page.html" target="content">이벤트</a></li>
	</ul>
</div>
<div id="iframeSection" class="container-fluid">
	<iframe src="/seunghwang.bms/main.jsp" id="the_iframe" onload="calcHeight();" name="content" title="게시판뷰" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; min-height:500px;"></iframe>
</div>
<br><br>
	<div class="container-fluid" id="footer">
	<p id="footer0">INTERNET BOOK STORE</p>
	<p id="footer1">BOOK KING</p>
	<p id="footer2">ⓒKS TEAM.</p>
</div>
</body>
</html>
