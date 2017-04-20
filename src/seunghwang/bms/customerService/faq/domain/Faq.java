package seunghwang.bms.customerService.faq.domain;

public class Faq {
	private int faqId;
	private String faqCategory;
	private String faqTitle;
	private String faqContent;
	private int readCnt;
	private String userId;
	
	public Faq(){}
	
	public Faq(int faqId, String faqCategory, String faqTitle, String faqContent, int readCnt, String userId){
		this.faqId = faqId;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.readCnt = readCnt;
		this.userId = userId;
	}
	
	public Faq(String faqCategory, String faqTitle, String faqContent, int readCnt, String userId){
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.readCnt = readCnt;
		this.userId = userId;
	}
	
	public Faq(int readCnt){
		this.readCnt = readCnt;
	}
	
	public int getFaqId() {
		return faqId;
	}
	public void setFaqId(int faqId) {
		this.faqId = faqId;
	}
	public String getFaqCategory() {
		return faqCategory;
	}
	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}