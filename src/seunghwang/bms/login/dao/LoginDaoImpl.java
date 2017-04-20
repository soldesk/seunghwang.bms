package seunghwang.bms.login.dao;

import seunghwang.bms.config.Configuration;
import seunghwang.bms.login.dao.mapper.LoginMapper;
import seunghwang.bms.login.domain.User;

public class LoginDaoImpl implements LoginDao {
	  private LoginMapper loginMapper;
	    
	    public LoginDaoImpl(){
	    	this.loginMapper = Configuration.getMapper(LoginMapper.class);
	    }
	    
	    public LoginDaoImpl(LoginMapper loginMapper){
	        this.loginMapper = loginMapper;
	    }
	 
	    //사용자 한명의 정보를 조회한다.
	    //return: 사용자 정보	    //param: 사용자 번호
	    public User getUser(String userId){
	        return loginMapper.getUser(userId);
	    }
	    
	
		public String getFindId(String userEmail) {
			return loginMapper.getFindId(userEmail);
		}

		public int signUp(User user) {		
			return loginMapper.signUp(user);
		}

		public int modify(User user) {
			return loginMapper.modify(user);
		}

		public int pwModify(User user) {
			return loginMapper.pwModify(user);
		}
	    
		public int userStateChange(User user) {
			return loginMapper.userStateChange(user);
		}
	    
}
