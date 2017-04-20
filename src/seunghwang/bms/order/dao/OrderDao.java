package seunghwang.bms.order.dao;

import java.util.List;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.login.domain.User;
import seunghwang.bms.order.domain.Order;

public interface OrderDao {
	User getOrder(String userId); 
    Book getOrderBook(String bookId);
    int addOrder(Order order);
    int addOrder2(Order order);
    List<Order> orderList(Order order);
    int orderCount(String userId);
}
    