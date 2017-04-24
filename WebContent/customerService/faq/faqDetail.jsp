<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.faq.domain.Faq" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDao" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqService" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqServiceImpl" %>
<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	FaqDao faqDao = new FaqDaoImpl();
	FaqService faqService = new FaqServiceImpl(faqDao);
	HttpSession sess = request.getSession(false);
	
	String faqId = request.getParameter("faqId");
	String faqTitle = request.getParameter("faqTitle");
	String faqCategory = request.getParameter("faqCategory");
	String faqContent = request.getParameter("faqContent");
	String readCnt = request.getParameter("readCnt");
	
	if(faqTitle==null)
		faqTitle="없음";
	if(faqContent==null)
		faqContent="없음";
	int faqIdNo = Integer.parseInt(faqId);
	int count = Integer.parseInt(readCnt);
	Faq faq = new Faq();
	faq.setFaqId(faqIdNo);
	faq.setReadCnt(++count);
	faqService.visitCnt(faq);
%>

<html lang="ko">
<head>
  <title>BookKing</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>/*상징색 hotpink */
  	.container-fluid{width: 1580px;	max-width: none !important;	background-color: hotpink;}
  	.table {max-width: none !important; max-height: none !important;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
      body {position: relative;}
      #boardDetailSection {height: 710px;color: black; background-color: white;}
      a {display:inline; color:white; font-size: 20px; filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3));}
      a:hover{text-decoration: none;}
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
#boardDetailSection input[type=text]{width: 500px; margin-left: 40px;}
#boardDetailSection input[type=file]{margin-left: 80px; margin-top: -20px;}
#boardDetailSection textarea{width: 600px; height: 60px; resize:none;}
hr{margin-top: -35px; border-top: 2px solid #D5D5D5; width: 700px; margin-left: 0px;}
#freeboard_read p{font-weight: bold; font-size: 20px; color: #747474;}
#inbox{margin-top: 50px; width: 717px;}
#write_button {margin-left: 930px; margin-top: 30px;}
.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
	color: black;
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
#controlDiv button{height: 30px;}
#btnPos{margin-left: 1045px; margin-top: -55px;}
  </style>
</head>
 
<body>
<div id="boardDetailSection" class="container-fluid">
	<h3 id="freeBoard_title">자주묻는질문</h3>
	<div id="freeboard_read">
		<h4>[<%=faqCategory %>]</h4>
		<p><%=faqTitle %></p><br><br>
		<hr>
		<div id="inbox"><%=faqContent%></div><br><br>

	</div>
	<br>
		<div id="write_button">
		<%
		if(sess == null || sess.getAttribute("authUser") != null){ 
		if(sess.getAttribute("authUser").getClass().getSimpleName().equals("Admin")){ 
		%>
			<button type="button" class="btn btn-default" onclick="location.href='faqUpdate.jsp?faqId=<%=faqId%>&faqTitle=<%=faqTitle %>&faqCategory=<%=faqCategory %>&faqContent=<%=faqContent%>'">수정</button>
			<button type="button" class="btn btn-default" onclick="location.href='faqDelProc.jsp?faqId=<%=faqId%>'">삭제</button>
		<%
		}
	}
	%>
	</div>
			<button type="button" class="btn btn-default" id="btnPos" onclick="location.href='faqList.jsp'">목록</button>
<br><br>
</div>
</body>
</html>