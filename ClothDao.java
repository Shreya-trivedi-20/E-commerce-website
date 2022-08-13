package com.ecommerce.dao;

import java.util.List;
import com.ecommerce.pojo.Cloth;

public interface ClothDao
{
	boolean addCloth(Cloth cloth);
    List<Cloth> getAllCloth(); 
    int getClothIdByProductId(int productId);
    int getTotalCloth();
    String getClothNameById(int clothId);
    boolean deleteClothById(int clothId);
}
