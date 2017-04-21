package seunghwang.bms.book.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import seunghwang.bms.book.domain.Book;

public interface BookDao {
	List<Book> getBooks(); //책 목록
	List<Book> largeCategoryBooks(String largeCategory);
	List<Book> findBooks(Map map); //책 검색
	Book searchBook(String bookId);//책 한권 정보 불러오기
	void insertBook(Book book); //책 추가
	void updateBook(Book book); //책 수정
	void deleteBook(String bookId); //책 삭제
}
