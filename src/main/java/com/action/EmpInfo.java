package com.action;

import com.bean.*;
import com.doa.EmpInfoDoa;
import com.mail.SendMailUsingAuthentication;
import com.opensymphony.xwork2.ActionSupport;
import com.prop.LomsProperties;
import org.apache.struts2.interceptor.SessionAware;

import javax.mail.MessagingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Map;

public class EmpInfo extends ActionSupport implements SessionAware {
	AddEmpBean addEmpBean = new AddEmpBean(); /* For Add Employee Detail */
	EmpInfoDoa empInfoDoa = new EmpInfoDoa();
	//SearchEmpIdBean searchempidbean = new SearchEmpIdBean();
	/* For Search Employee Detail */
	private SearchEmpIdBean searchempidbean;
	EmppasschangeBean emppasschangeBean = new EmppasschangeBean();
	MailDataBean mailDataBean = new MailDataBean();
    SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();
    FeedBackBean feedBackBean = new FeedBackBean();
    
    public FeedBackBean getFeedBackBean() {
		return feedBackBean;
	}

	public void setFeedBackBean(FeedBackBean feedBackBean) {
		this.feedBackBean = feedBackBean;
	}

	String errId = "";
    String oldEmailID = "";
    String empID = "";

	public String getEmpID() {
		return empID;
	}

	public void setEmpID(String empID) {
		this.empID = empID;
	}

	public String getOldEmailID() {
		return oldEmailID;
	}

	public void setOldEmailID(String oldEmailID) {
		this.oldEmailID = oldEmailID;
	}

	public String getErrId() {
		return errId;
	}

	public void setErrId(String errId) {
		this.errId = errId;
	}

	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	public Map session;
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	public String retMsg = "";
	public String hidempid;
	public String retEmpID = "";
	public String retUserName = "";
	public String retPassword = "";
	public String errMsg = "";
	 String retClientMsg = "";
	

	public String getRetClientMsg() {
		return retClientMsg;
	}

	public void setRetClientMsg(String retClientMsg) {
		this.retClientMsg = retClientMsg;
	}

	ArrayList retGender = new ArrayList();
	public String userId;
	public String mailErrorStr = "";
	public String empPass = "";
	
	public String logOurStr = "";
	String smsService = "";
	String emailService = "";
	
	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
	public String getLogOurStr() {
		return logOurStr;
	}

	public void setLogOurStr(String logOurStr) {
		this.logOurStr = logOurStr;
	}

	
	

	public String getSmsService() {
		return smsService;
	}

	public void setSmsService(String smsService) {
		this.smsService = smsService;
	}

	public String getEmailService() {
		return emailService;
	}

	public void setEmailService(String emailService) {
		this.emailService = emailService;
	}

	public String getEmpPass() {
		return empPass;
	}

	public void setEmpPass(String empPass) {
		this.empPass = empPass;
	}

	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	
	public String getMailErrorStr() {
		return mailErrorStr;
	}

	public void setMailErrorStr(String mailErrorStr) {
		this.mailErrorStr = mailErrorStr;
	}
	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public ArrayList getRetGender() {
		return retGender;
	}

	public void setRetGender(ArrayList retGender) {
		this.retGender = retGender;
	}

	public EmppasschangeBean getEmppasschangeBean() {
		return emppasschangeBean;
	}

	public void setEmppasschangeBean(EmppasschangeBean emppasschangeBean) {
		this.emppasschangeBean = emppasschangeBean;
	}

	public String getHidempid() {
		return hidempid;
	}

	public void setHidempid(String hidempid) {
		this.hidempid = hidempid;
	}

	public String getRetEmpID() {
		return retEmpID;
	}

	public void setRetEmpID(String retEmpID) {
		this.retEmpID = retEmpID;
	}

	public String getRetUserName() {
		return retUserName;
	}

	public void setRetUserName(String retUserName) {
		this.retUserName = retUserName;
	}

	public String getRetPassword() {
		return retPassword;
	}

	public void setRetPassword(String retPassword) {
		this.retPassword = retPassword;
	}

