package seunghwang.bms.cart.dao.mapper;

import java.util.List;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.cart.domain.Cart;

public interface CartMapper {
	
	Book getOrderBook(String bookId);
	int addCart(Cart cart);
	List<Cart> listCart(Cart cart);
	int cartCount(String userId);
	int delCart(String cartId);
}    