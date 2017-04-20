package seunghwang.bms.admin.dao.mapper;

import java.util.List;

import seunghwang.bms.admin.domain.AdminOrder;

public interface AdminOrderMapper {
	List<AdminOrder> listAdminOrder(AdminOrder order);
	int adminOrderCount(AdminOrder order);
	AdminOrder getAdminOrder1(String orderId);
	List<AdminOrder> getAdminOrder2(String orderId);
	int delOrder(AdminOrder order);
	int updateOrder1(AdminOrder order);
	int updateOrder2(AdminOrder order);
	int deleteOrder(String orderId);
}
  