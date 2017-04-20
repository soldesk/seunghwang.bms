package seunghwang.bms.customerService.inquiry.domain;

import java.sql.Date;

public class Inquiry {
	private int inquiryId;
	private String userId;
	private String inquiryCategory;
	private String inquiryTitle;
	private String inquiryContent;
	private String userEmail;
	private String inquiryAnswer;
	private Date regDate;
	
	public Inquiry(){}
	
	public Inquiry(int inquiryId, String userId, String inquiryCategory,
			String inquiryTitle, String inquiryContent, String userEmail, String inquiryAnswer, Date regDate){
		this.inquiryId=inquiryId;
		this.userId=userId;
		this.inquiryCategory=inquiryCategory;
		this.inquiryTitle=inquiryTitle;
		this.inquiryContent=inquiryContent;
		this.userEmail=userEmail;
		this.inquiryAnswer=inquiryAnswer;
		this.regDate=regDate;
	}
	
	public Inquiry(String userId, String inquiryCategory, String inquiryTitle, String inquiryContent, String userEmail, String inquiryAnswer){
		this.userId=userId;
		this.inquiryCategory=inquiryCategory;
		this.inquiryTitle=inquiryTitle;
		this.inquiryContent=inquiryContent;
		this.userEmail=userEmail;
		this.inquiryAnswer=inquiryAnswer;
	}
	
	public Inquiry(int inquiryId){
		this.inquiryId = inquiryId;
	}
	
	public int getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getInquiryCategory() {
		return inquiryCategory;
	}
	public void setInquiryCategory(String inquiryCategory) {
		this.inquiryCategory = inquiryCategory;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getInquiryAnswer() {
		return inquiryAnswer;
	}
	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}