package seunghwang.bms.admin.domain;

public class Admin {
	private int adminGrade;
	private String adminName;
	private String adminPw;
	private String adminId;
	
	public int getAdminGrade() {
		return adminGrade;
	}
	public void setAdminGrade(int adminGrade) {
		this.adminGrade = adminGrade;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public boolean pw(String adminPw) {
		return this.adminPw.equals(adminPw);
	}

}
