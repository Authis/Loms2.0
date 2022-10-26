package com.doa;

import com.action.RakshaDBUtil;
import com.bean.SearchJudgmentBean;
import com.bean.SearchJudgmentFieldBean;
import com.bean.TemplateBean;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
public class SearchJudgmentsDoa {
	
	 String union = " UNION ";
	
   public ArrayList<SearchJudgmentBean>  searchJudgmentResultsDoa(SearchJudgmentFieldBean searchJudgmentFieldBean,String statesNames,String beanchNames) {
	   
	   String fromDate = searchJudgmentFieldBean.getFromDate();
	   String toDate = searchJudgmentFieldBean.getToDate();
	   String supCourtChk = searchJudgmentFieldBean.getSupCourt();
	   String highCourtChk = searchJudgmentFieldBean.getHighCourt();
	   String otherCourtChk = searchJudgmentFieldBean.getOtherCourt();
	   String keyWord = searchJudgmentFieldBean.getJudgmntKeyWord();
	  // keyWord = "\"*"+keyWord+"*\"";   
	   String courtSql = "";
	  
	   
	    String judDate = "";
		String year = "";
		String month = "";
		String day = "";
		String citationInfo = "";
	   
	   String whereCondSup = "";
	   //String whereCondHig = "";
	   String whereCondOth = "";
	   
	   if(statesNames.isEmpty()){
		   statesNames = "HC_JUDGMNT_INFO_AP,HC_JUDGMNT_INFO_ARP,HC_JUDGMNT_INFO_BIHAR,HC_JUDGMNT_INFO_CHHATTISGARH," +
		   		"HC_JUDGMNT_INFO_GAUHATI,HC_JUDGMNT_INFO_GOA,HC_JUDGMNT_INFO_GUJARAT,HC_JUDGMNT_INFO_HARYANA,HC_JUDGMNT_INFO_HP," +
		   		"HC_JUDGMNT_INFO_JHARKHAND,HC_JUDGMNT_INFO_JK,HC_JUDGMNT_INFO_KERALA,HC_JUDGMNT_INFO_MAHARASHTRA,HC_JUDGMNT_INFO_MP," +
		   		"HC_JUDGMNT_INFO_ORISSA,HC_JUDGMNT_INFO_RAJASTHAN,HC_JUDGMNT_INFO_TN,HC_JUDGMNT_INFO_UP,HC_JUDGMNT_INFO_UTTARAKHAND";
	   }
	   
	   if(beanchNames.isEmpty()){
		   beanchNames = "'NEW DELHI','HYDERABAD','AHMEDABAD','ALLAHABAD'," +
		   				 "'BANGALORE','CHANDIGARH','CHENNAI','CUTTACK','ERNAKULAM'," +
		   				 "'GUWAHATI','JABALPUR','JAIPUR','LUCKNOW','MUMBAI','PATNA'";
	   }
	   
	   
	   
		if(!fromDate.isEmpty()){		
			  year = fromDate.substring(6, 10);
			  month = fromDate.substring(3, 5);
			  day = fromDate.substring(0, 2); 
			 
			fromDate = year+"-"+month+"-"+day;
			year = "";
			month = "";
			day = "";
		}	
		if(!toDate.isEmpty()){		
			  year = toDate.substring(6, 10);
			  month = toDate.substring(3, 5);
			  day = toDate.substring(0, 2); 
			 
			toDate = year+"-"+month+"-"+day;
			year = "";
			month = "";
			day = "";
		}	
		
		if((!supCourtChk.isEmpty() && !highCourtChk.isEmpty() && !otherCourtChk.isEmpty()) ||
				(supCourtChk.isEmpty() && highCourtChk.isEmpty() && otherCourtChk.isEmpty())){
			 
				// courtSql = "SELECT " +
					//	"c0JUDGMNT_DOC_NO,c1JUDGMNT_TITLE, c6JUDGMNT_ACT,'SC' AS COURTTYPE,c4JUDGMNT_CITN, " +
					//	"c5JUDGMNT_CITR_INFO,c3JUDGMNT_DATE,c11JUDGMNT_BENCH FROM SC_JUDGMNT_INFO_content WHERE ";
				
				courtSql = "SELECT " +
				"JUDGMNT_DOC_NO,JUDGMNT_TITLE, JUDGMNT_ACT,'SC' AS COURTTYPE,JUDGMNT_CITN, " +
				"JUDGMNT_CITR_INFO,JUDGMNT_DATE,JUDGMNT_BENCH FROM SC_JUDGMNT_INFO WHERE ";
				
				
				if(!fromDate.isEmpty() && !toDate.isEmpty()){
					
					 whereCondSup += " JUDGMNT_DATE BETWEEN '"+fromDate+"' AND '"+toDate+"'";
				}
				
				if(!keyWord.isEmpty()){
					if(whereCondSup != ""){
						whereCondSup += " AND ";
					}
					
					whereCondSup += " JUDGMNT_DOC LIKE('"+keyWord+"*')";
				}
				
				
				courtSql = courtSql + whereCondSup;
				
				
				 
		 
			 
				if(supCourtChk != "" && courtSql != ""){
					courtSql += union;
				}
				
				courtSql += getHighCourtQuery(statesNames,keyWord,fromDate,toDate);
				
				 
				
				if(highCourtChk != "" && courtSql != ""){
					courtSql += union;
				}
				
		
				courtSql += "SELECT JUDGMNT_ID,JUDGMNT_TITLE, JUDGMNT_ACT,'TC' AS COURTTYPE,JUDGMNT_CITATION, " +
				"JUDGMNT_CITR_INFO,JUDGMNT_DATE,JUDGMNT_BENCH FROM TC_JUDGMNT_INFO WHERE ";
				
				
				if(!fromDate.isEmpty() && !toDate.isEmpty()){
					
					whereCondOth += " JUDGMNT_DATE BETWEEN '"+fromDate+"' AND '"+toDate+"'";
				}
				
				if(!keyWord.isEmpty()){
					if(whereCondOth != ""){
						whereCondOth += " AND ";
					}
					
					whereCondOth += "CONTAINS(JUDGMNT_WORD_DOC , '"+keyWord+"')";
				}
				if(!beanchNames.isEmpty()){
					if(whereCondOth != ""){
						whereCondOth += " AND ";
					}
					whereCondOth += " JUDGMNT_COURT IN ("+beanchNames+")";
				}
				
				courtSql = courtSql + whereCondOth;
				
				 
				
				
		}else if(!supCourtChk.isEmpty() || !highCourtChk.isEmpty() || !otherCourtChk.isEmpty()){	
		
			if(!supCourtChk.isEmpty()){
				
			/*	courtSql = "SELECT JUDGMNT_ID,JUDGMNT_TITLE, JUDGMNT_ACT, 'SC' AS COURTTYPE ,JUDGMNT_CITATION,JUDGMNT_CITR_INFO ," +
						" JUDGMNT_DATE,JUDGMNT_BENCH " +
						"  FROM SC_JUDGMNT_INFO_content WHERE ";*/
				
			//	courtSql = "SELECT " +
			//	"c0JUDGMNT_DOC_NO,c1JUDGMNT_TITLE, c6JUDGMNT_ACT,'SC' AS COURTTYPE,c4JUDGMNT_CITN, " +
			//	"c5JUDGMNT_CITR_INFO,c3JUDGMNT_DATE,c11JUDGMNT_BENCH FROM SC_JUDGMNT_INFO_content WHERE ";
				
				courtSql = "SELECT " +
				"JUDGMNT_DOC_NO,JUDGMNT_TITLE, JUDGMNT_ACT,'SC' AS COURTTYPE,JUDGMNT_CITN, " +
				"JUDGMNT_CITR_INFO,JUDGMNT_DATE,JUDGMNT_BENCH FROM SC_JUDGMNT_INFO WHERE ";
			 
				if(!keyWord.isEmpty()){
				    
					whereCondSup += " JUDGMNT_DOC MATCH('"+keyWord+"*')";
				}
				
				if(!fromDate.isEmpty() && !toDate.isEmpty()){
					if(whereCondSup != ""){
						whereCondSup += " AND ";
					}
					 whereCondSup += " JUDGMNT_DATE BETWEEN '"+fromDate+"' AND '"+toDate+"'";
				}
				courtSql = courtSql + whereCondSup;
				
			}
			 if(!highCourtChk.isEmpty()){
				 if(supCourtChk != "" && courtSql != ""){
						courtSql += union;
			     }
				 
				 courtSql += getHighCourtQuery(statesNames,keyWord,fromDate,toDate);
			 
			} 
			if(!otherCourtChk.isEmpty()){
		
				courtSql += "SELECT JUDGMNT_ID,JUDGMNT_TITLE, JUDGMNT_ACT,'TC' AS COURTTYPE,JUDGMNT_CITATION,JUDGMNT_CITR_INFO, " +
				"JUDGMNT_DATE,JUDGMNT_BENCH FROM TC_JUDGMNT_INFO WHERE ";
				
				
				if(!fromDate.isEmpty() && !toDate.isEmpty()){
					
					whereCondOth += " JUDGMNT_DATE BETWEEN '"+fromDate+"' AND '"+toDate+"'";
				}
				
				if(!keyWord.isEmpty()){
					if(whereCondOth != ""){
						whereCondOth += " AND ";
					}
					
					whereCondOth += " CONTAINS(JUDGMNT_WORD_DOC , '"+keyWord+"')";
				}
				if(!beanchNames.isEmpty()){
					if(whereCondOth != ""){
						whereCondOth += " AND ";
					}
					whereCondOth += " JUDGMNT_COURT IN ("+beanchNames+")";
				}
				
				courtSql = courtSql + whereCondOth;
			}
		} 
		
		if(!courtSql.isEmpty()){
			
			courtSql += " ORDER BY JUDGMNT_DATE DESC ";
		}
 	System.out.println("Final Query ---->"+courtSql);
		
		
		ArrayList<SearchJudgmentBean>  retSearchJudgmentBean = new ArrayList<SearchJudgmentBean>();
		SearchJudgmentBean searchJudgment;
		Connection connection = null;
		String[] temp;
		String delim = "\\[";
		try{ 
			
			connection = RakshaDBUtil.getServerJudgmentCon();	
			  if(connection != null){
	         Statement statement = connection.createStatement(); 
	         ResultSet resultSet = statement.executeQuery(courtSql);
	            
	            while (resultSet.next()) {  	            	 
	            	searchJudgment = new SearchJudgmentBean();	            	
	            	searchJudgment.setJdgmntID(resultSet.getString("JUDGMNT_DOC_NO"));   
	            	
	            	judDate = resultSet.getString("JUDGMNT_DATE");
					if(judDate!=null){
						  year = judDate.substring(0, 4);
						  month = judDate.substring(5, 7);
						  day = judDate.substring(8, 10); 
						
				       judDate = day+"/"+month+"/"+year;
				   } 
	            	searchJudgment.setJdgmntDate(judDate);        
	            	searchJudgment.setJdgmntTitle(resultSet.getString("JUDGMNT_TITLE"));       
	            	searchJudgment.setJdgmntBench(resultSet.getString("JUDGMNT_BENCH"));    
	            	
	            	if(!resultSet.getString("JUDGMNT_CITN").isEmpty()){
	            		citationInfo = resultSet.getString("JUDGMNT_CITN");
	            	}else{
	            		temp = resultSet.getString("JUDGMNT_TITLE").split(delim);
	            		citationInfo = "["+temp[0];
	            		//System.out.println("--->"+citationInfo);
	            	}
	            	
	            	
	            	searchJudgment.setJdgmntCitation(citationInfo);    
	            	searchJudgment.setJdgmntCitatorInfo(resultSet.getString("JUDGMNT_CITR_INFO")); 
	            	
	            	/*String judgAct = resultSet.getString("JUDGMNT_ACT");	            	
	            	if(!judgAct.isEmpty()){
	            		judgAct = judgAct.substring(0, 300)+"...";
	            	}
	            	searchJudgment.setJdgmntAct(judgAct);   */
	            	
	            	searchJudgment.setJdgmntAct("JUDGMNT_ACT"); 
	            	searchJudgment.setCourtType(resultSet.getString("JUDGMNT_DOC_NO")+"|"+resultSet.getString("COURTTYPE"));     
	            	if(resultSet.getString("COURTTYPE").equals("SC")){
	            	searchJudgment.setCourtName("Supreme Court"); 
	            	}else if(resultSet.getString("COURTTYPE").equals("TC")){
	            		searchJudgment.setCourtName("Tribunal Court"); 
	            	}else{
	            	searchJudgment.setCourtName(resultSet.getString("COURTTYPE")); 	
	            	}
	            	retSearchJudgmentBean.add(searchJudgment); 
	            }  
		
			  }
		}catch (Exception e) {
			System.out.println("Exception ---->"+e);
		} 
		
		
	return retSearchJudgmentBean;
		 
		
	}
	
