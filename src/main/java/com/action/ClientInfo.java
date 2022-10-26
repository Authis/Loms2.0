package com.action;

import com.bean.*;
import com.doa.CaseInfoDoa;
import com.doa.ClientInfoDoa;
import com.doa.QuickLinksDoa;
import com.doa.ReminderDoa;
import com.mail.SendMailUsingAuthentication;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.struts2.interceptor.SessionAware;

import javax.mail.MessagingException;
import java.io.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;


@SuppressWarnings({ "serial", "unused" })
public class ClientInfo extends ActionSupport implements SessionAware {
	 

	public AddClientBean addClientBean; /* For Add Client Info */
	public SearchBean searchbean; /* For Search Client Info */
	public String searchPageVar = "";
	ArrayList<AddClientBean> retvaladdClientBean = new ArrayList<AddClientBean>();
	ArrayList<ClientFamilyBean> arrClientFambean = new ArrayList<ClientFamilyBean>();
	ClientFamilyBean addfamilyinfo = new ClientFamilyBean();/*
															 * For Add Family
															 * Info
															 */
	
	 
	QuickLinksDoa quickLinksDoa = new QuickLinksDoa();
	CaseInfoDoa caseInfoDoa = new CaseInfoDoa();
	public String hidclientid;/* For Modify Client Detail */
	public String hidRelname;
	public String hidReltype;
	
	//public String hidMenuID;
	//public String hidSubMenuID1;
	//public String hidSubMenuID2;
	
	public String mailErrorStr = "";
	
	//HttpServletRequest request;
	
	
	public String getMailErrorStr() {
		return mailErrorStr;
	}

	public void setMailErrorStr(String mailErrorStr) {
		this.mailErrorStr = mailErrorStr;
	}
   public String checkCourtExists = "";
	
	public String getCheckCourtExists() {
		return checkCourtExists;
	}
	public void setCheckCourtExists(String checkCourtExists) {
		this.checkCourtExists = checkCourtExists;
	}

	public AddClientBean viewClientBean; /* For Pop Up Client Info Screen */
	public Map session; // ActionContext.getContext().getSession();
	ClientInfoDoa clientinfodoa = new ClientInfoDoa();
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	MailDataBean mailDataBean = new MailDataBean();
   SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();
   Communication communication = new Communication();

   ArrayList<ReminderBean>  retReminderBean = new ArrayList<ReminderBean> ();
   ArrayList<CaseSearchResultBean>  retCaseHearInfo = new ArrayList<CaseSearchResultBean> ();
 
   
    private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;
	private String fileName;
	private InputStream fileInputStream; 	
	public String downloadFileName = "";
	
