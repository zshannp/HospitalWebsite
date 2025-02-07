package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.dao.DoctorDao;
import com.entity.Doctor;
import com.entity.User;

public class DoctorDaoImpl implements DoctorDao {

	private Connection connection;

	public DoctorDaoImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	@Override
	public boolean registerDoctor(Doctor doctor) {

		boolean isRegistered = false;

		try {
			String queryString = "INSERT INTO doctor_tbl (full_name, qualification, specialist, experience, contact, email, password) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, doctor.getFullName());
			preparedStatement.setString(2, doctor.getQualification());
			preparedStatement.setString(3, doctor.getSpecialist());
			preparedStatement.setInt(4, doctor.getExperience());
			preparedStatement.setString(5, doctor.getContact());
			preparedStatement.setString(6, doctor.getEmail());
			preparedStatement.setString(7, doctor.getPassword());

			if (preparedStatement.executeUpdate() == 1) {
				isRegistered = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isRegistered;
	}

	@Override
	public List<Doctor> getAllDoctors() {

		List<Doctor> doctorsList = new ArrayList<Doctor>();
		Doctor doctor = null;

		try {

			String qureyString = "SELECT * FROM doctor_tbl ORDER BY id ASC";

			PreparedStatement preparedStatement = connection.prepareStatement(qureyString);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				doctor = new Doctor();
				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setQualification(resultSet.getString(3));
				doctor.setSpecialist(resultSet.getString(4));
				doctor.setExperience(resultSet.getInt(5));
				doctor.setContact(resultSet.getString(6));
				doctor.setEmail(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));
				doctorsList.add(doctor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctorsList;
	}

	@Override
	public Doctor getDoctorById(int id) {

		Doctor doctor = null;

		try {

			String qureyString = "SELECT * FROM doctor_tbl WHERE id = ?";

			PreparedStatement preparedStatement = connection.prepareStatement(qureyString);
			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				doctor = new Doctor();
				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setQualification(resultSet.getString(3));
				doctor.setSpecialist(resultSet.getString(4));
				doctor.setExperience(resultSet.getInt(5));
				doctor.setContact(resultSet.getString(6));
				doctor.setEmail(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctor;
	}

	@Override
	public boolean updateDoctor(Doctor doctor) {

		boolean isUpdated = false;

		try {

			String qureyString = "UPDATE doctor_tbl SET full_name = ?, qualification = ?, specialist = ?,"
					+ " experience = ?, contact = ?, email = ?, password = ? WHERE id = ?";

			PreparedStatement preparedStatement = connection.prepareStatement(qureyString);
			preparedStatement.setString(1, doctor.getFullName());
			preparedStatement.setString(2, doctor.getQualification());
			preparedStatement.setString(3, doctor.getSpecialist());
			preparedStatement.setInt(4, doctor.getExperience());
			preparedStatement.setString(5, doctor.getContact());
			preparedStatement.setString(6, doctor.getEmail());
			preparedStatement.setString(7, doctor.getPassword());
			preparedStatement.setInt(8, doctor.getId());

			if (preparedStatement.executeUpdate() == 1) {
				isUpdated = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}

	@Override
	public boolean deleteDoctor(int id) {
		boolean isDeleted = false;

		try {

			String queryString = "DELETE FROM doctor_tbl WHERE id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, id);

			if (preparedStatement.executeUpdate() == 1) {
				isDeleted = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDeleted;
	}

	@Override
	public Doctor doctorLogin(String email, String password) {
		
		Doctor doctor = null;
		
		try {
			
			String queryString = "SELECT * FROM doctor_tbl WHERE email = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, email);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				doctor = new Doctor(); 
				doctor.setId(resultSet.getInt(1)); 
				doctor.setFullName(resultSet.getString(2));
				doctor.setQualification(resultSet.getString(3));
				doctor.setSpecialist(resultSet.getString(4));
				doctor.setExperience(resultSet.getInt(5));
				doctor.setContact(resultSet.getString(6));
				doctor.setEmail(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return doctor;
	}
	
	@Override
	public int countDoctor() {
		int count = 0;
		try {
			String queryString = "SELECT * FROM doctor_tbl";
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
	
	@Override
	public int countAppointmentByDoctorId(int doctorId) {
		int count = 0;
		try {
			String queryString = "SELECT * FROM appointment_tbl WHERE doctor_id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, doctorId);
			
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
