<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.inquiry.domain.Inquiry" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDao" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryService" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryServiceImpl" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	InquiryDao inquiryDao = new InquiryDaoImpl();
	InquiryService inquiryService = new InquiryServiceImpl(inquiryDao);
	
	String inquiryId = request.getParameter("inquiryId");
	String inquiryTitle = request.getParameter("inquiryTitle");
	String inquiryContent = request.getParameter("inquiryContent");
	String userId = request.getParameter("userId");
	String inquiryCategory = request.getParameter("inquiryCategory");
	String userEmail = request.getParameter("userEmail");
%>
<html lang="ko">
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>/*상징색 hotpink #ED4C00*/
  	.container-fluid{width: 1580px;	max-width: none !important;	background-color: hotpink;}
  	.table {max-width: none !important; max-height: none !important;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
      body {position: relative;}
      #noticeDetailSection {height: 710px;color: black; background-color: white;}
	#freeBoard_title{margin-left: 350px; filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, .3)); width: 150px; height: 30px; padding-top: 5px; text-align: center;
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
#freeboard_read{margin-left: 350px; margin-top: 30px; border: 1px solid #eee; width: 760px; padding:20px;}
#noticeDetailSection input[type=text]{width: 500px; margin-left: 40px;}
#noticeDetailSection input[type=file]{margin-left: 80px; margin-top: -20px;}
#noticeDetailSection textarea{width: 600px; height: 60px; resize:none;}
#freeboard_read button{margin-top: -50px; height: 60px;}
hr{margin-top: -35px; border-top: 2px solid #D5D5D5; width: 700px; margin-left: 0px;}
#freeboard_read p{font-weight: bold; font-size: 20px; color: #747474;}
#inbox{margin-top: 50px; height: 100px;}
#write_button {margin-left: 830px; margin-top: 30px;}
.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
  </style>
</head>
 
<body>
<div id="noticeDetailSection" class="container-fluid">
	<h3 id="freeBoard_title">1:1 묻고답하기</h3>
	<div id="freeboard_read">
		<h4>[<%=inquiryCategory %>]</h4>
		<p><%=inquiryTitle %></p><h5><%=userEmail %></h5><br><br>
		<hr>
		<div id="inbox"><%=inquiryContent %></div><br><br>
	</div>
	<div id="write_button">
		<button type="button" class="btn btn-default" onclick="location.href='inquiryAnswer.jsp?inquiryId=<%=inquiryId%>&userEmail=<%=userEmail%>'">답변하기</button>
		<button type="button" class="btn btn-default" onclick="location.href='inquiryUpdate.jsp?inquiryId=<%=inquiryId%>&inquiryTitle=<%=inquiryTitle%>&userEmail=<%=userEmail%>&inquiryCategory=<%=inquiryCategory%>&inquiryContent=<%=inquiryContent%>'">수정</button>
		<button type="button" class="btn btn-default" onclick="location.href='inquiryDelProc.jsp?inquiryId=<%=inquiryId%>'">삭제</button> 
		<button type="button" class="btn btn-default" onclick="location.href='inquiryList.jsp'">목록</button>
	</div>
</div>
</body>
</html>