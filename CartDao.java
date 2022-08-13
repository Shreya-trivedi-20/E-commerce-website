package com.ecommerce.dao;

import java.util.List;
import com.ecommerce.pojo.Cart;

public interface CartDao
{
	boolean addToCart(Cart cart);
	List<Cart> getCartByUserId(int userId);
	int totalCartByUserId(int userId);
	int totalPriceFromCart(int userId);
	public boolean alreadyAvailableInCart(int productId,int userId,String size);
    public int getPreviousQuantityFromCart(int productId,int userId,String size);
    boolean updateCart(Cart cart);
    boolean deleteCartById(int cartId);
    boolean deleteCartByUserId(int userId);
}
