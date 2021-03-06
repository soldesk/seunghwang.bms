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
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="seunghwang.bms.book.dao.mapper.CategoryMapper" %>
<%@ page import="seunghwang.bms.book.dao.CategoryDao" %>
<%@ page import="seunghwang.bms.book.dao.CategoryDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.CategoryService" %>
<%@ page import="seunghwang.bms.book.service.CategoryServiceImpl" %>
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
	
	CategoryService categoryService = new CategoryServiceImpl();
	
	String savePath = "img/bookUpload"; //저장경로
	int uploadFileMaxSize = 100 * 1024 * 1024; 
	String encType = "utf-8";
	
	ServletContext context = getServletContext();
	String uploadFilePath = context.getRealPath(savePath);
	
	MultipartRequest multiRequest = new MultipartRequest(request,
			uploadFilePath, uploadFileMaxSize, encType,
			new DefaultFileRenamePolicy());

	String categoryId = multiRequest.getParameter("categoryId");
	String bookId = multiRequest.getParameter("bookId");
	String bookName = multiRequest.getParameter("bookName");
	int bookPrice = Integer.parseInt(multiRequest.getParameter("bookPrice"));
	String bookWriter = multiRequest.getParameter("bookWriter");
	String bookPublisher = multiRequest.getParameter("bookPublisher");
	String publicationDate = multiRequest.getParameter("publicationDate");
	double bookGrade = Double.parseDouble(multiRequest.getParameter("bookGrade"));
	String bookETC = multiRequest.getParameter("bookETC");
	int bookSale = Integer.parseInt(multiRequest.getParameter("bookSale"));
	int bookStock = Integer.parseInt(multiRequest.getParameter("bookStock"));
	String bookImage = multiRequest.getParameter("bookImage");
	String upBookImage = multiRequest.getFilesystemName("upBookImage");
	Date date = java.sql.Date.valueOf(publicationDate);
	
	String detailBook = multiRequest.getParameter("detailBook");
	String detailReview = multiRequest.getParameter("detailReview");
	String detailWriter = multiRequest.getParameter("detailWriter");
	String detailChapter = multiRequest.getParameter("detailChapter");
	
	if(upBookImage == null || upBookImage.equals("")) {
		Book book = new Book(bookId, bookName, bookPrice, bookWriter, bookPublisher, 
				 date, bookGrade, bookETC, bookSale, bookStock, categoryId, bookImage);
		bookService.updateBook(book);
	} else {
		Book book = new Book(bookId, bookName, bookPrice, bookWriter, bookPublisher, 
				 date, bookGrade, bookETC, bookSale, bookStock, categoryId, upBookImage);
		bookService.updateBook(book);
	}
		
	
	
	
	Detail detail = new Detail(bookId, detailBook, detailReview, detailWriter, detailChapter);
	detailService.updateDetail(detail);
	
	response.sendRedirect("bookManage.jsp");
%>
