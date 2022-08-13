package com.ecommerce.dao;

public class Helper
{
    public static String get10Words(String productDescription)
    {
    	String[] str=productDescription.split(" ");
    	if(str.length>10)
    	{
    		String res="";
    		for(int i=0;i<10;i++)
    		{
    			res=res+str[i]+" ";
    		}
    		
    		return res+"...";
    	}
    	
    	else
    	{
    		return productDescription+"...";
    	}
    }
    
    public static int getProductSellingPrice(int productPrice,int productDiscountPercent)
    {
    	Double price=Double.parseDouble(String.valueOf(productPrice));
    	Double discount=Double.parseDouble(String.valueOf(productDiscountPercent));
    	Double tenPercentValue=discount*0.01;
    	Double tenPercentOfPrice=tenPercentValue*price;
    	Double finalPrice=productPrice-tenPercentOfPrice;
    	
    	int value = (int)Math.round(finalPrice);
    	
    	return value;
    }
}