	public String getDownloadFileName() {
		return downloadFileName;
	}

	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
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

	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}

	String retClientID = "";
	
	
	/*public String getHidSubMenuID1() {
		return hidSubMenuID1;
	}

	public void setHidSubMenuID1(String hidSubMenuID1) {
		this.hidSubMenuID1 = hidSubMenuID1;
	}

	public String getHidSubMenuID2() {
		return hidSubMenuID2;
	}

	public void setHidSubMenuID2(String hidSubMenuID2) {
		this.hidSubMenuID2 = hidSubMenuID2;
	}

	public String getHidMenuID() {
		return hidMenuID;
	}

	public void setHidMenuID(String hidMenuID) {
		this.hidMenuID = hidMenuID;
	}*/

	public String getRetClientID() {
		return retClientID;
	}

	public void setRetClientID(String retClientID) {
		this.retClientID = retClientID;
	}

	public ClientFamilyBean getAddfamilyinfo() {
		return addfamilyinfo;
	}

	public void setAddfamilyinfo(ClientFamilyBean addfamilyinfo) {
		this.addfamilyinfo = addfamilyinfo;
	}

	public ArrayList<ClientFamilyBean> getArrClientFambean() {
		return arrClientFambean;
	}

	public void setArrClientFambean(ArrayList<ClientFamilyBean> arrClientFambean) {
		this.arrClientFambean = arrClientFambean;
	}

	public String getHidclientid() {
		return hidclientid;
	}

	public void setHidclientid(String hidclientid) {
		this.hidclientid = hidclientid;
	}

	public String getHidRelname() {
		return hidRelname;
	}

	public void setHidRelname(String hidRelname) {
		this.hidRelname = hidRelname;
	}

	public String getHidReltype() {
		return hidReltype;
	}

	public void setHidReltype(String hidReltype) {
		this.hidReltype = hidReltype;
	}

	public ArrayList<AddClientBean> getRetvaladdClientBean() {
		return retvaladdClientBean;
	}

	public void setRetvaladdClientBean(
			ArrayList<AddClientBean> retvaladdClientBean) {
		this.retvaladdClientBean = retvaladdClientBean;
	}

	public AddClientBean getAddClientBean() {
		return addClientBean;
	}

	public void setAddClientBean(AddClientBean addClientBean) {
		this.addClientBean = addClientBean;
	}

	public String getSearchPageVar() {
		return searchPageVar;
	}

	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}

	public SearchBean getSearchbean() {
		return searchbean;
	}

	public void setSearchbean(SearchBean searchbean) {
		this.searchbean = searchbean;
	}

	ArrayList retGender = new ArrayList();

	public ArrayList getRetGender() {
		return retGender;
	}

	public void setRetGender(ArrayList retGender) {
		this.retGender = retGender;
	}

	
	public ArrayList<ReminderBean> getRetReminderBean() {
		return retReminderBean;
	}

	public void setRetReminderBean(ArrayList<ReminderBean> retReminderBean) {
		this.retReminderBean = retReminderBean;
	}

	
	public ArrayList<CaseSearchResultBean> getRetCaseHearInfo() {
		return retCaseHearInfo;
	}
	public void setRetCaseHearInfo(ArrayList<CaseSearchResultBean> retCaseHearInfo) {
		this.retCaseHearInfo = retCaseHearInfo;
	}	
	
	public String newregistration() {

		retGender.add("Male");
		retGender.add("Female");
		retGender.add("Other");
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if (loginbean != null && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN")) ) {
			addClientBean = null; // Added to clear Client Mgmt Form to get
									// clear on loading if it persist any old
									// data.
			retClientID = "";
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}
	
	
	public String loginaction() {
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
		if (  loginbean != null) {
			setSearchPageVar("value");	
			
			 session.put("loginbean", loginbean);
			 session.put("username", username);
			 session.put("retEmpType", retEmpType);
			 ReminderDoa reminderDoa = new ReminderDoa();		
		        retReminderBean = reminderDoa.viewreminderDao(username,password,"frmHome");	       
		       
		       
		        
				for(int i=0;i<retReminderBean.size();i++){
					String remdate = retReminderBean.get(i).getReminderdate();
					if(remdate!=null){
						String year = remdate.substring(0, 4);
						String month = remdate.substring(5, 7);
						String day = remdate.substring(8, 10); 
						
						retReminderBean.get(i).setReminderdate(day+"/"+month+"/"+year);
				   }		
				} 			
				String viewType = "CASE HEARING";
				Calendar now = Calendar.getInstance();
			   
	             String fromDate = (now.get(Calendar.DATE) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.YEAR));
	              
			    // add days to current date using Calendar.add method
			      now.add(Calendar.DATE, 7);		    
			    String toDate = (now.get(Calendar.DATE) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.YEAR));
			    
			    
			    retCaseHearInfo =  quickLinksDoa.searchCaseHearInfoDoa(fromDate,toDate,viewType,username,password);
			System.out.println("retCaseHearInfo---->"+retCaseHearInfo.size());
				for(int i=0;i<retCaseHearInfo.size();i++){
					String judDate = retCaseHearInfo.get(i).getJudgmntDate();
					if(judDate!=null){
						String year = judDate.substring(0, 4);
						String month = judDate.substring(5, 7);
						String day = judDate.substring(8, 10); 
						
						retCaseHearInfo.get(i).setJudgmntDate(day+"/"+month+"/"+year);
				   }		
				}
				
				checkCourtExists = caseInfoDoa.checkIfCourtExists(username,password).trim();  
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	
	
	

	public String homeDashBoard() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if (   loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String mngClient() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if (   loginbean != null) {
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	public String clientManagement() {
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
	
	
	

	public String addClientInfo() {
		ArrayList<String> emailList = new ArrayList<String>();
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		} 
		if ( loginbean != null) {
			retClientID = clientinfodoa.addClientInfo(addClientBean, username,password);
			String emailid = addClientBean.emailid;
			addClientBean = null;  /* To make client page reset */
			if(retClientID != "E9999"  ){
				    mailDataBean = clientinfodoa.sendClientMail(retClientID,username,password);			 
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
					//e.printStackTrace();
					 
					mailErrorStr = "notSent"; 
				}
				 
				 
				try{
					if((mobileNo != "" && smsMessage != "")  && (mobileNo != null && smsMessage != null))
					communication.sendSMS(mobileNo,smsMessage,sendermailId,senderPass);
				}catch (Exception e) {
					//e.printStackTrace();
					 
				}
			}
		
		//	if(!((List<AddClientBean>) fileUpload).isEmpty()) 	{ 
			 //  String path = request.getContextPath();
			 //  System.out.println("path---------------->"+path);
				 String strDirectoy ="C:\\PHOTOS(DO_NOT_DELETE_RENAME)";	
			   // String strDirectoy ="loms\\view\\ClientPhotos";
			    boolean success = false;
			    boolean exists  = false;
			    String filePath = "";
			 
				 File filePre=new File(strDirectoy);
        		   exists = filePre.exists();
        		if(!exists){
        			  success = (new File(strDirectoy)).mkdir();		            			  
        		}
			    if (success || exists) {
					 
				         filePath = "C:\\PHOTOS(DO_NOT_DELETE_RENAME)";
						  
						  
						  try{
							  
							  
							  File fileToCreate = new File(filePath,retClientID+".jpg");// Create file name same as original
							  FileUtils.copyFile(getFileUpload(), fileToCreate); // Just copy temp file content tos this file 

							  
							}catch(Exception e){					 
						        System.out.println(e.getMessage());
						    }
		  }
				
				
				
			//}
			
			
			retGender.add("Male");
			retGender.add("Female");
			retGender.add("Other");
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}

	@SuppressWarnings("unchecked")
	public String searchClient() {
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
		if ( loginbean != null) {
			setSearchPageVar("value");
			if (searchbean == null || searchbean.equals("")) {
				searchbean = (SearchBean) session.get("searchbean");
			} else {
				session.put("searchbean", searchbean);
			}
			retvaladdClientBean = clientinfodoa.searchClientInfoDoa(searchbean,username, password);
			 session.put("retvaladdClientBean", retvaladdClientBean);   // Added in session for XLS Download
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	
	public String downloadFile() throws FileNotFoundException{
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		 String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
		 downloadFileName = "ClientDetails.xls";
		  boolean success = false;
	   	    boolean exists  = false;
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			retvaladdClientBean = (ArrayList<AddClientBean>) session.get("retvaladdClientBean");
			
		    File file;
       	    file = new File("C://LOMS_IMAGES_DOWNLOAD//"+downloadFileName);			
			
			FileOutputStream fileOut = new FileOutputStream(file);
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet worksheet = workbook.createSheet("Client Details");
			
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
			cellB1.setCellValue("Client ID");
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
			cellC1.setCellValue("Name");
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
			cellD1.setCellValue("Gender");
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
			cellE1.setCellValue("Mobile Number");
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
			cellF1.setCellValue("Telephone Number");
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
			cellG1.setCellValue("Email ID");
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
			cellH1.setCellValue("Permanent Address");
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
			cellI1.setCellValue("Temporary Address");
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
			cellJ1.setCellValue("Organization Name");
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
			cellK1.setCellValue("Organization Address");
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
			cellL1.setCellValue("Organization Telephone No");
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
			
			HSSFCell cellM1 = row1.createCell((short) 12);
			cellM1.setCellValue("Organization Mobile No");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellM1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			
			HSSFCell cellN1 = row1.createCell((short) 13);
			cellN1.setCellValue("PAN Number");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellN1.setCellStyle(cellStyle);
 			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellO1 = row1.createCell((short) 14);
			cellO1.setCellValue("TIN Number");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellO1.setCellStyle(cellStyle);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			HSSFCell cellP1 = row1.createCell((short) 15);
			cellP1.setCellValue("Profession");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellP1.setCellStyle(cellStyle);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			
			HSSFCell cellQ1 = row1.createCell((short) 16);
			cellQ1.setCellValue("Date Of Birth");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellQ1.setCellStyle(cellStyle);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
			
			
			HSSFCell cellR1 = row1.createCell((short) 17);
			cellR1.setCellValue("Comment");
			cellStyle = workbook.createCellStyle();
			cellStyle.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
 			cellStyle.setBorderBottom((short) 1);
			cellStyle.setBorderTop((short) 1);
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellR1.setCellStyle(cellStyle);
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cellStyle.setFont(font);
 
			 
			HSSFRow row = null;
			
			for(int i = 0;i<= retvaladdClientBean.size()-1;i++ ){
				
				System.out.println("----->"+retvaladdClientBean.get(i).getFirstname());
				 
			 
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
					cellB2.setCellValue(retvaladdClientBean.get(i).getClientid());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellB2.setCellStyle(cellStyleData);
					
					HSSFCell cellC2 = row.createCell((short) 2);
					cellC2.setCellValue(retvaladdClientBean.get(i).getFirstname()+" "+retvaladdClientBean.get(i).getLastname());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellC2.setCellStyle(cellStyleData);
					
					
					HSSFCell cellD2 = row.createCell((short) 3);
					cellD2.setCellValue(retvaladdClientBean.get(i).getGender());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellD2.setCellStyle(cellStyleData);

					HSSFCell cellE2 = row.createCell((short) 4);
					cellE2.setCellValue(retvaladdClientBean.get(i).getMobilenumber());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellE2.setCellStyle(cellStyleData);


					HSSFCell cellF2 = row.createCell((short) 5);
					cellF2.setCellValue(retvaladdClientBean.get(i).getTelephoneno());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellF2.setCellStyle(cellStyleData);


					
					HSSFCell cellG2 = row.createCell((short) 6);
					cellG2.setCellValue(retvaladdClientBean.get(i).getEmailid());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellG2.setCellStyle(cellStyleData);


					
					HSSFCell cellH2 = row.createCell((short) 7);
					cellH2.setCellValue(retvaladdClientBean.get(i).getPermanentaddress());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellH2.setCellStyle(cellStyleData);

					HSSFCell cellI2 = row.createCell((short) 8);
					cellI2.setCellValue(retvaladdClientBean.get(i).getTemporaryaddress());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellI2.setCellStyle(cellStyleData);

					HSSFCell cellJ2 = row.createCell((short) 9);
					cellJ2.setCellValue(retvaladdClientBean.get(i).getOrganizationname());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellJ2.setCellStyle(cellStyleData);

					HSSFCell cellK2 = row.createCell((short) 10);
					cellK2.setCellValue(retvaladdClientBean.get(i).getOrganizationaddress());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellK2.setCellStyle(cellStyleData);


					HSSFCell cellL2 = row.createCell((short) 11);
					cellL2.setCellValue(retvaladdClientBean.get(i).getOrganizationtelephoneno());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellL2.setCellStyle(cellStyleData);


					HSSFCell cellM2 = row.createCell((short) 12);
					cellM2.setCellValue(retvaladdClientBean.get(i).getOrganizationmobileno());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellM2.setCellStyle(cellStyleData);

					HSSFCell cellN2 = row.createCell((short) 13);
					cellN2.setCellValue(retvaladdClientBean.get(i).getPannumber());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellN2.setCellStyle(cellStyleData); 

			
					HSSFCell cellO2 = row.createCell((short) 14);
					cellO2.setCellValue(retvaladdClientBean.get(i).getTinnumber());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellO2.setCellStyle(cellStyleData);
					
					HSSFCell cellP2 = row.createCell((short) 15);
					cellP2.setCellValue(retvaladdClientBean.get(i).getProfession());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellP2.setCellStyle(cellStyleData);
					
					HSSFCell cellQ2 = row.createCell((short) 16);
					cellQ2.setCellValue(retvaladdClientBean.get(i).getDateofbirth());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);
					cellQ2.setCellStyle(cellStyleData);
					
					HSSFCell cellR2 = row.createCell((short) 17);
					cellR2.setCellValue(retvaladdClientBean.get(i).getComments());
					cellStyleData = workbook.createCellStyle();
					cellStyleData.setFillForegroundColor(HSSFColor.WHITE.index);
					cellStyleData.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
					cellStyleData.setBorderBottom((short) 1);
					cellStyleData.setBorderTop((short) 1);
					cellStyleData.setBorderLeft((short) 1);
					cellStyleData.setBorderRight((short) 1);				 
					cellR2.setCellStyle(cellStyleData); 

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
	

	public String updateClinetInfo() {

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

			addClientBean = new AddClientBean();
			addClientBean = clientinfodoa.updateClientInfo(hidclientid,
					username, password);
			retGender.add("Male");
			retGender.add("Female");
			retGender.add("Other");
			searchbean = (SearchBean) session.get("searchbean");
			session.put("searchbean", searchbean);
			String dateOfBirth = addClientBean.dateofbirth;
			if (dateOfBirth != null) {
				String year = dateOfBirth.substring(0, 4);
				String month = dateOfBirth.substring(5, 7);
				String day = dateOfBirth.substring(8, 10);
				 
				addClientBean.dateofbirth = day + "/" + month + "/" + year;
			}

			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String updateSaveClinetInfo() {

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
			retGender.add("Male");
			retGender.add("Female");
			retGender.add("Other");
			retClientID = clientinfodoa.updateSaveClinetInfoDao(addClientBean,
					username, password);
			
			String strDirectoy ="C:\\PHOTOS(DO_NOT_DELETE_RENAME)";		    
		    boolean success = false;
		    boolean exists  = false;
		    String filePath = "";
		 
			 File filePre=new File(strDirectoy);
    		   exists = filePre.exists();
    		if(!exists){
    			  success = (new File(strDirectoy)).mkdir();		            			  
    		}
		   if (success || exists) {
				 
			     filePath = "C://PHOTOS(DO_NOT_DELETE_RENAME)";
				 
				 
				 File delFile = new File("C://PHOTOS(DO_NOT_DELETE_RENAME)"+addClientBean.clientid+".jpg");
				 if(delFile.exists()){
				    delFile.delete();
				 }
				  try{
					  
					  
					  File fileToCreate = new File(filePath, retClientID+".jpg");// Create file name same as original
					  FileUtils.copyFile(getFileUpload(), fileToCreate); // Just copy temp file content tos this file 

					  
					}catch(Exception e){					 
				        System.out.println(e.getMessage());
				    }
		   }
			
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String getClientFamilyInfo() {

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
			setSearchPageVar("value");
			session.put("hidclientid", hidclientid);
			arrClientFambean = clientinfodoa.getClientFamilyInfoDoa(
					hidclientid, username, password);
			
			for(int i=0;i<arrClientFambean.size();i++){
				String dateOfBirth = arrClientFambean.get(i).getDateofbirth();
				if(dateOfBirth!=null){
					String year = dateOfBirth.substring(0, 4);
					String month = dateOfBirth.substring(5, 7);
					String day = dateOfBirth.substring(8, 10); 
					
					arrClientFambean.get(i).setDateofbirth(day+"/"+month+"/"+year);
			   }		
				
			 String marriageDate = arrClientFambean.get(i).getMarriagedate();
				if(marriageDate!=null){
					String year = marriageDate.substring(0, 4);
					String month = marriageDate.substring(5, 7);
					String day = marriageDate.substring(8, 10); 
					
					arrClientFambean.get(i).setMarriagedate(day+"/"+month+"/"+year);
			   } 
			} 			
			
			
			
			
			searchbean = (SearchBean) session.get("searchbean");
			session.put("searchbean", searchbean);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String addFamilyInfoView() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String ret = "";
		if (loginbean != null) {
			String username = loginbean.getUserName();
			String password = loginbean.getPassWord();

			//ret = loginLoms.execute(username, password);
			
		}
		if (    loginbean != null) {

			 
			if (hidclientid == null || hidclientid.equals("") && (retEmpType.equals("GOD") || retEmpType.equals("ADMIN"))) {
				hidclientid = (String) session.get("hidclientid");
			}
			searchbean = (SearchBean) session.get("searchbean");
			session.put("searchbean", searchbean);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String addFamilyInfo() {
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
		if (loginbean != null) {
			 

			retClientID = clientinfodoa.addFamilyInfoDoa(addfamilyinfo,
					username, password);
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}

	public String delFamInfoView() {
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		String ret = "";
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null && (retEmpType.equals("GOD"))) {
			clientinfodoa.delFamInfoViewDoa(hidclientid, hidRelname,
					hidReltype, username, password);
			getClientFamilyInfo();

			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	

	public String viewClientInfo(){
		
		String username = "";
		String password = "";
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
        
		String ret = "";
		loginbean = (LoginBean) session.get("loginbean");
		if (loginbean != null) {
			username = loginbean.getUserName();
			password = loginbean.getPassWord();

		//	ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {		
			viewClientBean = new AddClientBean();	
			 
			viewClientBean = clientinfodoa.viewClientInfoDoa(hidclientid,username,password);
			String dateOfBirth = viewClientBean.dateofbirth;
			if (dateOfBirth != null) {
				String year = dateOfBirth.substring(0, 4);
				String month = dateOfBirth.substring(5, 7);
				String day = dateOfBirth.substring(8, 10);
			 
				viewClientBean.dateofbirth = day + "/" + month + "/" + year;
			}
			
			
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	}
	
	
	public void copy(File src, File dst) throws IOException {
		InputStream in = new FileInputStream(src);
		OutputStream out = new FileOutputStream(dst);
		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) > 0) {
		out.write(buf, 0, len);
		}
		in.close();
		out.close();
		}
	 
		
	@Override
	public void setSession(Map arg0) {
		this.session = arg0;
		// TODO Auto-generated method stub

	}
}
