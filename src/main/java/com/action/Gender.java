package com.action;

public class Gender {

	private String genderId;

	private String genderName;
	
	Gender(String genderId, String genderName)
	{
		this.genderId = genderId;
		this.genderName = genderName;
	}
	
	public String getGenderId() {
		return genderId;
	}

	public void setGenderId(String genderId) {
		this.genderId = genderId;
	}

	public String getGenderName() {
		return genderName;
	}

	public void setGenderName(String genderName) {
		this.genderName = genderName;
	}
	
}
