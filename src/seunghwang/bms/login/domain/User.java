package seunghwang.bms.login.domain;

import java.util.Date;

public class User {
	
	public User() {}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", userPost=" + userPost + ", userAddress=" + userAddress + ", userEmail=" + userEmail
				+ ", userState=" + userState + ", regDate=" + regDate + "]";
	}

	public User(String userId, String userPost, String userAddress, String userEmail) {
		this.userId = userId;
		this.userPost = userPost;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
	}

	public User(String userId, String userPw, String userName, String userPhone, String userPost, String userAddress,
			String userEmail, int userState, Date regDate) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userPost = userPost;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.userState = userState;
		this.regDate = regDate;
	}

	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userPost;
	private String userAddress;
	private String userEmail;
	private int userState;
	private Date regDate;
	
	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserPhone() {
		return userPhone;
	}



	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}



	public String getUserPost() {
		return userPost;
	}



	public void setUserPost(String userPost) {
		this.userPost = userPost;
	}



	public String getUserAddress() {
		return userAddress;
	}



	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}




	public boolean pw(String pw){
		return this.userPw.equals(pw);
	}
	
	
}
