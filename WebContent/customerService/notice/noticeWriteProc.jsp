<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.notice.domain.Notice"%>
<%@ page import="seunghwang.bms.customerService.notice.dao.NoticeDao"%>
<%@ page import="seunghwang.bms.customerService.notice.dao.NoticeDaoImpl"%>
<%@ page import="seunghwang.bms.customerService.notice.service.NoticeService"%>
<%@ page import="seunghwang.bms.customerService.notice.service.NoticeServiceImpl"%>
<%
	request.setCharacterEncoding("utf-8");
	NoticeDao noticeDao = new NoticeDaoImpl();
	NoticeService noticeService = new NoticeServiceImpl(noticeDao);
	String noticeTitleName = request.getParameter("noticeTitle");
	String noticeContentName = request.getParameter("noticeContent");
	
	if(noticeTitleName==null || noticeContentName==null){
		noticeTitleName=null;
		noticeContentName=null;
	}else{
		Notice notice = new Notice(noticeTitleName, noticeContentName, 0);
		noticeService.addNotice(notice);
	}
	response.sendRedirect("noticeList.jsp");
%>