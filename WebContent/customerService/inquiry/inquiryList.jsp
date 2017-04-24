<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.inquiry.domain.Inquiry" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDao" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryService" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>
<!DOCTYPE html>
<%!
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	InquiryDao inquiryDao = new InquiryDaoImpl();
	InquiryService inquiryService = new InquiryServiceImpl(inquiryDao);
	List<Inquiry> inquiries = inquiryService.listInquiries();
	List<Inquiry> searchInquiries =(List)request.getAttribute("searchInquiries");
	HttpSession sess = request.getSession(false);
	
	int pageno = toInt(request.getParameter("pageno"));
	if(pageno<1){//현재 페이지
		pageno = 1;
	}
	int total_record = inquiries.size(); //총 레코드 수
	int page_per_record_cnt = 5;  //페이지 당 레코드 수
	int group_per_page_cnt = 5;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
//					  									  [6],[7],[8],[9],[10]											

	int record_end_no = pageno*page_per_record_cnt;				
	int record_start_no = record_end_no-(page_per_record_cnt-1);
	if(record_end_no>total_record){
		record_end_no = total_record;
	}
										   
	int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
	if(pageno>total_page){
		pageno = total_page;
	}

// 	현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
	int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
//		현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)	
//	ex) 	14		=	13(몫)		=	 (66 / 5)		1	(1(나머지) =66 % 5)			  
	
	int page_eno = group_no*group_per_page_cnt;		
//		현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
//	ex) 	70		=	14	*	5
	int page_sno = page_eno-(group_per_page_cnt-1);	
// 		현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
//	ex) 	66	=	70 - 	4 (5 -1)
	
	if(page_eno>total_page){
//	   현재 그룹 끝 번호가 전체페이지 수 보다 클 경우		
		page_eno=total_page;
//	   현재 그룹 끝 번호와 = 전체페이지 수를 같게
	}
	
	int prev_pageno = page_sno-group_per_page_cnt;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
//		이전 페이지 번호	= 현재 그룹 시작 번호 - 페이지당 보여줄 번호수	
//	ex)		46		=	51 - 5				
	int next_pageno = page_sno+group_per_page_cnt;	// <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
