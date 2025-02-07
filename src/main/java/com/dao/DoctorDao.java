package com.dao;

import java.util.List;

import com.entity.Doctor;

public interface DoctorDao {
	
	public boolean registerDoctor(Doctor doctor);
	public List<Doctor> getAllDoctors();
	public Doctor getDoctorById(int id);
	public boolean updateDoctor(Doctor doctor);
	public boolean deleteDoctor(int id);
	public Doctor doctorLogin(String email, String password);
	public int countDoctor();
	public int countAppointmentByDoctorId(int doctorId);
}
