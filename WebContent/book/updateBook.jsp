<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="seunghwang.bms.book.domain.Detail" %>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper" %>
<%@ page import="seunghwang.bms.book.dao.BookDao" %>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.BookService" %>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl" %>
<%@ page import="seunghwang.bms.book.dao.mapper.DetailMapper" %>
<%@ page import="seunghwang.bms.book.dao.DetailDao" %>
<%@ page import="seunghwang.bms.book.dao.DetailDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.DetailService" %>
<%@ page import="seunghwang.bms.book.service.DetailServiceImpl" %>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>BookKing</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style> /*hotpink*/
.container-fluid {
	width: 1580px;
	max-width: none !important;
	background-color: hotpink;
}

.table {
	max-width: none !important;
	max-height: none !important;
	margin-top: 20px;
	color: black;
}

.table-responsive {
	min-height: none !important;
	overflow-x: 0
}

body {
	position: relative;
}

#freeBoard_title {
	margin-left: 380px;
	filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3));
	width: 150px;
	height: 30px;
	padding-top: 5px;
	text-align: center;
	color: white;
	background-color: hotpink;
	border-top-left-radius: 1em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: 1em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: 1em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: 1em; /*오른쪽 하단 코너를 부드럽게*/
	font-size: 18px;
	font-weight: bold;
}

#bookInfoSection {
	height: 600px;
	color: black;
	background-color: white;
}

#book_info_body {
	border: 1px solid #eee;
	margin-left: 350px;
	margin-top: 20px;
	width: 1100px;
	padding: 50px;
	padding-top: 30px;
	padding-left: 50px;
	border-top: 2px solid #eee;
}

#book_info_body_goods {
	height: border: 1px solid #eee;
	margin-left: 350px;
	margin-top: 20px;
	width: 900px;
	padding: 50px;
	padding-top: 30px;
	padding-left: 50px;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	height: 400px;
}

.buy_button {
	margin-left: 650px;
	width: 150px;
	height: 60px;
}

img {
	border: 1px solid #ddd;
}

.form-group input[type=text] {
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}

td {
	width: 300px;
	border: 1px solid #ddd;
}

.left_subCategory {
	float: left;
}

.left_subCategory_list {
	height: 790px;
	width: 250px;
	margin-top: 10px;
	margin-left: 20px;
}

.panel-default {
	border-color: #fff;
}

.panel-default>.panel-heading {
	background-color: hotpink;
	color: white;
	filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
}

.category_accordion_button {
	background-color: hotpink;
	border-color: hotpink;
	font-size: 16px;
	font-weight: bold;
}

a.list-group-item:focus, a.list-group-item:hover, button.list-group-item:focus,
	button.list-group-item:hover {
	color: white;
	text-decoration: none;
	background-color: hotpink;
	font-size: 16px;
	font-weight: bold;
}

a.item-green-hover:hover, a.item-green-hover:focus {
	background-color: #EAEAEA;
}

.book_info {
	margin-left: 250px;
	margin-top: -200px;
}

.book_info p {
	filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
	font-weight: bold;
	font-size: 18px;
}

.book_money {
	margin-left: 330px;
	margin-top: 80px;
	color: red;
}

.strong_position {
	margin-left: 10px;
	filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));
	font-size: 18px;
}

.td_bgcolor {
	background-color: #eee;
	font-weight: bold;
}

textarea {
	resize: none;
	width: 550px;
	height: 100px;
}

.table-pay {
	width: 600px;
	margin-left: 500px;
}

.alert-color {
	background: white;
}

.alert-warning {
	color: black;
}

.number_button {
	width: 50px;
}

table {
	font-size: 14px;
}

#pageBoard {
	margin-left: 350px;
}

.selectSearch {
	height: 25px;
}

select {
	height: 25px;
	width: 100px;
}

.p_bg {
	background-color: hotpink;
	color: white;
	height: 30px;
	padding-top: 5px;
}

.btn-pos {
	margin-left: 300px;
}

#category {
	width: 600px;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	DetailMapper detailMapper = Configuration.getMapper(DetailMapper.class);
	DetailDao detailDao = new DetailDaoImpl(detailMapper);
	DetailService detailService = new DetailServiceImpl(detailDao);
	
	String bookId = request.getParameter("bookId");
	
	Book book = bookService.searchBook(bookId); 
	Detail detail = detailService.searchDetail(bookId);
