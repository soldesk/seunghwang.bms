package seunghwang.bms.login.dao;

import java.util.List;

import seunghwang.bms.admin.domain.Page;
import seunghwang.bms.login.domain.User;

public interface LoginDao {
	User getUser(String userId);
	String getFindId(String userEmail);
	int signUp(User user);
	int modify(User user);
	int pwModify(User user);
	int delUser(String userId);
	int userStateChange(User user);
	List<User> getUsers(Page page);
	int getTotRowCnt();
}
