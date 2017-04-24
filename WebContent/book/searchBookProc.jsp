<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="seunghwang.bms.admin.domain.Admin" %>
<%@ page import= "seunghwang.bms.login.domain.User" %>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper" %>
<%@ page import="seunghwang.bms.book.dao.BookDao" %>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.BookService" %>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String searchType = request.getParameter("searchType");
	String searchBook = request.getParameter("searchBook");
	
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	Map map = new HashMap<String,String>();
	map.put("searchType",searchType);
	map.put("searchBook",searchBook);
	
	List<Book> books = bookService.findBooks(map);
	
	request.setAttribute("searchBooks", books);
%>
<jsp:forward page="bookManage.jsp"/>

