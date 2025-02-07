package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.AppointmentDao;
import com.entity.Appointment;

public class AppointmentDaoImpl implements AppointmentDao {

	private Connection connection;

	public AppointmentDaoImpl(Connection connection) {
		super();
		this.connection = connection;
	}
	
	@Override
	public boolean addAppointment(Appointment appointment) {
		boolean appointed = false;
		try {
			
			String queryString = "INSERT INTO appointment_tbl(user_id, full_name, gender, age, appointment_date, email, phone, disease, doctor_id, address, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, appointment.getUserId());
			preparedStatement.setString(2, appointment.getFullName());	
			preparedStatement.setString(3, appointment.getGender());	
			preparedStatement.setString(4, appointment.getAge());	
			preparedStatement.setString(5, appointment.getAppointmentDate());	
			preparedStatement.setString(6, appointment.getEmail());	
			preparedStatement.setString(7, appointment.getPhone());	
			preparedStatement.setString(8, appointment.getDisease());	
			preparedStatement.setInt(9, appointment.getDoctorId());	
			preparedStatement.setString(10, appointment.getAddress());	
			preparedStatement.setString(11, appointment.getStatus());	
			
			if (preparedStatement.executeUpdate() == 1) {
				appointed = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return appointed;
	}

	@Override
	public List<Appointment> getAllAppointmentsByLoginUser(int userId) {
		List<Appointment> appointmentsList = new ArrayList<Appointment>();
		
		Appointment appointment = null;
		try {
			String queryString = "SELECT * FROM appointment_tbl WHERE user_id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, userId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				appointment = new Appointment();
				appointment.setId(resultSet.getInt(1));
				appointment.setUserId(resultSet.getInt(2));
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				appointment.setDisease(resultSet.getString(9));
				appointment.setDoctorId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));
				appointmentsList.add(appointment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return appointmentsList;
	}

	@Override
	public List<Appointment> getAllAppointmentsByDoctorLogin(int doctorId) {
		List<Appointment> appointmentsList = new ArrayList<Appointment>();
		
		Appointment appointment = null;
		try {
			String queryString = "SELECT * FROM appointment_tbl WHERE doctor_id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, doctorId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				appointment = new Appointment();
				appointment.setId(resultSet.getInt(1));
				appointment.setUserId(resultSet.getInt(2));
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				appointment.setDisease(resultSet.getString(9));
				appointment.setDoctorId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));
				appointmentsList.add(appointment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return appointmentsList;
	}
	
	@Override
	public List<Appointment> getAllAppointments() {
		
		List<Appointment> appointmentsList = new ArrayList<Appointment>();
		
		Appointment appointment = null;
		try {
			String queryString = "SELECT * FROM appointment_tbl ORDER BY id ASC";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				appointment = new Appointment();
				appointment.setId(resultSet.getInt(1));
				appointment.setUserId(resultSet.getInt(2));
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				appointment.setDisease(resultSet.getString(9));
				appointment.setDoctorId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));
				appointmentsList.add(appointment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return appointmentsList;
	}
	
	@Override
	public Appointment getAppointmentsById(int id) {
		
		Appointment appointment = null;
		try {
			String queryString = "SELECT * FROM appointment_tbl WHERE id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, id);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				appointment = new Appointment();
				appointment.setId(resultSet.getInt(1));
				appointment.setUserId(resultSet.getInt(2));
				appointment.setFullName(resultSet.getString(3));
				appointment.setGender(resultSet.getString(4));
				appointment.setAge(resultSet.getString(5));
				appointment.setAppointmentDate(resultSet.getString(6));
				appointment.setEmail(resultSet.getString(7));
				appointment.setPhone(resultSet.getString(8));
				appointment.setDisease(resultSet.getString(9));
				appointment.setDoctorId(resultSet.getInt(10));
				appointment.setAddress(resultSet.getString(11));
				appointment.setStatus(resultSet.getString(12));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return appointment;
	}
	
	@Override
	public boolean updateCommentStatus(int id, int doctorId, String comment) {
		boolean commented = false;
		
		try {
			String queryString = "UPDATE appointment_tbl SET status=? WHERE id=? AND doctor_id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, comment);
			preparedStatement.setInt(2, id);
			preparedStatement.setInt(3, doctorId);
			
			if (preparedStatement.executeUpdate() == 1) {
				commented = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return commented;
	}
	
	@Override
	public int countAppointment() {
		int count = 0;
		try {
			String queryString = "SELECT * FROM appointment_tbl";
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
