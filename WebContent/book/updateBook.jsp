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
<script>
function chgsel1(){
	tform = document.main_form;
	if(tform.sel1.value == 'novel') {
		tform.sel2.length = 5;
		tform.sel2.options[0].text='한국소설';
		tform.sel2.options[0].value='NK';
		tform.sel2.options[1].text='영미소설';
		tform.sel2.options[1].value='NA';
		tform.sel2.options[2].text='일본소설';
		tform.sel2.options[2].value='NJ';
		tform.sel2.options[3].text='프랑스소설';
		tform.sel2.options[3].value="NF";
		tform.sel2.options[4].text="중국소설"
		tfrom.sel2.options[4].value="NC";
	}else if(tform.sel1.value== 'economic'){
		tform.sel2.length=6;
		tform.sel2.options[0].text='경영일반';
		tform.sel2.options[0].value='MG';
		tform.sel2.options[1].text='경영이론';
		tform.sel2.options[1].value='MT';
		tform.sel2.options[2].text='경영관리';
		tform.sel2.options[2].value='BM';
		tform.sel2.options[3].text='경제일반';
		tform.sel2.options[3].value='EG';
		tform.sel2.options[4].text='경제이론';
		tform.sel2.options[4].value='ET';
		tform.sel2.options[5].text='기업경제';
		tform.sel2.options[5].value='CE';
	}else if(tform.sel1.value== 'human'){
		tform.sel2.length=4;
		tform.sel2.options[0].text='심리학';
		tform.sel2.options[0].value='HP';
		tform.sel2.options[1].text='인문학일반';
		tform.sel2.options[1].value='HG';
		tform.sel2.options[2].text='철학';
		tform.sel2.options[2].value='HPS';
		tform.sel2.options[3].text='교육학';
		tform.sel2.options[3].value='HPD';
	}else if(tform.sel1.value == 'history') {
		tform.sel2.length=5;
		tform.sel2.options[0].text='역사일반';
		tform.sel2.options[0].value='HSG';
		tform.sel2.options[1].text='세계사';
		tform.sel2.options[1].value='HWH';
		tform.sel2.options[2].text='동양사';
		tform.sel2.options[2].value='HOH';
		tform.sel2.options[3].text='한국사';
		tform.sel2.options[3].value='HKH';
		tform.sel2.options[4].text='신화';
		tform.sel2.options[4].value='HM';
	}else if(tform.sel1.value == 'politic'){
		tform.sel2.length=5;
		tform.sel2.options[0].text='정치/외교';
		tform.sel2.options[0].value='PP';
		tform.sel2.options[1].text='행정/정책';
		tform.sel2.options[1].value='PA';
		tform.sel2.options[2].text='국방/군사';
		tform.sel2.options[2].value='PD';
		tform.sel2.options[3].text='법학';
		tform.sel2.options[3].value='PL';
		tform.sel2.options[4].text='사회학';
		tform.sel2.options[4].value='PS';
	} else if(tform.sel1.value == 'science') {
		tform.sel2.length = 6;
		tform.sel2.options[0].text='과학이론';
		tform.sel2.options[0].value='ST';
		tform.sel2.options[1].text='교양과학';
		tform.sel2.options[1].value='SR';
		tform.sel2.options[2].text='물리학';
		tform.sel2.options[2].value='SP';
		tform.sel2.options[3].text='화학';
		tform.sel2.options[3].value='SC';
		tform.sel2.options[4].text='생물학';
		tform.sel2.options[4].value='SB';
		tform.sel2.options[5].text='지구과학';
		tform.sel2.options[5].value='SE';
	} else {
		tform.sel2.length = 6;
		tform.sel2.options[0].text='웹프로그래밍';
		tform.sel2.options[0].value='CW';
		tform.sel2.options[1].text='보안';
		tform.sel2.options[1].value='CS';
		tform.sel2.options[2].text='데이터베이스';
		tform.sel2.options[2].value='CD';
		tform.sel2.options[3].text='네트워크';
		tform.sel2.options[3].value='CN';
		tform.sel2.options[4].text='OS';
		tform.sel2.options[4].value='CO';
		tform.sel2.options[5].text='컴퓨터공학';
		tform.sel2.options[5].value='CC';
	}
}
</script>
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
			<form action="bookUpdateProc.jsp" method="post">
			<table class="table table-boardered">
			<tbody>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" name="bookName" value="<%= book.getBookName() %>"/></td>
					<td>고유번호</td>
					<td><input type="text" name="bookId" value="<%=book.getBookId()%>" readonly/><br></td>
				</tr>
				<tr>
					<td>이미지 URL</td>
					<td colspan="3"><input type="file" name="bookImage"/>
									<img src="../img/bookUpload/<%=book.getBookImage()%>"/></td>
					<td>작가이름</td>
					<td><input type="text" name="bookWriter" value="<%=book.getBookWriter()%>"/></td>
				</tr>
				<tr>
					<td>장르</td>
					<td id="category">
						<select name="sel1" onchange="chgsel1()">
							<option value="novel">소설</option>
							<option value="economic">경제/경영</option>
							<option value="human">인문</option>
							<option value="history">역사/문화</option>
							<option value="politic">정치/사회</option>
							<option value="science">과학</option>
							<option value="computer">컴퓨터/IT</option>
						</select> 
						 > 
						<select name="sel2">
							<option value="NK">한국소설</option>
							<option value="NA">영미소설</option>
							<option value="NJ">일본소설</option>
							<option value="NF">프랑스소설</option>
							<option value="NC">중국소설</option>
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
				<tr>
					<td>책 소개</td>
					<td colspan="4"><textarea name="detailBook"><%=detail.getDetailBook() %></textarea></td>
					<td rowspan="4" align="center">
						<p class="p_bg">비고</p><br>
						1.책 상세 내용을 책소개, 출판사 서평, 저자 소개, 목차 순으로 작성해주세요.<br><br>
						2.글자수 제한은 없습니다.　　<br><br>
					</td>
				</tr>
				<tr>
					<td>출판사 서평</td>
					<td colspan="4"><textarea name="detailReview"><%=detail.getDetailReview() %></textarea></td>
				</tr>
				<tr>
					<td>저자 소개</td>
					<td colspan="4"><textarea name="detailWriter"><%=detail.getDetailWriter() %></textarea></td>
				</tr>
				<tr>
					<td>목차</td>
					<td colspan="4"><textarea name="detailChapter"><%=detail.getDetailChapter() %></textarea></td>
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