package com.action;


import com.bean.LoginBean;
import com.bean.SearchJudgmentBean;
import com.bean.SearchJudgmentFieldBean;
import com.bean.TemplateBean;
import com.doa.SearchJudgmentsDoa;
import org.apache.struts2.interceptor.SessionAware;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Map;


public class SearchJudgments implements SessionAware{
	
	
	InputStream fileInputStream;
	String judgmentDocName = "";  
//	public String hidMenuID;
//	public String hidSubMenuID1;
//	public String hidSubMenuID2;
	LoginLoms loginLoms = new LoginLoms();
	LoginBean loginbean = new LoginBean();
	public Map session;
	public String searchPageVar = "";
	SearchJudgmentsDoa searchJudgmentsDoa =  new SearchJudgmentsDoa();
	String retEmpType = "";  // Variable used to Restricting menu for USER and ADMIN 
	private String statesNames = "";
	private String beanchNames = "";
	private String searchPageInternetMsg = "";

	public String getSearchPageInternetMsg() {
		return searchPageInternetMsg;
	}

	public void setSearchPageInternetMsg(String searchPageInternetMsg) {
		this.searchPageInternetMsg = searchPageInternetMsg;
	}

	SearchJudgmentFieldBean searchJudgmentFieldBean = new SearchJudgmentFieldBean();
	
	String bareActsRulesName = "";
	String hidBareid = "";
	
	public String getHidBareid() {
		return hidBareid;
	}

	public void setHidBareid(String hidBareid) {
		this.hidBareid = hidBareid;
	}

	public String getBareActsRulesName() {
		return bareActsRulesName;
	}

	public void setBareActsRulesName(String bareActsRulesName) {
		this.bareActsRulesName = bareActsRulesName;
	}

	public String hidjdgmntId = "";
	
	String downloadBareRulesType = "";
	String bareRulesKeyWord = "";
	ArrayList<TemplateBean>  retBareRulesTemplateBean = new ArrayList<TemplateBean>();
	
	public ArrayList<TemplateBean> getRetBareRulesTemplateBean() {
		return retBareRulesTemplateBean;
	}

	public void setRetBareRulesTemplateBean(
			ArrayList<TemplateBean> retBareRulesTemplateBean) {
		this.retBareRulesTemplateBean = retBareRulesTemplateBean;
	}

	public String getBareRulesKeyWord() {
		return bareRulesKeyWord;
	}

	public void setBareRulesKeyWord(String bareRulesKeyWord) {
		this.bareRulesKeyWord = bareRulesKeyWord;
	}

	public String getDownloadBareRulesType() {
		return downloadBareRulesType;
	}

	public void setDownloadBareRulesType(String downloadBareRulesType) {
		this.downloadBareRulesType = downloadBareRulesType;
	}

	
	
	
	public String getHidjdgmntId() {
		return hidjdgmntId;
	}

	public void setHidjdgmntId(String hidjdgmntId) {
		this.hidjdgmntId = hidjdgmntId;
	}

	public String getJudgmentDocName() {
		return judgmentDocName;
	}

	public void setJudgmentDocName(String judgmentDocName) {
		this.judgmentDocName = judgmentDocName;
	}

