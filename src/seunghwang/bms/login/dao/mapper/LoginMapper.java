package seunghwang.bms.login.dao.mapper;

import java.util.List;

import seunghwang.bms.admin.domain.Page;
import seunghwang.bms.login.domain.User;
public interface LoginMapper {
	User getUser(String userId);
	String getFindId(String userEmail);
	int signUp(User user);
	int modify(User user);
	int pwModify(User user);
	int userStateChange(User user);
	int delUser(String userId);
	List<User> getUsers(Page page);
	int getTotRowCnt();
	
}
