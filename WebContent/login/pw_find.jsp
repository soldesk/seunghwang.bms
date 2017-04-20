<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
  	.container-fluid{width: 1600px; max-width: none !important;	}
  	.img-thumbnail {max-width: none !important;}
  	.pre-scrollable {max-height: none !important;}
  	.table {max-width: none !important; max-height: none !important;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
      body {position: relative; }
      #section1 {padding-top:50px;height:10%;color: #fff; background-color: #fff;}
      #section1-1{background-color: #EAEAEA; border-top: 1px solid #D5D5D5; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
      #section1-1 a{color: #747474;	font-size: 15px;}
      #section2 {height:243px; color: #fff; background-color: #3f3f3f; width: 1580px;}
      #section3 {height:750px; color: #ED4C00; background-color: hotpink; }
      #logo {margin-left: 270px; font-weight:bold; color:#fff; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 26px; margin-top:-15px;}
      #logo:hover{color:#9d9d9d; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
      #id {font-weight:bold; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 22px; color: white; margin-left: 570px;}
      #id:hover{color:#9d9d9d; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
      #join {font-weight:bold; color:#fff; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 22px;  color: #ED4C00;}
      #join:hover{color:#9d9d9d; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
      .container-fluid{background-color: #ED4C00;}
      #search{margin-top: 8px;height:35px; border:1px solid white;padding:10px;width:250px; }
      #search{border-top-left-radius: .5em; border-bottom-left-radius: .5em;
      border-top-right-radius: .5em; border-bottom-right-radius: .5em;}
      a {display:inline; color:white; font-size: 20px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
      a:hover{text-decoration: none;}
      #allList{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); padding-top: 12px;}
    .carousel-inner > .item > img,
	.carousel-inner > .item > a > img {width:1200px;margin: 0;}
	.carousel-control{width:0;}
 	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail a>img, .thumbnail>img {
	display: block;
	max-width: none !important;
	height: 240px;
}
 	.carousel-indicators li {display: inline-block;width: 12px;height: 12px; margin: 1px; text-indent: -999px;
    cursor: pointer;background-color: #000\9;background-color: rgba(0,0,0,0);border: 1px solid #fff;border-radius: 10px;}
	.carousel-indicators .active {width: 16px;height: 16px;margin: 0;background-color: #fff;}
	#category{margin-left:260px;width:80%; border:2px solid white; background-color:#fff;}
	#category a{color: #ED4C00;}
	#category a:hover{color:orange;}
	#navbar{border:0px solid;}
	.navbar-inverse .navbar-toggle:focus, .navbar-inverse .navbar-toggle:hover {background-color: #ED4C00;border:1px solid white;}
	.navbar-inverse .navbar-toggle {border-color: #ED4C00;}
	.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {border-color: #ED4C00;}
	.navbar-inverse{background-color: #ED4C00;}
	.modal-dialog{color: #ED4C00;}
	#usr{width: 550px; height:40px;}
	#pwd{width: 550px; height:40px; margin-top: -12px;}
	#loginButt{width: 550px; height:60px;}
	#logon{font-weight:normal;}
	#idFind{margin-left: 260px; font-size: 14px; color: #ED4C00;}
	#pwFind{font-size: 14px; color: #ED4C00;}
	#loginGroup{border-top:1px solid #e5e5e5;padding-top:15px;}
	textarea{width:550px; height: 150px; color:black;}
	#agree{color: #ED4C00; font-size: 14px;}
	#logMenu{background-color:white; float:right; margin-top:-50px;}
	#menu1Area{color:black;width:1000px;height:500px;}
	#novel a{font-size:14px; float:left;}
	#humanism a{font-size:14px; float:left;}
	#social a{font-size:14px; float:left;}
	.nav-tabs>li>a {margin-right: 0px;}
	#novel>li>a {padding: 7px 9px;}
	#joinButt{width: 350px; height:30px;margin-right:120px; background-color: transparent; color: #ED4C00;}
	#bestSeller1{width: 1090px; height: 480px; float:left;margin-left: 16%; }
	#bestSeller2{width: 1090px; height: 480px; float:left;margin-left: 16%; margin-top: 20px;}
	#bestSeller3{width: 1090px; height: 480px; float:left;margin-left: 16%; margin-top: 20px;}
	#bestTab{height: 200px;}
	#bestTop1{padding: 40px 50px; width:100px;}
	#bestTop2{padding-top: 80px; padding-left:40px;}
	#bestTop3{padding-left: 30px;}
	#titleSeller{margin-left: 85px;}
	#categoryList{background-color: white;}
	#footer{height: 130px; padding-left: 680px; padding-top: 20px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-weight: bold; background: hotpink;}
	#footer0{width: 170px; max-width: none !important; color: white;}
	#footer1{width: 100px;margin-left: 45px; max-width: none !important; color: white;}
	#footer2{width: 100px; margin-left: 45px; max-width: none !important;color: white;}
	address{font-size: 11px; font-weight:bold; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
	#addressNum{font-size: 11px; margin-top: -10px; font-weight:bold; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
	#addressNum a{font-size: 11px;font-weight:bold; color:#fff; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
	#security {font-weight:bold; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
	#security a{font-size: 14px;font-weight:bold; color:#fff; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}	
	#phoneNum{font-weight:bold; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
	#qnaLink{margin-left: 20px; font-weight: normal;}
	#bestSeller1 ul li a{font-size:14px; color: #ED4C00; }
	#bestSeller2 ul li a{font-size:14px; color: #ED4C00;}
	#bestSeller3 ul li a{font-size:14px; color: #ED4C00;}
	#about1{float: left;margin-left: 80px;}#about2{float: left;margin-left: 30px;}#about3{float: left;margin-left: 30px;}
	#bestTop2 img {margin-left: 20px;}
	#categ2{margin-left: 270px;}
	#banner{width: 1090px; margin-left: 50px; margin-top: 1px;}
	.imgPos{ text-align: center; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: black; font-size: 20px;}
	.imgPos2{padding-bottom: -20px; text-align: center; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: black; font-size: 25px;}
	#bookPlusInfo{margin-left: 60px;width: 950px; margin-top: -30px;}
	#bookPlusInfo table{border: 0px solid white;}
	dl {filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: black;}
	#bestPlusInfoList{width: 950px; height: 10px;}
	dt{text-align: center;}
	dd {color: #747474; text-align: center;}
	#widthDl{width: 200px;}
	#heightTr{height: 20px;}
	#pwFind_Pos{margin-top: 80px; margin-left: 600px;}
	#form_title{color: #fff; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 26px;}
	#input_email{width: 400px; height: 50px; padding: 10px; margin-left: -50px;}
	#pwFind_butt{margin-top: 20px; width: 400px; height: 50px; margin-left: -50px; color: hotpink; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 20px; font-weight: bold;}
	#pwFind_Pos form{margin-top: 70px;}
	hr{margin-left: -100px; width: 500px;}
	#form_footer{color: white;filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 17px; margin-left: -60px; font-weight: bold;}
	#form_footer1{color: white;filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 17px; margin-left: 90px; font-weight: bold;}
	#pwfind_input_id{width: 400px; height: 50px; padding: 10px; margin-left: -50px;}
  </style>
</head>
 
<body>
<div id="section3" class="container-fluid">
	<div id="pwFind_Pos">
		<a href="/index.jsp"><img src="/seunghwang.bms/img/logo1.png" width="280px" height="70px"/></a>
		<form action = "loginFindPwAction.login" method="post">
			<p id="form_title"></p>
			<input type="text" name="userId" placeholder="유저 아이디 입력" id="pwfind_input_id"><br>
			<input type="text" name="userEmail" placeholder="이메일 입력" id="input_email"><br>
			<button type="submit" id="pwFind_butt" class="btn btn-default">제출</button>
		</form>
		<hr>
		<p id="form_footer">기억이 나지 않으면 고객센터로 문의 주세요</p>
		<p id="form_footer1">010-8564-5567</p>
	</div>
</div>
</body>
<div class="container-fluid" id="footer">
	<p id="footer0">INTERNET BOOK STORE</p>
	<p id="footer1">BOOK KING</p>
	<p id="footer2">âKS TEAM.</p>
</div>
</html>