package seunghwang.bms.admin.dao;

import seunghwang.bms.admin.dao.mapper.AdminMapper;
import seunghwang.bms.admin.domain.Admin;
import seunghwang.bms.config.Configuration;
import seunghwang.bms.login.dao.mapper.LoginMapper;
import seunghwang.bms.login.domain.User;

public class AdminDaoImpl implements AdminDao {
	private AdminMapper adminMapper;
	
	public AdminDaoImpl() {
		this.adminMapper = Configuration.getMapper(AdminMapper.class);
	}
	
		public Admin getAdmin(String adminId) {
	        return adminMapper.getAdmin(adminId);
		}
}
