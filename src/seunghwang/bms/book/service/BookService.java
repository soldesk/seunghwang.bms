package seunghwang.bms.book.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import seunghwang.bms.book.domain.Book;

public interface BookService {
	List<Book> getBooks(); //책 목록
	List<Book> largeCategoryBooks(String largeCategory);
	List<Book> middleCategoryBooks(String categoryId);
	List<Book> findBooks(Map map); //책 검색
	Book searchBook(String bookId);//책 한권 정보 불러오기
	void insertBook(Book book); //책 추가
	void updateBook(Book book); //책 수정
	void deleteBook(String bookId); //책 삭제
	List<Book> findNewBooks(Date date);
	List<Book> findBestSellers();
	List<Book> findSteadySellers();
}
