package seunghwang.bms.review.service;

import java.util.List;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.review.dao.ReviewDao;
import seunghwang.bms.review.domain.Review;

public class ReviewServiceImpl implements ReviewService{
	private ReviewDao reviewDao;
	
	public ReviewServiceImpl(){}
	
	public ReviewServiceImpl(ReviewDao reviewDao){
		this.reviewDao = reviewDao;
	}
	
	public List<Review> getReviews(){
		return reviewDao.getReviews();
	}
	
	public List<Review> getBookReviews(Book book) {
		return reviewDao.getBookReviews(book);
	}
	
	public Review searchReview(String bookId){
		return reviewDao.searchReview(bookId);
	}
	
	public void insertReview(Review review){
		reviewDao.insertReview(review);
	}
	
	public void updateReview(Review review){
		reviewDao.updateReview(review);
	}
	
	public void deleteReview(String reviewId){
		reviewDao.deleteReview(reviewId);
	}
	
	public double getIdGrade(String userId){
		return reviewDao.getIdGrade(userId);
	}
	
	
	public double getAvgGrade(String bookId){
		return reviewDao.getAvgGrade(bookId);
	}

}
