<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper" %>
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="seunghwang.bms.book.dao.BookDao" %>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.BookService" %>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl" %>
<%@ page import="seunghwang.bms.book.dao.mapper.CategoryMapper" %>
<%@ page import="seunghwang.bms.book.domain.Category" %>
<%@ page import="seunghwang.bms.book.dao.CategoryDao" %>
<%@ page import="seunghwang.bms.book.dao.CategoryDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.CategoryService" %>
<%@ page import="seunghwang.bms.book.service.CategoryServiceImpl" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
      #literatureBooklist {height:1000px;color: hotpink; background-color: white;}
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
	#thumbnail_title{margin-left: 300px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3)); text-align:center; width: 200px; height: 30px; padding-top: 5px;
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

  </style>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String categoryId = request.getParameter("categoryId");
	
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	CategoryMapper categoryMapper = Configuration.getMapper(CategoryMapper.class);
	CategoryDao categoryDao = new CategoryDaoImpl(categoryMapper);
	CategoryService categoryService = new CategoryServiceImpl(categoryDao);
	
	Category middleCategory = categoryService.findCategory(categoryId);
	List<Book> books = bookService.middleCategoryBooks(categoryId);
%>
<div id="literatureBooklist" class="container-fluid">
	<h3 id="thumbnail_title"><%=middleCategory.getMiddleCategory() %> 추천책</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c1">소설</a>
        </h4>
      </div>
      <div id="c1" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">한국소설</a>
        	<a href="#" class="list-group-item item-green-hover">영미소설</a>
        	<a href="#" class="list-group-item item-green-hover">일본소설</a>
        	<a href="#" class="list-group-item item-green-hover">프랑스소설</a>
        	<a href="#" class="list-group-item item-green-hover">중국소설</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c2">경제/경영</a>
        </h4>
      </div>
      <div id="c2" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">경영일반</a>
        	<a href="#" class="list-group-item item-green-hover">경영이론</a>
        	<a href="#" class="list-group-item item-green-hover">경영관리</a>
        	<a href="#" class="list-group-item item-green-hover">경제일반</a>
        	<a href="#" class="list-group-item item-green-hover">경제이론</a>
        	<a href="#" class="list-group-item item-green-hover">기업경제</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c3">인문</a>
        </h4>
      </div>
      <div id="c3" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">심리학</a>
        	<a href="#" class="list-group-item item-green-hover">인문학일반</a>
        	<a href="#" class="list-group-item item-green-hover">철학</a>
        	<a href="#" class="list-group-item item-green-hover">교육학</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c4">역사/문화</a>
        </h4>
      </div>
      <div id="c4" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">역사일반</a>
        	<a href="#" class="list-group-item item-green-hover">세계사</a>
        	<a href="#" class="list-group-item item-green-hover">동양사</a>
        	<a href="#" class="list-group-item item-green-hover">한국사</a>
        	<a href="#" class="list-group-item item-green-hover">신화</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c5">정치/사회</a>
        </h4>
      </div>
      <div id="c5" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">정치/외교</a>
        	<a href="#" class="list-group-item item-green-hover">행정/정책</a>
        	<a href="#" class="list-group-item item-green-hover">국방/군사</a>
        	<a href="#" class="list-group-item item-green-hover">법학</a>
        	<a href="#" class="list-group-item item-green-hover">사회학</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c6">과학</a>
        </h4>
      </div>
      <div id="c6" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">과학이론</a>
        	<a href="#" class="list-group-item item-green-hover">교양과학</a>
        	<a href="#" class="list-group-item item-green-hover">물리학</a>
        	<a href="#" class="list-group-item item-green-hover">화학</a>
        	<a href="#" class="list-group-item item-green-hover">생물학</a>
        	<a href="#" class="list-group-item item-green-hover">지구과학</a>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c7">컴퓨터/IT</a>
        </h4>
      </div>
      <div id="c7" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="#" class="list-group-item item-green-hover">웹프로그래밍</a>
        	<a href="#" class="list-group-item item-green-hover">보안</a>
        	<a href="#" class="list-group-item item-green-hover">데이터베이스</a>
        	<a href="#" class="list-group-item item-green-hover">네트워크</a>
        	<a href="#" class="list-group-item item-green-hover">OS</a>
        	<a href="#" class="list-group-item item-green-hover">컴퓨터공학</a>
        </div>
      </div>
    </div>
  </div>
		</div>
	</div>
	<div class="row" id="thumbnailPos">
<% 
	if(books.size() != 0) 
		for(Book book : books) { %>
		<div class="col-sm-4" id="imgSize">
			<a href="bookDetail.jsp?bookId=<%= book.getBookId() %>" class="thumbnail">
				<img src="../img/bookUpload/<%=book.getBookImage() %>" style="width:150px;height:180px">
					<dl><dt><%=book.getBookName() %></dt><dd>가격: <%=book.getBookPrice() %></dd></dl>
			</a>
		</div>
<%}else{ %>
		<div>
			검색 결과가 없습니다.
		</div>
<% } %>
	</div>
</body>
</html>