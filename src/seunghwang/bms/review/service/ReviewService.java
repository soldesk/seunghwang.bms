package seunghwang.bms.review.service;

import java.util.List;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.review.domain.Review;

public interface ReviewService {
	List<Review> getReviews(); //리뷰 리스트
	List<Review> getBookReviews(Book book); 
	Review searchReview(String bookId); //리뷰 하나
	void insertReview(Review review); //리뷰 추가
	void updateReview(Review review); //리뷰 수정
	void deleteReview(String reviewId); //리뷰 삭제
	double getIdGrade(String userId); //개인 리뷰 점수 불러오기 
	double getAvgGrade(String bookId); //전체 리뷰 점수 불러오기
}
