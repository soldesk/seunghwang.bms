package seunghwang.bms.review.domain;

import java.sql.Date;

public class Review {
	private String reviewId;
	private String bookName;
	private String reviewTitle;
	private String reviewContent;
	private double reviewGrade;
	private Date   regDate;
	private String bookId;
	private String userId;
	
	public Review(){}
	
	public Review(String reviewTitle, String reviewContent, double reviewGrade){
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewGrade = reviewGrade;
	}
	
	public Review(String reviewId, String bookName, String reviewTitle, String reviewContent,
			double reviewGrade,  Date regDate, String bookId,String userId){
		this.reviewId = reviewId;
		this.bookName = bookName;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewGrade = reviewGrade;
		this.regDate = regDate;
		this.bookId = bookId;
		this.userId = userId;
	}

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public double getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(double reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString(){
		return String.format("%s %s %s %-6s", reviewTitle,reviewContent,userId,regDate);
	}
	
}
