package com.ecommerce.dao;

import java.util.List;
import com.ecommerce.pojo.Brand;

public interface BrandDao
{
	boolean addBrand(Brand brand);
    List<Brand> getAllBrand(); 
    int getBrandIdByProductId(int productId);
    int getTotalBrand();
    String getBrandNameById(int brandId);
    boolean deleteBrandById(int brandId);
}
