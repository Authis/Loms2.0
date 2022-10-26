package com.action;

import com.bean.LoginBean;
import com.bean.TemplateBean;
import com.doa.TemplateDao;
import org.apache.struts2.interceptor.SessionAware;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

public class Template implements SessionAware{
	 
	
	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;
	private String fileName;
	private InputStream fileInputStream; 
	
	
	
	
	TemplateDao templateDao = new TemplateDao();
	ArrayList<TemplateBean>  retTemplateBean = new ArrayList<TemplateBean>();
	
	
	
	 

	String templateDocumentName = ""; 	
	
	ArrayList retLang = new ArrayList();
	
	ArrayList<TemplateBean>  retTemplateFormBean = new ArrayList<TemplateBean>();
	ArrayList retDownloadFormLocList = new ArrayList();
	ArrayList retDocName = new ArrayList();	
	String downloadFormType = "";
	String downloadFormLoc = "";
	String formsKeyWord = "";
	public String hidFormid = ""; 
	String templateFormsName = "";
	
	
	public String getTemplateFormsName() {
		return templateFormsName;
	}
	public void setTemplateFormsName(String templateFormsName) {
		this.templateFormsName = templateFormsName;
	}
	public String getHidFormid() {
		return hidFormid;
	}
	public void setHidFormid(String hidFormid) {
		this.hidFormid = hidFormid;
	}
	
	
	
	public ArrayList getRetDownloadFormLocList() {
		return retDownloadFormLocList;
	}
	public void setRetDownloadFormLocList(ArrayList retDownloadFormLocList) {
		this.retDownloadFormLocList = retDownloadFormLocList;
	}	
	public String getDownloadFormType() {
		return downloadFormType;
	}
	public void setDownloadFormType(String downloadFormType) {
		this.downloadFormType = downloadFormType;
	}
	
	public String getFormsKeyWord() {
		return formsKeyWord;
	}
	public void setFormsKeyWord(String formsKeyWord) {
		this.formsKeyWord = formsKeyWord;
	}
	public String getDownloadFormLoc() {
		return downloadFormLoc;
	}
	public void setDownloadFormLoc(String downloadFormLoc) {
		this.downloadFormLoc = downloadFormLoc;
	}
	
	public ArrayList<TemplateBean> getRetTemplateFormBean() {
		return retTemplateFormBean;
	}
	public void setRetTemplateFormBean(ArrayList<TemplateBean> retTemplateFormBean) {
		this.retTemplateFormBean = retTemplateFormBean;
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
	 
	public ArrayList getRetDocName() {
		return retDocName;
	}
	public void setRetDocName(ArrayList retDocName) {
		this.retDocName = retDocName;
	}
	public ArrayList getRetLang() {
		return retLang;
	}
	public void setRetLang(ArrayList retLang) {
		this.retLang = retLang;
	}
	public String getTemplateDocumentName() {
		return templateDocumentName;
	}
	public void setTemplateDocumentName(String templateDocumentName) {
		this.templateDocumentName = templateDocumentName;
	}
	public ArrayList<TemplateBean> getRetTemplateBean() {
		return retTemplateBean;
	}
	public void setRetTemplateBean(ArrayList<TemplateBean> retTemplateBean) {
		this.retTemplateBean = retTemplateBean;
	}
	public InputStream getFileInputStream() {
		return fileInputStream;
	}
	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}


	/* Mandatory variable for all Action classes*/
	public String searchPageVar = "";
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	public String errMsg = "";
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	public Map session;
	/* *************************************************** */
	
	public String downloadTempType = "";
	public String tempName = "";
	public String hidTempid = ""; 
	public String lanRadio = "";
	
	
	public String getLanRadio() {
		return lanRadio;
	}
	public void setLanRadio(String lanRadio) {
		this.lanRadio = lanRadio;
	}
	public String getTempName() {
		return tempName;
	}
	public void setTempName(String tempName) {
		this.tempName = tempName;
	}


	
	
