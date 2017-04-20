package seunghwang.bms.book.dao;

import java.util.List;

import seunghwang.bms.book.domain.Book;

public interface BookDao {
	List<Book> getBooks(); //책 목록
	Book searchBook(String bookId); //책 검색
	void insertBook(Book book); //책 추가
	void updateBook(Book book); //책 수정
	void deleteBook(String bookId); //책 삭제
}
