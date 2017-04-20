<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.book.domain.Book"%>
<%@ page import="seunghwang.bms.book.domain.Detail" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper"%>
<%@ page import="seunghwang.bms.config.Configuration"%>
<%@ page import="seunghwang.bms.book.dao.BookDao"%>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl"%>
<%@ page import="seunghwang.bms.book.service.BookService"%>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl"%>
<%@ page import="seunghwang.bms.book.dao.mapper.DetailMapper" %>
<%@ page import="seunghwang.bms.book.dao.DetailDao" %>
<%@ page import="seunghwang.bms.book.dao.DetailDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.DetailService" %>
<%@ page import="seunghwang.bms.book.service.DetailServiceImpl" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	DetailMapper detailMapper = Configuration.getMapper(DetailMapper.class);
	DetailDao detailDao = new DetailDaoImpl(detailMapper);
	DetailService detailService = new DetailServiceImpl(detailDao);

	String categoryId = request.getParameter("sel2");
	String bookId = request.getParameter("bookId");
	String bookName = request.getParameter("bookName");
	int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));
	String bookWriter = request.getParameter("bookWriter");
	String bookPublisher = request.getParameter("bookPublisher");
	String publicationDate = request.getParameter("publicationDate");
	double bookGrade = Double.parseDouble(request.getParameter("bookGrade"));
	String bookETC = request.getParameter("bookETC");
	int bookSale = Integer.parseInt(request.getParameter("bookSale"));
	int bookStock = Integer.parseInt(request.getParameter("bookStock"));
	String bookImage = request.getParameter("bookImage");
	
	
	String detailBook = request.getParameter("detailBook");
	String detailReview = request.getParameter("detailReview");
	String detailWriter = request.getParameter("detailWriter");
	String detailChapter = request.getParameter("detailChapter");
	
	Book book = new Book(bookId, bookName, bookPrice, bookWriter, bookPublisher, 
						 new Date(2017/04/06), bookGrade, bookETC, bookSale, bookStock, categoryId, bookImage );
	bookService.updateBook(book);
	
	Detail detail = new Detail(bookId, detailBook, detailReview, detailWriter, detailChapter);
	detailService.updateDetail(detail);
	
	response.sendRedirect("bookManage.jsp");
%>
