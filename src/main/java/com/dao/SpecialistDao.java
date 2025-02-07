package com.dao;

import java.util.List;

import com.entity.Specialist;

public interface SpecialistDao {
	
	public boolean addSpecialist(String specialistName);
	public List<Specialist> getAllSpecialists();
	public int countSpecialist();
}
