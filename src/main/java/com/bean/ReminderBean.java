package com.bean;

public class ReminderBean {
	
	private String reminderid; 
	
	private String remindertype = "";  
	private String remindersubject = "";
	private String reminderlocn = "";   
	private String reminderdate = "";   
	private String remindertime = "";	

	private String remindermsg = "";
	
	public String getReminderid() {
		return reminderid;
	}
	public void setReminderid(String reminderid) {
		this.reminderid = reminderid;
	}
	
	public String getRemindertime() {
		return remindertime;
	}
	public void setRemindertime(String remindertime) {
		this.remindertime = remindertime;
	}

	
	public String getRemindertype() {
		return remindertype;
	}
	public void setRemindertype(String remindertype) {
		this.remindertype = remindertype;
	}
	public String getRemindersubject() {
		return remindersubject;
	}
	public void setRemindersubject(String remindersubject) {
		this.remindersubject = remindersubject;
	}
	public String getReminderlocn() {
		return reminderlocn;
	}
	public void setReminderlocn(String reminderlocn) {
		this.reminderlocn = reminderlocn;
	}
	public String getReminderdate() {
		return reminderdate;
	}
	public void setReminderdate(String reminderdate) {
		this.reminderdate = reminderdate;
	}
	public String getRemindermsg() {
		return remindermsg;
	}
	public void setRemindermsg(String remindermsg) {
		this.remindermsg = remindermsg;
	} 
}