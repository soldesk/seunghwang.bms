<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDao"%>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryService" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryServiceImpl" %>
<%@ page import="seunghwang.bms.customerService.inquiry.domain.Inquiry" %>
<%
	request.setCharacterEncoding("utf-8");
	InquiryDao inquiryDao = new InquiryDaoImpl();
	InquiryService inquiryService = new InquiryServiceImpl(inquiryDao);
	
	String inquiryId = request.getParameter("inquiryId");
	String inquiryTitle = request.getParameter("inquiryTitle");
	String userEmail = request.getParameter("userEmail");
	int idx = userEmail.indexOf("@");
	String mail1 = userEmail.substring(0,idx);
	String mail2 = userEmail.substring(idx+1);
	
	String inquiryCategory = request.getParameter("inquiryCategory");
	String inquiryContent = request.getParameter("inquiryContent");
	int inquiryIdNo = Integer.parseInt(inquiryId);
	
	
	if(inquiryId==null || inquiryTitle==null || inquiryContent==null){
		inquiryId="";
		inquiryTitle="";
		inquiryContent="";
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
  <script src="../lib/jquery.js"></script>
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
#title{width: 500px; margin-left: 40px;}
#noticeWriteSection input[type=file]{margin-left: 40px; margin-top: 0px;}
#noticeWriteSection textarea{width: 800px; height: 400px; resize : none;}
#write_button {margin-left: 690px; margin-top: 20px;}
.selectSearch{margin-left: 40px; height: 20px;}
#mail{width: 200px; margin-left: 40px;}
#mail2{width: 200px;}
#selectHeight{width: 150px; height: 27px;}
  </style>
</head>
<body>
<div id="noticeWriteSection" class="container-fluid">
	<h3 id="freeBoard_title">자주묻는질문</h3>
	<div id="freeboard_write">
		<form action="inquiryModProc.jsp?inquiryId=<%=inquiryId %>" method="post">
			<table class="table table-hover">
							<tbody>
								<tr>
									<td>제목</td>
									<td>
										<input type="text" placeholder="게시글 제목을 입력하세요." id="title" name="inquiryTitle" value="<%=inquiryTitle %>" required/>
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>
										<input type="text" placeholder="이메일 ID를 입력하세요." name="userEmail" id="mail" value="<%=mail1 %>" required/>@
										<input type="text" name="userEmail2" id="mail2"  disabled value="<%=mail2%>"/>
										<select class="emailSelect" name="userEmail3" id="selectHeight">
											<option value="naver.com" <%if(mail2.equals("naver.com")){ %>selected<%}%>>naver.com</option>
											<option value="daum.net" <%if(mail2.equals("daum.net")){ %>selected<%}%>>daum.net</option>
											<option value="gmail.com" <%if(mail2.equals("gmail.com")){ %>selected<%}%>>gmail.com</option>
											<option value="nate.com" <%if(mail2.equals("nate.com")){ %>selected<%}%>>nate.com</option>
											<option value="korea.com" <%if(mail2.equals("korea.com")){ %>selected<%}%>>korea.com</option>
											<option value="1">직접입력</option>
										</select>
									</td>
								</tr>
								<script>
								  $('.emailSelect').change(function(){
									   $(".emailSelect option:selected").each(function () {
									        
									        if($(this).val()== '1'){ //직접입력일 경우
									             $("#mail2").val('');//값 초기화
									             $("#mail2").attr("disabled",false); //활성화
									        }else{ //직접입력이 아닐경우
									             $("#mail2").val($(this).text());      //선택값 입력
									             $("#mail2").attr("disabled",true); //비활성화
									        }
									   });
									});
								  </script>
								<tr>
									<td>카테고리</td>
									<td>
										<select class="selectSearch" name="inquiryCategory" id="selectHeight">
											<option <%if(inquiryCategory.equals("회원")){ %>selected<%}%>>회원</option>
											<option <%if(inquiryCategory.equals("주문")){ %>selected<%}%>>주문</option>
											<option <%if(inquiryCategory.equals("책")){ %>selected<%}%>>책</option>
											<option <%if(inquiryCategory.equals("시스템")){ %>selected<%}%>>시스템</option>
										</select>
									</td>
								</tr>
							</tbody>
								</tbody>
						</table>
			<%inquiryContent = inquiryContent.replaceAll("<br>","\r\n");%>
		<textarea name="inquiryContent" required><%=inquiryContent %></textarea>
			<%inquiryContent = inquiryContent.replaceAll("\r\n","<br>");%>
		<div id="write_button"><button type="submit" class="btn btn-default">완료</button>  
		<button type="button" class="btn btn-default" onclick="location.href='inquiryList.jsp'">목록</button></div>
		</form>
	</div>
</div>
</body>
</html>