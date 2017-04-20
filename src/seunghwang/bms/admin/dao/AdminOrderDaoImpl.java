package seunghwang.bms.admin.dao;

import java.util.List;

import seunghwang.bms.admin.dao.mapper.AdminOrderMapper;
import seunghwang.bms.admin.domain.AdminOrder;
import seunghwang.bms.config.Configuration;

public class AdminOrderDaoImpl implements AdminOrderDao{

    private AdminOrderMapper adminOrderMapper;
    
    public AdminOrderDaoImpl(){
        this.adminOrderMapper = Configuration.getMapper(AdminOrderMapper.class);
    }
      
	public List<AdminOrder> listAdminOrder(AdminOrder order){
		return adminOrderMapper.listAdminOrder(order);
	}
	
	public int adminOrderCount(AdminOrder order){
		return adminOrderMapper.adminOrderCount(order);
	}
	
	public AdminOrder getAdminOrder1(String orderId){
		return adminOrderMapper.getAdminOrder1(orderId);
	}
	
	public List<AdminOrder> getAdminOrder2(String orderId){
		return adminOrderMapper.getAdminOrder2(orderId);
	}
	
    public int delOrder(AdminOrder order){
    	return adminOrderMapper.delOrder(order);
    }
    
    public int updateOrder1(AdminOrder order){
    	return adminOrderMapper.updateOrder1(order);
    }
    
    public int updateOrder2(AdminOrder order){
    	return adminOrderMapper.updateOrder2(order);
    }
    
    public int deleteOrder(String orderId){
    	return adminOrderMapper.deleteOrder(orderId);
    }
}
