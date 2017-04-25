<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="seunghwang.bms.customerService.faq.domain.Faq" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDao" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqService" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqServiceImpl" %>
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
	FaqDao faqDao = new FaqDaoImpl();
	FaqService faqService = new FaqServiceImpl(faqDao);
	List<Faq> faqs = faqService.listFaqs();
	List<Faq> userFaqs = faqService.userFaqs(); 
	List<Faq> orderFaqs = faqService.orderFaqs();
	List<Faq> bookFaqs = faqService.bookFaqs();
	List<Faq> systemFaqs = faqService.systemFaqs();
	List<Faq> searchFaqs =(List)request.getAttribute("searchFaqs");
	HttpSession sess = request.getSession(false);
	
	int pageno = toInt(request.getParameter("pageno"));
	if(pageno<1){//현재 페이지
		pageno = 1;
	}
	int total_record = faqs.size(); //총 레코드 수
	int page_per_record_cnt = 5;  //페이지 당 레코드 수
	int group_per_page_cnt =5;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
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
	
	//관리자기능, 회원기능 구별
%>
<html lang="ko">
<head>
  <title>BookKing</title><!-- 고객센터 -->
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>/*상징색 hotpink #ED4C00*/
  	.container-fluid{width: 1580px;	max-width: none !important;}
  	.table {max-width: none !important; max-height: none !important;}
	.table-responsive {min-height: none !important;	overflow-x: 0}
      body {position: relative;}
    #boardSection {height: 200px;color: black; background-color: white;}
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
	#selectBoard{filter: drop-shadow(0 1px 1px rgba(0, 0, 0, .3)); margin-left: 630px; margin-top: -30px; width: 380px;}
	#buttonBoardWrite{margin-top: 40px; margin-left: 500px;}
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
#board_hover{background-color: white; color: hotpink; border: 1px solid white;}
.nav-pills{width: 600px; height: 60px; margin-left: 350px;}
.tdTitle{width: 400px;}
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
    color: #fff;
    background-color: hotpink;
}
p{padding-left: 700px;}
#searchInput{padding-left: 10px;}
  </style>
