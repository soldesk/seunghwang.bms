package seunghwang.bms.review.dao;

import java.util.List;

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
	
	public void insertReview(Review review){
		reviewMapper.insertReview(review); 
	}
	
	public void updateReview(Review review){
		reviewMapper.updateReview(review);
	}
	
	public void deleteReview(String reviewId){
		reviewMapper.deleteReview(reviewId);
	}
	
}
