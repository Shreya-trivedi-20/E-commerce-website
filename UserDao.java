package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.pojo.User;

public interface UserDao
{
    boolean addUser(User user);
    boolean isAlreadyUser(String userEmail);
    User login(String userEmail,String password);
    String getUserType(String userEmail,String password);
    List<User> getAllUser(String userType);
    int getTotalUser();
    User getUserByUserId(int userId);
    boolean changePassword(int userId,String password);
    boolean forgetPassword(String userEmail,String userPhone,String password);
}
