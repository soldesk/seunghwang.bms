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
<%
	request.setCharacterEncoding("utf-8");
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String ss=sdf.format(new java.util.Date());
    Date date= java.sql.Date.valueOf(ss);
	
    List<Book> books = bookService.findNewBooks(date);
%>
<html lang="ko">
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>/*hotpink*/
  	.thumbnail{color: black; font-weight: bold;}
  	.container-fluid{width: 1580px;	max-width: none !important;	background-color: hotpink;}
      body {position: relative;}
      #bestsellerBooklist {height:1000px;color: hotpink; background-color: white;}
 	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail a>img, .thumbnail>img {
	display: block;
	max-width: none !important;
	height: 240px;
}
	.modal-dialog{color: hotpink;}
	dl {filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); color: black;}
	dt{text-align: center;}
	dd {color: #747474; text-align: center;}
	#imgSize{width: 270px;}
	#thumbnailPos{margin-left: 280px; margin-top: 20px; width: 1100px; max-width: none !important;}
	#thumbnail_title{margin-left: 340px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3));	width: 150px; height: 30px; padding-left: 35px; padding-top: 5px;
	color: white;
	background-color: hotpink;
	border-top-left-radius: 1em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: 1em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: 1em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: 1em; /*오른쪽 하단 코너를 부드럽게*/
	font-size: 18px;
	font-weight: bold;
	}
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
.left_subCategory{float: left;}
.left_subCategory_list{height: 790px; width: 250px; margin-top: 10px; margin-left: 20px;}
.panel-default{border-color: #fff;}
.panel-default>.panel-heading {
    background-color: hotpink;
    color: white;
    filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
    border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
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
.bookList ul li {
	list-style-type:none;
}
.thumbnail{
	margin-left: 20px;
	width: 800px;
}
.img{
	float:left;
	margin-left: 5px;
	margin-right: 10px;
	padding-bottom: 5px;
	padding-top: 3px;
}

.etc, .grade, .price {
	font-weight: normal;
	font-size: 13px;
}
.grade{
	padding-top:10px;
}
.price{
	padding-top:5px;
}
.font{
	font-size:13px;
	color: #BDBDBD;
}
.numberFont{
	color:#8BBDFF;
}
.gradeFont{
	font-weight:bold;
}
.discount{
	color:red;
}
  </style>
</head>
<body>

<div id="bestsellerBooklist" class="container-fluid">
	<h3 id="thumbnail_title">신간 도서</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c1">문학</a>
        </h4>
      </div>
      <div id="c1" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">소설</a>
        	<a href="#" class="list-group-item item-green-hover">일반소설</a>
        	<a href="#" class="list-group-item item-green-hover">추리/스릴러</a>
        	<a href="#" class="list-group-item item-green-hover">SF소설</a>
        	<a href="#" class="list-group-item item-green-hover">판타지소설</a>
        	<a href="#" class="list-group-item item-green-hover">역사소설</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c2">사회</a>
        </h4>
      </div>
      <div id="c2" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">정치/사회</a>
        	<a href="#" class="list-group-item item-green-hover">예술/문학</a>
        	<a href="#" class="list-group-item item-green-hover">역사</a>
        	<a href="#" class="list-group-item item-green-hover">인문학</a>
        	<a href="#" class="list-group-item item-green-hover">인간관계</a>
        	<a href="#" class="list-group-item item-green-hover">기획/창의/리더십</a>
        	<a href="#" class="list-group-item item-green-hover">성공/삶의자세</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c3">경제</a>
        </h4>
      </div>
      <div id="c3" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">경영일반</a>
        	<a href="#" class="list-group-item item-green-hover">경제일반</a>
        	<a href="#" class="list-group-item item-green-hover">마케팅</a>
        	<a href="#" class="list-group-item item-green-hover">세일즈</a>
        	<a href="#" class="list-group-item item-green-hover">재테크/금융/부동산</a>
        	<a href="#" class="list-group-item item-green-hover">CEO/리더십</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c4">교육</a>
        </h4>
      </div>
      <div id="c4" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">외국어</a>
        	<a href="#" class="list-group-item item-green-hover">과학</a>
        	<a href="#" class="list-group-item item-green-hover">수학</a>
        	<a href="#" class="list-group-item item-green-hover">공부법</a>
        	<a href="#" class="list-group-item item-green-hover">대입 수시/논술</a>
        	<a href="#" class="list-group-item item-green-hover">합격후기</a>
        	<a href="#" class="list-group-item item-green-hover">자격증</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c5">IT</a>
        </h4>
      </div>
      <div id="c5" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">IT 비지니스</a>
        	<a href="#" class="list-group-item item-green-hover">개발</a>
        	<a href="#" class="list-group-item item-green-hover">프로그래밍</a>
        	<a href="#" class="list-group-item item-green-hover">컴퓨터/앱 활용</a>
        	<a href="#" class="list-group-item item-green-hover">수험서</a>
        </div>
      </div>
    </div>
  </div>
		</div>
	</div>
	<div class="row" id="thumbnailPos">
			<div class="col-sm-4" id="imgSize">
				<% 
	if(books.size() != 0) 
		for(Book book : books) { %>
		<div class="bookList">
			<ul class="thumbnail">
				<li class="img"><a href="bookDetail.jsp?bookId=<%= book.getBookId() %>">
						<img src="../img/bookUpload/<%=book.getBookImage() %>" style="width:100px;height:114px"></a>
				</li>
				<li class="name"><a href="bookDetail.jsp?bookId=<%=book.getBookId() %>"><%=book.getBookName() %></a></li>
				<li class="etc"><%=book.getBookWriter() %> <span class="font">지음 | 출판사</span> <%=book.getBookPublisher() %> <span class="font">| 출판일 </span><%= book.getPublicationDate() %></li><br>
				<li class="grade">추천지수(<span class="numberFont">230</span>) <span class="font">|</span>  리뷰(<span class="numberFont">230</span>) <span class="font">| 회원평점:</span>  <span class="gradeFont"><%=book.getBookGrade() %></span></li>
				<li class="price"><%=book.getBookPrice() %>원 -> <span class="discount"><%=(int)(0.9*book.getBookPrice()) %></span>원 (10% 할인)</li><br>
			</ul>
		</div>
<%}else{ %>
		<div>
			검색 결과가 없습니다.
		</div>
<% } %>
			</div>
		</div>
	</div>
</body>
</html>