<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper" %>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.book.dao.BookDao" %>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.BookService" %>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	List<Book> books = bookService.getBooks();
	List<Book> searchBooks = (List)request.getAttribute("searchBooks");
%>
<html lang="ko">
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>/*hotpink*/
  	.container-fluid{width: 1580px;	max-width: none !important;	background-color: hotpink;}
  	.table {max-width: none !important; max-height: none !important; margin-top: 20px; color: black;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
    body {position: relative;}
    #freeBoard_title{margin-left: 380px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3)); width: 150px; height: 30px; padding-top: 5px; text-align: center;
	color: white;
	background-color: hotpink;
	border-top-left-radius: 1em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: 1em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: 1em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: 1em; /*오른쪽 하단 코너를 부드럽게*/
	font-size: 18px;
	font-weight: bold;
	}
    #bookInfoSection {height: 600px; color: black; background-color: white;}
	#book_info_body{border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 1100px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid #eee;}
	#book_info_body_goods{height: border: 1px solid #eee; margin-left: 350px; margin-top: 20px; width: 900px; padding: 50px; padding-top: 30px; padding-left: 50px; border-top: 2px solid black; border-bottom: 2px solid black; height: 400px;}
	.buy_button{margin-left: 650px; width: 150px; height: 60px;}
	img{border: 1px solid #ddd;}
	.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
td{width: 300px;}
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
.book_info{margin-left: 250px; margin-top: -200px;}
.book_info p{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-weight: bold; font-size: 18px;}
.book_money{margin-left: 330px; margin-top: 80px; color: red;}
.strong_position{margin-left: 10px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 18px;}
.td_bgcolor{background-color: #eee; font-weight: bold;}
textarea{resize: none; width: 500px; height: 60px;}
.table-pay{width: 600px; margin-left: 500px;}
.alert-color{background: white;}
.alert-warning {
    color: black;
}
.number_button{width: 50px;}
tr{cursor: pointer;}
table{font-size: 14px;}
#pageBoard{margin-left: 350px;}
.selectSearch{height: 25px;}
.btn-default{height: 30px;}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    background-color: hotpink;
    border-color: hotpink;
    color: white;
}
.btn-pos{margin-left: 870px;}
  </style>
</head>
<body>

<div id="bookInfoSection" class="container-fluid">
	<h3 id="freeBoard_title">책 정보 관리</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c1" onfocus="#c1">관리자 메뉴</a>
        </h4>
      </div>
      <div id="c1" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="../admin/user_manage.jsp" class="list-group-item item-green-hover">회원 정보 관리</a>
        	<a href="../book/bookManage.jsp" class="list-group-item item-green-hover">책 정보 관리</a>
        	<a href="/seunghwang.bms/admin/listOrder.ag" class="list-group-item item-green-hover">주문 정보 관리</a>
        	<a href="banner_manage.html" class="list-group-item item-green-hover">배너관리</a>
        </div>
      </div>
    </div>
  	</div>
	</div>
	</div>
		<div id="book_info_body">
		<div>
			<form action="searchBookProc.jsp" method="post">
			검색정보: 
			<select class="selectSearch" name="searchType">
				<option value="total">전체</option>
				<option value="bookName">책이름</option>
				<option value="bookPublisher">출판사</option>
				<option value="bookWriter">작가</option>
				<option value="publicationDate">출판일 기준</option>
			</select>
			<input type="text" name="searchBook"/>
			<input type="submit" class="btn btn-default" value="조회"/>
			</form>
		</div>
			<table class="table table-hover">
			<thead>
				<tr>
					<th>고유번호</th>
					<th>책 제목</th>
					<th>가격</th>
					<th>작가</th>
					<th>출판사</th>
					<th>출간일</th>
					<th>판매량</th>
					<th>재고</th>
					<th>평점</th>
				</tr>
			</thead>
<% 
	if(searchBooks == null)
		if(books.size() != 0) 
			for(Book book : books) { %>
				<tbody>
					<tr onclick="location.href='updateBook.jsp?bookId=<%=book.getBookId()%>'">
						<td><%= book.getBookId() %></td>
						<td><%= book.getBookName() %></td>
						<td><%= book.getBookPrice() %></td>
						<td><%= book.getBookWriter() %></td>
						<td><%= book.getBookPublisher()%></td>
						<td><%= book.getPublicationDate() %></td>
						<td><%= book.getBookSale() %></td>
						<td><%= book.getBookStock() %></td>
						<td><%= book.getBookGrade() %></td>
					</tr>
<%			}
		else{ %>
					<tr>
						<td>등록된 도서가 없습니다.</td>
					</tr>
				</tbody>
<% 		}
	else if(searchBooks != null)
		if(searchBooks.size() != 0)
			for(Book book: searchBooks) { %>
				<tbody>
					<tr onclick="location.href='updateBook.jsp?bookId=<%=book.getBookId()%>'">
						<td><%= book.getBookId() %></td>
						<td><%= book.getBookName() %></td>
						<td><%= book.getBookPrice() %></td>
						<td><%= book.getBookWriter() %></td>
						<td><%= book.getBookPublisher()%></td>
						<td><%= book.getPublicationDate() %></td>
						<td><%= book.getBookSale() %></td>
						<td><%= book.getBookStock() %></td>
						<td><%= book.getBookGrade() %></td>
					</tr>
<%			}
		else { %>
					<tr>
						<td>등록된 도서가 없습니다.</td>
					</tr>
				</tbody>
<% 		} %>
		</table>
		<form action="addBook.jsp" method="post">
			<input type="submit" class="btn btn-default  btn-pos" value="책 추가"/>
		</form>
		
		<div id="pageBoard">
		<ul class="pagination pagination-sm">
			<li><a href="#"><<</a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">>></a></li>
		</ul>
	</div>
	</div>
</div>
</body>
</html>