%>
	
<div id="bookInfoSection" class="container-fluid">
	<h3 id="freeBoard_title">책 정보 관리 수정</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" data-toggle="collapse" data-parent="#accordion" href="#c1">관리자 메뉴</a>
        </h4>
      </div>
      <div id="c1" class="panel-collapse collapse">
        <div class="panel-body list-group">
        	<a href="user_manage.jsp" class="list-group-item item-green-hover">회원 정보 관리</a>
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
			<form action="bookUpdateProc.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-boardered">
			<tbody>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" name="bookName" value="<%= book.getBookName() %>"/></td>
					<td>고유번호</td>
					<td><input type="text" name="bookId" value="<%=book.getBookId()%>" readonly/><br></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td colspan="3"><input type="text" name="bookImage" value="<%=book.getBookImage()%>" readonly/>
									<input type="file" name="upBookImage"/>
									<img src="../img/bookUpload/<%=book.getBookImage()%>"/></td>
					<td>작가이름</td>
					<td><input type="text" name="bookWriter" value="<%=book.getBookWriter()%>"/></td>
				</tr>
				<tr>
					<td>장르</td>
					<td id="category">
						<select name="categoryId">
							<optgroup label="소설">
								<option value="NK" <%if(book.getCategoryId().equals("NK")){ %>selected<%}%>>한국소설</option>
								<option value="NA" <%if(book.getCategoryId().equals("NA")){ %>selected<%}%>>영미소설</option>
								<option value="NJ" <%if(book.getCategoryId().equals("NJ")){ %>selected<%}%>>일본소설</option>
								<option value="NF" <%if(book.getCategoryId().equals("NF")){ %>selected<%}%>>프랑스소설</option>
								<option value="NC" <%if(book.getCategoryId().equals("NC")){ %>selected<%}%>>중국소설</option>
							</optgroup>
							<optgroup label="경제/경영">
								<option value="MG" <%if(book.getCategoryId().equals("MG")){ %>selected<%}%>>경영일반</option>
								<option value="MT" <%if(book.getCategoryId().equals("MT")){ %>selected<%}%>>경영이론</option>
								<option value="BM" <%if(book.getCategoryId().equals("BM")){ %>selected<%}%>>경영관리</option>
								<option value="EG" <%if(book.getCategoryId().equals("EG")){ %>selected<%}%>>경제일반</option>
								<option value="ET" <%if(book.getCategoryId().equals("ET")){ %>selected<%}%>>경제이론</option>
								<option value="CE" <%if(book.getCategoryId().equals("CE")){ %>selected<%}%>>기업경제</option>
							</optgroup>
							<optgroup label="인문">
								<option value="HP" <%if(book.getCategoryId().equals("HP")){ %>selected<%}%>>심리학</option>
								<option value="HG" <%if(book.getCategoryId().equals("HG")){ %>selected<%}%>>인문학일반</option>
								<option value="HPS" <%if(book.getCategoryId().equals("HPS")){ %>selected<%}%>>철학</option>
								<option value="HPD" <%if(book.getCategoryId().equals("HPD")){ %>selected<%}%>>교육학</option>
							</optgroup>
							<optgroup label="역사/문화">
								<option value="HSG" <%if(book.getCategoryId().equals("HSG")){ %>selected<%}%>>역사일반</option>
								<option value="HWH" <%if(book.getCategoryId().equals("HWH")){ %>selected<%}%>>세계사</option>
								<option value="HOH" <%if(book.getCategoryId().equals("HOH")){ %>selected<%}%>>동양사</option>
								<option value="HKH" <%if(book.getCategoryId().equals("HKH")){ %>selected<%}%>>한국사</option>
								<option value="HM" <%if(book.getCategoryId().equals("HM")){ %>selected<%}%>>신화</option>
							</optgroup>
							<optgroup label="과학">
								<option value="ST" <%if(book.getCategoryId().equals("ST")){ %>selected<%}%>>과학이론</option>
								<option value="SR" <%if(book.getCategoryId().equals("SR")){ %>selected<%}%>>교양과학</option>
								<option value="SP" <%if(book.getCategoryId().equals("SP")){ %>selected<%}%>>물리학</option>
								<option value="SC" <%if(book.getCategoryId().equals("SC")){ %>selected<%}%>>화학</option>
								<option value="SB" <%if(book.getCategoryId().equals("SB")){ %>selected<%}%>>생물학</option>
								<option value="SE" <%if(book.getCategoryId().equals("SE")){ %>selected<%}%>>지구과학</option>
							</optgroup>
							<optgroup label="컴퓨터/IT">
								<option value="CW" <%if(book.getCategoryId().equals("CW")){ %>selected<%}%>>웹프로그래밍</option>
								<option value="CS" <%if(book.getCategoryId().equals("CS")){ %>selected<%}%>>보안</option>
								<option value="CD" <%if(book.getCategoryId().equals("CD")){ %>selected<%}%>>데이터베이스</option>
								<option value="CN" <%if(book.getCategoryId().equals("CN")){ %>selected<%}%>>네트워크</option>
								<option value="CO" <%if(book.getCategoryId().equals("CO")){ %>selected<%}%>>OS</option>
								<option value="CC" <%if(book.getCategoryId().equals("CC")){ %>selected<%}%>>컴퓨터공학</option>
							</optgroup>
						</select> 
					</td>
					<td>출판사</td>
					<td><input type="text" name="bookPublisher" value="<%=book.getBookPublisher()%>"/></td>
					<td>가격</td>
					<td><input type="text" name="bookPrice" value="<%=book.getBookPrice()%>"/></td>
				</tr>
				<tr>
					<td>출간일</td>
					<td><input type="text" name="publicationDate" value="<%=book.getPublicationDate()%>"/></td>
					<td>판매량</td>
					<td><input type="text" name="bookSale" value="<%=book.getBookSale()%>"/></td>
					<td>재고</td>
					<td><input type="text" name="bookStock" value="<%=book.getBookStock()%>"/></td>
				</tr>
				<tr>
					<td>평점</td>
					<td><input type="text" name="bookGrade" value="<%=book.getBookGrade()%>"/></td>
					<td>베스트셀러</td>
					<td>
						<label><input type="radio" name="best"checked>베스트</label>
						<label><input type="radio" name="best">베스트아님</label>
					</td>
					<td>스테디셀러</td>
					<td>
						<label><input type="radio" name="steady" checked>스테디</label>
						<label><input type="radio" name="steady">스테디아님</label>
					</td>
				</tr>
				<tr>
					<td>기타정보</td>
					<td colspan="4"><textarea name="bookETC"><%=book.getBookETC() %></textarea></td>
					<td>기타정보에는 "책 크기: 00 x 00cm // 총 페이지 000쪽 // 양장본 or 양장아님" 형식으로 정보를 등록해주세요.</td>
				</tr>