	public InputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}
 
	

	 
	public SearchJudgmentFieldBean getSearchJudgmentFieldBean() {
		return searchJudgmentFieldBean;
	}

	public void setSearchJudgmentFieldBean(
			SearchJudgmentFieldBean searchJudgmentFieldBean) {
		this.searchJudgmentFieldBean = searchJudgmentFieldBean;
	}

	public String getStatesNames() {
		return statesNames;
	}

	public void setStatesNames(String statesNames) {
		this.statesNames = statesNames;
	}

	
	public String getBeanchNames() {
		return beanchNames;
	}

	public void setBeanchNames(String beanchNames) {
		this.beanchNames = beanchNames;
	}
	
	
	SearchJudgmentBean searchJudgmentBean = new SearchJudgmentBean();
	ArrayList<SearchJudgmentBean>  retSearchJudgmentBean = new ArrayList<SearchJudgmentBean>();
	 

	public ArrayList<SearchJudgmentBean> getRetSearchJudgmentBean() {
		return retSearchJudgmentBean;
	}

	public void setRetSearchJudgmentBean(
			ArrayList<SearchJudgmentBean> retSearchJudgmentBean) {
		this.retSearchJudgmentBean = retSearchJudgmentBean;
	}

	public SearchJudgmentBean getSearchJudgmentBean() {
		return searchJudgmentBean;
	}

	public void setSearchJudgmentBean(SearchJudgmentBean searchJudgmentBean) {
		this.searchJudgmentBean = searchJudgmentBean;
	}

	public String getRetEmpType() {
		return retEmpType;
	}

	public void setRetEmpType(String retEmpType) {
		this.retEmpType = retEmpType;
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
//
//
//	public void setHidMenuID(String hidMenuID) {
//		this.hidMenuID = hidMenuID;
//	}
//
//
//	public String getHidSubMenuID1() {
//		return hidSubMenuID1;
//	}
//
//
//	public void setHidSubMenuID1(String hidSubMenuID1) {
//		this.hidSubMenuID1 = hidSubMenuID1;
//	}
//
//
//	public String getHidSubMenuID2() {
//		return hidSubMenuID2;
//	}
//
//
//	public void setHidSubMenuID2(String hidSubMenuID2) {
//		this.hidSubMenuID2 = hidSubMenuID2;
//	}


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

	
	
	
	public String judgmentManagement() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		Connection connection = null;
		 CallableStatement cstmt = null;
		 String errorCode = "";
		 String errorMsg = "";
		 String licenseStatus = "";
		 String userName = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			 /*try{
			   userName = getGodUserName(username,password);				  
			   connection = RakshaDBUtil.getServerJudgmentActivationCon(); 			   
			   cstmt = connection.prepareCall("{call checkiflicenseisexpired(?,?,?,?)}");		  
			   
			   	cstmt.setString(1, userName);			    			    
			   	cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			   	cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			   	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);		 
				cstmt.executeUpdate(); 
				
				licenseStatus = cstmt.getString(2);
				errorCode =  cstmt.getString(3);
            	errorMsg =  cstmt.getString(4);
            	if(licenseStatus != null){
	            	   session.put("licenseStatus", licenseStatus);
	            	   System.out.println("---->1");
	             }else{
	            		session.put("licenseStatus", "N");
	            		  System.out.println("---->1");
	             }
            	 
			  }catch (Exception e){
				  
				e.printStackTrace();  
			  }*/
			
		}
		if (  loginbean != null) {	
			 
			 
 			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}
	public String getGodUserName(String username, String password){
		String userName = ""; 
		Connection connection = null;
		try{		 
			connection = RakshaDBUtil.getCon(username,password);	
			 
	        Statement statement = connection.createStatement(); 
	        String sel_query = " SELECT USER_NAME " +
	        				   " FROM LOMS_EMP_INFO" +
	        				   " WHERE  USER_TYPE = 'GOD'";
	        
	        ResultSet resultSet = statement.executeQuery(sel_query);
			      
					 
	            while (resultSet.next()) {           	 
	            	 
	            	userName = resultSet.getString("USER_NAME");		             	 
	            	 
	            }   
		}catch (Exception e) {
			
			 
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
		}
		return userName;
	}

	public String searchJudgments() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		String retStr = "";
		Connection connection = null;
		 CallableStatement cstmt = null;
		 String errorCode = "";
		 String errorMsg = "";
		 String licenseStatus = "";
		 String userName = "";
		
		
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			searchJudgmentFieldBean = null; // To make search fields empty when page load
			
		}
		if ( loginbean != null) {	
			 
			/*  try{
				   userName = getGodUserName(username,password);				  
				   connection = RakshaDBUtil.getServerJudgmentActivationCon(); 	
				   if(connection != null){
					   System.out.println("-->1");
				   cstmt = connection.prepareCall("{call checkiflicenseisexpired(?,?,?,?)}");		  
				   
				   	cstmt.setString(1, userName);			    			    
				   	cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
				   	cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
				   	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);		 
					cstmt.executeUpdate(); 
					
					licenseStatus = cstmt.getString(2);
					errorCode =  cstmt.getString(3);
	            	errorMsg =  cstmt.getString(4);
	            	if(licenseStatus != null){
	            	   session.put("licenseStatus", licenseStatus);
	            	}else{
	            		session.put("licenseStatus", "N");
	            	}
	            	setSearchPageInternetMsg("NETACTIVE");
				   }else{
					   System.out.println("-->2");
					   setSearchPageInternetMsg("NETINACTIVE");
				   }
				  }catch (Exception e){
					  
					e.printStackTrace();  
				  }*/
				  retStr = "SUCCESS";
		} else {
			
			retStr = "FAILURE";
		}
		return retStr;
	}
	
	 
	public String searchJudgmentResults(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		String retString = "";
		String newFmtBench = "";
		String[] checkedBench;
		/*String judDate = "";
		String year = "";
		String month = "";
		String day = "";*/
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
			
		}
		if (  loginbean != null) {	
			setSearchPageVar("value");
			if(!beanchNames.isEmpty()){
				checkedBench = beanchNames.split("\\,");
				
				 for(int i = 0;i<checkedBench.length;i++){
					if(i < checkedBench.length -1 ){
						newFmtBench += "'"+checkedBench[i]+"',";
					}
					if(i == checkedBench.length-1){
						newFmtBench += "'"+checkedBench[i]+"'";
				   }
					
				} 
				//System.out.println("----->"+newFmtBench); 
			}
			String licenseStatus = (String) session.get("licenseStatus");
			System.out.println("licenseStatus --->"+licenseStatus);
			//if(licenseStatus.equalsIgnoreCase("Y")){			
				retSearchJudgmentBean =	searchJudgmentsDoa.searchJudgmentResultsDoa(searchJudgmentFieldBean,statesNames,newFmtBench); 
		        
				/*for(int i=0;i<retSearchJudgmentBean.size();i++){
					  judDate = retSearchJudgmentBean.get(i).getJdgmntDate();
					if(judDate!=null){
						  year = judDate.substring(0, 4);
						  month = judDate.substring(5, 7);
						  day = judDate.substring(8, 10); 
						
						retSearchJudgmentBean.get(i).setJdgmntDate(day+"/"+month+"/"+year);
				}*/	
		//	}else{				 	            	 
			   /* SearchJudgmentBean	searchJudgment = new SearchJudgmentBean();	            	
		        searchJudgment.setJdgmntID("Expired");			 
				retSearchJudgmentBean.add(searchJudgment); */// To indicate licence expired to the user
		//	}
			
			//System.out.println("retSearchJudgmentBean---->"+retSearchJudgmentBean.size());
			retString = "SUCCESS";
		} else {
			
			retString = "FAILURE";
		}
			return retString;
		
	}
	
	public String searchBareActsRules() {
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
			 
			 
 			return "SUCCESS";
		} else {
			
			return "FAILURE";
		}

	}
	
	 
	
	
	public String searchdownBareRules() {
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		String username = "";
		String password = "";
		String ret = "";
		String retString = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();

			// ret = loginLoms.execute(username, password);
		 			
		}
		if (  loginbean != null) {	
			setSearchPageVar("value");
			String licenseStatus = (String) session.get("licenseStatus");
			System.out.println("licenseStatus --->"+licenseStatus);
			//if(licenseStatus.equalsIgnoreCase("Y")){
				retBareRulesTemplateBean = searchJudgmentsDoa.getBareRulesTemplateDao(downloadBareRulesType,bareRulesKeyWord.trim(),username,password);
				if(retBareRulesTemplateBean != null){
					   session.put("retBareRulesTemplateBean", retBareRulesTemplateBean);
				}
			//}else{
				//TemplateBean bareRulesTemplateBean = new TemplateBean();	            	
				//bareRulesTemplateBean.setTemplateID("Expired");			 
				//retBareRulesTemplateBean.add(bareRulesTemplateBean); // To indicate licence expired to the user
				
			//}
			retString = "SUCCESS";
		} else {
			
			retString = "FAILURE";
		}
		return retString;
	}
	
	
	 public String downBareActsTemplate(){
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
			        String temQuery = "SELECT TEMPLATE_NAME,TEMPLATE_DOC ," +
			        		          " TEMPLATE_DOC_EXTN " +
					 				  " FROM BARE_ACTS_RULES_INFO " +
					 				  "WHERE TEMPLATE_ID = '"+hidBareid+"'";
			        
			      
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) {              	 
			            	   templateDocName = resultSet.getString("TEMPLATE_NAME"); 		
			            	   extnType = resultSet.getString("TEMPLATE_DOC_EXTN"); 	
			            	   contentInBytes = resultSet.getBytes("TEMPLATE_DOC");	
			            	   
			            	  
			            	    File filePre=new File(strDirectoy);
			            		   exists = filePre.exists();
			            		if(!exists){
			            			  success = (new File(strDirectoy)).mkdir();		            			  
			            		}
			            			   if (success || exists) {
						            	             		  
						            	   
						            	   FileOutputStream fop = null;
						           		 
						           		   bareActsRulesName = templateDocName+extnType;
						           		    
						           		   file = new File("C://LOMS_IMAGES_DOWNLOAD//"+bareActsRulesName);
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
						if(retBareRulesTemplateBean != null){
							retBareRulesTemplateBean = (ArrayList<TemplateBean>) session.get("retBareRulesTemplateBean");
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
		
	
	
	
	public String downloadJudgDoc(){
		retEmpType = (String) session.get("retEmpType"); // Variable used to Restricting menu for USER and ADMIN 
		loginbean = (LoginBean) session.get("loginbean");
		
		String judjmentCourt = searchJudgmentBean.jdgmntCourt;
		String ret = "";
		String username = "";
		String password = "";
		if (loginbean != null) {
			  username = loginbean.getUserName();
			  password = loginbean.getPassWord();
	
			// ret = loginLoms.execute(username, password);
			
		}
		if ( loginbean != null) {
		//	retMsg = searchJudgmentsDoa.downloadJudgDocDoa(hidjdgmntId,username, password);
			
			Connection connection = null;
			String judgmentId = ""; 	   	   
	   	    String strDirectoy ="C:\\LOMS_IMAGES_DOWNLOAD";
	   	    byte[] contentInBytes = null;
	   	    String errMsg = "";
	   	    boolean success = false;
	   	    boolean exists  = false;
	      	 String tableName = "";
	      	 
	      	
			try{		 
				 String courtIDType[] = hidjdgmntId.split("\\|");
				 String judgmentID = courtIDType[0];
				 String courtType = courtIDType[1];
				 System.out.println("Court Type : " + courtType +" judgmentID " +judgmentID);
				if(courtType.equals("SC")){
					 tableName = "SC_JUDGMNT_INFO";
				 }else if(!courtType.equals("SC") && !courtType.equals("TC")){
					 tableName = courtType;
				 }else if(!courtType.equals("SC") && courtType.equals("TC")){
					 tableName = "TC_JUDGMNT_INFO"; 
				 }
				
				connection = RakshaDBUtil.getServerJudgmentCon();	
				 
		        Statement statement = connection.createStatement(); 	 
		        
		        String sqlQry = "SELECT JUDGMNT_DOC_NO,JUDGMNT_TITLE," +
								  " JUDGMNT_DOC " +
				                  //  " JUDGMNT_WORD_DOC " +
									 " FROM "+tableName+" WHERE " +			
									 " JUDGMNT_DOC_NO = '"+judgmentID+"'";
		        System.out.println("sqlQry : " + sqlQry);
				ResultSet resultSet = statement.executeQuery( sqlQry);
		            
		            while (resultSet.next()) {  	            	 
		            	   judgmentId = resultSet.getString("JUDGMNT_DOC_NO");   
		            	   judgmentDocName = resultSet.getString("JUDGMNT_DOC_NO")+".doc"; 		             	 
		            	   contentInBytes = resultSet.getBytes("JUDGMNT_DOC");
		            	   //contentInBytes = resultSet.getBytes("JUDGMNT_WORD_DOC");
		            	 
		            	 
		            	    
		            	   
		            	    File filePre=new File(strDirectoy);
		            		   exists = filePre.exists();
		            		if(!exists){
		            			  success = (new File(strDirectoy)).mkdir();		            			  
		            		}
            			   if (success || exists) {
			            	    		            		  
			            	   
			            	   
			            	   FileOutputStream fop = null; 
			           		   File file;
			           		   file = new File("C://LOMS_IMAGES_DOWNLOAD//"+judgmentDocName);
			           		    if (!file.exists()){
			       				 file.createNewFile();
			       			   }        	 
			           		 
				       		   fop = new FileOutputStream(file);		       		   
				           	   fop.write(contentInBytes);
				       		   fop.flush();
				       		   fop.close(); 
				       		   
				       		   fileInputStream = new FileInputStream(file);
			       		   	   
		            	   } 
		            		// fileInputStream = new FileInputStream(file);
		            } 
		            
		
		            
		            errMsg = "E1049";
		            
		            setSearchPageVar("value");
					if(retSearchJudgmentBean != null){
						retSearchJudgmentBean = (ArrayList<SearchJudgmentBean>) session.get("retSearchJudgmentBean");
					}
			}catch (Exception e) {
				
				errMsg = "E9999";
			}finally{
				try { 
					if(connection != null){
					connection.close();
					}
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
