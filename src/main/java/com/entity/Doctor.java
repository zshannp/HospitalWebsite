package com.entity;

public class Doctor {

	private int id;
	private String fullName;
	private String qualification;
	private String specialist;
	private int experience;
	private String contact;
	private String email;
	private String password;

	public Doctor() {
		super();
	}

	public Doctor(String fullName, String qualification, String specialist, int experience, String contact,
			String email, String password) {
		super();
		this.fullName = fullName;
		this.qualification = qualification;
		this.specialist = specialist;
		this.experience = experience;
		this.contact = contact;
		this.email = email;
		this.password = password;
	}

	public Doctor(int id, String fullName, String qualification, String specialist, int experience, String contact,
			String email, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.qualification = qualification;
		this.specialist = specialist;
		this.experience = experience;
		this.contact = contact;
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
