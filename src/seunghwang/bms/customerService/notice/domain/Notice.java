package seunghwang.bms.customerService.notice.domain;

import java.sql.Date;

public class Notice {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private int readCnt;
	private Date regDate;
	
	public Notice(){}
	
	public Notice(int noticeId, String noticeTitle, String noticeContent, int readCnt, Date regDate){
		this.noticeId=noticeId;
		this.noticeTitle=noticeTitle;
		this.noticeContent=noticeContent;
		this.readCnt=readCnt;
		this.regDate=regDate;
	}
	
	public Notice(String noticeTitle, String noticeContent, int readCnt){
		this.noticeTitle=noticeTitle;
		this.noticeContent=noticeContent;
		this.readCnt=readCnt;
	}
	
	public Notice(int readCnt){
		this.readCnt=readCnt;
	}
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}