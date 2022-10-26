package com.action;

import com.bean.*;
import com.doa.CaseInfoDoa;
import com.doa.ClientInfoDoa;
import com.doa.LawStandardInfoDoa;
import com.mail.SendMailUsingAuthentication;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.struts2.interceptor.SessionAware;

import javax.mail.MessagingException;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

@SuppressWarnings({ "serial", "unused" })
public class CaseInfo extends ActionSupport implements SessionAware {
	
	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;
	private String fileName;
	private InputStream fileInputStream; 
	String caseDocName = "";
	private String retClientID = "";
 	
   public String downloadFileName = "";
	
	

	public String getDownloadFileName() {
			return downloadFileName;
		}

		public void setDownloadFileName(String downloadFileName) {
			this.downloadFileName = downloadFileName;
		}

	public String getRetClientID() {
		return retClientID;
	}

	public void setRetClientID(String retClientID) {
		this.retClientID = retClientID;
	}

	public String getCaseDocName() {
		return caseDocName;
	}

	public void setCaseDocName(String caseDocName) {
		this.caseDocName = caseDocName;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public InputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}

	
	
	ArrayList<String> stateName = new ArrayList<String>();
	ArrayList<String> disName = new ArrayList<String>();
	public String hidTxtState = "";
	public String retCourtID = "";
	StdCourtInfoBean addCourtInfoBean = new StdCourtInfoBean(); 
	
	public StdCourtInfoBean getAddCourtInfoBean() {
		return addCourtInfoBean;
	}

	public void setAddCourtInfoBean(StdCourtInfoBean addCourtInfoBean) {
		this.addCourtInfoBean = addCourtInfoBean;
	}

	public String getRetCourtID() {
		return retCourtID;
	}

	public void setRetCourtID(String retCourtID) {
		this.retCourtID = retCourtID;
	}

	public String getHidTxtState() {
		return hidTxtState;
	}

	public void setHidTxtState(String hidTxtState) {
		this.hidTxtState = hidTxtState;
	}

	public ArrayList<String> getDisName() {
		return disName;
	}

	public void setDisName(ArrayList<String> disName) {
		this.disName = disName;
	}

	public ArrayList<String> getStateName() {
		return stateName;
	}

	public void setStateName(ArrayList<String> stateName) {
		this.stateName = stateName;
	}
	
	
	
	private SearchCaseInfoBean searchCaseInfoBean; /* For Search Case Info */
	private SearchCaseDocBean searchCaseDocBean; /* For Search Case Doc */
	public SearchBean searchbean; /* For Search Client Info */
	AddCaseDocBean addCaseDocBean = new AddCaseDocBean();
	




	CaseInfoDoa caseInfoDoa = new CaseInfoDoa();
	AddCaseBean addCaseBean = new AddCaseBean(); // For Add Page
	AddCaseBean editCaseBean = new AddCaseBean(); // For Edit Case Page
	
	OppDetailBean oppDetailBean = new OppDetailBean();
	CaseHearingBean caseHearingBean = new CaseHearingBean();
	ArrayList<SearchCaseDocBean> retSearchCaseDocBean = new ArrayList<SearchCaseDocBean>();
	ArrayList<CaseHearingBean> retCaseHearingBean = new ArrayList<CaseHearingBean>();
	ArrayList<AddClientBean> retvaladdClientBean = new ArrayList<AddClientBean>();
	LawStandardInfoDoa lawStandardInfoDoa = new LawStandardInfoDoa();
	ArrayList<StdCourtInfoBean> arrStdCourtInfoBean = new ArrayList<StdCourtInfoBean>();
	ArrayList<OppDetailBean> arroppDetailBean = new ArrayList<OppDetailBean>();
	 OppDetailBean editoppDetailBean = new OppDetailBean();
	
	 SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();
		MailDataBean mailDataBean = new MailDataBean();
		   Communication communication = new Communication();
	public OppDetailBean getEditoppDetailBean() {
		return editoppDetailBean;
	}

	public void setEditoppDetailBean(OppDetailBean editoppDetailBean) {
		this.editoppDetailBean = editoppDetailBean;
	}

	StdCourtInfoBean stdCourtInfoBean = new StdCourtInfoBean(); /* Search Std Court info */
	public StdCourtInfoBean getStdCourtInfoBean() {
		return stdCourtInfoBean;
	}

	public void setStdCourtInfoBean(StdCourtInfoBean stdCourtInfoBean) {
		this.stdCourtInfoBean = stdCourtInfoBean;
	}

	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	int txtCounter = 0; //  Counter Value to get Opponent details
	String hidcaseoppid= "";
	String retDelvar = "";
	String retEditvar = ""; 
	
	public String del = "\\,";
	public String caseNo = "";	              
	public String clientId = "";	
	public String[] oppPartyName;		      
	public String[] oppPartyAddress;		
	public String[] oppPartyTelNo;		      
	public String[] oppPartyMobNo;		      
	public String[] oppPartEmailId;		      
	public String[] oppPartyOrgName;		      
	public String[] oppPartyOrgRepName;		
	public String[] oppPartyOrgAddress;		
	public String[] oppPartyOrgTelNo;		
	public String[] oppPartyOrgMobNo;		
	public String[] oppPartyOrgEmailId;		
	public String[] oppPartyLawyerName;		
	public String[] oppPartyLawyerAddress;		
	public String[] oppPartyLawyerTelNo;		
	public String[] oppPartyLawyerMobNo ;		
	public String[] oppPartyLawyerEmailId;
	
	public int txtCounterint = 0;
	public String mailErrorStr = "";
	
	public String getMailErrorStr() {
		return mailErrorStr;
	}

	public void setMailErrorStr(String mailErrorStr) {
		this.mailErrorStr = mailErrorStr;
	}

	public int getTxtCounterint() {
		return txtCounterint;
	}

	public void setTxtCounterint(int txtCounterint) {
		this.txtCounterint = txtCounterint;
	}

	public String getRetEditvar() {
		return retEditvar;
	}

	public void setRetEditvar(String retEditvar) {
		this.retEditvar = retEditvar;
	}

	
	public String getRetDelvar() {
		return retDelvar;
	}

	public void setRetDelvar(String retDelvar) {
		this.retDelvar = retDelvar;
	}
	
	public String getHidcaseoppid() {
		return hidcaseoppid;
	}