	public String getHighCourtQuery(String statesNames, String keyWord, String fromDate, String toDate){
		 String statesQuery = "";
		 String[] checkedStates;
		 String whereCondHig = "";
		 checkedStates = statesNames.split("\\,");
		
	    for(int i = 0;i<checkedStates.length;i++){
	    	statesQuery += "SELECT JUDGMNT_ID,JUDGMNT_TITLE, JUDGMNT_ACT,'"+checkedStates[i]+"' AS COURTTYPE,JUDGMNT_CITATION,JUDGMNT_CITR_INFO, " +
	    			" JUDGMNT_DATE,JUDGMNT_BENCH " +
	    			" FROM "+checkedStates[i]+" WHERE ";
	    	
	    	if(!fromDate.isEmpty() && !toDate.isEmpty()){
				
				whereCondHig += " JUDGMNT_DATE BETWEEN '"+fromDate+"' AND '"+toDate+"'";
			}
	    	
	    	
	    	if(!keyWord.isEmpty()){
	    		if(whereCondHig != ""){
					whereCondHig += " AND ";
				}				
				whereCondHig += "CONTAINS(JUDGMNT_WORD_DOC , '"+keyWord+"')";
			} 
	    	statesQuery += whereCondHig;
	    	whereCondHig = "";
	    	
	    	if(i < checkedStates.length -1 ){
	    		statesQuery += union;
				} 
		 
			
		} 
		
		return statesQuery;
	}
	

