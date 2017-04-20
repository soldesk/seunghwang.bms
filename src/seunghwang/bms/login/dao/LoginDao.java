package seunghwang.bms.login.dao;

import java.util.List;

import seunghwang.bms.login.domain.User;

public interface LoginDao {
	User getUser(String userId);
	String getFindId(String userEmail);
	int signUp(User user);
	int modify(User user);
	int pwModify(User user);
	int userStateChange(User user);

}
