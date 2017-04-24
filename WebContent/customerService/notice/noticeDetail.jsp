<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.notice.domain.Notice" %>
<%@ page import="seunghwang.bms.customerService.notice.dao.NoticeDao" %>
<%@ page import="seunghwang.bms.customerService.notice.dao.NoticeDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.notice.service.NoticeService" %>
<%@ page import="seunghwang.bms.customerService.notice.service.NoticeServiceImpl" %>
<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("utf-8");
	NoticeDao noticeDao = new NoticeDaoImpl();
	NoticeService noticeService = new NoticeServiceImpl(noticeDao);
	HttpSession sess = request.getSession(false);
	
	String noticeId = request.getParameter("noticeId");
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String readCnt = request.getParameter("readCnt");
	
	if(noticeTitle==null)
		noticeTitle="없음";
	if(noticeContent==null)
		noticeContent="없음";
	int noticeIdNo = Integer.parseInt(noticeId);
	int count = Integer.parseInt(readCnt);
	Notice notice = new Notice();
	notice.setNoticeId(noticeIdNo);
	notice.setReadCnt(++count);
	noticeService.visitCnt(notice);
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
hr{margin-top: -35px; border-top: 2px solid #D5D5D5; width: 700px; margin-left: 0px;}
#freeboard_read p{font-weight: bold; font-size: 20px; color: #747474;}
#inbox{margin-top: 50px; height: 100px;}
#write_button {margin-left: 840px; margin-top: 30px;}
.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
#controlDiv{
	font-weight: bold; 
	margin-left: 500px; 
	border: 1px solid hotpink;
	width: 230px; 
	color: hotpink; 
	height: 40px; 
	padding-left: 10px; 
	padding-top: 5px;
	border-top-left-radius: 1em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: 1em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: 1em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: 1em; /*오른쪽 하단 코너를 부드럽게*/
	}
#btnPos{margin-left: 1040px; margin-top: -55px;}
  </style>
</head>
 
<body>
<div id="noticeDetailSection" class="container-fluid">
	<h3 id="freeBoard_title">공지사항</h3>
	<div id="freeboard_read">
		<p><%=noticeTitle %></p><br><br>
		<hr>
		<div id="inbox"><%=noticeContent %></div><br><br>
		</div>
		<br>
		<div id="write_button">
		<%
			if(sess == null || sess.getAttribute("authUser") != null){ 
			if(sess.getAttribute("authUser").getClass().getSimpleName().equals("Admin")){ 
		%>
			<button type="button" class="btn btn-default" onclick="location.href='noticeWrite.jsp'">글쓰기</button>
			<button type="button" class="btn btn-default" onclick="location.href='noticeUpdate.jsp?noticeId=<%=noticeId %>&noticeTitle=<%=noticeTitle%>&noticeContent=<%=noticeContent%>'">수정</button>
			<button type="button" class="btn btn-default" onclick="location.href='noticeDelProc.jsp?noticeId=<%=noticeId%>'">삭제</button>
			<%
		}
	}
	%>
		</div>
			<button type="button" class="btn btn-default" id="btnPos" onclick="location.href='noticeList.jsp'">목록</button>
	</div>
</body>
</html>