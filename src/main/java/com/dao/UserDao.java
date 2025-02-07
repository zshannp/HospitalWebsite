package com.dao;


import com.entity.User;
public interface UserDao {

	public boolean userRegister(User user);
	public User userLogin(String email, String password);
	public void userChangePassword(User user, String password);
	public int countUser();
}
