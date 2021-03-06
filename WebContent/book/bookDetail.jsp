<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper" %>
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="seunghwang.bms.book.dao.BookDao" %>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.BookService" %>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl" %>
<%@ page import="seunghwang.bms.book.dao.mapper.DetailMapper" %>
<%@ page import="seunghwang.bms.book.domain.Detail" %>
<%@ page import="seunghwang.bms.book.dao.DetailDao" %>
<%@ page import="seunghwang.bms.book.dao.DetailDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.DetailService" %>
<%@ page import="seunghwang.bms.book.service.DetailServiceImpl" %>

<!-- 2017 04 24 추가됨 -->
<%@ page import="seunghwang.bms.review.dao.mapper.ReviewMapper" %>
<%@ page import="seunghwang.bms.review.domain.Review" %>
<%@ page import="seunghwang.bms.review.dao.ReviewDao" %>
<%@ page import="seunghwang.bms.review.dao.ReviewDaoImpl" %>
<%@ page import="seunghwang.bms.review.service.ReviewService" %>
<%@ page import="seunghwang.bms.review.service.ReviewServiceImpl" %>
<%@ page import="java.util.List" %>

<!-- 2017 04 25 추가됨  -->
<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String bookId = request.getParameter("bookId");
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	DetailMapper detailMapper = Configuration.getMapper(DetailMapper.class);
	DetailDao detailDao = new DetailDaoImpl(detailMapper);
	DetailService detailService = new DetailServiceImpl(detailDao);
	
	Book book = bookService.searchBook(bookId);
	Detail bookDetail = detailService.searchDetail(bookId);
	
	//리뷰 기능
	ReviewMapper reviewMapper = Configuration.getMapper(ReviewMapper.class);
	ReviewDao reviewDao = new ReviewDaoImpl(reviewMapper);
	ReviewService reviewService = new ReviewServiceImpl(reviewDao);
	List<Review> reviews = reviewService.getBookReviews(bookId);

	
	//리뷰 수정 삭제를 위한 로그인 체크 기능
	HttpSession sess = request.getSession(false);
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
  	.container-fluid{width: 1580px;	max-width: none !important;	}
  	.table {max-width: none !important; max-height: none !important;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
      body {position: relative;}
	#bookImg{float: left; max-width: none !important;}
	#bookDetailSection{float: left; margin-left: 30px; margin-top: 20px; color: black; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 16px;max-width: none !important;}
	#bookZoomin{margin-left: 60px;}
	#book_detail_title{font-size: 26px;}
	#bookdetail_buytable{padding-top: 25px; padding-left: 40px; }
	#bookdetail_table{border-bottom: 1px solid #ddd; margin-top: 50px;}
	#buyButt{margin-left: 380px;}
	#buttSize1{width: 50px; height:40px; font-size:18px; color: #d43f3a; }
	#buttSize2{height: 40px; width: 80px;}
	#bookGuide{width: 900px; margin-top: 10px;}
	#bookGuide2{width: 900px; margin-top: 50px;}
	#bookGuide2 pre{padding-left: 50px; height: 160px;}
	#bookGuide3{width: 900px; margin-top: 50px;}
	#bookGuide3 h3{border-bottom: 2px solid #ddd; height: 40px;}
	#bookGuide4{width: 900px; margin-top: 50px;}
	#bookGuide4 h3{border-bottom: 2px solid #ddd; height: 40px;}
	#bookGuide5{width: 900px; margin-top: 50px;}
	#bookGuide5 h3{border-bottom: 2px solid #ddd; height: 40px;}
	#bookGuide6{width: 900px; margin-top: -40px;}
	#bookGuide6 h3{border-bottom: 2px solid #ddd; height: 40px;}
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
.form-control{width: 100px;}
.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
.bookguide_left{float: left;}
.bookguide_left h2{margin-top: 0px; margin-left: 15px;}
.bookguide_right{margin-left: 130px;}
textarea{width: 600px; height: 60px; resize:none;}
.review_write{margin-left: 600px; margin-top: 10px; height: 30px;}
.panel-right{margin-top: -16px; margin-left: 480px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); font-size: 20px;}
.panel-right p{float: right; margin-right: 10px; font-size: 15px; margin-top: 3px; filter: drop-shadow(0 0px 0px rgba(0, 0, 0, 0));}
.panel-default>.panel-heading {
    background-color: #F6F6F6;
}
.panel-group{
	margin-bottom: 0px;
}
#reviewTitle{width: 700px;}
#reviewContent{width: 700px;}
.reviewRemoveBtn{margin-left: 810px;}
  </style>
