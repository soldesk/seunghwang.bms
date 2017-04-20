<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDao" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqService" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqServiceImpl" %>
<%@ page import="seunghwang.bms.customerService.faq.domain.Faq" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	FaqDao faqDao = new FaqDaoImpl();
	FaqService faqService = new FaqServiceImpl(faqDao);
	
	String faqId = request.getParameter("faqId");
	String faqTitle = request.getParameter("faqTitle");
	String faqCategory = request.getParameter("faqCategory");
	String faqContent = request.getParameter("faqContent");
	
	if(faqId==null || faqTitle==null || faqContent==null){
		faqId="";
		faqTitle="";
		faqContent="";
	}else{
		
	}
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
      #noticeWriteSection {height: 710px;color: black; background-color: white;}
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
#freeboard_write{margin-left: 350px; margin-top: 30px; border: 1px solid #eee; width: 850px; padding: 20px;}
#noticeWriteSection input[type=text]{width: 500px; margin-left: 40px;}
#noticeWriteSection input[type=file]{margin-left: 40px; margin-top: 0px;}
#noticeWriteSection textarea{width: 800px; height: 400px; resize : none;}
#write_button {margin-left: 690px; margin-top: 20px;}
.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}
	.selectSearch{margin-left: 40px; height: 20px;}
  </style>
</head>
<body>
<div id="noticeWriteSection" class="container-fluid">
	<h3 id="freeBoard_title">자주묻는질문</h3>
	<div id="freeboard_write">
		<form action="faqModProc.jsp?faqId=<%=faqId %>" method="post">
			<table class="table table-hover">
							<tbody>
								<tr>
									<td>제목</td>
									<td>
										<input type="text" placeholder="게시글 제목을 입력하세요." name="faqTitle" value="<%=faqTitle %>" required/>
									</td>
								</tr>
								<tr>
									<td>카테고리</td>
									<td>
										<select class="selectSearch" name="faqCategory">
											<option <%if(faqCategory.equals("회원")){ %>selected<%}%>>회원</option>
											<option <%if(faqCategory.equals("주문")){ %>selected<%}%>>주문</option>
											<option <%if(faqCategory.equals("책")){ %>selected<%}%>>책</option>
											<option <%if(faqCategory.equals("시스템")){ %>selected<%}%>>시스템</option>
										</select>
									</td>
								</tr>
							</tbody>
								</tbody>
						</table>
			<%faqContent = faqContent.replaceAll("<br>","\r\n");%>
		<textarea name="faqContent" required><%=faqContent %></textarea>
			<%faqContent = faqContent.replaceAll("\r\n","<br>");%>
		<div id="write_button"><button type="submit" class="btn btn-default">완료</button>  
		<button type="button" class="btn btn-default" onclick="location.href='faqList.jsp'">목록</button></div>
		</form>
	</div>
</div>
</body>
</html>