	public String getRetMsg() {
		return retMsg;
	}

	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}

	ArrayList<AddEmpBean> retAddEmpBean = new ArrayList<AddEmpBean>();
	ArrayList retUserType = new ArrayList();
	
	ArrayList retEmqSeqQuestion1 = new ArrayList();
	ArrayList retEmqSeqQuestion2 = new ArrayList();
	public ArrayList getRetEmqSeqQuestion1() {
		return retEmqSeqQuestion1;
	}

	public void setRetEmqSeqQuestion1(ArrayList retEmqSeqQuestion1) {
		this.retEmqSeqQuestion1 = retEmqSeqQuestion1;
	}

	public ArrayList getRetEmqSeqQuestion2() {
		return retEmqSeqQuestion2;
	}

	public void setRetEmqSeqQuestion2(ArrayList retEmqSeqQuestion2) {
		this.retEmqSeqQuestion2 = retEmqSeqQuestion2;
	}

	
	
	
	 
	public ArrayList getRetUserType() {
		return retUserType;
	}

	public void setRetUserType(ArrayList retUserType) {
		this.retUserType = retUserType;
	}

	public ArrayList<AddEmpBean> getRetAddEmpBean() {
		return retAddEmpBean;
	}

	public void setRetAddEmpBean(ArrayList<AddEmpBean> retAddEmpBean) {
		this.retAddEmpBean = retAddEmpBean;
	}

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
//
//	public String getHidMenuID() {
//		return hidMenuID;
//	}
//
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}

	public SearchEmpIdBean getSearchempidbean() {
		return searchempidbean;
	}

	public void setSearchempidbean(SearchEmpIdBean searchempidbean) {
		this.searchempidbean = searchempidbean;
	}

	public String searchPageVar = "";
	ArrayList<String> arrClientdet = new ArrayList<String>();

	public ArrayList<String> getArrClientdet() {
		return arrClientdet;
	}

	public void setArrClientdet(ArrayList<String> arrClientdet) {
		this.arrClientdet = arrClientdet;
	}

	public String getSearchPageVar() {
		return searchPageVar;
	}

	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}

	public AddEmpBean getAddEmpBean() {
		return addEmpBean;
	}

	public void setAddEmpBean(AddEmpBean addEmpBean) {
		this.addEmpBean = addEmpBean;
	}

	
	
	public String employeeManagement() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String addNewEmployee() {

		retUserType.add("USER");  
		retUserType.add("ADMIN");
		retGender.add("MALE");
		retGender.add("FEMALE");
		retGender.add("OTHER");
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			addEmpBean = null; // Make all fields empty while loading new Employee add page
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
   public String addGodUserInfo(){
	   String proActFlag = ""; 
	   String mailMess = "";
	   String errCdInsLawInfo = "";
	   String errCdLoginCred = "";
	   String errCdActivationTbl = "";
	   
		LoginLoms loginLoms = new LoginLoms();
	   ArrayList<String> emailList = new ArrayList<String>();
	   proActFlag = empInfoDoa.checkProductActive();
	   if(proActFlag == "N" || proActFlag.equals("N")){
		   try {
			    String productId = (String) session.get("productId");
			    String activateCode = (String) session.get("activateCode");
 		        String clientId = (String) session.get("clientId");
 		        String activationCd = (String) session.get("activationCd");
 		        String sunEmail = (String) session.get("email_id");
 		        String sunPass = (String) session.get("pass");
 		       
			    
			    
			    retMsg = empInfoDoa.addGodUserInfoDoa(addEmpBean);	
			   
				empInfoDoa.addApplicationMasterInfoDao(addEmpBean,smsService,emailService,productId,activateCode);
				
				errCdInsLawInfo = loginLoms.insertLawyerInfo(addEmpBean,clientId);
				errCdLoginCred = loginLoms.insertLoginCredentials(addEmpBean);				
				errCdActivationTbl =loginLoms.updateActivationTbl(productId,activateCode,clientId,activationCd,addEmpBean);
				retUserName = addEmpBean.getEmployeeid();
				retPassword = addEmpBean.getEmppassword();
				/*String userFirstName = addEmpBean.getFirstname();
				String userSecondName = addEmpBean.getLastname();
				String userEmail = addEmpBean.getEmpemail();
				emailList.add(userEmail);
				emailList.add("loms.notification@sunraysts.com");
				String[] temp = retMsg.split("-");
				retEmpID = temp[0];
				retUserName = temp[1];
				retPassword = temp[2];
				mailMess += "Dear "+userFirstName+" "+userSecondName+",\n"; 
				mailMess += "Employee Info has been added Successfully. Employee ID is: "+retEmpID+"\n"; 
				mailMess += "User Name: "+retUserName+"\n"; 
				mailMess += "Password: "+retPassword+"\n"; 				 
				mailMess += "Thanks,"+"\n";
				mailMess += "Sunrays Technology Solutions."+"\n";
				
				
			   // String sendermailId = "service.raksha@gmail.com";
				String txtBody =  mailMess;//"<html> <body>"+mailMess+"</body></html>";				
				String mailSub =  "Welcome to LOMS";
				try { 
					mailErrorStr = smtpMailSender.postMail(emailList, mailSub,txtBody,sunEmail,sunPass,"INFO");
				} catch (MessagingException e) {
					//e.printStackTrace();
					mailErrorStr = "notSent";
					
				} 
	         }*/
				
			} catch (SQLException e) {
				 
			}
		  if(!errCdInsLawInfo.equals("E9999") && !errCdLoginCred.equals("E9999") && !errCdActivationTbl.equals("E9999")) {
			retClientMsg = "SUCCESS";
		  }else{
			  retClientMsg = "FAILURE";
		  }
	   }else{
		   retClientMsg = "FAILURE";
	   }
	   
	   
		
		session.remove("loginbean");
		session.remove("activateCode");
		session.remove("activationCd");
		session.remove("clientId");
		session.remove("productId");
		
		return retClientMsg;
	   
   }
	public String addEmpInfo() {
		String username = "";
		String password = "";
		ArrayList<String> emailList = new ArrayList<String>();
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 

		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			retUserType.add("USER");  
			retUserType.add("ADMIN");
			retGender.add("MALE");
			retGender.add("FEMALE");
			retGender.add("OTHER");

			
			
			
			username = loginbean.getUserName();
		    password = loginbean.getPassWord();
			retMsg = empInfoDoa.addEmpInfoDoa(addEmpBean,username,password);
			String[] temp = retMsg.split("-");
			retEmpID = temp[0];
			retUserName = temp[1];
			retPassword = temp[2];
			errMsg = temp[3]; 
			
			 if(errMsg != "E9999" || !errMsg.equals("E9999")){ 
			if(!retUserName.isEmpty() ){
				    mailDataBean = empInfoDoa.sendEmpMail(retUserName,username,password);			 
					String sendermailId = mailDataBean.getFromEmailIDOUT();
					String senderPass = mailDataBean.getFromEmailPwdOUT();
					emailList.add(mailDataBean.getToemailIdOUT());
					String mailSub = mailDataBean.getEmailSubjectOUT();
					String mailMess = mailDataBean.getEmailMsgOUT();
				try {
					String txtBody =  mailMess;//"<html> <body>"+mailMess+"</body></html>";		
					if((mailSub != "" && mailMess != "") && (mailSub != null && mailMess != null)){
					smtpMailSender.postMail(emailList, mailSub,txtBody,sendermailId,senderPass,"INFO");
					}
				} catch (MessagingException e) {					 
					e.printStackTrace();
				}
			}
			 }
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String delEmpDet() {

		String username = "";
		String password = "";
		String ret = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD"))) {
			retMsg = empInfoDoa.delEmpInfoDoa(hidempid, username, password);
			searchEmpInfoResult();

			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String editEmpDet() {

		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			retUserType.add("USER");
			retUserType.add("ADMIN");

			retGender.add("MALE");
			retGender.add("FEMALE");
			retGender.add("OTHER");
			addEmpBean = empInfoDoa.editEmpDetDoa(hidempid, username, password);
			searchempidbean = (SearchEmpIdBean) session.get("searchempidbean");			 
		    session.put("searchempidbean", searchempidbean);
		    
			String dataOfJoin = addEmpBean.dateofjoining;
			if (dataOfJoin != null) {
				String year = dataOfJoin.substring(0, 4);
				String month = dataOfJoin.substring(5, 7);
				String day = dataOfJoin.substring(8, 10);
				addEmpBean.dateofjoining = day + "/" + month + "/" + year;
			}
			String dataOfBirth = addEmpBean.dateofbirth;
			if (dataOfJoin != null) {
				String year = dataOfBirth.substring(0, 4);
				String month = dataOfBirth.substring(5, 7);
				String day = dataOfBirth.substring(8, 10);
				addEmpBean.dateofbirth = day + "/" + month + "/" + year;
			}
			
		 
			
			
			
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String editEmployeeInfo() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			retGender.add("MALE");
			retGender.add("FEMALE");
			retGender.add("OTHER");
			retUserType.add("USER");
			retUserType.add("ADMIN");
			retEmpID = empInfoDoa.editEmployeeInfoDoa(addEmpBean, username, password);
			 
		searchempidbean = (SearchEmpIdBean) session.get("searchempidbean");			 
	    session.put("searchempidbean", searchempidbean);
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}
	
	
	public String chgSecQuestion(){
		ArrayList<String> retQuestions = new ArrayList<String>();
		String username = "";
		String password = "";
		String ret = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN") || retEmpType.equals("USER"))) { 
			retEmqSeqQuestion1.add("Last Name of Family Doctor");
			retEmqSeqQuestion1.add("Who is your all time favorite cricketer");
			retEmqSeqQuestion1.add("Which web-site you created your first e-mail account");
			retEmqSeqQuestion1.add("Last 4 digits of your passport number");
			retEmqSeqQuestion1.add("In Which Month does your Father's Birthday come");
		 
			retEmqSeqQuestion2.add("What is the Brand of the First vehicle you owned");
			retEmqSeqQuestion2.add("Preferred brand of Shampoo");
			retEmqSeqQuestion2.add("Which Brand of Mobile Phone did you first own");
			retEmqSeqQuestion2.add("How many brother/sisters does your father have");
			retEmqSeqQuestion2.add("You can write in how many languages");
			 
			
						
			retQuestions = empInfoDoa.getSecQuestions(username,password);
			addEmpBean.setUsername(username);
			addEmpBean.setSecquestion1((String) retQuestions.get(0));
			addEmpBean.setSecquestion2((String) retQuestions.get(1));
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String chgEmailID(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null && (retEmpType.equals("ADMIN") || retEmpType.equals("USER")
				|| retEmpType.equals("GOD"))) {
			oldEmailID = empInfoDoa.getEmailID(username,password);
			empID = username;
			
		//	addEmpBean.setEmpemail(oldEmailID);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

		
	}
	
	public String updateEmailID(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("ADMIN") || retEmpType.equals("USER")
				|| retEmpType.equals("GOD"))) {
			addEmpBean.setUsername(username);
			retMsg = empInfoDoa.updateEmailID(addEmpBean,username,password);
			 
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	public String updateSecQuestions(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			 //ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN") || retEmpType.equals("USER"))) {
			retEmqSeqQuestion1.add("Last Name of Family Doctor");
			retEmqSeqQuestion1.add("Who is your all time favorite cricketer");
			retEmqSeqQuestion1.add("Which web-site you created your first e-mail account");
			retEmqSeqQuestion1.add("Last 4 digits of your passport number");
			retEmqSeqQuestion1.add("In Which Month does your Father's Birthday come");
		 
			retEmqSeqQuestion2.add("What is the Brand of the First vehicle you owned");
			retEmqSeqQuestion2.add("Preferred brand of Shampoo");
			retEmqSeqQuestion2.add("Which Brand of Mobile Phone did you first own");
			retEmqSeqQuestion2.add("How many brother/sisters does your father have");
			retEmqSeqQuestion2.add("You can write in how many languages");
			
			retMsg = empInfoDoa.updateSecQuestions(addEmpBean,username,password);
			
			
			
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String manageEmployee() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN") || retEmpType.equals("USER"))) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String searchEmpInfoResult() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			setSearchPageVar("value");
			if (searchempidbean == null || searchempidbean.equals("")) {
				searchempidbean = (SearchEmpIdBean) session.get("searchempidbean");
			} else {
				session.put("searchempidbean", searchempidbean);
			}
			retAddEmpBean = empInfoDoa.searchEmpInfoResultDoa(searchempidbean,
					username, password);
			
			
			for (int i = 0; i < retAddEmpBean.size(); i++) {
				String dateOfBirth = retAddEmpBean.get(i).dateofbirth;
				if (dateOfBirth != null) {
					String year = dateOfBirth.substring(0, 4);
					String month = dateOfBirth.substring(5, 7);
					String day = dateOfBirth.substring(8, 10);
					 
					retAddEmpBean.get(i).dateofbirth = day+"/"+month+"/"+ year;
				}

			}

			for (int i = 0; i < retAddEmpBean.size(); i++) {
				String dateofjoining = retAddEmpBean.get(i).dateofjoining;
				if (dateofjoining != null) {
					String year = dateofjoining.substring(0, 4);
					String month = dateofjoining.substring(5, 7);
					String day = dateofjoining.substring(8, 10);
					 
					retAddEmpBean.get(i).dateofjoining = day + "/" + month
							+ "/" + year;
				}

			}

			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String viewEmpInfo(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			addEmpBean = empInfoDoa.viewEmpInfoDao(hidempid,username, password);
			String dataOfJoin = addEmpBean.dateofjoining;
			if (dataOfJoin != null) {
				String year = dataOfJoin.substring(0, 4);
				String month = dataOfJoin.substring(5, 7);
				String day = dataOfJoin.substring(8, 10);
				addEmpBean.dateofjoining = day + "/" + month + "/" + year;
			}
			String dataOfBirth = addEmpBean.dateofbirth;
			if (dataOfJoin != null) {
				String year = dataOfBirth.substring(0, 4);
				String month = dataOfBirth.substring(5, 7);
				String day = dataOfBirth.substring(8, 10);
				addEmpBean.dateofbirth = day + "/" + month + "/" + year;
			}
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	

	public String chgPwd() {

		ArrayList<String> retQuestions = new ArrayList<String>();
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
			retQuestions = empInfoDoa.chgPwdDoa(username,password);

			emppasschangeBean.setUsername(username);
			emppasschangeBean.setSecquestion1((String) retQuestions.get(0));
			emppasschangeBean.setSecquestion2((String) retQuestions.get(1));

			//ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String updatePassword() {
		String username = "";
		String password = "";
		String nextPage = "";
		String returnCd = "";
		String returnMsg = "";
		String retMessage = "";
		String del = "\\|";
		ArrayList<String> emailList = new ArrayList<String>();
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		 
		String ret = "";
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			String userID= emppasschangeBean.getUsername();
			retMessage = empInfoDoa.updatePasswordDoa(emppasschangeBean, username,
					password);
			//emppasschangeBean = new EmppasschangeBean();
			String[] temp = retMessage.split(del);
			returnCd = temp[0];
			returnMsg = temp[1];
		 if(returnCd == "E9999" || returnCd.equals("E9999")){ 
		  
		 setLogOurStr("<font color='red'>Your Password has not been changed sucessfully! </br> Reason:"+returnMsg+"</font>");
		 nextPage = "SUCCESS";
		 }else{
			    password = emppasschangeBean.getNewpasswordconf();  // New password assigned due above method will change the old password
			    mailDataBean = empInfoDoa.sendChangePassMail(userID,username,password);			 
				String sendermailId = mailDataBean.getFromEmailIDOUT();
				String senderPass = mailDataBean.getFromEmailPwdOUT();
				emailList.add(mailDataBean.getToemailIdOUT());
				String mailSub = mailDataBean.getEmailSubjectOUT();
				String mailMess = mailDataBean.getEmailMsgOUT();
				String errID = mailDataBean.getErrorCdOUT();
				
			try {
				String txtBody =  mailMess;//"<html> <body>"+mailMess+"</body></html>";		
				if(!errID.equals("E9999")){
					if(mailSub != "" && mailMess != ""){
					  mailErrorStr = smtpMailSender.postMail(emailList, mailSub,txtBody,sendermailId,senderPass,"INFO");
					}
					if(mailErrorStr == "notSent"){
						 setLogOurStr("<font color='green'>Your Password has been changed sucessfully!</font><font color='red'> Mail has not been sent due to Internet problem.</font>");
					}else{
					    setLogOurStr("<font color='green'>Your Password has been changed sucessfully!. Check your mail for Credentials.</font>");
					}
					 
					 nextPage = "SUCCESS";
					 
					 
				}
				
			} catch (MessagingException e) {					 
				e.printStackTrace();
				mailErrorStr = "notSent"; 
				 setLogOurStr("<font color='green'>Your Password has been changed sucessfully!</font><font color='red'> Mail has not been sent due to Internet problem.</font>");
				 nextPage = "SUCCESS";
			}
			 
		 }
		 
		
         return nextPage; 
		} else {
			
			return "FAILURE";
		}
	}

	public String fgtPwd() {

		return "SUCCESS";
	}

	public String getsecquestion() {
		ArrayList<String> retQuestions = new ArrayList<String>();
		retQuestions = empInfoDoa.forgetpassword(userId);
		emppasschangeBean.setUsername(userId);
		emppasschangeBean.setSecquestion1((String) retQuestions.get(0));
		emppasschangeBean.setSecquestion2((String) retQuestions.get(1));
        
		return "SUCCESS";
	}
	
	
	public String openFeedbackForm(){
		
		
		return "SUCCESS";
	}
	
	public String submitFeedFrm(){
		Connection connection = null;
          String emailID = "";
          String password = "";
          String mailSub = "";
          String txtBody = "";
          ArrayList<String> emailList = new ArrayList<String>();
          emailList.add("loms.notification@sunraysts.com");
		
	    connection = RakshaDBUtil.getServerJudgmentActivationCon();	
	    Statement statementEmail;
		try {
			statementEmail = connection.createStatement();
			 String mailCredentials = "SELECT EMAIL_ID, EMAIL_PWD FROM MAIL_CREDENTIALS"; 
		        ResultSet resultSetMailCred = statementEmail.executeQuery(mailCredentials); 
		        while (resultSetMailCred.next()) {
		        	emailID =  resultSetMailCred.getString("EMAIL_ID"); 
		        	password =  resultSetMailCred.getString("EMAIL_PWD");
		        	
		         } 
		        
		        System.out.println(emailID+"---"+password);
		        
		        mailSub = "Feedback from "+feedBackBean.getUserName() + "("+LomsProperties.client_ID +")";    
		        txtBody += "Dear Sunrays, "+"\n"; 
		        txtBody += "Client Name : "+feedBackBean.getUserName()+"\n"; 
		        txtBody += "Client ID : "+LomsProperties.client_ID+"\n"; 
		        txtBody += "Email ID : "+feedBackBean.getEmailId()+"\n"; 
		        txtBody += "Client Comments : "+feedBackBean.getComments()+"\n"; 
		        txtBody += "Product Rating : "+feedBackBean.getProductRating()+"\n"; 
		        
		   smtpMailSender.postMail(emailList, mailSub,txtBody,emailID,password,"INFO");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
       
        emailList.add("loms.notification@sunraysts.com");
        
		
	    
		return "SUCCESS";
	}
	 
	
	
	
	
	public String sendpassmail(){
		ArrayList<String> emailList = new ArrayList<String>();
		
		emppasschangeBean.setUsername(userId);
		
	 
		    mailDataBean = empInfoDoa.sendpassmailDoa(emppasschangeBean);		
		    
		    empPass = mailDataBean.getEmpPass();
			String sendermailId = mailDataBean.getFromEmailIDOUT();
			String senderPass = mailDataBean.getFromEmailPwdOUT();
			emailList.add(mailDataBean.getToemailIdOUT());
			String mailSub = mailDataBean.getEmailSubjectOUT();
			String mailMess = mailDataBean.getEmailMsgOUT();
			retMsg = mailDataBean.getErrorMsgOUT();
			errId = mailDataBean.getErrorCdOUT();
		   
			
		try {
			String txtBody =  mailMess;//"<html> <body>"+mailMess+"</body></html>";			
		 if(!errId.equals("E9999")){
			 if((mailSub != "" && mailMess != "") && (mailSub != null && mailMess != null)){
			    smtpMailSender.postMail(emailList, mailSub,txtBody,sendermailId,senderPass,"INFO");
			 }
		 }
		} catch (MessagingException e) {					 
			e.printStackTrace();
		}
		
		if(!errId.equals("E9999")){
			retMsg = "Processing Successful";
		}else{
			retMsg = "Security validation failed. Answer Mismatch";
		}
		
    
		
		return "SUCCESS";
	}
	
	
	

	public String GetUserType(String username, String password) {
		 
		String retEmpType = "";
		try{			
			Connection connection = null;		 
			connection = RakshaDBUtil.getCon(username,password);	
			CallableStatement callStmt = null;			  	 
		    callStmt = connection.prepareCall("{ ? = call LOMS_EMP_PKG.GetUserType(?) }");		  // Calling Oracle Function  
		    callStmt.registerOutParameter(1, Types.VARCHAR);		    
		    callStmt.setString(2, username); 
			 callStmt.executeUpdate();	 
			 retEmpType = callStmt.getString(1);	 
			 callStmt.close();
	}catch(Exception e){
		 
	}
	return retEmpType;
		
		
	}

	@Override
	public void setSession(Map arg0) {
		this.session = arg0;

	}

}