//		다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
//	ex)		56		=	51 - 5
	if(prev_pageno<1){
//		이전 페이지 번호가 1보다 작을 경우		
		prev_pageno=1;
//		이전 페이지를 1로
	}
	if(next_pageno>total_page){	
//		다음 페이지보다 전체페이지 수보가 클경우		
		next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
//		next_pageno=total_page
//		다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
//	ex)			   = 	76 / 5 * 5 + 1	???????? 		
	}
	// [1][2][3].[10]
	// [11][12]
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
  	.table {max-width: none !important; max-height: none !important;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
      body {position: relative;}
      #noticeSection {height: 600px;color: black; background-color: white;}
	#board_table{width: 900px; margin-left: 350px;}
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
	#pageBoard{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); margin-left: 650px; margin-top: -20px; height: 70px;}
	#selectBoard{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); margin-left: 630px; width: 300px;}
	#buttonBoardWrite{margin-top: 70px; margin-left: 470px;}
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
#selectBoard input[type=text]{height: 30px;}
tr{cursor: pointer;}
.form-group input[type=text]{
	border-top-left-radius: .5em; /*왼쪽 상단 코너를 부드럽게 */
	border-bottom-left-radius: .5em; /*왼쪽 하단 코너를 부드럽게*/
	border-top-right-radius: .5em; /*오른족 상단 코너를 부드럽게*/
	border-bottom-right-radius: .5em; /*오른쪽 하단 코너를 부드럽게*/
	border: 1px solid #ccc;
	padding-left: 15px;
	height: 27px;
}	
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    background-color: hotpink;
    border-color: hotpink;
    color: white;
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
#notice_hover{background-color: white; color: hotpink; border: 1px solid white;}
.tdTitle{width: 400px;}
  </style>
</head>
<body>
<div id="noticeSection" class="container-fluid">
	<h3 id="freeBoard_title">1:1 묻고답하기</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" href="../faq/faqList.jsp">자주묻는질문</a>
        </h4>
      </div>
    </div>
    <div class="panel panel-default" id="notice_hover">
      <div class="panel-heading" id="notice_hover">
        <h4 class="panel-title" id="notice_hover">
          <a class="list-group-item category_accordion_button notice_hover" href="../inquiry/inquiryList.jsp" id="notice_hover">1:1 묻고답하기</a>
        </h4>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button" href="../notice/noticeList.jsp">공지사항</a>
        </h4>
      </div>
    </div>
  </div>
		</div>
	</div><br>
	<%
		if (sess == null || sess.getAttribute("authUser") == null){ //로그인 안됐을 시
	%>
		<script>
			alert("로그인해주세요");
			location.href="/seunghwang.bms/main.jsp";
		</script>
	<%}	else if(sess.getAttribute("authUser").getClass().getSimpleName().equals("Admin")){	
		if(searchInquiries==null){
			if(inquiries.size() != 0){ 
	%>
		<table class="table table-hover" id="board_table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>일시</th>
					<th>종류</th>
				</tr>
			</thead>
			<tbody>
			<%
				
				for(int i=0; i<inquiries.size(); i++){
					int inquiryPage=(i/5)+1;
					
					if(pageno==inquiryPage){
						String inquiryContent = inquiries.get(i).getInquiryContent().replaceAll("\r\n", "<br>"); 
			%>
				<tr onclick="location.href='inquiryDetail.jsp?inquiryId=<%=inquiries.get(i).getInquiryId()%>&inquiryTitle=<%=inquiries.get(i).getInquiryTitle()%>&inquiryContent=<%=inquiryContent%>&userId=<%=inquiries.get(i).getUserId()%>&inquiryCategory=<%=inquiries.get(i).getInquiryCategory()%>&userEmail=<%=inquiries.get(i).getUserEmail()%>'">
					<td><%=inquiries.get(i).getInquiryId() %></td>
					<td class="tdTitle"><%=inquiries.get(i).getInquiryTitle() %></td>
					<td><%=inquiries.get(i).getUserId() %></td>
					<td><%=inquiries.get(i).getRegDate() %></td>
					<td><%=inquiries.get(i).getInquiryCategory() %></td>
				</tr>
			<%
					}
				}
			%>
			</tbody>
		</table>
		<%}else{ %>
		<p>게시물이 없습니다</p>
		<%} %>
	<div id="pageBoard">
		<ul class="pagination pagination-sm">
			<li><a href="inquiryList.jsp?pageno=1"><<</a></li>
			<li><a href="inquiryList.jsp?pageno=<%=prev_pageno%>">이전</a></li>
			<% for(int i=page_sno; i<=page_eno;i++){ %>
			<li><a href="inquiryList.jsp?pageno=<%=i%>">
				<%if(pageno ==i ){ %>
					[<%=i %>]
					<%}else{ %>
					<%=i %>
					<%} %>
			</a></li>
			<%} %>
			<li><a href="inquiryList.jsp?pageno=<%=next_pageno%>">다음</a></li>
			<li><a href="inquiryList.jsp?pageno=<%=total_page%>">>></a></li>
		</ul>
	</div>
	<%
		}else if(searchInquiries!=null){
			if(searchInquiries.size() != 0){ 
	%>
		<table class="table table-hover" id="board_table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>일시</th>
					<th>종류</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Inquiry inquiry:searchInquiries){ 
					String inquiryContent = inquiry.getInquiryContent().replaceAll("\r\n", "<br>"); 
			%>
				<tr onclick="location.href='inquiryDetail.jsp?inquiryId=<%=inquiry.getInquiryId()%>&inquiryTitle=<%=inquiry.getInquiryTitle()%>&inquiryContent=<%=inquiryContent%>&userId=<%=inquiry.getUserId()%>&inquiryCategory=<%=inquiry.getInquiryCategory()%>&userEmail=<%=inquiry.getUserEmail()%>'">
					<td><%=inquiry.getInquiryId() %></td>
					<td class="tdTitle"><%=inquiry.getInquiryTitle() %></td>
					<td><%=inquiry.getUserId() %></td>
					<td><%=inquiry.getRegDate() %></td>
					<td><%=inquiry.getInquiryCategory() %></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<%}else{ %>
		<p>게시물이 없습니다</p>
		<%} %>
		
	<%}%>
	<form action="inquirySearchProc.jsp" method="post">
		<div id="selectBoard">
			제목: <input type="text" name="searchInquiryTitle" placeholder=" 찾을 글 제목" required/>
			<button type="submit" class="btn btn-default">검색</button>
		</div>
	</form>
	<%	}else if(sess.getAttribute("authUser")!=null){
			 User user = (User)sess.getAttribute("authUser"); 
			List<Inquiry> userInquiries = inquiryService.userInquiries(user.getUserId());
			if(userInquiries.size() != 0){
	%>
		<table class="table table-hover" id="board_table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>일시</th>
					<th>종류</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Inquiry inquiry:userInquiries){
						String inquiryContent = inquiry.getInquiryContent().replaceAll("\r\n", "<br>"); 
			%>
				<tr onclick="location.href='inquiryDetail.jsp?inquiryId=<%=inquiry.getInquiryId()%>&inquiryTitle=<%=inquiry.getInquiryTitle()%>&inquiryContent=<%=inquiryContent%>&userId=<%=inquiry.getUserId()%>&inquiryCategory=<%=inquiry.getInquiryCategory()%>&userEmail=<%=inquiry.getUserEmail()%>'">
					<td><%=inquiry.getInquiryId() %></td>
					<td><%=inquiry.getInquiryTitle() %></td>
					<td><%=inquiry.getUserId() %></td>
					<td><%=inquiry.getRegDate() %></td>
					<td><%=inquiry.getInquiryCategory() %></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<%}else{ %>
		<p>본인이 작성한 게시물이 없습니다</p>
		<%}%>
	<div id="pageBoard">
		<button type="button" class="btn btn-danger" id="buttonBoardWrite" onclick="location.href='inquiryWrite.jsp'">글쓰기</button>
	</div>	
	<%} %>
</div>
</body>
</html>