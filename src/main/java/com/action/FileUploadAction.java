package com.action;

import com.bean.LoginBean;
import com.doa.CaseInfoDoa;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import java.io.File;
import java.util.Map;

public class FileUploadAction extends ActionSupport implements SessionAware {
	
	private Map session;
	CaseInfoDoa caseInfoDoa = new CaseInfoDoa();
	
	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;	
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	String retMsg = "";
	String retErrorMsg = ""; 
	//public String val;
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	
	public String txtClientID = "";
	public String txtCaseID = "";
	public String txtComment = "";
	
	
	public String hidcaseid = "";
	public String hidclientid = "";
	
	
	private String caseId = "";
	
	
	
	public String getCaseId() {
		return caseId;
	}
	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}
	
	
	
	public String getHidcaseid() {
		return hidcaseid;
	}
	public void setHidcaseid(String hidcaseid) {
		this.hidcaseid = hidcaseid;
	} 
	public String getHidclientid() {
		return hidclientid;
	}
	public void setHidclientid(String hidclientid) {
		this.hidclientid = hidclientid;
	}
	public String getRetErrorMsg() {
		return retErrorMsg;
	}
	public void setRetErrorMsg(String retErrorMsg) {
		this.retErrorMsg = retErrorMsg;
	}
	
	
	public String getTxtClientID() {
		return txtClientID;
	}
	public void setTxtClientID(String txtClientID) {
		this.txtClientID = txtClientID;
	}
	public String getTxtCaseID() {
		return txtCaseID;
	}
	public void setTxtCaseID(String txtCaseID) {
		this.txtCaseID = txtCaseID;
	}
	public String getTxtComment() {
		return txtComment;
	}
	public void setTxtComment(String txtComment) {
		this.txtComment = txtComment;
	}
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
	public LoginLoms getLoginLoms() {
		return loginLoms;
	}
	public void setLoginLoms(LoginLoms loginLoms) {
		this.loginLoms = loginLoms;
	}
	public LoginBean getLoginbean() {
		return loginbean;
	}
	public void setLoginbean(LoginBean loginbean) {
		this.loginbean = loginbean;
	}
	public String getRetMsg() {
		return retMsg;
	}
	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}
	/*public String getVal() {
		return val;
	}
	public void setVal(String val) {
		this.val = val;
	}*/
//	public String getHidMenuID() {
//		return hidMenuID;
//	}
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}
//	public String getHidSubMenuID1() {
//		return hidSubMenuID1;
//	}
//	public void setHidSubMenuID1(String hidSubMenuID1) {
//		this.hidSubMenuID1 = hidSubMenuID1;
//	}
//	public String getHidSubMenuID2() {
//		return hidSubMenuID2;
//	}
//	public void setHidSubMenuID2(String hidSubMenuID2) {
//		this.hidSubMenuID2 = hidSubMenuID2;
//	}
	public String getRetEmpType() {
		return retEmpType;
	}
	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}
	
	
	
	
	public String addCaseDocument() { 
		
		 
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
			 
			String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			
			txtCaseID = hidcaseid;
			 txtClientID = hidclientid;
			retMsg = "";
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	
	public String uploadCaseDoc() {
		String username = "";
		String password = "";
		 
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
 		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
			String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) { 
			long filesize = fileUpload.length();    
			long filesizeInKB = filesize / 1024;       
			System.out.println("Size of File is: "+ filesizeInKB + " KB");
			long filesizeInMB = filesizeInKB / 1024;
			 
			 if(filesizeInKB <= 5120)	{
		 
		    	retMsg = caseInfoDoa.uploadCaseDocDoa(getHidcaseid(),getHidclientid(),getTxtComment(),getFileUpload(),getFileUploadFileName(),username,password);
			 }else{
				 retErrorMsg = "<div class='err'>Document size should be less then 5 MB. <br/> " +
				 		"Note: Attached file size is "+filesizeInMB +"MB </div>";
			 }
			if(retMsg.equals("E1049")){
				retErrorMsg = "<div class='succ'>Document has been Added Successfully.</div>";
			}else if(retMsg.equals("E9999")){
				retErrorMsg = "<div class='err'>Document has not been Added Successfully.</div>";
			}
			
			txtComment = "";
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String uploadCaseDocMenu() {
		String username = "";
		String password = "";
		 
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
 		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
			String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {	
			long filesize = fileUpload.length();    
			long filesizeInKB = filesize / 1024;       
			System.out.println("Size of File is: "+ filesizeInKB + " KB");
			long filesizeInMB = filesizeInKB / 1024;
			 
			 if(filesizeInKB <= 5120)	{
			retMsg = caseInfoDoa.uploadCaseDocDoa(getTxtCaseID(),getTxtClientID(),getTxtComment(),getFileUpload(),getFileUploadFileName(),username,password);
			 }else{
				 retErrorMsg = "<div class='err'>Document size should be less then 5 Mb. <br/> " +
				 		"Note: Attached file size is "+filesizeInMB +"MB </div>";
			 }
			if(retMsg.equals("E1049")){
				retErrorMsg = "<div class='succ'>Document has been Added Successfully.</div>";
			}else if(retMsg.equals("E9999")){
				retErrorMsg = "<div class='err'>Document has not been Added Successfully.</div>";
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
