package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.dbUtility.DBUtility;
import com.ecommerce.pojo.Brand;
import com.ecommerce.pojo.Category;

public class BrandDaoImp implements BrandDao
{
	@Override
	public boolean addBrand(Brand brand)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="insert into Brand(brandTitle,brandDescription) values(?,?)";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setString(1,brand.getBrandTitle());
    	    stmt.setString(2,brand.getBrandDescription());
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
	public List<Brand> getAllBrand()
	{
		Connection con=DBUtility.getConnection();
		String query="select * from Brand";
		ResultSet rs;
		Statement stmt;
		Brand brand;
		List<Brand> li=new ArrayList<>();
		
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	    	brand=new Brand(rs.getString("brandTitle"), rs.getString("brandDescription"));
    	    	brand.setBrandId(rs.getInt("brandId"));
    	       li.add(brand);
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return li;
		
	}

	@Override
	public int getBrandIdByProductId(int productId)
	{
		Connection con=DBUtility.getConnection();
		String query="select brandId from product where productId="+productId;
		ResultSet rs;
		Statement stmt;
		int brandId=0;
		try
    	{
    	    stmt=con.createStatement();
    	    rs=stmt.executeQuery(query);
    	    
    	    while(rs.next())
    	    {
    	    	brandId=rs.getInt("brandId");
    	    }
    	}
    	
    	catch(SQLException e)
    	{
    		System.out.println(e);
    	}
    	
    	return brandId;
	}

	@Override
	public int getTotalBrand() {
		int totalBrand=0;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select count(brandId) from brand";
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	  totalBrand=rs.getInt("count(brandId)");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return totalBrand;  
	}

	@Override
	public String getBrandNameById(int brandId)
	{
		   String brandName=null;
		   ResultSet rs;
	 	   
	 	   Connection con=DBUtility.getConnection();
	        String query="select brandTitle from brand where brandId="+brandId;
	        
	 	   try 
	 	   {
	 		Statement stmt=con.createStatement();
	 	    rs=stmt.executeQuery(query);
	 	    while(rs.next())
	 		{
	 	    	brandName=rs.getString("brandTitle");
	 		}
	 	   }
	 	   catch (SQLException e) 
	 	   {
	 		e.printStackTrace();
	 	   }
	 	  
		 
		return brandName; 
	}

	@Override
	public boolean deleteBrandById(int brandId)
	{
		int row=0;
    	Connection con=DBUtility.getConnection();
    	String query="delete from brand where brandId=?";
    	try
    	{
    	    PreparedStatement stmt= con.prepareStatement(query);
    	    stmt.setInt(1, brandId);
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
