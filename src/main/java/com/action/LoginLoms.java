package com.action;

import com.bean.AddEmpBean;
import com.bean.CaseSearchResultBean;
import com.bean.LoginBean;
import com.bean.ReminderBean;
import com.doa.CaseInfoDoa;
import com.doa.EmpInfoDoa;
import com.doa.QuickLinksDoa;
import com.opensymphony.xwork2.ActionSupport;
import com.prop.LomsProperties;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;


@SuppressWarnings({ "serial", "unused" })
public class LoginLoms extends ActionSupport implements SessionAware{

	private LoginBean loginbean;
	public String logOurStr = "";
	public Map session;
	String retEmpType = "";
	String retActErrMsg = "";
	String retEmpID = "";
	EmpInfoDoa empInfoDoa = new EmpInfoDoa();
	
	public String checkCourtExists = "";
	
	public String getCheckCourtExists() {
		return checkCourtExists;
	}
	public void setCheckCourtExists(String checkCourtExists) {
		this.checkCourtExists = checkCourtExists;
	}
	CaseInfoDoa caseInfoDoa = new CaseInfoDoa();
	
	 
	
	
	public String getRetEmpID() {
		return retEmpID;
	}
	public void setRetEmpID(String retEmpID) {
		this.retEmpID = retEmpID;
	}
	public String getRetActErrMsg() {
		return retActErrMsg;
	}
	public void setRetActErrMsg(String retActErrMsg) {
		this.retActErrMsg = retActErrMsg;
	}
	public String activationCd = "";
	public String getActivationCd() {
		return activationCd;
	}
	public void setActivationCd(String activationCd) {
		this.activationCd = activationCd;
	}
	LomsProperties lomsProperties= new LomsProperties();
 
	QuickLinksDoa quickLinksDoa = new QuickLinksDoa();
	ArrayList<CaseSearchResultBean>  retCaseHearInfo = new ArrayList<CaseSearchResultBean> ();
	