<% 
	String detailBook = detail.getDetailBook();
	String detailWriter = detail.getDetailWriter();
	String detailReview = detail.getDetailReview();
	String detailChapter = detail.getDetailChapter();
%>	
				<tr>
					<td>책 소개</td>
					<td colspan="4"><textarea name="detailBook"><%=detailBook %></textarea></td>
					<td rowspan="4" align="center">
						<p class="p_bg">비고</p><br>
						1.책 상세 내용을 책소개, 출판사 서평, 저자 소개, 목차 순으로 작성해주세요.<br><br>
						2.글자수 제한은 없습니다.　　<br><br>
					</td>
				</tr>
				<tr>
					<td>출판사 서평</td>
					<td colspan="4"><textarea name="detailReview"><%=detailWriter %></textarea></td>
				</tr>
				<tr>
					<td>저자 소개</td>
					<td colspan="4"><textarea name="detailWriter"><%= detailReview %></textarea></td>
				</tr>
				<tr>
					<td>목차</td>
					<td colspan="4"><textarea name="detailChapter"><%=detailChapter %></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" class="btn btn-default btn-pos" value="수정"/>
		<button type="button" class="btn btn-default" onclick="location.href='bookDeleteProc.jsp?bookId=<%=book.getBookId()%>'">삭제</button>
		<button type="button" class="btn btn-default" onclick="location.href='bookManage.jsp'">목록보기</button>
		</form>
		
	</div>
</div>
</body>
</html>
