package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.pojo.Product;

public interface ProductDao
{
   boolean addProduct(Product product);
   boolean updateProduct(Product product);
   List<Product> getAllProduct();
   List<Product> getProductByCategory(int categoryId);
   List<Product> getProductByCloth(int clothId);
   List<Product> getSearchedProduct(String productName);
   List<Product> getSearchedProduct(String productFor,int brandId,int clothId,int productRange);
   Product getProductById(int productId);
   int getTotalProduct();
   boolean deleteProductById(int productId);
   boolean deleteProductByCategoryId(int categoryId);
   boolean deleteProductByClothId(int clothId);
   int getQuantityByProductId(int productId);
   void updateQuantityAfterOrder(int productId,int productQuantity);
   int getTotalProductOfCategoryById(int categoryId);
   int getTotalProductOfClothById(int clothId);
   List<Product> getProductByBrandAndFor(String productFor,int clothId); 
}