	public ArrayList<CaseSearchResultBean> getRetCaseHearInfo() {
		return retCaseHearInfo;
	}
	public void setRetCaseHearInfo(ArrayList<CaseSearchResultBean> retCaseHearInfo) {
		this.retCaseHearInfo = retCaseHearInfo;
	}
	public String getRetEmpType() {
		return retEmpType;
	}
	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}
	public String getLogOurStr() {
		return logOurStr;
	}
	public void setLogOurStr(String logOurStr) {
		this.logOurStr = logOurStr;
	}
	
	public LoginBean getBean () {
		return loginbean;
	}
	public void setBean(LoginBean loginbean) {
		this.loginbean = loginbean;
	}
	public String username ="";
	public String password = "";
 
	
	ArrayList<ReminderBean>  retReminderBean = new ArrayList<ReminderBean> ();
	
	public ArrayList<ReminderBean> getRetReminderBean() {
		return retReminderBean;
	}

	public void setRetReminderBean(ArrayList<ReminderBean> retReminderBean) {
		this.retReminderBean = retReminderBean;
	}

	 
	
	
	public String execute(){
		 String returnVar = "";
		  String connectionStr = "";
		   
		
		 
			Connection connection = null;	 
			
			if(loginbean == null){
			  loginbean = (LoginBean) session.get("loginbean");
			}
			
			if(retEmpType == null){
				retEmpType = (String) session.get("retEmpType");
			}
			if(loginbean!= null){
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			}
			String prodCheck = "";
	 		if(!password.isEmpty() && password.length() > 6 ){
			  prodCheck =  password.substring(4,5);
	 		}
			 
			 if(!prodCheck.equals("-") ){
			   try{ 
				   connectionStr =  RakshaDBUtil.checkCon(username,password);	
				   
				   if(connectionStr.indexOf("ORA-12505") > 0){
					   connectionStr = "Listener refused the connection!";
				   }else if(connectionStr.indexOf("ORA-01017") > 0){
					   connectionStr = "Invalid username/password; logon denied!";
				   }
				 connection = RakshaDBUtil.getCon(username,password);
			 	 
				  
				}catch(Exception e){
					 
				}
				if(connection != null && !connection.equals("") ){ 
					EmpInfo empInfo = new EmpInfo();
					 retEmpType = empInfo.GetUserType(username,password);
					 session.put("loginbean", loginbean);
					 session.put("username", username);
					 session.put("retEmpType", retEmpType);
					returnVar = "SUCCESS";
					
				}else{
					 //setLogOurStr("<font color='red'>Please Enter Correct Credentials!</font>");
					 setLogOurStr("<font color='red'>"+connectionStr+"</font>");
					 
					 returnVar = "FAILURE"; 
				 } 
			 }else{
				 if(username.equals(LomsProperties.client_ID) && password.equals(LomsProperties.product_ID)){
					 String clientId = LomsProperties.client_ID;
					 String productId = LomsProperties.product_ID;
					 session.put("clientId", clientId);
					 session.put("productId", productId);
					 returnVar = "ACTIVATE"; 
				 }else{
					 setLogOurStr("<font color='red'>Please Enter Correct Client ID and Product ID!</font>");
					 returnVar = "FAILURE"; 
				 }
			 }
			return 	returnVar;
	}
	
	
 

	
	public String execute(String username,String password)  {
		
		Connection connection = null;
		  
		try{ 
		RakshaDBUtil rakshaDBUtil = new RakshaDBUtil();	
		connection = RakshaDBUtil.getCon(username,password);
	 
	     
		}catch(Exception e){
			  
		}
		 if(connection == null){
			return "FAILURE";
		 }else{

		   return "SUCCESS";
		 }
			
	} 
	
	
	 
	
	public String logOutAppln(){
		 
		session.remove("loginbean");
		setLogOurStr("<font color='green'>Thank You! You have Sucessfully Logged Out</font>");
		return "SUCCESS";
	}
	
	public String EulaDoc(){
		return "SUCCESS";		
	}
	
	public String openTroubleDoc(){
		return "SUCCESS";		
	}
	
	
	public String activationCode(){
		return "SUCCESS";	
	}
	
	public String checkActivationCode() throws SQLException{
		Connection connection = null;
		String productId = "";
		 String activateCode = "";
		 String email_id = "";
		 String pass = "";
		 String activated_date = "";
		 String clientId = "";
		 String proActFlag = "Y";
		 
		 String activationFlag = "";
		 String errorCode = "";
		 String errorMsg = "";
		 CallableStatement cstmt = null;
		   proActFlag = empInfoDoa.checkProductActive();
	     if(proActFlag == "N" || proActFlag.equals("N")){  
			try{		 
			   connection = RakshaDBUtil.getServerJudgmentActivationCon();	
			 
			   productId = (String) session.get("productId");
	           clientId = (String) session.get("clientId");	        
			   
			   cstmt = connection.prepareCall("{call CheckIfLicenseInfoIsValid(?,?,?,?,?,?)}");		   
			   	
			   	cstmt.setString(1, clientId);
			   	cstmt.setString(2, productId);
			   	cstmt.setString(3, activationCd);
			   	cstmt.registerOutParameter(4, Types.VARCHAR);
			   	cstmt.registerOutParameter(5, Types.VARCHAR);
			   	cstmt.registerOutParameter(6, Types.VARCHAR);
			 
				cstmt.executeUpdate(); 
				
            	activationFlag =  cstmt.getString(4);  
            	errorCode =  cstmt.getString(5);
            	errorMsg =  cstmt.getString(6);
	          
	            
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				 connection.commit();
		         connection.close();
			}
			 session.put("activateCode", activationCd);
			 session.put("activationCd", activationCd); 
			 
			 if(activationFlag.equals("Y") && !errorCode.equals("E9999")){
				 return "SUCCESS";	
			 }else{
					retActErrMsg = "ACTIVATION_FAIL";
					return "FAILURE";
			}
		}else{
			retActErrMsg = "ALREADY_ACTIVATED";
			return "FAILURE";	
		}
		 
		
	}
	
	public String activationCodeSucess() throws SQLException{
		 String retStmt = "";
		 Connection connection = null;
		 String productId = (String) session.get("productId");
         String clientId = (String) session.get("clientId");
         String activateCode = (String) session.get("activateCode");
         String activationCd = (String) session.get("activationCd");
         
         
         if(clientId == null || productId == null  || activationCd == null){
        	 retStmt = "HACKING";	
         }else{         
	         if(clientId.equals(LomsProperties.client_ID) && productId.equals(LomsProperties.product_ID) && activationCd.equals(activateCode)){	        	 
	           retStmt = "SUCCESS";
	        	
	         }else if(!clientId.equals(LomsProperties.client_ID) && !productId.equals(LomsProperties.product_ID) && !activationCd.equals(activateCode)){
	        	 retStmt = "FAILURE";	
	         }
         }
         
         return retStmt;	
	}
	
	public String insertLoginCredentials(AddEmpBean addEmpBean) throws SQLException{
		Connection connection = null;
	 
		String nameTitle = "";
		String errorCode = "";
    	String errorMsg = "";
		 
		CallableStatement callStmt = null;
		try{	
 
		 			
		connection = RakshaDBUtil.getServerJudgmentActivationCon();	 
		
		 callStmt = connection.prepareCall("{call  InsertLoginCredentials(?,?,?,?)}");     
		 callStmt.setString(1, addEmpBean.getEmployeeid());
		 callStmt.setString(2, addEmpBean.getEmppassword());
		 callStmt.registerOutParameter(3, Types.VARCHAR);
		 callStmt.registerOutParameter(4, Types.VARCHAR);

		 callStmt.executeUpdate();
	
	     errorCode = callStmt.getString(3);
         errorMsg = callStmt.getString(4);
		 
			}catch (Exception e) {
				 System.out.println("Exception -- >"+e);
			}
			finally{ 
		         connection.close();
			}    
		
		return errorCode;
		
		
	}
	
	
	public String insertLawyerInfo(AddEmpBean addEmpBean, String clientId) throws SQLException{
		Connection connection = null;
		String errorCode = "";
    	String errorMsg = "";
		String nameTitle = "";
	 
		CallableStatement callStmt = null;
		try{	
	  
		 			
		connection = RakshaDBUtil.getServerJudgmentActivationCon();	 
		
		  callStmt = connection.prepareCall("{call  InsertLawyersInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}"); 
		
		     
			  callStmt.setString(1, addEmpBean.getFirstname());
			  callStmt.setString(2, addEmpBean.getLastname());
			  callStmt.setString(3, addEmpBean.getGender());
			  callStmt.setString(4, addEmpBean.getTelephoneno());
			  callStmt.setString(5, addEmpBean.getMobileno());	      
		      
		      String dataOfBirth = addEmpBean.getDateofbirth();
		      String year = dataOfBirth.substring(6, 10);
		      String month = dataOfBirth.substring(3, 5);
		      String day = dataOfBirth.substring(0, 2);		 
		      dataOfBirth = year+"/"+month+"/"+day;
		      
		      callStmt.setString(6, dataOfBirth);
		      callStmt.setString(7, addEmpBean.getAddress());
		      callStmt.setString(8, addEmpBean.getOfficeaddress());
		      callStmt.setString(9, addEmpBean.getEmpemail());
		      callStmt.setString(10, addEmpBean.getEmployeeid());
		      callStmt.setString(11, clientId);
		      callStmt.setString(12, "NA");
		      callStmt.setString(13, "NA");
		      callStmt.setString(14, "NA");
		      callStmt.setString(15, "NA");
		      callStmt.setString(16, "NA");
		      callStmt.setString(17, addEmpBean.getNationality());
		      if(addEmpBean.getGender().equals("Male")){
		    	    nameTitle = "Mr";
		      }else{
		    	    nameTitle = "Ms";
		      }
		      
		      callStmt.setString(18, nameTitle);
		      callStmt.setString(19, "LOMSUSER");			      
	
		      callStmt.registerOutParameter(20, Types.VARCHAR);
			 callStmt.registerOutParameter(21, Types.VARCHAR);

			 callStmt.executeUpdate();
		
				  errorCode = callStmt.getString(20);
            	  errorMsg = callStmt.getString(21);
	         
		 
			}catch (Exception e) {
		       System.out.println("Exception -- >"+e);
			}
			finally{
			 
		         connection.close();
			}    			 
		 
		return errorCode; 
	}
	
	public String updateActivationTbl(String productId, String activateCode, String clientId, String activationCd, AddEmpBean addEmpBean) throws SQLException{
		Connection connection = null;
		CallableStatement callStmt = null;
		String errorCode = "";
    	String errorMsg = "";
		
		if(activateCode.equals(activationCd) && !activateCode.equals("")){
 			try{		    				
				Calendar currentDate = Calendar.getInstance();
				SimpleDateFormat formatter =  new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String dateNow = formatter.format(currentDate.getTime());
				 			
				connection = RakshaDBUtil.getServerJudgmentActivationCon();	
			 
				 callStmt = connection.prepareCall("{call  UpdateLicenseInfo(?,?,?,?,?,?)}");     
				 callStmt.setString(1, clientId);
				 callStmt.setString(2, productId);
				 callStmt.setString(3, activateCode);
				 callStmt.setString(4, addEmpBean.getEmployeeid());
				 callStmt.registerOutParameter(5, Types.VARCHAR);
				 callStmt.registerOutParameter(6, Types.VARCHAR);

				 callStmt.executeUpdate();
			
			     errorCode = callStmt.getString(5);
		         errorMsg = callStmt.getString(6); 
				 
 				}catch (Exception e) {
 					System.out.println("Exception -- >"+e);
 				}
 				finally{		 
		         connection.close();
 				}    			 
	 
 		   
		} 
		  return errorCode;	
	}
	 
	
	
	
	@Override
	public void setSession(Map arg0) {
		this.session = arg0;
		
	}
/*	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
*/
	
  
}