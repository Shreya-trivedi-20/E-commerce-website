package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.ecommerce.dbUtility.DBUtility;
import com.ecommerce.pojo.Order;

public class OrderDaoImp implements OrderDao 
{
	PreparedStatement stmt;
    ResultSet rs;
    int row=0,count=0;

	@Override
	public boolean addOrder(Order order) 
	{
        Connection con=DBUtility.getConnection();
		
		String query="insert into Orders(userId,productId,size,quantity,price,orderDate,deliveryDate) Values(?,?,?,?,?,?,?)";
		try 
		{
			stmt=con.prepareStatement(query);
			stmt.setInt(1,order.getUserId());
			stmt.setInt(2,order.getProdctId());
			stmt.setString(3,order.getProductSize());
			stmt.setInt(4,order.getQuantity());
			stmt.setInt(5,order.getPrice());
			stmt.setString(6,order.getOrderesDate());
			stmt.setString(7, order.getDeliveryDate());
		    row=stmt.executeUpdate();
		} 
		catch (SQLException e)
		{	
			e.printStackTrace();
		}
		if(row>0)
			return true;
		else
			return false;
	}

	@Override
	public List<Order> getOrderByUserId(int userId)
	{
		Connection con=DBUtility.getConnection();
		Statement stmt;
		String query="select * from orders where userId="+userId;
		Order order = null ;
		List<Order> li=new ArrayList<>();
		try
		{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query); 
			while(rs.next())
			{
				order=new Order();
				order.setOrderId(rs.getInt("orderId"));
				order.setUserId(rs.getInt("userId"));
				order.setProdctId(rs.getInt("productId"));
				order.setQuantity(rs.getInt("quantity"));
				order.setPrice(rs.getInt("price"));
				order.setDeliveryDate(rs.getString("deliveryDate"));
				order.setOrderesDate(rs.getString("orderDate"));
				order.setProductSize(rs.getString("size"));
		        li.add(order);                                         
			}
		}
		
		catch(SQLException e)
      	{
      		e.printStackTrace();
      	}
		
		return li;
	}

	@Override
	public List<Order> getAllOrder() 
	{
		Connection con=DBUtility.getConnection();
		Statement stmt;
		String query="select * from orders";
		Order order = null ;
		List<Order> li=new ArrayList<>();
		try
		{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query); 
			while(rs.next())
			{
				order=new Order();
				order.setOrderId(rs.getInt("orderId"));
				order.setUserId(rs.getInt("userId"));
				order.setProdctId(rs.getInt("productId"));
				order.setQuantity(rs.getInt("quantity"));
				order.setPrice(rs.getInt("price"));
				order.setDeliveryDate(rs.getString("deliveryDate"));
				order.setOrderesDate(rs.getString("orderDate")); 
				order.setProductSize(rs.getString("size"));
				li.add(order);  
		  	
			}
		}
		
		catch(SQLException e)
      	{
      		e.printStackTrace();
      	}
		
		return li;
	}

	@Override
	public int totalOrderPrice(int userId)
	{	
		Connection con=DBUtility.getConnection();
		Statement stmt;
		int price=0;
		String query="select price from orders where userId="+userId;
		
		try
		{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query); 
			
			while(rs.next())
			{
				int p=rs.getInt("price");
				price=price+p;
			}
		}
		
		catch(SQLException e)
      	{
      		e.printStackTrace();
      	}

		return price;
	}

	@Override
	public boolean addDeliveryDate(int orderId, int userId,int productId, String deliveyrDate)
	{
        Connection con=DBUtility.getConnection();
		
		String query="update orders set deliveryDate=? where orderId=? and userId=? and productId=?";
		try 
		{
			stmt=con.prepareStatement(query);
			stmt.setString(1,deliveyrDate);
			stmt.setInt(2,orderId);
			stmt.setInt(3,userId);
			stmt.setInt(4,productId);
		    row=stmt.executeUpdate();
		} 
		catch (SQLException e)
		{	
			e.printStackTrace();
		}
		if(row>0)
			return true;
		else
			return false;
	}

	@Override
	public int totalOrdersCount()
	{
		int totalOrders=0;
		   ResultSet rs;
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(orderId) from orders";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	totalOrders=rs.getInt("count(orderId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return totalOrders;
	}

}
