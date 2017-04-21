package seunghwang.bms.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import seunghwang.bms.book.dao.BookDao;
import seunghwang.bms.book.domain.Book;

public class BookServiceImpl implements BookService{
	private BookDao bookDao;
	
	public BookServiceImpl(){}
	
	public BookServiceImpl(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public List<Book> getBooks() {
		return bookDao.getBooks();
	}
	
	public List<Book> findBooks(Map map){
		return bookDao.findBooks(map);
	}
	
	public Book searchBook(String bookId) {
		return bookDao.searchBook(bookId);
	}
	
	public void insertBook(Book book) {
		bookDao.insertBook(book);
	}
	
	public void updateBook(Book book) {
		bookDao.updateBook(book);
	}
	
	public void deleteBook(String bookId) {
		bookDao.deleteBook(bookId);
	}
}
