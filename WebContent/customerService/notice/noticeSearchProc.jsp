<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.notice.domain.Notice" %>
<%@ page import="seunghwang.bms.customerService.notice.dao.NoticeDao" %>
<%@ page import="seunghwang.bms.customerService.notice.dao.NoticeDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.notice.service.NoticeService" %>
<%@ page import="seunghwang.bms.customerService.notice.service.NoticeServiceImpl" %>
<%@ page import="seunghwang.bms.customerService.notice.domain.Notice" %>
<%@ page import="java.util.List" %>
<%
	request.setCharacterEncoding("utf-8");
	NoticeDao noticeDao = new NoticeDaoImpl();
	NoticeService noticeService = new NoticeServiceImpl(noticeDao);
	String searchNoticeTitle = request.getParameter("searchNoticeTitle");
	
	List<Notice> notices = noticeService.searchNotices(searchNoticeTitle);
	
	request.setAttribute("searchNotices", notices);
%>
<jsp:forward page="noticeList.jsp"/>