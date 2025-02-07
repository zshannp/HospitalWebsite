package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.SpecialistDao;
import com.entity.Specialist;

public class SpecialistDaoImpl implements SpecialistDao {

	private Connection connection;

	public SpecialistDaoImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	@Override
	public boolean addSpecialist(String specialistName) {
		boolean isAdded = false;
		try {
			String queryString = "INSERT INTO specialist_tbl (specialist_name) VALUES (?)";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, specialistName);
			
			int rowCount = preparedStatement.executeUpdate();
			
			if (rowCount == 1) {
				isAdded = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isAdded;
	}

	@Override
	public List<Specialist> getAllSpecialists() {
		
		List<Specialist> specialistsList = new ArrayList<Specialist>();
		
		Specialist specialist = null;
		
		try {
			String queryString = "SELECT * FROM specialist_tbl";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				specialist = new Specialist();
				specialist.setId(resultSet.getInt(1));
				specialist.setSpecialistName(resultSet.getString(2));
				specialistsList.add(specialist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return specialistsList;
	}
	
	@Override
	public int countSpecialist() {
		int count = 0;
		try {
			String queryString = "SELECT * FROM specialist_tbl";
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
