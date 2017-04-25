package seunghwang.bms.book.domain;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class Book {
	private String bookId; //책 고유번호
	private String bookName; //책 이름
	private int bookPrice; //책 가격
	private String bookWriter; //저자
	private String bookPublisher; //출판사
	private Date publicationDate; //출판일
	private double bookGrade; //평점
	private String bookETC; //기타 정보
	private int bookSale; //판매량
	private int bookStock; //재고량
	//나중에 변동사항 생길 수 있음. 카테고리는 객체를 받아와야 할지 모름. 책 이미지 처리도 고려해야함.
	private String categoryId; //책 카테고리
	private String bookImage; //책 이미지
	private String detailId;
	private int startRow;
	private int endRow;
	private int bookDate;
	private int bookAmount;
	
	public Book(){}
	
	public Book(String bookId, String bookName, int bookPrice, String bookWriter, String bookPublisher,
			Date publicationDate, double bookGrade, String bookETC, int bookSale, int bookStock, String categoryId, String bookImage){
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookPrice = bookPrice;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
		this.publicationDate = publicationDate;
		this.bookGrade = bookGrade;
		this.bookETC = bookETC;
		this.bookSale = bookSale;
		this.bookStock = bookStock;
		this.categoryId = categoryId;
		this.bookImage = bookImage;
	}
	
	public String getDetailId() {
		return detailId;
	}

	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public Date getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}
	public double getBookGrade() {
		return bookGrade;
	}
	public void setBookGrade(double bookGrade) {
		this.bookGrade = bookGrade;
	}
	public String getBookETC() {
		return bookETC;
	}
	public void setBookETC(String bookETC) {
		this.bookETC = bookETC;
	}
	public int getBookSale() {
		return bookSale;
	}
	public void setBookSale(int bookSale) {
		this.bookSale = bookSale;
	}
	public int getBookStock() {
		return bookStock;
	}
	public void setBookStock(int bookStock) {
		this.bookStock = bookStock;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getBookDate() {
		return bookDate;
	}

	public void setBookDate(int bookDate) {
		this.bookDate = bookDate;
	}

	public int getBookAmount() {
		return bookAmount;
	}

	public void setBookAmount(int bookAmount) {
		this.bookAmount = bookAmount;
	}
	
	
	/*public String toString() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		return String.format("%3d %-6s %s", userNo, name, sf.format(regDate));
		//-6s 왼쪽 정렬(6자리 출력), 3d: 자릿수(3자리 출력)
	}
	GregorianCalendar now = new GregorianCalendar(); 
		//회원이름을 받은 순간 등록일 생성.
		String date = now.get(GregorianCalendar.YEAR) + "-" 
					+ now.get(GregorianCalendar.MONTH) + 1 + "-" 
					+  now.get(GregorianCalendar.DAY_OF_MONTH); */
}
