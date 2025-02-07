package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.UserDao;
import com.entity.User;

public class UserDaoImpl implements UserDao{

	private Connection connection;
	
	public UserDaoImpl(Connection connection) {
		this.connection = connection;
	}
	
	@Override
	public boolean userRegister(User user) {
		boolean isRegistered = false;
		try {

						
			String queryString = "INSERT INTO user_tbl(full_name, email, password) VALUES (?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, user.getFullName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());

			if (preparedStatement.executeUpdate() == 1) {
				isRegistered = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isRegistered;
	}

	@Override
	public User userLogin(String email, String password) {
		
		User user = null;
		
		try {
			
			String queryString = "SELECT * FROM user_tbl WHERE email = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, email);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				user = new User(); 
				user.setId(resultSet.getInt(1)); 
				user.setFullName(resultSet.getString(2));
				user.setEmail(resultSet.getString(3));
				user.setPassword(resultSet.getString(4));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public void userChangePassword(User user, String password) {
		
		try {
			
			String queryString = "UPDATE TABLE user_tbl SET password = ?, WHERE password = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, password);
			preparedStatement.setString(1, user.getPassword());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Override
	public int countUser() {
		int count = 0;
		try {
			String queryString = "SELECT * FROM user_tbl";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
}
