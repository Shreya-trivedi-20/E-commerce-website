package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.ecommerce.dbUtility.DBUtility;
import com.ecommerce.pojo.Cloth;

public class ClothDaoImp implements ClothDao
{
	@Override
	public boolean addCloth(Cloth cloth)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="insert into Cloth(clothTitle,clothDescription) values(?,?)";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,cloth.getClothTitle());
    	    stmt.setString(2,cloth.getClothDescription());
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
	public List<Cloth> getAllCloth()
	{
		Connection con=DBUtility.getConnection();
		String query="select * from Cloth";
		ResultSet rs;
		Statement stmt;
		Cloth cloth;
		List<Cloth> li=new ArrayList<>();
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	    	cloth=new Cloth(rs.getString("clothTitle"), rs.getString("clothDescription"));
    	    	cloth.setClothId(rs.getInt("clothId"));
    	       li.add(cloth);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
		
	}

	@Override
	public int getClothIdByProductId(int productId)
	{
		Connection con=DBUtility.getConnection();
		String query="select clothId from product where productId="+productId;
		ResultSet rs;
		Statement stmt;
		int clothId=0;
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	    	clothId=rs.getInt("clothId");
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return clothId;
	}

	@Override
	public int getTotalCloth() {
		int totalCloth=0;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(clothId) from Cloth";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  totalCloth=rs.getInt("count(clothId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return totalCloth;  
	}

	@Override
	public String getClothNameById(int clothId)
	{
		   String clothName=null;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select clothTitle from Cloth where clothId="+clothId;
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	clothName=rs.getString("clothTitle");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return clothName; 
	}

	@Override
	public boolean deleteClothById(int clothId)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="delete from cloth where clothId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setInt(1, clothId);
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
