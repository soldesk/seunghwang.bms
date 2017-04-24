package seunghwang.bms.review.dao;

import java.util.List;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.review.dao.mapper.ReviewMapper;
import seunghwang.bms.review.domain.Review;

public class ReviewDaoImpl implements ReviewDao{
private ReviewMapper reviewMapper;
	
	public ReviewDaoImpl(){}
	
	public ReviewDaoImpl(ReviewMapper reviewMapper){
		this.reviewMapper = reviewMapper;
	}
	
	public List<Review> getReviews(){
		return reviewMapper.getReviews();
	}
	
	public List<Review> getBookReviews(Book book) {
		return reviewMapper.getBookReviews(book);
	}
		
	public Review searchReview(String bookId){
		return reviewMapper.searchReview(bookId);
	}
	
	public void insertReview(Review review){
		reviewMapper.insertReview(review); 
	}
	
	public void updateReview(Review review){
		reviewMapper.updateReview(review);
	}
	
	public void deleteReview(String reviewId){
		reviewMapper.deleteReview(reviewId);
	}
	
	public double getIdGrade(String userId){
		return reviewMapper.getIdGrade(userId);
	}

	public double getAvgGrade(String bookId) {
		return reviewMapper.getAvgGrade(bookId);
	}
	
}
