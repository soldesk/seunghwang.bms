package seunghwang.bms.order.dao;

import java.util.List;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.config.Configuration;
import seunghwang.bms.login.domain.User;
import seunghwang.bms.order.dao.mapper.OrderMapper;
import seunghwang.bms.order.domain.Order;

public class OrderDaoImpl implements OrderDao{
    private OrderMapper orderMapper;
      
    public OrderDaoImpl(){
        this.orderMapper = Configuration.getMapper(OrderMapper.class);
    }
    
    public User getOrder(String userId){
        return orderMapper.getOrder(userId); 
    }  
    
    public Book getOrderBook(String bookId){
        return orderMapper.getOrderBook(bookId); 
    }    
    
    public int addOrder(Order order){
        return orderMapper.addOrder(order);
    }
    
    public int addOrder2(Order order){
        return orderMapper.addOrder2(order);
    }
    
    public List<Order> orderList(Order order){  
        return orderMapper.orderList(order);
    }  
    
    public int orderCount(String userId){
    	return orderMapper.orderCount(userId);
    }
}
