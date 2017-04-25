package seunghwang.bms.book.dao.mapper;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import seunghwang.bms.book.domain.Book;

public interface BookMapper {
	List<Book> getBooks(); //책 목록
	List<Book> largeCategoryBooks(String largeCategory);//대분류해서 나온 책들
	List<Book> middleCategoryBooks(String categoryId); //중분류해서 나온 책들
	List<Book> findBooks(Map map); //책 검색
 	Book searchBook(String bookId); //책 한권 정보 불러오기
	void insertBook(Book book); //책 추가
	void updateBook(Book book); //책 수정
	void deleteBook(String bookId); //책 삭제
	List<Book> getDetails();
	List<Book> findNewBooks(Date date);
	List<Book> findBestSellers(Date date);
	List<Book> findSteadySellers(Date date);
}