	public ArrayList<SearchJudgmentBean> searchJudgmentResuletsDoa(SearchJudgmentBean searchJudgmentBean, String username,String password) throws UnsupportedEncodingException {
		 
		String judjmentCourt = searchJudgmentBean.getJdgmntCourt();		 
		String strJudDate = searchJudgmentBean.getJdgmntDate();
		if(!strJudDate.isEmpty()){		
			String year = strJudDate.substring(6, 10);
			String month = strJudDate.substring(3, 5);
			String day = strJudDate.substring(0, 2); 
			 
			strJudDate = year+"-"+month+"-"+day;
		}	
		String tableName = "";
		//String jdgmntMonth = searchJudgmentBean.jdgmntMonth;
		//String jdgmntYear = searchJudgmentBean.jdgmntYear;
		String jdgmntTitle = searchJudgmentBean.jdgmntTitle;
		String jdgmntBench = searchJudgmentBean.jdgmntBench;
		String jdgmntCitation = searchJudgmentBean.jdgmntCitation;
		String jdgmntCitatorInfo = searchJudgmentBean.jdgmntCitatorInfo;
		String fromDate = searchJudgmentBean.fromDate;
		String toDate = searchJudgmentBean.toDate;
		if(!fromDate.isEmpty()){		
			String year = fromDate.substring(6, 10);
			String month = fromDate.substring(3, 5);
			String day = fromDate.substring(0, 2); 
			 
			fromDate = year+"-"+month+"-"+day;
		}	
		if(!toDate.isEmpty()){		
			String year = toDate.substring(6, 10);
			String month = toDate.substring(3, 5);
			String day = toDate.substring(0, 2); 
			 
			toDate = year+"-"+month+"-"+day;
		}	
		
		
		String whereCond = "";
		 
		if(!strJudDate.isEmpty()){
			whereCond += "  JUDGMNT_DATE = '"+strJudDate.trim()+"'";
			
			
		}
		/*if(!jdgmntMonth.isEmpty()){
			whereCond += " AND JUDGMNT_MONTH = '"+jdgmntMonth.trim()+"'";
		}
		if(!jdgmntYear.isEmpty()){
			whereCond += " AND JUDGMNT_YEAR = '"+jdgmntYear.trim()+"'";
		}*/
		if(!jdgmntTitle.isEmpty()){
			if(whereCond != ""){
				whereCond += " AND ";
			}
			
			whereCond += " UPPER(JUDGMNT_TITLE)  LIKE UPPER('%"+jdgmntTitle.trim()+"%') ";

			
		
		}
		if(!jdgmntBench.isEmpty()){
			if(whereCond != ""){
				whereCond += " AND ";
			}
			whereCond += "  UPPER(JUDGMNT_BENCH)  LIKE UPPER('%"+jdgmntBench.trim()+"%') ";
		}
		if(!jdgmntCitation.isEmpty()){
			if(whereCond != ""){
				whereCond += " AND ";
			}
			whereCond += "  UPPER(JUDGMNT_CITATION)  LIKE UPPER('%"+jdgmntCitation.trim()+"%') ";
		}
		if(!jdgmntCitatorInfo.isEmpty()){
			if(whereCond != ""){
				whereCond += " AND ";
			}
			whereCond += "   UPPER(JUDGMNT_CITR_INFO) LIKE UPPER('%"+jdgmntCitatorInfo.trim()+"%') ";
		}
		if(!fromDate.isEmpty() && !toDate.isEmpty()){
			if(whereCond != ""){
				whereCond += " AND ";
			}
			whereCond += "  JUDGMNT_DATE BETWEEN '"+fromDate+"' AND '"+toDate+"'";
		}
		 if(judjmentCourt.equals("SUPREME COURT OF INDIA")){
			 tableName = "SC_JUDGMENT_INFO";
		 }else if(judjmentCourt.equals("HIGH COURT")){
			 tableName = "HC_JUDGMENT_INFO";
		 }
	  
		
	 
		ArrayList<SearchJudgmentBean>  retSearchJudgmentBean = new ArrayList<SearchJudgmentBean>();
		SearchJudgmentBean searchJudgment;
		Connection connection = null;
		
		try{ 
			
			connection = RakshaDBUtil.getServerJudgmentCon();	
			  if(connection != null){
	         Statement statement = connection.createStatement(); 
	         
	         
	         String queryString = "SELECT JUDGMNT_ID, JUDGMNT_DATE,JUDGMNT_TITLE," +
			 						" JUDGMNT_BENCH,JUDGMNT_CITATION,JUDGMNT_CITR_INFO,JUDGMNT_ACT" +
			 						" FROM "+tableName+" WHERE "+whereCond;
	         
	       
	       
	            ResultSet resultSet = statement.executeQuery(queryString);
	            
	            while (resultSet.next()) {  	            	 
	            	searchJudgment = new SearchJudgmentBean();	            	
	            	searchJudgment.setJdgmntID(resultSet.getString("JUDGMNT_ID"));       
 	            	searchJudgment.setJdgmntDate(resultSet.getString("JUDGMNT_DATE"));        
 	            	searchJudgment.setJdgmntTitle(resultSet.getString("JUDGMNT_TITLE"));       
	            	searchJudgment.setJdgmntBench(resultSet.getString("JUDGMNT_BENCH"));       
	            	searchJudgment.setJdgmntCitation(resultSet.getString("JUDGMNT_CITATION"));    
	            	searchJudgment.setJdgmntCitatorInfo(resultSet.getString("JUDGMNT_CITR_INFO"));   
	            	searchJudgment.setJdgmntAct(resultSet.getString("JUDGMNT_ACT"));           
	            	retSearchJudgmentBean.add(searchJudgment); 
	            }  
	            
			  }else{
				  retSearchJudgmentBean = null;
				  
			  }
	}catch(Exception e){
			
	}finally{
		try {
			 if(connection != null){
			connection.close();
			 }
		} catch (SQLException e) {			 
			e.printStackTrace();
		}
	}
		return retSearchJudgmentBean;		
		
	}
	
	
	
	
	public ArrayList  getHighCourtName(String username,String password) {
		Connection connection = null;  
		ArrayList retHighCourtame = new ArrayList();		
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			 if(connection != null){
			        Statement statement = connection.createStatement(); 	
			        String temQuery = "SELECT DISTINCT JUDGMNT_STATE " +
			            											 " FROM HC_JUDGMENT_INFO";
			            											  
			       
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) { 
			            	retHighCourtame.add(resultSet.getString("JUDGMNT_STATE"));
			            	 
			            }
			 }
		 
		}catch (Exception e) {
			
			 
		}finally{
			try {
				 if(connection != null){
				     connection.close();
				 }
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
		}
		return retHighCourtame; 
		
	}
	
	public ArrayList<SearchJudgmentBean> searchAllJudgmentResuletsDoa(String judjmentCourt,String jdjDoc, String username,String password) {
		
		 
		ArrayList<SearchJudgmentBean>  retSearchJudgmentBean = new ArrayList<SearchJudgmentBean>();
		SearchJudgmentBean searchJudgment;
		Connection connection = null;
		String tableName = "";
		try{ 
			 if(judjmentCourt.equals("SUPREME COURT OF INDIA")){
				 tableName = "SC_JUDGMENT_INFO";
			 }else if(judjmentCourt.equals("HIGH COURT")){
				 tableName = "HC_JUDGMENT_INFO";
			 }
	         
	         connection = RakshaDBUtil.getServerJudgmentCon();	
	         if(connection != null){
	         Statement statement = connection.createStatement(); 
	         
	         String queryString = "SELECT JUDGMNT_ID, JUDGMNT_DATE,JUDGMNT_TITLE," +
			 						" JUDGMNT_BENCH,JUDGMNT_CITATION,JUDGMNT_CITR_INFO,JUDGMNT_ACT " +
			 						" FROM "+tableName+" WHERE " +			 						 
			 						" CONTAINS(JUDGMNT_WORD_DOC,'"+jdjDoc+"')";
	       
	            ResultSet resultSet = statement.executeQuery(queryString);
	            
	          
	            
	            while (resultSet.next()) {  	            	 
	            	searchJudgment = new SearchJudgmentBean();	            	
	            	searchJudgment.setJdgmntID(resultSet.getString("JUDGMNT_ID"));       
 	            	searchJudgment.setJdgmntDate(resultSet.getString("JUDGMNT_DATE"));        
 	            	searchJudgment.setJdgmntTitle(resultSet.getString("JUDGMNT_TITLE"));       
	            	searchJudgment.setJdgmntBench(resultSet.getString("JUDGMNT_BENCH"));       
	            	searchJudgment.setJdgmntCitation(resultSet.getString("JUDGMNT_CITATION"));    
	            	searchJudgment.setJdgmntCitatorInfo(resultSet.getString("JUDGMNT_CITR_INFO"));   
	            	searchJudgment.setJdgmntAct(resultSet.getString("JUDGMNT_ACT"));                  	
	            	retSearchJudgmentBean.add(searchJudgment); 
	            }  
	         }else{
	        	 
	        	 retSearchJudgmentBean = null; 
	         }
			 
	}catch(Exception e){
			e.printStackTrace();
	}finally{
		try {
			if(connection != null){
			connection.close();
			}
		} catch (SQLException e) {			 
			e.printStackTrace();
		}
	}
		return retSearchJudgmentBean;		
		
	}
	
	public String downloadJudgDocDoa(String hidjdgmntId, String username,
			String password) {
		Connection connection = null;
		String judgmentId = "";   
   	    String judgmentDocName = "";  
   	    String judgmentDocExtn = "";
   	    byte[] contentInBytes = null;
   	    String errMsg = "";
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			  
	        Statement statement = connection.createStatement(); 	         
	        ResultSet resultSet = statement.executeQuery("SELECT JUDGMNT_ID,JUDGMNT_DOC_NAME,JUDGMNT_DOC_EXTN," +
	            											 " JUDGMNT_PDF_DOC FROM LOMS_JUDGMNT_INFO " +
	            											 " WHERE " +
	            											 " JUDGMNT_ID = "+hidjdgmntId);
	            
	            while (resultSet.next()) {  	            	 
	            	   judgmentId = resultSet.getString("JUDGMNT_ID");   
	            	   judgmentDocName = resultSet.getString("JUDGMNT_DOC_NAME");  
	            	   judgmentDocExtn = resultSet.getString("JUDGMNT_DOC_EXTN"); 
	            	   contentInBytes = resultSet.getBytes("JUDGMNT_PDF_DOC");
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
		       		   errMsg = "E1049";
	            } 
		}catch (Exception e) {
			
			errMsg = "E9999";
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return errMsg;				   
		
	}

	public ArrayList<TemplateBean> getBareRulesTemplateDao(String downloadBareRulesType, String bareRulesKeyWord, String username,
			String password) {
		
		Connection connection = null;  
		TemplateBean templateBean;
		ArrayList<TemplateBean>  retBareRulesTemplateBean = new ArrayList<TemplateBean>();
		
		
		String whereCond = "";
		 
		if(!downloadBareRulesType.isEmpty()){
			whereCond += " TEMPLATE_TYPE = '"+downloadBareRulesType+"'";
		}
		if(!bareRulesKeyWord.isEmpty()){
			whereCond += " AND TEMPLATE_NAME LIKE '%"+bareRulesKeyWord+"%'";
		}
		 
		
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			 if(connection != null){
			        Statement statement = connection.createStatement(); 	
			        String temQuery = "SELECT TEMPLATE_ID,TEMPLATE_NAME,TEMPLATE_TYPE " +
			            											 " FROM BARE_ACTS_RULES_INFO " +
			            											 " WHERE " + whereCond;
			            											  
			       System.out.println("Bare Acts -->"+temQuery);
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) { 
			            	templateBean = new TemplateBean();
			            	templateBean.setTemplateID(resultSet.getString("TEMPLATE_ID"));   
			            	templateBean.setTemplateName(resultSet.getString("TEMPLATE_NAME"));  
			            	templateBean.setTemplateType(resultSet.getString("TEMPLATE_TYPE")); 
			            	retBareRulesTemplateBean.add(templateBean); 
			            } 
	            
			 }else{
				 retBareRulesTemplateBean = null;
			 }
		}catch (Exception e) {
			
			 
		}finally{
			try {
				 if(connection != null){
				     connection.close();
				 }
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
		}
		return retBareRulesTemplateBean; 
		
	}




	
	

}