	public void setHidcaseoppid(String hidcaseoppid) {
		this.hidcaseoppid = hidcaseoppid;
	}
	public ArrayList<OppDetailBean> getArroppDetailBean() {
		return arroppDetailBean;
	}

	public void setArroppDetailBean(ArrayList<OppDetailBean> arroppDetailBean) {
		this.arroppDetailBean = arroppDetailBean;
	}

	public AddCaseBean getEditCaseBean() {
		return editCaseBean;
	}

	public void setEditCaseBean(AddCaseBean editCaseBean) {
		this.editCaseBean = editCaseBean;
	}

	public OppDetailBean getOppDetailBean() {
		return oppDetailBean;
	}

	public void setOppDetailBean(OppDetailBean oppDetailBean) {
		this.oppDetailBean = oppDetailBean;
	}
	public int getTxtCounter() {
		return txtCounter;
	}

	public void setTxtCounter(int txtCounter) {
		this.txtCounter = txtCounter;
	}

	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}

	public ArrayList<StdCourtInfoBean> getArrStdCourtInfoBean() {
		return arrStdCourtInfoBean;
	}

	public void setArrStdCourtInfoBean(
			ArrayList<StdCourtInfoBean> arrStdCourtInfoBean) {
		this.arrStdCourtInfoBean = arrStdCourtInfoBean;
	}

	public ArrayList<AddClientBean> getRetvaladdClientBean() {
		return retvaladdClientBean;
	}

	public void setRetvaladdClientBean(
			ArrayList<AddClientBean> retvaladdClientBean) {
		this.retvaladdClientBean = retvaladdClientBean;
	}

	public SearchBean getSearchbean() {
		return searchbean;
	}

	public void setSearchbean(SearchBean searchbean) {
		this.searchbean = searchbean;
	}

	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();

	ArrayList retCivilSuiteType = new ArrayList();
	ArrayList retCaseSubTypes = new ArrayList();
	
	public ArrayList getRetCaseSubTypes() {
		return retCaseSubTypes;
	}

	public void setRetCaseSubTypes(ArrayList retCaseSubTypes) {
		this.retCaseSubTypes = retCaseSubTypes;
	}

	ArrayList retCivilAppealType = new ArrayList();
	ArrayList retCivilPetitioneType = new ArrayList();
	ArrayList retCivilExecutionType = new ArrayList();
	ArrayList retCriminalType = new ArrayList();
	
	ArrayList retCaseType = new ArrayList();
	ArrayList retCasePriority = new ArrayList();
	ArrayList retCaseStatus = new ArrayList();
	
	private Map session;

	String retMsg = "";
	String caseId = "";
	public String retOppId= "";
	
	public String getRetOppId() {
		return retOppId;
	}

	public void setRetOppId(String retOppId) {
		this.retOppId = retOppId;
	}

	public String val;

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}


	public ArrayList getRetCasePriority() {
		return retCasePriority;
	}

	public void setRetCasePriority(ArrayList retCasePriority) {
		this.retCasePriority = retCasePriority;
	}

	public ArrayList getRetCaseStatus() {
		return retCaseStatus;
	}

	public void setRetCaseStatus(ArrayList retCaseStatus) {
		this.retCaseStatus = retCaseStatus;
	}
	
	public ArrayList getRetCaseType() {
		return retCaseType;
	}

	public void setRetCaseType(ArrayList retCaseType) {
		this.retCaseType = retCaseType;
	}

	public String getCaseId() {
		return caseId;
	}

	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}
	public String getRetMsg() {
		return retMsg;
	}

	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}

	public String hidcaseid;
	public String hidclientid;
	public String hidclientidmenu;
	




	public String comments; 
	public String hisdocid;
	public String hidcasehearid;
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	String casesubtype = "";
	

	public ArrayList getRetCivilAppealType() {
		return retCivilAppealType;
	}

	public void setRetCivilAppealType(ArrayList retCivilAppealType) {
		this.retCivilAppealType = retCivilAppealType;
	}

	public ArrayList getRetCivilPetitioneType() {
		return retCivilPetitioneType;
	}

	public void setRetCivilPetitioneType(ArrayList retCivilPetitioneType) {
		this.retCivilPetitioneType = retCivilPetitioneType;
	}

	public ArrayList getRetCivilExecutionType() {
		return retCivilExecutionType;
	}

	public void setRetCivilExecutionType(ArrayList retCivilExecutionType) {
		this.retCivilExecutionType = retCivilExecutionType;
	}

	public ArrayList getRetCriminalType() {
		return retCriminalType;
	}

	public void setRetCriminalType(ArrayList retCriminalType) {
		this.retCriminalType = retCriminalType;
	}

	public ArrayList getRetCivilSuiteType() {
		return retCivilSuiteType;
	}

	public void setRetCivilSuiteType(ArrayList retCivilSuiteType) {
		this.retCivilSuiteType = retCivilSuiteType;
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

	ArrayList<AddCaseBean> retAddCaseBean = new ArrayList<AddCaseBean>();
	ArrayList<CaseSearchResultBean>  retCaseSearchResult = new ArrayList<CaseSearchResultBean>();

	public ArrayList<CaseSearchResultBean> getRetCaseSearchResult() {
		return retCaseSearchResult;
	}

	public void setRetCaseSearchResult(
			ArrayList<CaseSearchResultBean> retCaseSearchResult) {
		this.retCaseSearchResult = retCaseSearchResult;
	}

	public String getHidcasehearid() {
		return hidcasehearid;
	}

	public void setHidcasehearid(String hidcasehearid) {
		this.hidcasehearid = hidcasehearid;
	}

	public String getHisdocid() {
		return hisdocid;
	}

	public void setHisdocid(String hisdocid) {
		this.hisdocid = hisdocid;
	}

	public ArrayList<CaseHearingBean> getRetCaseHearingBean() {
		return retCaseHearingBean;
	}

	public void setRetCaseHearingBean(
			ArrayList<CaseHearingBean> retCaseHearingBean) {
		this.retCaseHearingBean = retCaseHearingBean;
	}

	public CaseHearingBean getCaseHearingBean() {
		return caseHearingBean;
	}

	public void setCaseHearingBean(CaseHearingBean caseHearingBean) {
		this.caseHearingBean = caseHearingBean;
	}

	public ArrayList<SearchCaseDocBean> getRetSearchCaseDocBean() {
		return retSearchCaseDocBean;
	}

	public void setRetSearchCaseDocBean(
			ArrayList<SearchCaseDocBean> retSearchCaseDocBean) {
		this.retSearchCaseDocBean = retSearchCaseDocBean;
	}

	public ArrayList<AddCaseBean> getRetAddCaseBean() {
		return retAddCaseBean;
	}

	public void setRetAddCaseBean(ArrayList<AddCaseBean> retAddCaseBean) {
		this.retAddCaseBean = retAddCaseBean;
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
	public String getHidclientidmenu() {
		return hidclientidmenu;
	}

	public void setHidclientidmenu(String hidclientidmenu) {
		this.hidclientidmenu = hidclientidmenu;
	}
	
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}


	public AddCaseBean getAddCaseBean() {
		return addCaseBean;
	}

	public void setAddCaseBean(AddCaseBean addCaseBean) {
		this.addCaseBean = addCaseBean;
	}

	 

	public String searchPageVar = "";

	public SearchCaseInfoBean getSearchCaseInfoBean() {
		return searchCaseInfoBean;
	}

	public void setSearchCaseInfoBean(SearchCaseInfoBean searchCaseInfoBean) {
		this.searchCaseInfoBean = searchCaseInfoBean;
	}

	public String getSearchPageVar() {
		return searchPageVar;
	}

	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}

	public SearchCaseDocBean getSearchCaseDocBean() {
		return searchCaseDocBean;
	}

	public void setSearchCaseDocBean(SearchCaseDocBean searchCaseDocBean) {
		this.searchCaseDocBean = searchCaseDocBean;
	}
	
	public AddCaseDocBean getAddCaseDocBean() {
		return addCaseDocBean;
	}

	public void setAddCaseDocBean(AddCaseDocBean addCaseDocBean) {
		this.addCaseDocBean = addCaseDocBean;
	}

	
	public String caseManagement() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	
	public String newCaseInfo() {
		 
		String username = "";
		String password = "";
		 
		retCaseType.add("CIVIL");
		retCaseType.add("CRIMINAL");
		 
		
		retCasePriority.add("HIGH");
		retCasePriority.add("NORMAL");
		retCasePriority.add("LOW");
		retCaseStatus.add("NEW");
		retCaseStatus.add("IN PROGRESS");
		retCaseStatus.add("PENDING");
		retCaseStatus.add("CLOSED");
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			//ln("credentials--->" + username + "--->" + password);
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
		    casesubtype = addCaseBean.getCasesubtype1(); 
		    if(txtCounter != 0  ){
		    setTxtCounter(txtCounter);
		    }
		 // if(casesubtype != null){
		    
		     //if(casesubtype.equals("APPEAL") || casesubtype == "APPEAL"){			 
			   retCivilSuiteType.add(0,"");
		     //}
			 //if(casesubtype.equals("EXECUTION") || casesubtype == "EXECUTION"){			 
				retCivilSuiteType.add(1,caseInfoDoa.newCaseAppealDoa(username,password));
			 //}
			 //if(casesubtype.equals("PETITION") || casesubtype == "PETITION"){			 
				retCivilSuiteType.add(2,caseInfoDoa.newCaseExecutionDoa(username,password));
			 //}
			 //if(casesubtype.equals("SUIT") || casesubtype == "SUIT"){
			   retCivilSuiteType.add(3, caseInfoDoa.newCasePetitioneDoa(username,password));				
			 //} 
			 //if(casesubtype.equals("CRIMINAL") || casesubtype == "CRIMINAL"){			 
				retCivilSuiteType.add(4,caseInfoDoa.newCaseSuiteDoa(username,password));
			 //}
				retCivilSuiteType.add(5,caseInfoDoa.newCaseCriminalDoa(username,password));
		//  }
				addCaseBean.clientid = retClientID;
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String addCaseInfoSave() {
		ArrayList<String> emailList = new ArrayList<String>();
		String username = "";
		String password = "";
		retCaseType.add("CIVIL");
		retCaseType.add("CRIMINAL");
		retCasePriority.add("HIGH");
		retCasePriority.add("NORMAL");
		retCasePriority.add("LOW");
		retCaseStatus.add("NEW");
		retCaseStatus.add("IN PROGRESS");
		retCaseStatus.add("PENDING");
		retCaseStatus.add("CLOSED");
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
			//String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			 casesubtype = addCaseBean.getCasesubtype1();
			   retCivilSuiteType.add(0,"");		
			   retCivilSuiteType.add(1,caseInfoDoa.newCaseAppealDoa(username,password));		    
			   retCivilSuiteType.add(2,caseInfoDoa.newCaseExecutionDoa(username,password));			
			   retCivilSuiteType.add(3,caseInfoDoa.newCasePetitioneDoa(username,password));			
			   retCivilSuiteType.add(4, caseInfoDoa.newCaseSuiteDoa(username,password));		
			   retCivilSuiteType.add(5,caseInfoDoa.newCaseCriminalDoa(username,password));		
			
			caseId = caseInfoDoa.addCaseInfoSaveDoa(addCaseBean,username,password);
			int count = 0;
			 if(txtCounter != 0){
		     count = txtCounter ;
			 caseNo = caseId;             
			 clientId = addCaseBean.getClientid();	              
			 oppPartyName = oppDetailBean.getOppPartyName().split(del);		
			  
			 oppPartyAddress = oppDetailBean.getOppPartyAddress().split(del);	  
			 oppPartyTelNo = oppDetailBean.getOppPartyTelNo().split(del);		      
			 oppPartyMobNo = oppDetailBean.getOppPartyMobNo().split(del);		      
			 oppPartEmailId = oppDetailBean.getOppPartEmailId().split(del);	      
			 oppPartyOrgName = oppDetailBean.getOppPartyOrgName().split(del);	  
			 oppPartyOrgRepName = oppDetailBean.getOppPartyOrgRepName().split(del);		  
			 oppPartyOrgAddress = oppDetailBean.getOppPartyOrgAddress().split(del);	  
			 oppPartyOrgTelNo = oppDetailBean.getOppPartyOrgTelNo().split(del);	  
			 oppPartyOrgMobNo = oppDetailBean.getOppPartyOrgMobNo().split(del);	  
			 oppPartyOrgEmailId = oppDetailBean.getOppPartyOrgEmailId().split(del);	  
			 oppPartyLawyerName = oppDetailBean.getOppPartyLawyerName().split(del);	  
			 oppPartyLawyerAddress = oppDetailBean.getOppPartyLawyerAddress().split(del);		
			 oppPartyLawyerTelNo = oppDetailBean.getOppPartyLawyerTelNo().split(del);	
			 oppPartyLawyerMobNo  = oppDetailBean.getOppPartyLawyerMobNo().split(del);	
			 oppPartyLawyerEmailId = oppDetailBean.getOppPartyLawyerEmailId().split(del); 

			for(int i = 0;i<=count-1;i++){
				oppDetailBean = new OppDetailBean();
				oppDetailBean.setCaseNo(caseNo);
				oppDetailBean.setClientId(clientId);
				oppDetailBean.setOppPartyName(oppPartyName[i]);  		 
				oppDetailBean.setOppPartyAddress(oppPartyAddress[i]); 		 
				oppDetailBean.setOppPartyTelNo(oppPartyTelNo[i]); 		 
				oppDetailBean.setOppPartyMobNo(oppPartyMobNo[i]); 		 
				oppDetailBean.setOppPartEmailId(oppPartEmailId[i]); 		 
				oppDetailBean.setOppPartyOrgName(oppPartyOrgName[i]); 		 
				oppDetailBean.setOppPartyOrgRepName(oppPartyOrgRepName[i]); 		
				oppDetailBean.setOppPartyOrgAddress(oppPartyOrgAddress[i]);		
				oppDetailBean.setOppPartyOrgTelNo(oppPartyOrgTelNo[i]); 		
				oppDetailBean.setOppPartyOrgMobNo(oppPartyOrgMobNo[i]); 		
				oppDetailBean.setOppPartyOrgEmailId(oppPartyOrgEmailId[i]); 		
				oppDetailBean.setOppPartyLawyerName(oppPartyLawyerName[i]); 		
				oppDetailBean.setOppPartyLawyerAddress(oppPartyLawyerAddress[i]); 
				oppDetailBean.setOppPartyLawyerTelNo(oppPartyLawyerTelNo[i]); 		
				oppDetailBean.setOppPartyLawyerMobNo(oppPartyLawyerMobNo[i]);  	
				oppDetailBean.setOppPartyLawyerEmailId(oppPartyLawyerEmailId[i]); 
				
				retMsg = caseInfoDoa.addCaseOppInfoSaveDoa(oppDetailBean,username,password);
				
			}
		 }
			 if((retMsg != "E9999" || !retMsg.equalsIgnoreCase("E9999")) && !caseId.isEmpty()){
				    mailDataBean = caseInfoDoa.sendCaseMail(caseId,username,password);			 
					String sendermailId = mailDataBean.getFromEmailIDOUT();
					String senderPass = mailDataBean.getFromEmailPwdOUT();
					emailList.add(mailDataBean.getToemailIdOUT());
					String mailSub = mailDataBean.getEmailSubjectOUT();
					String mailMess = mailDataBean.getEmailMsgOUT();
					String mobileNo = mailDataBean.getMobileNoOUT();
					String smsMessage = mailDataBean.getSmsMessageOUT();
					try {
						if((mailSub != "" && mailMess != "")  && (mailSub != null && mailMess != null)){
						String txtBody =  mailMess;//"<html> <body>"+mailMess+"</body></html>";					
						mailErrorStr = smtpMailSender.postMail(emailList, mailSub,txtBody,sendermailId,senderPass,"INFO");
						}		
						
					} catch (MessagingException e) {	
						e.printStackTrace();
						mailErrorStr = "notSent"; 
					}
					
				
					try{
						if((mobileNo != "" && smsMessage != "")  && (mobileNo != null && smsMessage != null))
						communication.sendSMS(mobileNo,smsMessage,sendermailId,senderPass);
					}catch (Exception e) {
						e.printStackTrace();
					} 
					
					
					/*caseHearingBean.setCaseid(caseId);
					caseHearingBean.setClientid(clientId);
					
					session.put("hidcaseid", caseId);
					session.put("hidclientid", clientId);*/
					
			 }
			 
			 hidcaseid = caseId;
			 hidclientid = addCaseBean.getClientid();
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String manageCaseinfo() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
			 
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String searchCaseInforesult() {

		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			//ln("credentials--->" + username + "--->" + password);
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null ) {
			setSearchPageVar("value");
			if(searchCaseInfoBean == null || searchCaseInfoBean.equals("")){
				searchCaseInfoBean = (SearchCaseInfoBean) session.get("searchCaseInfoBean"); 
			 }else{
				 session.put("searchCaseInfoBean", searchCaseInfoBean);
			 }
			retCaseSearchResult = caseInfoDoa.searchCaseInfo(searchCaseInfoBean,username,password);
			 session.put("retCaseSearchResult", retCaseSearchResult); // Added into for XLS Download
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	

	
	
	
	
	
	public String searchIndCaseID(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			   password = loginbean.getPassWord();
			 
			// String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	public String searchresultIndCaseId() {

		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();			 
		//	String ret = loginLoms.execute(username, password);
			 
		}
		if (loginbean != null) {
			setSearchPageVar("value");
			/*if(searchCaseInfoBean == null || searchCaseInfoBean.equals("")){
				searchCaseInfoBean = (SearchCaseInfoBean) session.get("searchCaseInfoBean"); 
			 }else{
				 session.put("searchCaseInfoBean", searchCaseInfoBean);
			 }*/
			retAddCaseBean = caseInfoDoa.searchIndCaseID(searchCaseInfoBean,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String editCaseInfo() {	

		String username = "";
		String password = "";
		retCaseType.add("CIVIL");
		retCaseType.add("CRIMINAL");
		retCasePriority.add("HIGH");
		retCasePriority.add("NORMAL");
		retCasePriority.add("LOW");
		retCaseStatus.add("NEW");
		retCaseStatus.add("IN PROGRESS");
		retCaseStatus.add("PENDING");
		retCaseStatus.add("CLOSED");
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			//ln("credentials--->" + username + "--->" + password);
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			
			 
				/*   retCivilSuiteType = caseInfoDoa.newCaseSuiteDoa(username,password);	
				   for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
					   retCaseSubTypes.add(retCivilSuiteType.get(i));
		            }
				  
					retCivilSuiteType = caseInfoDoa.newCaseAppealDoa(username,password);
					for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
						   retCaseSubTypes.add(retCivilSuiteType.get(i));
			          }
				 	 
					retCivilSuiteType = caseInfoDoa.newCasePetitioneDoa(username,password);
					for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
						   retCaseSubTypes.add(retCivilSuiteType.get(i));
			            }
			 		 
					retCivilSuiteType = caseInfoDoa.newCaseExecutionDoa(username,password);
					for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
						   retCaseSubTypes.add(retCivilSuiteType.get(i));
			            }
				 
					retCivilSuiteType = caseInfoDoa.newCaseCriminalDoa(username,password);
					for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
						   retCaseSubTypes.add(retCivilSuiteType.get(i));
			            }*/
			 //if(casesubtype.equals("APPEAL") || casesubtype == "APPEAL"){			 
			   retCivilSuiteType.add(0,caseInfoDoa.newCaseAppealDoa(username,password));
		     //}
			 //if(casesubtype.equals("EXECUTION") || casesubtype == "EXECUTION"){			 
				retCivilSuiteType.add(1,caseInfoDoa.newCaseExecutionDoa(username,password));
			 //}
			 //if(casesubtype.equals("PETITION") || casesubtype == "PETITION"){			 
				retCivilSuiteType.add(2,caseInfoDoa.newCasePetitioneDoa(username,password));
			 //}
			 //if(casesubtype.equals("SUIT") || casesubtype == "SUIT"){
			   retCivilSuiteType.add(3, caseInfoDoa.newCaseSuiteDoa(username,password));				
			 //} 
			 //if(casesubtype.equals("CRIMINAL") || casesubtype == "CRIMINAL"){			 
				retCivilSuiteType.add(4,caseInfoDoa.newCaseCriminalDoa(username,password));
			 //}
		//  }
			
			searchCaseInfoBean = (SearchCaseInfoBean) session.get("searchCaseInfoBean"); 
			 session.put("searchCaseInfoBean", searchCaseInfoBean);	
			 
			 editCaseBean = caseInfoDoa.updCaseInfoDoa(hidcaseid,username,password);			
			String caseHearDate = editCaseBean.getCaseJudgmentdate();
			if(caseHearDate!=null){
			String year = caseHearDate.substring(0, 4);
			String month = caseHearDate.substring(5, 7);
			String day = caseHearDate.substring(8, 10);		 
			//ln("Date of Birth--->"+month+"/"+day+"/"+year);
			editCaseBean.setCaseJudgmentdate(day+"/"+month+"/"+year);
			}
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String editCaseInfoSave() {
		String username = "";
		String password = "";
		retCaseType.add("CIVIL");
		retCaseType.add("CRIMINAL");
		retCasePriority.add("HIGH");
		retCasePriority.add("NORMAL");
		retCasePriority.add("LOW");
		retCaseStatus.add("NEW");
		retCaseStatus.add("IN PROGRESS");
		retCaseStatus.add("PENDING");
		retCaseStatus.add("CLOSED");
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();			 
			//  String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
		 
			 /*  retCivilSuiteType = caseInfoDoa.newCaseSuiteDoa(username,password);	
			   for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
				   retCaseSubTypes.add(retCivilSuiteType.get(i));
	            }
		 	 
				retCivilSuiteType = caseInfoDoa.newCaseAppealDoa(username,password);
				for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
					   retCaseSubTypes.add(retCivilSuiteType.get(i));
		          }
		 		 
				retCivilSuiteType = caseInfoDoa.newCasePetitioneDoa(username,password);
				for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
					   retCaseSubTypes.add(retCivilSuiteType.get(i));
		            }
	 			 
				retCivilSuiteType = caseInfoDoa.newCaseExecutionDoa(username,password);
				for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
					   retCaseSubTypes.add(retCivilSuiteType.get(i));
		            }
		 
				retCivilSuiteType = caseInfoDoa.newCaseCriminalDoa(username,password);
				for(int i = 0; i<=retCivilSuiteType.size()-1; i++){
					   retCaseSubTypes.add(retCivilSuiteType.get(i));
		            }*/
			 //if(casesubtype.equals("APPEAL") || casesubtype == "APPEAL"){			 
			   retCivilSuiteType.add(0,caseInfoDoa.newCaseAppealDoa(username,password));
		     //}
			 //if(casesubtype.equals("EXECUTION") || casesubtype == "EXECUTION"){			 
				retCivilSuiteType.add(1,caseInfoDoa.newCaseExecutionDoa(username,password));
			 //}
			 //if(casesubtype.equals("PETITION") || casesubtype == "PETITION"){			 
				retCivilSuiteType.add(2,caseInfoDoa.newCasePetitioneDoa(username,password));
			 //}
			 //if(casesubtype.equals("SUIT") || casesubtype == "SUIT"){
			   retCivilSuiteType.add(3, caseInfoDoa.newCaseSuiteDoa(username,password));				
			 //} 
			 //if(casesubtype.equals("CRIMINAL") || casesubtype == "CRIMINAL"){			 
				retCivilSuiteType.add(4,caseInfoDoa.newCaseCriminalDoa(username,password));
			 //}
		//  }
			retMsg = caseInfoDoa.editCaseInfoSaveDoa(editCaseBean,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String mngCaseDocument() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
			
					
			// String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			retMsg = "";
			return "SUCCESS";
			 // To make Status message hidden
		} else {
			
			return "FAILURE";
		}

	}
	
	public String searchCaseDocresult() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN") || retEmpType.equals("USER"))) {
			setSearchPageVar("value");
			retSearchCaseDocBean = caseInfoDoa.searchCaseDoc(searchCaseDocBean,username,password);
			if(retSearchCaseDocBean != null){
				   session.put("retSearchCaseDocBean", retSearchCaseDocBean);
		     }
			//if(calFrmDownload != "Y" || !calFrmDownload.equals("Y")){
			retMsg = ""; // To make Status message hidden
			//}
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	public String downloadDoc() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			 
			
			Connection connection = null;
			 	   	   
	   	    String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
	   	    byte[] contentInBytes = null;
	   	    String errMsg = "";
	   	    
	   	    boolean success = false;
	   	    boolean exists  = false;
			try{		 
				connection = RakshaDBUtil.getCon(username,password);	
				 
		        Statement statement = connection.createStatement(); 	         
		        ResultSet resultSet = statement.executeQuery("SELECT DOC_NAME," +
		            											 " ACTUAL_DOC FROM LOMS_CASE_DOC_INFO " +
		            											 " WHERE " +
		            											 " DOC_ID = "+hisdocid);
		            
		            while (resultSet.next()) {  	            	 
		            	      
		            	   caseDocName = resultSet.getString("DOC_NAME"); 		             	 
		            	   contentInBytes = resultSet.getBytes("ACTUAL_DOC");
		            	   
		            	   
		            	    File filePre=new File(strDirectoy);
		            		   exists = filePre.exists();
		            		if(!exists){
		            			  success = (new File(strDirectoy)).mkdir();		            			  
		            		}
		            			   if (success || exists) {
					            	                		  
					            	   
					            	   FileOutputStream fop = null;
					           		   File file;
					           		   file = new File("C://LOMS_IMAGES_DOWNLOAD//"+caseDocName);
					           		   if (!file.exists()){
					       				 file.createNewFile();
					       			   }        	 
					           		   
						       		   fop = new FileOutputStream(file);		       		   
						           	   fop.write(contentInBytes);
						       		   fop.flush();
						       		   fop.close(); 
						       		   
						       		   fileInputStream = new FileInputStream(file);
					       		   	   
				            	   } 
		            }  
		            
		            errMsg = "E1049";
		            
		            setSearchPageVar("value");
		            if(retSearchCaseDocBean != null){
						retSearchCaseDocBean = (ArrayList<SearchCaseDocBean>) session.get("retSearchCaseDocBean");
					}
			}catch (Exception e) {
				
				errMsg = "E9999";
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					 
					e.printStackTrace();
				}
			}
			 
			
			//String calFrmDownload = "Y";   //  Added To make Status message hidden
			//searchCaseDocresult(calFrmDownload); //  Method is parameterized  To make Status message hidden/Visible
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String delDocument(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null &&(retEmpType.equals("GOD"))) {
			caseInfoDoa.delDocumentDoa(hisdocid,username,password);
			String calFrmDownload = "Y";   //  Added To make Status message hidden
			//searchCaseDocresult(calFrmDownload); //  Method is parameterized  To make Status message hidden/Visible
			
			 if(retSearchCaseDocBean != null){
					retSearchCaseDocBean = (ArrayList<SearchCaseDocBean>) session.get("retSearchCaseDocBean");
			}
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}

	public String addCaseDocument() { 
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
			 
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
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
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			 
			addCaseDocBean.setCaseid(hidcaseid);
			addCaseDocBean.setClientid(hidclientid);
			addCaseDocBean.setComments(comments);		
			 
			//retMsg = caseInfoDoa.uploadCaseDocDoa(addCaseDocBean,getFileUpload(),getFileUploadFileName(),username,password);
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
			
					
			// String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {	
			 
			addCaseDocBean.setCaseid(hidcaseid);
			addCaseDocBean.setClientid(hidclientidmenu);
			addCaseDocBean.setComments(comments);
			
			//retMsg = caseInfoDoa.uploadCaseDocDoa(addCaseDocBean,getFileUpload(),getFileUploadFileName(),username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String addcaseHear() {
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
			
					
		 //	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
		 
			retMsg = "";
		//	searchCaseInfoBean = (SearchCaseInfoBean) session.get("searchCaseInfoBean"); 
		//	 session.put("searchCaseInfoBean", searchCaseInfoBean);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	

	public String addCaseHearSavemenu() {
		String username = "";
		String password = "";
		ArrayList<String> emailList = new ArrayList<String>();
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();				
			//  String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			  
			retMsg = caseInfoDoa.addCaseHearSaveDoa(caseHearingBean,username,password);
			 
			if(!retMsg.equals("E9999")){
				    mailDataBean = caseInfoDoa.sendCaseHearMail(retMsg,username,password);			 
					String sendermailId = mailDataBean.getFromEmailIDOUT();
					String senderPass = mailDataBean.getFromEmailPwdOUT();
					emailList.add(mailDataBean.getToemailIdOUT());
					String mailSub = mailDataBean.getEmailSubjectOUT();
					String mailMess = mailDataBean.getEmailMsgOUT();
					String mobileNo = mailDataBean.getMobileNoOUT();
					String smsMessage = mailDataBean.getSmsMessageOUT();
					try {
						if((mailSub != "" && mailMess != "") && (mailSub != null && mailMess != null)){
							String txtBody =  mailMess;//"<html> <body>"+mailMess+"</body></html>";							
						    mailErrorStr = smtpMailSender.postMail(emailList, mailSub,txtBody,sendermailId,senderPass,"INFO");
						}		
						
					} catch (MessagingException e) {	
						e.printStackTrace();
						mailErrorStr = "notSent"; 
					}
					
					try{
						if((mobileNo != "" && smsMessage != "")  && (mobileNo != null && smsMessage != null))
						communication.sendSMS(mobileNo,smsMessage,sendermailId,senderPass);
					}catch (Exception e) {
						e.printStackTrace();
					}
			}
			
			hidcaseid =	caseHearingBean.caseid;
			//hidclientid = caseHearingBean.clientid;
			 
			caseHearingBean = null;
		 
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	
	
	
	public String addCaseHearSave() {
		String username = "";
		String password = "";
		ArrayList<String> emailList = new ArrayList<String>();
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
		   if(hidclientid != null && hidclientid != null){
			   caseHearingBean.setCaseid(hidcaseid);
			   caseHearingBean.setClientid(hidclientid);	
		   }
			  
			  
			retMsg = caseInfoDoa.addCaseHearSaveDoa(caseHearingBean,username,password);
			 
			if(!retMsg.equals("E9999")){
				    mailDataBean = caseInfoDoa.sendCaseHearMail(retMsg,username,password);			 
					String sendermailId = mailDataBean.getFromEmailIDOUT();
					String senderPass = mailDataBean.getFromEmailPwdOUT();
					emailList.add(mailDataBean.getToemailIdOUT());
					String mailSub = mailDataBean.getEmailSubjectOUT();
					String mailMess = mailDataBean.getEmailMsgOUT();
					String mobileNo = mailDataBean.getMobileNoOUT();
					String smsMessage = mailDataBean.getSmsMessageOUT();
					try {
						if((mailSub != "" && mailMess != "") && (mailSub != null && mailMess != null)){
							String txtBody =  mailMess;//"<html> <body>"+mailMess+"</body></html>";							
						mailErrorStr = smtpMailSender.postMail(emailList, mailSub,txtBody,sendermailId,senderPass,"INFO");
						}		
						
					} catch (MessagingException e) {	
						e.printStackTrace();
						mailErrorStr = "notSent"; 
					}
					
					try{
						if((mobileNo != "" && smsMessage != "")  && (mobileNo != null && smsMessage != null))
						communication.sendSMS(mobileNo,smsMessage,sendermailId,senderPass);
					}catch (Exception e) {
						e.printStackTrace();
					}
			}
			
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String searchCaseHearing() {
	 
		String username ="";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN") || retEmpType.equals("USER"))) {
			session.put("hidclientid", hidclientid);
			session.put("hidcaseid", hidcaseid);
			searchCaseInfoBean = (SearchCaseInfoBean) session.get("searchCaseInfoBean"); 
			 session.put("searchCaseInfoBean", searchCaseInfoBean);
			retCaseHearingBean = caseInfoDoa.searchCaseHearingDoa(hidclientid,
					hidcaseid,username,password);
			
			for(int i=0;i<retCaseHearingBean.size();i++){
				String dateOfBirth = retCaseHearingBean.get(i).casehearingdate;
				if(dateOfBirth!=null){
					String year = dateOfBirth.substring(0, 4);
					String month = dateOfBirth.substring(5, 7);
					String day = dateOfBirth.substring(8, 10); 
					
					retCaseHearingBean.get(i).casehearingdate = day+"/"+month+"/"+year;
			   }
			
			}
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String deleteCaseHearing() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			   password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD"))) {
			caseInfoDoa.deleteCaseHearingDoa(hidcasehearid,username,password);
			hidclientid = (String) session.get("hidclientid");
			hidcaseid = (String) session.get("hidcaseid");
			searchCaseHearing();
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String editCaseHearing() { 
	 
		String username ="";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			caseHearingBean = caseInfoDoa.editCaseHearingDoa(hidcasehearid,username,password);
			searchCaseInfoBean = (SearchCaseInfoBean) session.get("searchCaseInfoBean"); 
			 session.put("searchCaseInfoBean", searchCaseInfoBean);
			
			String caseHearDate = caseHearingBean.casehearingdate;
			if(caseHearDate!=null){
			String year = caseHearDate.substring(0, 4);
			String month = caseHearDate.substring(5, 7);
			String day = caseHearDate.substring(8, 10);		 
			
			caseHearingBean.casehearingdate = day+"/"+month+"/"+year;
			}
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String editCaseHearSave() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			retMsg = caseInfoDoa.editCaseHearSaveDoa(caseHearingBean,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String searchClientID() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
			
					
			// String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}
	
	public String searchCourtID(){
		String checkCourtExists = "";
		String nextPage = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
		 
		//	String ret = loginLoms.execute(username, password);
			 
		}
		if (loginbean != null) {
			checkCourtExists = caseInfoDoa.checkIfCourtExists(username,password).trim();
		 
			if(checkCourtExists.equals("NO")){
				 			
				nextPage = "ADD";
			}else if(checkCourtExists.equals("YES")){
			 
				nextPage = "SEARCH";
		     }
		} else {
			
			nextPage =  "FAILURE";
		}
		return nextPage;
		
	}
	
	public String addstdcrtinfoPop(){
		
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
			stateName = lawStandardInfoDoa.stdCrtInfoState(username, password);
			disName = lawStandardInfoDoa.stdCrtInfoDis(hidTxtState, username,password);
			retCourtID = "";
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		} 
		
	}
	
	public String addCourtInfoPopSave(){
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
		if ( loginbean != null) {
			retCourtID = lawStandardInfoDoa.addStdCrtInfoSaveDoa(
					addCourtInfoBean, username, password);
			stateName = lawStandardInfoDoa.stdCrtInfoState(username, password);
			disName = lawStandardInfoDoa.stdCrtInfoDis(hidTxtState, username,password);
			addCourtInfoBean = new StdCourtInfoBean(); // To clear Add court Info page once values added in data base
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

		
		
	}
public String searchCaseID(){
	
	String username = "";
	String password = "";
	retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
	loginbean = (LoginBean) session.get("loginbean");
	 
	if (loginbean != null) {
		  username = loginbean.getUserName();
		  password = loginbean.getPassWord();
		
				
	//	String ret = loginLoms.execute(username, password);
		
	}
	if (loginbean != null) {
		
		setSearchPageVar("value");
		ClientInfoDoa clientinfodoa = new ClientInfoDoa();
		retAddCaseBean = caseInfoDoa.searchCaseIDForClientID(hidclientid,username,password);
		return "SUCCESS";
	} else {
		
		return "FAILURE";
	}
	
	
}
	
	
	
	public String searchresultClientCase() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			
					
		//	String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null ) {
			setSearchPageVar("value");
			ClientInfoDoa clientinfodoa = new ClientInfoDoa();
			retvaladdClientBean = clientinfodoa.searchClientInfoDoa(searchbean,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String searchstdcourtinfo(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			setSearchPageVar("value");
			arrStdCourtInfoBean = lawStandardInfoDoa.searchStdCourtinfoDoa(
					stdCourtInfoBean, username, password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	public String viewCaseInfo(){

		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
			 
			// String ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null) {
			
			addCaseBean = caseInfoDoa.viewCaseInfoDoa(hidcaseid,username,password);
			arroppDetailBean  = caseInfoDoa.viewOppInfoDoa(hidcaseid,username,password);
			
			String caseHearDate = addCaseBean.getCaseJudgmentdate();
			if(caseHearDate!=null){
			String year = caseHearDate.substring(0, 4);
			String month = caseHearDate.substring(5, 7);
			String day = caseHearDate.substring(8, 10);		 
			
			addCaseBean.setCaseJudgmentdate(day+"/"+month+"/"+year);
			}
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	
	
	public String searchCaseOpp(){
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
			arroppDetailBean = caseInfoDoa.searchCaseOppDoa(hidcaseid,username,password);
			 
			 session.put("hidcaseid", hidcaseid);
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	public String addCaseOpp(){
		
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
		 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	
	}
	
	public String addCaseOppSave(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
		//	ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			oppDetailBean.setCaseNo(hidcaseid);
			oppDetailBean.setClientId(hidclientid);
			retOppId = caseInfoDoa.addCaseOppInfoSaveDoa(oppDetailBean,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}


	public String editCaseopp(){
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
			editoppDetailBean = caseInfoDoa.editCaseoppDoa(hidcaseoppid,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}	
	}
	
	public String editCaseOppSave(){
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
		if (loginbean != null) {
			 retEditvar = caseInfoDoa.editCaseoppSaveDoa(editoppDetailBean,username,password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}	
		
	}
	
	public String deleteCaseOpp(){
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
		//	ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD"))) {
			retDelvar = caseInfoDoa.deleteCaseoppDoa(hidcaseoppid,username,password);
			 
			hidcaseid =  (String) session.get("hidcaseid"); 
			  
			searchCaseOpp();
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}	
	}
	
	public String delCaseInfo(){
		
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
		//	ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null && (retEmpType.equals("GOD"))) {
			retDelvar = caseInfoDoa.deleteCaseInfoDao(hidcaseid,username,password);
			 
			searchCaseInfoBean = (SearchCaseInfoBean) session.get("searchCaseInfoBean"); 
			  
			searchCaseInforesult();
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}	
	}
	
	public String downloadCaseFile() throws FileNotFoundException{
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		 String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
		 downloadFileName = "CaseDetails.xls";
		  boolean success = false;
	   	    boolean exists  = false;
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if (   loginbean != null) {
			retCaseSearchResult = (ArrayList<CaseSearchResultBean>) session.get("retCaseSearchResult");
			
 		    File file;
       	    file = new File("C://LOMS_IMAGES_DOWNLOAD//"+downloadFileName);			
			
			FileOutputStream fileOut = new FileOutputStream(file);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet worksheet = workbook.createSheet("Case Details");
			
			HSSFRow row1 = worksheet.createRow((short) 0);
			 
			HSSFCell cellA1 = row1.createCell((short) 0);
			cellA1.setCellValue("SL No");
			
			HSSFCellStyle cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);			  
			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);		 
			cellA1.setCellStyle(cellStyle);
			HSSFFont font = workbook.createFont();
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellB1 = row1.createCell((short) 1);
			cellB1.setCellValue("Case ID");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellB1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);


			HSSFCell cellC1 = row1.createCell((short) 2);
			cellC1.setCellValue("Client ID");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellC1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellD1 = row1.createCell((short) 3);
			cellD1.setCellValue("Client Info");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellD1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellE1 = row1.createCell((short) 4);
			cellE1.setCellValue("Case Type");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellE1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellF1 = row1.createCell((short) 5);
			cellF1.setCellValue("Prime Case No");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellF1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellG1 = row1.createCell((short) 6);
			cellG1.setCellValue("Ref Case No");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellG1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font); 
			
			HSSFCell cellH1 = row1.createCell((short) 7);
			cellH1.setCellValue("Court Details");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellH1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			
			HSSFCell cellI1 = row1.createCell((short) 8);
			cellI1.setCellValue("Case Priority");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellI1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellJ1 = row1.createCell((short) 9);
			cellJ1.setCellValue("Case Status");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellJ1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellK1 = row1.createCell((short) 10);
			cellK1.setCellValue("Judgment Date");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellK1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			

			HSSFCell cellL1 = row1.createCell((short) 11);
			cellL1.setCellValue("Comments");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellL1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
		 
		 
			HSSFRow row = null;
			
			for(int i = 0;i<= retCaseSearchResult.size()-1;i++ ){
				
			 
				 
			 
				   row = worksheet.createRow((short) i+1);
					HSSFCell cellA2 = row.createCell((short) 0);
					cellA2.setCellValue(i+1);
					HSSFCellStyle cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellA2.setCellStyle(cellStyleData);
					
					HSSFCell cellB2 = row.createCell((short) 1);
					cellB2.setCellValue(retCaseSearchResult.get(i).getCaseId());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellB2.setCellStyle(cellStyleData);
					
					HSSFCell cellC2 = row.createCell((short) 2);
					cellC2.setCellValue(retCaseSearchResult.get(i).getClientId());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellC2.setCellStyle(cellStyleData);
					
					
					HSSFCell cellD2 = row.createCell((short) 3);
					cellD2.setCellValue(retCaseSearchResult.get(i).getClientInfo());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellD2.setCellStyle(cellStyleData);

					HSSFCell cellE2 = row.createCell((short) 4);
					cellE2.setCellValue(retCaseSearchResult.get(i).getCaseType());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellE2.setCellStyle(cellStyleData);


					HSSFCell cellF2 = row.createCell((short) 5);
					cellF2.setCellValue(retCaseSearchResult.get(i).getPrimeCaseNo());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellF2.setCellStyle(cellStyleData);


					
					HSSFCell cellG2 = row.createCell((short) 6);
					cellG2.setCellValue(retCaseSearchResult.get(i).getRefCaseNo());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellG2.setCellStyle(cellStyleData);


					
					HSSFCell cellH2 = row.createCell((short) 7);
					cellH2.setCellValue(retCaseSearchResult.get(i).getCourtDetails());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellH2.setCellStyle(cellStyleData);

					HSSFCell cellI2 = row.createCell((short) 8);
					cellI2.setCellValue(retCaseSearchResult.get(i).getCasePriority());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellI2.setCellStyle(cellStyleData);

					HSSFCell cellJ2 = row.createCell((short) 9);
					cellJ2.setCellValue(retCaseSearchResult.get(i).getCaseStatus());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellJ2.setCellStyle(cellStyleData);

					HSSFCell cellK2 = row.createCell((short) 10);
					cellK2.setCellValue(retCaseSearchResult.get(i).getJudgmntDate());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellK2.setCellStyle(cellStyleData);

					HSSFCell cellL2 = row.createCell((short) 11);
					cellL2.setCellValue(retCaseSearchResult.get(i).getCaseComments());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellL2.setCellStyle(cellStyleData);


					 
					 

			}
			try {
				
			    workbook.write(fileOut);
				fileOut.flush();
            	fileOut.close();
				fileInputStream = new FileInputStream(file);


			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
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