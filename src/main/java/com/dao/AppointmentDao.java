package com.dao;

import java.util.List;

import com.entity.Appointment;

public interface AppointmentDao {
	public boolean addAppointment(Appointment appointment);
	public List<Appointment> getAllAppointmentsByLoginUser(int userId);
	public List<Appointment> getAllAppointmentsByDoctorLogin(int doctorId);
	public Appointment getAppointmentsById(int id);
	public boolean updateCommentStatus(int id, int doctorId, String comment);
	public List<Appointment> getAllAppointments();
	public int countAppointment();
}
