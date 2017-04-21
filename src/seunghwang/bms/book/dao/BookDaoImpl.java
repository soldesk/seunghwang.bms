package seunghwang.bms.book.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import seunghwang.bms.book.dao.mapper.BookMapper;
import seunghwang.bms.book.domain.Book;

public class BookDaoImpl implements BookDao{
	private BookMapper bookMapper;
	
	public BookDaoImpl() {}
	
	public BookDaoImpl(BookMapper bookMapper){
		this.bookMapper = bookMapper;
	}
	public List<Book> getBooks(){
		return bookMapper.getBooks();
	}
	
	public List<Book> findBooks(Map map) {
		return bookMapper.findBooks(map);
	}
	
	public Book searchBook(String bookId) {
		return bookMapper.searchBook(bookId);
	}
	
	public void insertBook(Book book) {
		bookMapper.insertBook(book);
	}
	
	public void updateBook(Book book) {
		bookMapper.updateBook(book);
	}
	
	public void deleteBook(String bookId) {
		bookMapper.deleteBook(bookId);
	}
}
