package com.ecommerce.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.ecommerce.dbUtility.DBUtility;
import com.ecommerce.pojo.User;

public class UserDaoImp implements UserDao
{
	@Override
	public boolean addUser(User user)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="insert into user(userName,userEmail,userPassword,userPhone,userPic,userAddress,userType) values(?,?,?,?,?,?,?)";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,user.getUserName());
    	    stmt.setString(2,user.getUserEmail());
    	    stmt.setString(3,user.getUserPassword());
    	    stmt.setString(4,user.getUserPhone());
    	    stmt.setString(5,user.getUserPic());
    	    stmt.setString(6,user.getUserAddress());
    	    stmt.setString(7,user.getUserType());
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    		
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}

	@Override
	public boolean isAlreadyUser(String userEmail) 
	{
		int count=0;
	 	   ResultSet rs;
	 	   Connection con=DBUtility.getConnection();
	        String query="select userEmail from user";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 			 if(userEmail.equals(rs.getString("userEmail")) )
	 			 {
	 				 count=1;
	 			 }
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	   
	 	   if(count==1)
	 	   {
	 		   count=0;
	 		   return true;
	 	   }
	 	   else 
	 		   return false;
		
	}

	@Override
	public User login(String userEmail, String password)
	{
		   User user=null;
		   ResultSet rs;
		   Connection con=DBUtility.getConnection();
	       String query="select * from user where userEmail='"+userEmail+"' and userpassword='"+password+"'";
	       
		   try 
		   {
			Statement stmt=con.createStatement();
		    rs=stmt.executeQuery(query);
		    while(rs.next())
			{
		    	user=new User(rs.getInt("userId"),rs.getString("userName"),rs.getString("userEmail"),rs.getString("userPhone"),rs.getString("userPic"),rs.getString("userAddress"),rs.getString("userType"));
			}
		   }
		   catch (SQLException e) 
		   {
			e.printStackTrace();
		   }
		   
		   return user;
	}

	@Override
	public String getUserType(String userEmail, String password)
	{
		  
	 	   ResultSet rs;
	 	   String type=null;
	 	   Connection con=DBUtility.getConnection();
	        String query="select * from user";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	 if(userEmail.equals(rs.getString("userEmail")) && password.equals(rs.getString("userPassword")) )
				 {
					
					 type = rs.getString("userType");
				 }
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return type;  
	}

	@Override
	public List<User> getAllUser(String userType)
	{
		Connection con=DBUtility.getConnection();
		String query="select * from User where userType='"+userType+"'";
		ResultSet rs;
		Statement stmt;
		User user;
		List<User> li=new ArrayList<>();
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        user=new User(rs.getInt("userId"),rs.getString("userName"),rs.getString("userEmail"), rs.getString("userPhone"), rs.getString("userPic"),rs.getString("userAddress"),
    	    			rs.getString("userType"));
    	        li.add(user);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
	}

	@Override
	public int getTotalUser()
	{
		   int totalUser=0;
		   ResultSet rs;
	 	   String type=null;
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(userId) from user where userType='normal'";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  totalUser=rs.getInt("count(userId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return totalUser;  
	}

	@Override
	public User getUserByUserId(int userId)
	{
		Connection con=DBUtility.getConnection();
		String query="select * from User where userId="+userId;
		ResultSet rs;
		Statement stmt;
		User user = null;
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	        user=new User(rs.getInt("userId"),rs.getString("userName"),rs.getString("userEmail"), rs.getString("userPhone"), rs.getString("userPic"),rs.getString("userAddress"),
    	    			rs.getString("userType"));
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return user;
	}

	@Override
	public boolean changePassword(int userId, String password)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="update user set userPassword=? where userId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,password);
    	    stmt.setInt(2,userId);
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    		
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}

	@Override
	public boolean forgetPassword(String userEmail, String userPhone, String password)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="update user set userPassword=? where userEmail=? and userPhone=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,password);
    	    stmt.setString(2,userEmail);
    	    stmt.setString(3,userPhone);
    	    row=stmt.executeUpdate();
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    		
    	}
    	
    	if(row>0)
    	   return true;
    	else
    	   return false;
	}
	
	

	

}
