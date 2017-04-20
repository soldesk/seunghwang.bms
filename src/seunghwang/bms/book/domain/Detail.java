package seunghwang.bms.book.domain;

public class Detail {
	private String bookId;
	private String detailId;
	private String detailBook;
	private String detailReview;
	private String detailWriter;
	private String detailChapter;
	
	public Detail(){}
	
	public Detail(String bookId, String detailBook, String detailReview, String detailWriter, String detailChapter) {
		this.bookId = bookId;
		this.detailId = bookId;
		this.detailBook = detailBook;
		this.detailReview = detailReview;
		this.detailWriter = detailWriter;
		this.detailChapter = detailChapter;
	}
	
	
	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getDetailId() {
		return detailId;
	}
	
	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}
	
	public String getDetailBook() {
		return detailBook;
	}
	
	public void setDetailBook(String detailBook) {
		this.detailBook = detailBook;
	}
	
	public String getDetailReview() {
		return detailReview;
	}
	
	public void setDetailReview(String detailReview) {
		this.detailReview = detailReview;
	}
	
	public String getDetailWriter() {
		return detailWriter;
	}
	
	public void setDetailWriter(String detailWriter) {
		this.detailWriter = detailWriter;
	}
	
	public String getDetailChapter() {
		return detailChapter;
	}
	
	public void setDetailChapter(String detailChapter) {
		this.detailChapter = detailChapter;
	}
}