</head>
<body>
	<div class="container-fluid" id="bookGuide">
	<a class="navbar-brand" data-toggle="modal" data-target="#bookDetail">
			<img src="../img/bookUpload/<%=book.getBookImage() %>" width="200px" height="300px" id="bookImg"/>
		</a>
		<div class="modal fade" id="bookDetail">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">책 이미지</h4>
        </div>
        <div class="modal-body">
        	<img src="../img/bookUpload/<%=book.getBookImage() %>" width="450px" height="500px" id="bookZoomin"/>
        </div>
        <div class="modal-footer">
        </div>
      </div>      
    </div>
  </div>
  <div id="bookDetailSection">
			<p id="book_detail_title"><%= book.getBookName() %></p>
			<p>추천: 0</p>
			<p>도서정보<br>
			출판사:<%= book.getBookPublisher() %> | 출간일: <%= book.getPublicationDate() %> | <%= book.getBookETC() %></p>
			<table class="table" id="bookdetail_table">
				<tr>
					<td rowspan="2" id="bookdetail_buytable">구매</td>
					<td>정가</td>
					<td><%= book.getBookPrice() %></td>
				</tr>
				<tr>
					<td>판매가</td>
					<td><%= (int)(0.9*book.getBookPrice()) %>(10%↓)</td>
				</tr>
			</table>
			<div id="buyButt">
				<form method="post">
					<input type="hidden" name="bookId" value="<%=book.getBookId() %>">
					<input type="hidden" name="bookPrice" value="<%=book.getBookPrice() %>">
					<input type="hidden" name="bookAmount" value="1">
					<input type="hidden" name="length0" value="0">
					<button type="button" id="buttSize1" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span></button>
					<button type="submit" id="buttSize1" class="btn btn-default" formaction="../order/addCart.ct"><span class="glyphicon glyphicon-shopping-cart"></span></button>
					<button type="submit" id="buttSize2" class="btn btn-danger" formaction="../order/getOrder.do">구매하기</button>					
				</form>
			</div>
		</div>
	</div>
	<div class="container-fluid" id="bookGuide2">
		<pre>
[도서 안내] 
본 도서는 이번 주 주말의 쿨딜 이벤트 기간 동안만 50% 할인된 10년 대여가로 판매됩니다. 
이벤트 종료 후에는 대여가 불가능하오니, 도서 이용에 참고 부탁드립니다.

※ 대여한 시점부터 10년 동안 읽으실 수 있습니다. 
※ 본 합본의 낱권 도서를 이미 구매하셨을 경우, 본 도서를 대여해도 쿠폰 등으로 대체 지급되지 않습니다.
		</pre>
	</div>
	<div class="container-fluid" id="bookGuide4">
		<h3>책 소개</h3>
<% 
	String detailBook = bookDetail.getDetailBook().replaceAll("\r\n", "<br>");
	String detailWriter = bookDetail.getDetailWriter().replaceAll("\r\n", "<br>");
	String detailReview = bookDetail.getDetailReview().replaceAll("\r\n", "<br>");
	String detailChapter = bookDetail.getDetailChapter().replaceAll("\r\n", "<br>");
%>		
		<%= detailBook %>
	</div>
	<div class="container-fluid" id="bookGuide3">
		<h3>저자소개</h3>
		<%= detailWriter %>
	</div>
	<div class="container-fluid" id="bookGuide4">
		<h3>출판사 서평</h3>
		<%= detailReview %>
	</div>
	<div class="container-fluid" id="bookGuide4">
		<h3>목차</h3>
		<%= detailChapter %>
	</div>
	<div class="container-fluid" id="bookGuide5">
		<h3>리뷰</h3>
	<form action="addReviewProc.jsp" method="post">
	<div class="bookguide_left">
		구매자 평점
		<div class="form-group">
			<label for="sell">평점을 매겨주세요</label>
				<select class="form-control" id="sell" name="reviewGrade">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>				
			</select>
		</div>
		</div>
	<div class="bookguide_right">
	
		<input type="hidden" name="bookId" value="<%=bookId%>">
		<input type="hidden" name="bookName" value="<%=book.getBookName()%>">
		<div class="form-group">
			제목
			<textarea class="form-control" rows="1" name="reviewTitle"id="reviewTitle" placeholder="리뷰 제목을 입력해주세요."></textarea>	
			내용
			<textarea class="form-control" rows="5" name="reviewContent" id="reviewContent" placeholder="리뷰 내용을 입력해주세요. 제목과 내용을 입력하지 않으면 리뷰가 등록되지 않습니다."></textarea>
			<input type="submit" class="btn btn-default review_write" value="리뷰 남기기"/>
			
		</div>
		</div>
	</form>
</div>




	<div class="container-fluid" id="bookGuide6">
		<h3>리뷰 보기</h3>
		
      

<% 
	if(reviews.size()!=0){
		for(Review review:reviews){
%>
<div class="panel-group">
    <div class="panel panel-default">
			<div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#<%= review.getReviewId()%>"><%= review.getReviewTitle() %></a>
          <div class="panel-right">
          	아이디: <%= review.getUserId() %>
          	평점: <%= review.getReviewGrade() %> 
          	<p><%= review.getRegDate() %></p> 
          </div>
        </h4>
      </div>
      <div id="<%= review.getReviewId()%>" class="panel-collapse collapse">
        <div class="panel-body"><%= review.getReviewContent().replaceAll("\r\n", "<br>") %></div>
        <% 	
        	String userId = "";
        if (sess != null && sess.getAttribute("authUser") != null){	
        	User user = (User)sess.getAttribute("authUser");
    		userId = user.getUserId();
        }else{ userId = "";}
   	    	if(userId.equals(review.getUserId())){
        %>
        <button type="button" class="btn btn-default reviewRemoveBtn" onclick="location.href='delReviewProc.jsp?reviewId=<%= review.getReviewId()%>&bookId=<%=bookId%>&userId=<%=review.getUserId()%>'">삭제</button>
       <% }
        	
       	%>
       
       
      </div>
    </div>
    </div>
<%	
		}
%>

<%
	}else{
%>
	<h2>리뷰가 없습니다.</h2>
<% 
	}
%>
</div>
</body>
</html>