</head>
<body>
<div id="boardSection" class="container-fluid">
	<h3 id="freeBoard_title">자주묻는질문</h3>
	<div class="left_subCategory">
		<div class="left_subCategory_list">
			<div class="panel-group">
    <div class="panel panel-default" id="board_hover">
      <div class="panel-heading" id="board_hover">
        <h4 class="panel-title" id="board_hover">
          <a class="list-group-item category_accordion_button"  href="../faq/faqList.jsp" id="board_hover">자주묻는질문</a>
        </h4>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button"  href="../inquiry/inquiryList.jsp">1:1 묻고답하기</a>
        </h4>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a class="list-group-item category_accordion_button"  href="../notice/noticeList.jsp">공지사항</a>
        </h4>
      </div>
    </div>
  </div>
		</div>
	</div><br>
	<%if(searchFaqs == null){ %>
	<ul class="nav nav-pills">
			<li class="active"><a data-toggle="pill" href="#home">전체</a></li>
			<li><a data-toggle="pill" href="#menu1">회원</a></li>
			<li><a data-toggle="pill" href="#menu2">주문</a></li>
			<li><a data-toggle="pill" href="#menu3">책</a></li>
			<li><a data-toggle="pill" href="#menu4">시스템</a></li>
	</ul>
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<% if(faqs.size() != 0){ %>
				<table class="table table-hover" id="board_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>카테고리</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(int i=0; i<faqs.size(); i++){
						int faqPage = (i/5)+1;
						
						if(pageno==faqPage){
							String faqContent = faqs.get(i).getFaqContent().replaceAll("\r\n", "<br>");
				%>
						<tr onclick="location.href='faqDetail.jsp?faqId=<%=faqs.get(i).getFaqId()%>&faqTitle=<%=faqs.get(i).getFaqTitle()%>&faqCategory=<%=faqs.get(i).getFaqCategory() %>&faqContent=<%=faqContent%>&readCnt=<%=faqs.get(i).getReadCnt()%>'">
							<td><%=faqs.get(i).getFaqId() %></td>
							<td class="tdTitle"><%=faqs.get(i).getFaqTitle() %></td>
							<td><%=faqs.get(i).getFaqCategory() %></td>
							<td><%=faqs.get(i).getReadCnt() %></td>
						</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>
		<%}else{ %>
		<p>게시물이 없습니다.</p>
		<%} %>
		<%if(faqs.size() != 0){ %>
		<div id="pageBoard">
			<ul class="pagination pagination-sm">
				<li><a href="faqList.jsp?pageno=1"><<</a></li>
				<li><a href="faqList.jsp?pageno=<%=prev_pageno%>">이전</a></li>
				<%for(int i =page_sno;i<=page_eno;i++){%>
				<li><a href="faqList.jsp?pageno=<%=i %>">
						<%if(pageno == i){ %>
							[<%=i %>]
						<%}else{ %>
							<%=i %>
						<%} %>
					</a></li> 
				<%} %>
				<li><a href="faqList.jsp?pageno=<%=next_pageno%>">다음</a></li>
				<li><a href="faqList.jsp?pageno=<%=total_page%>">>></a></li>
			</ul>
		</div>
		<%} %>
			</div>
			<div id="menu1" class="tab-pane fade">
				<% if(userFaqs.size() != 0){ %>
				<table class="table table-hover" id="board_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>카테고리</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Faq faq:userFaqs){ 
						String faqContent = faq.getFaqContent().replaceAll("\r\n", "<br>");
				%>
						<tr onclick="location.href='faqDetail.jsp?faqId=<%=faq.getFaqId()%>&faqTitle=<%=faq.getFaqTitle()%>&faqCategory=<%=faq.getFaqCategory() %>&faqContent=<%=faqContent%>&readCnt=<%=faq.getReadCnt()%>'">
							<td><%=faq.getFaqId() %></td>
							<td class="tdTitle"><%=faq.getFaqTitle() %></td>
							<td><%=faq.getFaqCategory() %></td>
							<td><%=faq.getReadCnt() %></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		<%}else{ %>
		<p>게시물이 없습니다.</p>
		<%} %>
			</div>
			<div id="menu2" class="tab-pane fade">
				<% if(orderFaqs.size() != 0){ %>
				<table class="table table-hover" id="board_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>카테고리</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Faq faq:orderFaqs){ 
						String faqContent = faq.getFaqContent().replaceAll("\r\n", "<br>");
				%>
						<tr onclick="location.href='faqDetail.jsp?faqId=<%=faq.getFaqId()%>&faqTitle=<%=faq.getFaqTitle()%>&faqCategory=<%=faq.getFaqCategory() %>&faqContent=<%=faqContent%>&readCnt=<%=faq.getReadCnt()%>'">
							<td><%=faq.getFaqId() %></td>
							<td class="tdTitle"><%=faq.getFaqTitle() %></td>
							<td><%=faq.getFaqCategory() %></td>
							<td><%=faq.getReadCnt() %></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		<%}else{ %>
		<p>게시물이 없습니다.</p>
		<%} %>
			</div>
			<div id="menu3" class="tab-pane fade">
				<% if(bookFaqs.size() != 0){ %>
				<table class="table table-hover" id="board_table">
				<thead>
					<tr>
					
						<th>번호</th>
						<th>내용</th>
						<th>카테고리</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Faq faq:bookFaqs){ 
						String faqContent = faq.getFaqContent().replaceAll("\r\n", "<br>");
				%>
						<tr onclick="location.href='faqDetail.jsp?faqId=<%=faq.getFaqId()%>&faqTitle=<%=faq.getFaqTitle()%>&faqCategory=<%=faq.getFaqCategory() %>&faqContent=<%=faqContent%>&readCnt=<%=faq.getReadCnt()%>'">
							<td><%=faq.getFaqId() %></td>
							<td class="tdTitle"><%=faq.getFaqTitle() %></td>
							<td><%=faq.getFaqCategory() %></td>
							<td><%=faq.getReadCnt() %></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		<%}else{ %>
		<p>게시물이 없습니다.</p>
		<%} %>
			</div>
			<div id="menu4" class="tab-pane fade">
				<% if(systemFaqs.size() != 0){ %>
				<table class="table table-hover" id="board_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>카테고리</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Faq faq:systemFaqs){ 
						String faqContent = faq.getFaqContent().replaceAll("\r\n", "<br>");
				%>
						<tr onclick="location.href='faqDetail.jsp?faqId=<%=faq.getFaqId()%>&faqTitle=<%=faq.getFaqTitle()%>&faqCategory=<%=faq.getFaqCategory() %>&faqContent=<%=faqContent%>&readCnt=<%=faq.getReadCnt()%>'">
							<td><%=faq.getFaqId() %></td>
							<td class="tdTitle"><%=faq.getFaqTitle() %></td>
							<td><%=faq.getFaqCategory() %></td>
							<td><%=faq.getReadCnt() %></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		<%}else{ %>
		<p>게시물이 없습니다.</p>
		<%
			}
		}else if(searchFaqs !=null){%>
			<div class="tab">
				<% if(searchFaqs.size() != 0){ %>
				<table class="table table-hover" id="board_table">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>카테고리</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Faq faq:searchFaqs){ 
						String faqContent = faq.getFaqContent().replaceAll("\r\n", "<br>");
				%>
						<tr onclick="location.href='faqDetail.jsp?faqId=<%=faq.getFaqId()%>&faqTitle=<%=faq.getFaqTitle()%>&faqCategory=<%=faq.getFaqCategory() %>&faqContent=<%=faqContent%>&readCnt=<%=faq.getReadCnt()%>'">
							<td><%=faq.getFaqId() %></td>
							<td class="tdTitle"><%=faq.getFaqTitle() %></td>
							<td><%=faq.getFaqCategory() %></td>
							<td><%=faq.getReadCnt() %></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		<%}else{ %>
		<p>게시물이 없습니다.</p>
		<%} %>
			</div>
		<%
			}
		%>
			</div>
		</div>
	<div id="pageBoard">
	<%
		if(sess == null || sess.getAttribute("authUser") != null){ 
		if(sess.getAttribute("authUser").getClass().getSimpleName().equals("Admin")){ 
	%>
		<!-- 관리자만 글쓰기버튼 보임. -->
		<button type="button" class="btn btn-danger" id="buttonBoardWrite" onclick="location.href='faqWrite.jsp'">글쓰기</button>
	<%
		}
	}
	%>
	</div>
	<form action="faqSearchProc.jsp" method="post">
		<div id="selectBoard">
			제목: <input type="text" id="searchInput" name="searchFaqTitle" placeholder="찾을 글 제목" required/>
			<button type="submit" class="btn btn-default">검색</button>
		</div>
	</form>
</div>
</body>
</html>