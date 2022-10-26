package com.action;

import com.bean.LoginBean;
import com.doa.CommunicationDoa;
import com.mail.SendMailUsingAuthentication;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.util.EntityUtils;
import org.apache.struts2.interceptor.SessionAware;

import javax.mail.MessagingException;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;
//import com.sms.SMSClient;
 



@SuppressWarnings({ "serial", "unused" })
public class Communication extends ActionSupport implements SessionAware {

	public Map session; // ActionContext.getContext().getSession();
	
	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;	

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	public String txtsendNo = "";
	public String txtSendMsg = "";
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}
	//public String txtFrom="";
	public String txtTo;
	
	public String retErrMsg = "";
	public String getRetErrMsg() {
		return retErrMsg;
	}

	public void setRetErrMsg(String retErrMsg) {
		this.retErrMsg = retErrMsg;
	}
	ArrayList<String> emailList = new ArrayList<String>();

	public String txtSubject="";
	public String txtBody="";
	public String filename = "";
	public String mailErrorStr = "";

	public String getMailErrorStr() {
		return mailErrorStr;
	}

	public void setMailErrorStr(String mailErrorStr) {
		this.mailErrorStr = mailErrorStr;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getTxtTo() {
		return txtTo;
	}

	public void setTxtTo(String txtTo) {
		this.txtTo = txtTo;
	}


	/*public String[] getTxtTo() {
		return txtTo;
	}

	public void setTxtTo(String[] txtTo) {
		this.txtTo = txtTo;
	}*/

	public String getTxtSubject() {
		return txtSubject;
	}

	public void setTxtSubject(String txtSubject) {
		this.txtSubject = txtSubject;
	}

	public String getTxtBody() {
		return txtBody;
	}

	public void setTxtBody(String txtBody) {
		this.txtBody = txtBody;
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

	public String getTxtsendNo() {
		return txtsendNo;
	}

	public void setTxtsendNo(String txtsendNo) {
		this.txtsendNo = txtsendNo;
	}

	public String getTxtSendMsg() {
		return txtSendMsg;
	}

	public void setTxtSendMsg(String txtSendMsg) {
		this.txtSendMsg = txtSendMsg;
	}
	
	
	
	public String communicationManagement() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			 // ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String sendSMSView() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && retEmpType.equals("GOD")) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String sendSMS() throws UnsupportedEncodingException { 
		String username = "";
		String password = "";
		String mailCred = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && retEmpType.equals("GOD")) {
			/*SMSClient smsClient = new SMSClient(0);
			int retSms = 0;
			retSms = smsClient.sendMessage(txtsendNo, txtSendMsg);
			ln("sms sent msg : " + retSms);*/
			 CommunicationDoa communicationDoa = new CommunicationDoa();			 
			 mailCred = communicationDoa.sendMailDoa(username,password); 
			 
				String[] cred =  mailCred.split("#");
				
				 String fromMail = cred[0];
				 String fromPass = cred[1];
			retErrMsg = sendSMS(txtsendNo,txtSendMsg,fromMail,fromPass);
			 
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}
	public static String sendSMS(String sendToNo,String sendMessage,String mailId, String password) {
		String retErr = "";
		try {	
			 
			String txtmsg = java.net.URLEncoder.encode(sendMessage, "UTF-8");
			String strURL = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user="+mailId+":"+password+"&senderID=TEST%20SMS&receipientno="+sendToNo+"&dcs=0&msgtxt="+txtmsg+"&state=4";
            HttpClient client = new DefaultHttpClient(); 
            client.getParams().setParameter(CoreProtocolPNames.PROTOCOL_VERSION, HttpVersion.HTTP_1_1);
            HttpGet get = new HttpGet(strURL);
            HttpResponse responseGet = client.execute(get);  
            HttpEntity resEntityGet = responseGet.getEntity();  
            if (resEntityGet != null) {  
                //do something with the response
            	 
            	retErr = EntityUtils.toString(resEntityGet);
            	
            
            }
        } catch (Exception e) {
            e.printStackTrace();
        }   
        return retErr;
	}

	public String SendEmailView() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && retEmpType.equals("GOD")) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String SendEmail() {
		String username = "";
		String password = "";
		String mailCred = "";
		
		String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
   	    byte[] contentInBytes = null;
   	    String errMsg = "";
   	    boolean success = false;
   	    boolean exists  = false;
   	    String filePath = "";
   	    File fileToCreate = null;
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && retEmpType.equals("GOD")) {
			 CommunicationDoa communicationDoa = new CommunicationDoa();			 
			 mailCred = communicationDoa.sendMailDoa(username,password); 
			 
				String[] cred =  mailCred.split("#");
				
				 String fromMail = cred[0]; 
				 String fromPass = cred[1];
				 
				 SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();
			 
				 String[] splits = txtTo.split(",");

				 

				 for(String mailid: splits){
					 emailList.add(mailid);
				 } 
				 try {  
					 
				if(getFileUpload() != null){
					 
		        File filePre=new File(strDirectoy);
          	    exists = filePre.exists();
          		if(!exists){
          			  success = (new File(strDirectoy)).mkdir();		            			  
          		}
  			   if (success || exists) {
					 
  				     filePath = "C:\\LOMS_IMAGES_DOWNLOAD\\"+filename;
					 
					  
					  try{
						  
						  
						  fileToCreate = new File(filePath, getFileUploadFileName());// Create file name same as original
						  FileUtils.copyFile(getFileUpload(), fileToCreate); // Just copy temp file content tos this file 

						  
						}catch(Exception e){					 
					        System.out.println(e.getMessage());
					    }
						 
  			   }
  			    mailErrorStr = smtpMailSender.postMail(emailList, txtSubject, txtBody, fromMail,fromPass,fileToCreate.toString());
	        }else{
	        	mailErrorStr = smtpMailSender.postMail(emailList, txtSubject, txtBody, fromMail,fromPass,"");
	        }
						 
		} catch (MessagingException e) {	
			//e.printStackTrace();
			 
			mailErrorStr = "notSent"; 
		} 
				 
				 
		  
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

public String serviceRequest(){
	retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
	loginbean = (LoginBean) session.get("loginbean");
	String ret = "";
	if (loginbean != null) {
		String username = loginbean.getUserName();
		String password = loginbean.getPassWord();

	//	ret = loginLoms.execute(username, password);
		
	}
	if (  loginbean != null) {
		return "SUCCESS";
	} else {
		
		return "FAILURE";
	}
	
}
	
public String SendServiceEmail(){
	String username = "";
	String password = "";
	String mailCred = "";
	File fileToCreate = null;
	
	String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
	     
	    
	    boolean success = false;
	    boolean exists  = false;
	    String filePath = "";
	
	
	retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
	loginbean = (LoginBean) session.get("loginbean");
	String ret = "";
	if (loginbean != null) {
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();

		// ret = loginLoms.execute(username, password);
		
	}
	if (  loginbean != null) {     
		 CommunicationDoa communicationDoa = new CommunicationDoa();			 
		 mailCred = communicationDoa.sendMailDoa(username,password); 
		  
			 String[] cred =  mailCred.split("#");
				
			 String fromMail = cred[0];
			 String fromPass = cred[1];
			 
			 
			 SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();		 
			 String[] splits = txtTo.split(",");
			  
			 for(String mailid: splits){
				 emailList.add(mailid);
			 } 
			 
			 
			 try {  
				   // txtBody =  "<html> <body>"+txtBody+"</body></html>";		
				 if(getFileUpload() != null){ 
				 
				 File filePre=new File(strDirectoy);
        		   exists = filePre.exists();
        		if(!exists){
        			  success = (new File(strDirectoy)).mkdir();		            			  
        		}
			   if (success || exists) {
					 
				      filePath = "C:\\LOMS_IMAGES_DOWNLOAD\\";
					 
					  
					  try{
						  
						  
						    fileToCreate = new File(filePath, getFileUploadFileName());// Create file name same as original
						  FileUtils.copyFile(getFileUpload(), fileToCreate); // Just copy temp file content tos this file 

						  
						}catch(Exception e){					 
					        System.out.println(e.getMessage());
					    }
			   }
			   mailErrorStr = smtpMailSender.postMail(emailList, txtSubject, txtBody, fromMail,fromPass,fileToCreate.toString());
				 
				 }else{
					 mailErrorStr = smtpMailSender.postMail(emailList, txtSubject, txtBody, fromMail,fromPass,"");
				 }
				
				 
					
					 
				} catch (MessagingException e) {	
					//e.printStackTrace();
					 
					mailErrorStr = "notSent"; 
				} 
			  
		 
		return "SUCCESS";
	} else {
		
		return "FAILURE";
	}
}
	@Override
	public void setSession(Map arg0) {
		this.session = arg0;
		// TODO Auto-generated method stub

	}

}