	public String getHidTempid() {
		return hidTempid;
	}
	public void setHidTempid(String hidTempid) {
		this.hidTempid = hidTempid;
	}
	
	

	
	public String getDownloadTempType() {
		return downloadTempType;
	}
	public void setDownloadTempType(String downloadTempType) {
		this.downloadTempType = downloadTempType;
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
	public String getRetEmpType() {
		return retEmpType;
	}
	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	public String getSearchPageVar() {
		return searchPageVar;
	}
	public void setSearchPageVar(String searchPageVar) {
		this.searchPageVar = searchPageVar;
	}
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
//	
	
	
	
	public String templateManagement(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord() ; 
			  
			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
	 
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	public String caseFillingTemplateDownload(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord() ; 
			  
			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
		//	retLang = templateDao.getTemplateLangDao(username,password);
			//retDocName = templateDao.getTemplateDocNameDao(downloadTempType,username,password);
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}

	
	
	
	
	public String formTemplateDownload(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord() ; 
			  
			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {
		//	retLang = templateDao.getTemplateLangDao(username,password);
			//retDocName = templateDao.getTemplateDocNameDao(downloadTempType,username,password);
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
		
	}
	
	
	
	 public String seleFormLoc(){
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
				//setSearchPageVar("value");
				 
			 
				retDownloadFormLocList = templateDao.getTemplateFormLocDao(downloadFormType,username,password);
				 
				 
				return "SUCCESS";
			} else {
				
				return "FAILURE";
			}
		  
		  
	  }
	  
	
	  public String formsSearch(){
		  retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
			loginbean = (LoginBean) session.get("loginbean");
			String ret = "";
			String username = "";
			String password = "";
			 
			if (loginbean != null) {
				  username = loginbean.getUserName();
				  password = loginbean.getPassWord();

			//	ret = loginLoms.execute(username, password);
				
			}
			if (  loginbean != null) {
				setSearchPageVar("value");
				 
				retDownloadFormLocList = templateDao.getTemplateFormLocDao(downloadFormType,username,password);
 				retTemplateFormBean = templateDao.getTemplateFormListDao(downloadFormType,downloadFormLoc,formsKeyWord.trim(),username,password);
				if(retTemplateBean != null){
					   session.put("retTemplateFormBean", retTemplateFormBean);
				}
				 
				return "SUCCESS";
			} else {
				
				return "FAILURE";
			}
		  
		  
	  }

	
	  
	  
	  
	  public String downFormTemplate(){
		    retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
			loginbean = (LoginBean) session.get("loginbean");
			String username = "";
			String password = "";
			String ret = "";
			  File file = null;
			if (loginbean != null) {
				  username = loginbean.getUserName();
				  password = loginbean.getPassWord();

				// ret = loginLoms.execute(username, password);
				
			}
			if (  loginbean != null) {
				
				 
				Connection connection = null;
				String extnType = ""; 	   
				String templateDocName = "";
				  
		   	    String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
		   	    byte[] contentInBytes = null;
		   	    String errMsg = "";
		   	    boolean success = false;
		   	    boolean exists  = false;
				try{		 
					connection = RakshaDBUtil.getServerJudgmentCon();	
					 
			        Statement statement = connection.createStatement(); 	   
			        String temQuery = "SELECT FORM_NAME,FORM_PDF_DOC ," +
			        		          " FORM_PDF_EXTN " +
					 				  " FROM FORMS_INFO " +
					 				  "WHERE FORM_ID = '" +hidFormid +"'";
			        
			      
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) {              	 
			            	   templateDocName = resultSet.getString("FORM_NAME"); 		
			            	   extnType = resultSet.getString("FORM_PDF_EXTN"); 	
			            	   contentInBytes = resultSet.getBytes("FORM_PDF_DOC");	
			            	   
			            	  
			            	    File filePre=new File(strDirectoy);
			            		   exists = filePre.exists();
			            		if(!exists){
			            			  success = (new File(strDirectoy)).mkdir();		            			  
			            		}
			            			   if (success || exists) {
						            	             		  
						            	   
						            	   FileOutputStream fop = null;
						           		 
						           		   templateFormsName = templateDocName+extnType;  // Need to change
						           		    
						           		   file = new File("C://LOMS_IMAGES_DOWNLOAD//"+templateFormsName);
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
			            
			            //file.delete();
			            errMsg = "E1049";
			            
			            setSearchPageVar("value");
						if(retTemplateBean != null){
							retTemplateBean = (ArrayList<TemplateBean>) session.get("retTemplateBean");
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
				
				return "SUCCESS";
			} else {
				
				return "FAILURE";
			}
			 
		  
		  
	  }
		
	  
	  
	
	
  public String searchTemplate(){
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
		if ( loginbean != null) {
			setSearchPageVar("value");
			 
			 retLang = templateDao.getTemplateLangDao(username,password);
			retDocName = templateDao.getTemplateDocNameDao(downloadTempType,username,password);
			retTemplateBean = templateDao.getTemplateDao(downloadTempType,tempName.trim(),lanRadio,username,password);
			if(retTemplateBean != null){
				   session.put("retTemplateBean", retTemplateBean);
			}
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	  
	  
  }

  
  public String seleLanguageTemp(){
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
			//setSearchPageVar("value");
			 
			retLang = templateDao.getTemplateLangDao(username,password);
			retDocName = templateDao.getTemplateDocNameDao(downloadTempType,username,password);
			//retTemplateBean = templateDao.getTemplateDao(downloadTempType,tempName.trim(),lanRadio,username,password);
			//if(retTemplateBean != null){
			//	   session.put("retTemplateBean", retTemplateBean);
			//}
			 
			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}
	  
	  
  }
  
  public String downTemplate(){
	    retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		  File file = null;
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
			
			 
			Connection connection = null;
			String extnType = ""; 	   
			String templateDocName = "";
			  
	   	    String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
	   	    byte[] contentInBytes = null;
	   	    String errMsg = "";
	   	    boolean success = false;
	   	    boolean exists  = false;
			try{		 
				connection = RakshaDBUtil.getServerJudgmentCon();	
				 
		        Statement statement = connection.createStatement(); 	   
		        String temQuery = "SELECT TEMPLATE_NAME,TEMPLATE_FILE ," +
		        		          " TEMPLATE_EXTN " +
				 				  " FROM LAWYERS_TEMPLATES " +
				 				  "WHERE TEMPLATE_ID = '" +hidTempid +"'";
		        
		      
		        ResultSet resultSet = statement.executeQuery(temQuery);
		            
		            while (resultSet.next()) {              	 
		            	   templateDocName = resultSet.getString("TEMPLATE_NAME"); 		
		            	   extnType = resultSet.getString("TEMPLATE_EXTN"); 	
		            	   contentInBytes = resultSet.getBytes("TEMPLATE_FILE");	
		            	   
		            	  
		            	    File filePre=new File(strDirectoy);
		            		   exists = filePre.exists();
		            		if(!exists){
		            			  success = (new File(strDirectoy)).mkdir();		            			  
		            		}
		            			   if (success || exists) {
					            	             		  
					            	   
					            	   FileOutputStream fop = null;
					           		 
					           		   templateDocumentName = templateDocName+extnType;
					           		    
					           		   file = new File("C://LOMS_IMAGES_DOWNLOAD//"+templateDocumentName);
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
		            
		            //file.delete();
		            errMsg = "E1049";
		            
		            setSearchPageVar("value");
					if(retTemplateBean != null){
						retTemplateBean = (ArrayList<TemplateBean>) session.get("retTemplateBean");
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
