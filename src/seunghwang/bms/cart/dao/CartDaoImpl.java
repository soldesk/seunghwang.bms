package seunghwang.bms.cart.dao;

import java.util.List;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.cart.dao.mapper.CartMapper;
import seunghwang.bms.cart.domain.Cart;
import seunghwang.bms.config.Configuration;

public class CartDaoImpl implements CartDao{
    private CartMapper cartMapper;
    
    public CartDaoImpl(){
        this.cartMapper = Configuration.getMapper(CartMapper.class);
    }
    
    public Book getOrderBook(String bookId){    	
    	return cartMapper.getOrderBook(bookId);
    }
    
    
    public int addCart(Cart cart)  {
        return cartMapper.addCart(cart);
    }
    
    public List<Cart> listCart(Cart cart)  {
        return cartMapper.listCart(cart);
    }
    
    public int cartCount(String userId){
    	return cartMapper.cartCount(userId);
    }
    
    public int delCart(String cartId){
    	return cartMapper.delCart(cartId);   
    }
    
    public Book getBook(String bookId){
    	return cartMapper.getBook(bookId);
    }
    
}
