<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper" %>
<%@ page import="seunghwang.bms.book.dao.BookDao" %>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.BookService" %>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>BookKing</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
	/*부트스트랩 유동성 비활성화*/
  	.container-fluid{width: 900px; max-width: none !important; background-color: hotpink;}
  	.table {max-width: none !important; max-height: none !important;}
      body {position: relative;}
      #eventSection {height:243px;color: #fff; background-color: white; width: 1580px;}
      #mainSection {height:1000px;color: hotpink; background-color: white;}
      a {display:inline; color:white; font-size: 20px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
      a:hover{text-decoration: none;}
     /*배너 이미지 크기*/
    .carousel-inner > .item > img,
	.carousel-inner > .item > a > img {width:1200px;margin: 0;}
	.carousel-control{width:0;}
 	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail a>img, .thumbnail>img {
	display: block;
	max-width: none !important;
	height: 240px;
}
	.nav-tabs>li>a {margin-right: 0px;}
	.recommend_book{margin-left: -90px; width: 1500px; height: 400px; background-color: white;}
	.recommend_book hr{width: 800px; margin-top: 35px; margin-right: 130px; border-top: 1px solid #787878;}
	.recommend_book button{margin-top: -60px; margin-left: 980px;}
	#bestSeller1{width: 1090px; height: 480px; float:left; margin-left: -85px;}
	#bestSeller2{width: 1090px; height: 480px; float:left; margin-top: 20px; margin-left: -85px;}
	#bestSeller3{width: 1090px; height: 480px; float:left; margin-top: 20px; margin-left: -85px;}
	#bestSeller1 ul li a{font-size:14px; color: #5D5D5D; }
	#bestSeller2 ul li a{font-size:14px; color: #5D5D5D;}
	#bestSeller3 ul li a{font-size:14px; color: #5D5D5D;}
	.bestSeller_right{margin-top: -30px; margin-left: 970px;}
	.bestSeller_right a{font-size: 14px; color: black;}
	.modal-header{height: 60px;}
	#banner{width: 1090px; margin-left: 50px; margin-top: 1px;}
	.imgPos{ text-align: center; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: black; font-size: 20px;}
	.imgPos2{padding-bottom: -20px; text-align: center; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: black; font-size: 25px;}
	#bookPlusInfo{margin-left: 60px;width: 950px; margin-top: -30px;}
	#bookPlusInfo table{border: 0px solid white;}
	#bestPlusInfoList{width: 950px; height: 10px;}
	dl {filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: black;}
	dt{text-align: center;}
	dd {color: #747474; text-align: center;}
	#widthDl{width: 200px;}
	#heightTr{height: 20px;}
	.btn-danger {
    color: #fff;
    background-color: hotpink;
    border-color: hotpink;
}
	.btn-danger:hover {
    color: #FFB2F5;
    background-color: hotpink;
    border-color: hotpink;
}
	.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
	hr{border-top: 1px solid #ddd; width: 200px;}
	.imgpo{width: 120px; height: 160px; margin-right: 70px;}
	.name{margin-top:10px;margin-left: 0px;font-weight:bold; color: #5D5D5D; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); text-overflow: ellipsis;}
	.writer{margin-top:-5px;margin-left: 0px;color:#666;font-size:13px; text-overflow: ellipsis;}
	#grade{width:70px;height:15px;margin-top:-13px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: red;}
	.topBook{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 20px;}
</style>
</head>
<body>
<div id="eventSection" class="container-fluid">
<div class="container">
  	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>
		
		<!-- Wrapper for slides -->
		<div class="carousel-inner" id="banner">
			<div class="item active">
				<img src="img/banner1.jpg" alt="a" width="1200" height="500">
			</div>
			<div class="item">
				<img src="img/banner2.jpg" alt="b" width="1200" height="500">
			</div>
			<div class="item">
				<img src="img/banner3.jpg" alt="c" width="1200" height="500">
				<div class="carousel-caption">
					<h3>녹색</h3>
					<p>강아지풀</p>
				</div>
			</div>
			<div class="item">
				<img src="img/banner4.jpg" alt="d" width="460" height="345">
			</div>
			<div class="item">
				<img src="img/banner5.jpg" alt="e" width="460" height="345">
			</div>
		</div>
		</div>
	</div>
</div>
<div id="mainSection" class="container-fluid">
  <br>
<%
	request.setCharacterEncoding("utf-8");
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String ss=sdf.format(new java.util.Date());
    Date date= java.sql.Date.valueOf(ss);
    
    List<Book> steadyBooks = bookService.findSteadySellers();
    List<Book> bestBooks = bookService.findBestSellers();
	List<Book> newBooks = bookService.findNewBooks(date);
	int steadyTopCnt = 1;
	int bestTopCnt = 1;
	int newTopCnt = 1;
%>	 
	
  <div class="modal-content" id="bestSeller1">
    	<div class="modal-header">
    		<h4 class="modal-title">신간 도서</h4>
    		<button class="btn btn-default bestSeller_right"><a href="book/newBookList.jsp" target="content">전체보기</a></button>
        </div>
     	<div class="modal-body">
        	<ul class="nav nav-tabs">
				<li class="active"><a href="#bestMon1" data-toggle="tab">신간도서</a></li>
			</ul>
			<div class="tab-content">
			    <div class="tab-pane active" id="bestMon1">
			      <br><br>
				<div id="bookPlusInfo"><br>
					<ul class="nav navbar-nav" id="bestseller">
<% 
	if(newBooks.size() != 0) 
		for(Book book : newBooks) {
%>
						<li><p class="topBook">Top <%=newTopCnt %></p><img src="img/bookUpload/<%=book.getBookImage() %>" class="imgpo" width="120px" height="160px">
							<a href="book/bookDetail.jsp?bookId=<%=book.getBookId() %>"></a>
							<p class="name"><a href="book/bookDetail.jsp?bookId=<%=book.getBookId() %>"><%=book.getBookName() %></a></p>
							<p class="writer"><%=book.getBookWriter() %></p>
							<p id="grade">★★★★☆</p>
						</li>
<%
			++newTopCnt;
			if(newTopCnt == 5)
				break;
		} 
	else {
%>
						<li><p class="topBook">Top <%= ++newTopCnt %></p><img src="img/bookUpload/ad.jpg" class="imgpo" width="120px" height="160px">
							<p class="name">없음</p>
							<p class="writer">없음</p>
							<p id="grade">☆☆☆☆☆</p>
						</li>
<%		
	} 
%>
				</ul>
				</div>
			    </div>
			  </div>
		</div>
	</div><br>
	<div class="modal-content" id="bestSeller2">
    	<div class="modal-header">
    		<h4 class="modal-title">베스트셀러</h4>
    		<button class="btn btn-default bestSeller_right"><a href="book/bestSellerList.jsp" target="content">전체보기</a></button>
        </div>
     	<div class="modal-body">
        	<ul class="nav nav-tabs" >
				<li class="active"><a href="#bestMon2" data-toggle="tab">월간</a></li>
				<!-- <li><a href="#bestWeek2" data-toggle="tab">주간</a></li>
				<li><a href="#bestDay2" data-toggle="tab">일간</a></li>-->
			</ul>
			<div class="tab-content">
			    <div class="tab-pane active" id="bestMon2">
			      <br>
				<br>
				<div id="bookPlusInfo"><br>
					<ul class="nav navbar-nav" id="bestseller">
<% 
	if(bestBooks.size() != 0) 
		for(Book book : bestBooks) {
%>
						<li><p class="topBook">Top <%=bestTopCnt %></p><img src="img/bookUpload/<%=book.getBookImage() %>" class="imgpo" width="120px" height="160px">
							<a href="book/bookDetail.jsp?bookId=<%=book.getBookId() %>"></a>
							<p class="name"><a href="book/bookDetail.jsp?bookId=<%=book.getBookId() %>"><%=book.getBookName() %></a></p>
							<p class="writer"><%=book.getBookWriter() %></p>
							<p id="grade">★★★★☆</p>
						</li>
<%
			++bestTopCnt;
			if(bestTopCnt == 6)
				break;
		} 
	else {
%>
						<li><p class="topBook">Top <%= ++bestTopCnt %></p><img src="img/bookUpload/ad.jpg" class="imgpo" width="120px" height="160px">
							<p class="name">없음</p>
							<p class="writer">없음</p>
							<p id="grade">☆☆☆☆☆</p>
						</li>
<%		
	} 
%>
					</ul>
				</div>
			    </div>
			    <div class="tab-pane" id="bestWeek2">
			      <p>안녕, 나는 부분 2에 있어.</p>
			    </div>
			    <div class="tab-pane" id="bestDay2">
			      <p>안녕, 나는 부분 2에 있어.</p>
			    </div>
			  </div>
		</div>
	</div><br>
	<div class="modal-content" id="bestSeller3">
    	<div class="modal-header">
    		<h4 class="modal-title">스테디셀러</h4>
    		<button class="btn btn-default bestSeller_right"><a href="book/steadySellerList.jsp" target="content">전체보기</a></button>
        </div>
     	<div class="modal-body">
        	<ul class="nav nav-tabs" >
				<li class="active"><a href="#bestMon3" data-toggle="tab">스테디셀러</a></li>
			</ul>
			<div class="tab-content">
			    <div class="tab-pane active" id="bestMon3">
			      <br>
				<br>
				<div id="bookPlusInfo"><br>
			<ul class="nav navbar-nav" id="bestseller">
				<% 
	if(steadyBooks.size() != 0) 
		for(Book book : steadyBooks) {
%>
						<li><p class="topBook">Top <%=steadyTopCnt %></p><img src="img/bookUpload/<%=book.getBookImage() %>" class="imgpo" width="120px" height="160px">
							<a href="book/bookDetail.jsp?bookId=<%=book.getBookId() %>"></a>
							<p class="name"><a href="book/bookDetail.jsp?bookId=<%=book.getBookId() %>"><%=book.getBookName() %></a></p>
							<p class="writer"><%=book.getBookWriter() %></p>
							<p id="grade">★★★★☆</p>
						</li>
<%
			++steadyTopCnt;
			if(steadyTopCnt == 6)
				break;
		} 
	else {
%>
						<li><p class="topBook">Top <%= ++steadyTopCnt %></p><img src="img/bookUpload/ad.jpg" class="imgpo" width="120px" height="160px">
							<p class="name">없음</p>
							<p class="writer">없음</p>
							<p id="grade">☆☆☆☆☆</p>
						</li>
<%		
	} 
%>
			</ul>
				</div>
			    </div>
			  </div>
		</div>
	</div><br>
</div>
</body>
</html>