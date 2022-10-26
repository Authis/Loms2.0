package com.action;

import com.bean.LoginBean;
import com.bean.ReminderBean;
import com.doa.ReminderDoa;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import java.util.ArrayList;
import java.util.Map;

public class Reminder extends ActionSupport implements SessionAware{
	@SuppressWarnings("rawtypes")
	public Map session; //ActionContext.getContext().getSession();
	ReminderBean reminderBean;
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	ReminderDoa reminderDoa = new ReminderDoa();
	public String searchPageVar="";
	public String hidreminderid="";
	public String retMsg = "";
	String txtUserId = "";
	
	String userName = "";
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTxtUserId() {
		return txtUserId;
	}

	public void setTxtUserId(String txtUserId) {
		this.txtUserId = txtUserId;
	}

	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	
	ArrayList retReminderList = new ArrayList();
	
	public ArrayList getRetReminderList() {
		return retReminderList;
	}

	public void setRetReminderList(ArrayList retReminderList) {
		this.retReminderList = retReminderList;
	}

	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}
	public String getRetMsg() {
		return retMsg;
	}

	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}

	public String getHidreminderid() {
		return hidreminderid;
	}

	public void setHidreminderid(String hidreminderid) {
		this.hidreminderid = hidreminderid;
	}

	public String getSearchPageVar() {
		return searchPageVar;
	}

	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}

	ArrayList<ReminderBean>  retReminderBean = new ArrayList<ReminderBean> ();
	
	public ArrayList<ReminderBean> getRetReminderBean() {
		return retReminderBean;
	}

	public void setRetReminderBean(ArrayList<ReminderBean> retReminderBean) {
		this.retReminderBean = retReminderBean;
	}

	String retRemID = "";
	
	public String getRetRemID() {
		return retRemID;
	}

	public void setRetRemID(String retRemID) {
		this.retRemID = retRemID;
	}

//	public String getHidMenuID() {
//		return hidMenuID;
//	}
//
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}
//
//	public String getHidSubMenuID1() {
//		return hidSubMenuID1;
//	}
//
//	public void setHidSubMenuID1(String hidSubMenuID1) {
//		this.hidSubMenuID1 = hidSubMenuID1;
//	}
//
//	public String getHidSubMenuID2() {
//		return hidSubMenuID2;
//	}
//
//	public void setHidSubMenuID2(String hidSubMenuID2) {
//		this.hidSubMenuID2 = hidSubMenuID2;
//	}

	public ReminderBean getReminderBean() {
		return reminderBean;
	}

	public void setReminderBean(ReminderBean reminderBean) {
		this.reminderBean = reminderBean;
	}

	
	
	
	public String reminderManagement(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN  
		
		String username = "";
		String password = "";
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){ 
		 
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	
	public String addreminder(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		 
		
		String username = "";
		String password = "";
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))){
			 
		   retReminderList = reminderDoa.getactiveUserList(retEmpType,username,password);
		   userName  = reminderDoa.getactiveUserName(txtUserId,username,password);
			
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
	}
	public String addremindersave(){
		
 
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null){
			retRemID = reminderDoa.addremindersaveDao(reminderBean,username,password);
			 retReminderList = reminderDoa.getactiveUserList(retEmpType,username,password);
			   userName  = reminderDoa.getactiveUserName(txtUserId,username,password);
			reminderBean = new ReminderBean();
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String viewreminder(){
		
		setSearchPageVar("value");	
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");	
		String username = "";
		String password = "";
		String ret = "";
		if(loginbean!= null){
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			//  ret = loginLoms.execute(username,password);
		}
		if(  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))){
		
			retReminderBean = reminderDoa.viewreminderDao(username,password,"frmMenu");
			
			for(int i=0;i<retReminderBean.size();i++){
				String remdate = retReminderBean.get(i).getReminderdate();
				if(remdate!=null){
					String year = remdate.substring(0, 4);
					String month = remdate.substring(5, 7);
					String day = remdate.substring(8, 10); 
					
					retReminderBean.get(i).setReminderdate(day+"/"+month+"/"+year);
			   }
			
			} 
			  ret = loginLoms.execute(username,password);
			
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	public String delReminder(){
		
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if(loginbean!= null){
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
		// ret = loginLoms.execute(username,password);
		
		}
		if(  loginbean != null  && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))){
			reminderDoa.delReminderDao(hidreminderid,username,password);
			viewreminder();
			return "SUCCESS";
		}else{
			
			return "FAILURE";
		}
		
	}
	
	@Override
	public void setSession(Map arg0) {
		this.session = arg0;
		// TODO Auto-generated method stub
		
	}

}
