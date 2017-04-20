package seunghwang.bms.review.dao.mapper;

import java.util.List;

import seunghwang.bms.review.domain.Review;

public interface ReviewMapper {
	List<Review> getReviews(); //리뷰 리스트
	void insertReview(Review review); //리뷰 추가
	void updateReview(Review review); //리뷰 수정
	void deleteReview(String reviewId); //리뷰 삭제
}
