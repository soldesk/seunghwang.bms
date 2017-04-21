<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
%>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>책 제목</th>
				<th>가격</th>
				<th>작가</th>
				<th>출판사</th>
				<th>출간일</th>
				<th>평점</th>
			</tr>
		</thead>
<% 
	if(books.size() != 0) 
		for(Book book : books) { %>
			<tbody>
				<tr onclick="location.href='updateBook.jsp?bookId=<%=book.getBookId()%>'">
					<td><%= book.getBookName() %></td>
					<td><%= book.getBookPrice() %></td>
					<td><%= book.getBookWriter() %></td>
					<td><%= book.getBookPublisher()%></td>
					<td><%= book.getPublicationDate() %></td>
					<td><%= book.getBookGrade() %></td>
				</tr>
<%}else{ %>
				<tr>
					<td>등록된 도서가 없습니다.</td>
				</tr>
			</tbody>
<% } %>
		</table>
