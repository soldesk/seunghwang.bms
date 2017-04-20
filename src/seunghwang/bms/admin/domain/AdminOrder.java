package seunghwang.bms.admin.domain;
import java.sql.Date;

public class AdminOrder {
  
		private  String orderId;
		private  String bookId;
		private  String bookName;
		private  int bookPrice;
		private  String bookImage;
		private  int bookAmount;
		private  String paymentChoice;
		private  int paymentCost;
		private  String orderAddress;
		private  String orderName;
		private  String orderStatus;
		private  Date orderEta;
		private  String userId;
		private  String orderMemo;
		private  String orderPhone;
		private  Date orderDate;
		private  int startRow;
		private  int endRow;
		private String searchTitle;
		private String searchContent;
		  
		  
		public String getOrderId() {
			return orderId;
		}
		public void setOrderId(String orderId) {
			this.orderId = orderId;
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
		public String getBookImage() {
			return bookImage;
		}
		public void setBookImage(String bookImage) {
			this.bookImage = bookImage;
		}
		public int getBookAmount() {
			return bookAmount;
		}
		public void setBookAmount(int bookAmount) {
			this.bookAmount = bookAmount;
		}
		public String getPaymentChoice() {
			return paymentChoice;
		}
		public void setPaymentChoice(String paymentChoice) {
			this.paymentChoice = paymentChoice;
		}
		public int getPaymentCost() {
			return paymentCost;
		}
		public void setPaymentCost(int paymentCost) {
			this.paymentCost = paymentCost;
		}
		public String getOrderAddress() {
			return orderAddress;
		}
		public void setOrderAddress(String orderAddress) {
			this.orderAddress = orderAddress;
		}
		public String getOrderName() {
			return orderName;
		}
		public void setOrderName(String orderName) {
			this.orderName = orderName;
		}
		public String getOrderStatus() {
			return orderStatus;
		}
		public void setOrderStatus(String orderStatus) {
			this.orderStatus = orderStatus;
		}
		public Date getOrderEta() {
			return orderEta;
		}
		public void setOrderEta(Date orderEta) {
			this.orderEta = orderEta;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getOrderMemo() {
			return orderMemo;
		}
		public void setOrderMemo(String orderMemo) {
			this.orderMemo = orderMemo;
		}
		public String getOrderPhone() {
			return orderPhone;
		}
		public void setOrderPhone(String orderPhone) {
			this.orderPhone = orderPhone;
		}    
		public Date getOrderDate() {
			return orderDate;
		}
		public void setOrderDate(Date orderDate) {
			this.orderDate = orderDate;
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
		public String getSearchTitle() {
			return searchTitle;
		}
		public void setSearchTitle(String searchTitle) {
			this.searchTitle = searchTitle;
		}
		public String getSearchContent() {
			return searchContent;
		}
		public void setSearchContent(String searchContent) {
			this.searchContent = searchContent;
		}

		
}


