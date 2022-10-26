package com.doa;

import com.action.RakshaDBUtil;
import com.bean.*;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.io.File;
import java.io.FileInputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
@SuppressWarnings({ "rawtypes", "unchecked" })
public class CaseInfoDoa{
	
	public ArrayList<CaseSearchResultBean> searchCaseInfo(SearchCaseInfoBean searchCaseInfoBean, String username, String password){
		 
		ArrayList<CaseSearchResultBean>  retCaseSearchResult = new ArrayList<CaseSearchResultBean>();
		CaseSearchResultBean caseSearchResult ;
		Connection connection = null;
		try{			
					 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseInfo(?,?,?,?,?,?,?,?,?,?,?,?)}"); 
			 
			
			 callStmt.setString(1, searchCaseInfoBean.getCaseid().trim()); 
			 callStmt.setString(2, searchCaseInfoBean.getClientid().trim()); 
			 callStmt.setString(3, searchCaseInfoBean.getCaseType().trim()); 
			 callStmt.setString(4, searchCaseInfoBean.getCaseNo().trim()); 
			 callStmt.setString(5, searchCaseInfoBean.getFname().trim()); 
			 callStmt.setString(6, searchCaseInfoBean.getLname().trim()); 	
			 callStmt.setString(7, searchCaseInfoBean.getMobileno().trim());
			 callStmt.setString(8, searchCaseInfoBean.getEmailId().trim()); 
			 callStmt.setString(9, searchCaseInfoBean.getCourtId().trim());  
			 callStmt.registerOutParameter(10,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(11, Types.VARCHAR);
			 callStmt.registerOutParameter(12, Types.VARCHAR);
			 callStmt.executeUpdate();	 
			
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(10);
			 while (rs.next())
			    {
				 caseSearchResult = new CaseSearchResultBean();
				 caseSearchResult.setCaseId(rs.getString(1));
				 caseSearchResult.setClientId(rs.getString(2));
				 caseSearchResult.setClientInfo(rs.getString(3));
				 caseSearchResult.setCaseType(rs.getString(4));				 			  
				 caseSearchResult.setPrimeCaseNo(rs.getString(5));			 			  
				 caseSearchResult.setRefCaseNo(rs.getString(6));			 			  
				 caseSearchResult.setCourtDetails(rs.getString(7));			 			  
				 caseSearchResult.setCasePriority(rs.getString(8));			 			  
				 caseSearchResult.setCaseStatus(rs.getString(9));
				 caseSearchResult.setJudgmntDate(rs.getString(10));
				 caseSearchResult.setCaseComments(rs.getString(11));				 
				 
				 retCaseSearchResult.add(caseSearchResult);
				} 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return retCaseSearchResult;		
	}
	
	public AddCaseBean updCaseInfoDoa(String hidcaseid, String username, String password){
	 
		AddCaseBean addCaseBean = new AddCaseBean();
		Connection connection = null;
		try{			
			 	 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseInfoForUpdate(?,?,?,?,?)}"); 
			 
			
			 callStmt.setString(1, hidcaseid); 
			 callStmt.registerOutParameter(2,OracleTypes.CURSOR);	
			 callStmt.registerOutParameter(3,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(4, Types.VARCHAR);
			 callStmt.registerOutParameter(5, Types.VARCHAR);
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(2);
			 while (rs.next())
			    {
				 
				 addCaseBean.setCaseid(rs.getString(1));
				 addCaseBean.setClientid(rs.getString(2));
				 addCaseBean.setCasetype(rs.getString(3));
				 addCaseBean.setCasesubtype1(rs.getString(4));
			     addCaseBean.setCasesubtype2(rs.getString(5));			 			  
				 addCaseBean.setCaseno1(rs.getString(6));			 			  
				 addCaseBean.setCaseno2(rs.getString(7));			 			  
				 addCaseBean.setCaseno3(rs.getString(8));	
				 addCaseBean.setCaseno4(rs.getString(9)); 
				 addCaseBean.setCaseno5(rs.getString(10));			 			  
				 addCaseBean.setCaseno6(rs.getString(11));			 			  
				 addCaseBean.setCourtdetails(rs.getString(12));			 			  
				 addCaseBean.setCasepriority(rs.getString(13));			 			  
				 addCaseBean.setCasestatus(rs.getString(14));			 			  
				 addCaseBean.setCaseJudgmentdate(rs.getString(15)); 		 			  
				 addCaseBean.setComments(rs.getString(16));		 			  
				 
				} 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return addCaseBean;
	}
	
	public ArrayList<SearchCaseDocBean> searchCaseDoc(SearchCaseDocBean searchCaseDocBean, String username, String password){
		 
		ArrayList<SearchCaseDocBean>  retSearchCaseDocBean = new ArrayList<SearchCaseDocBean> ();
		SearchCaseDocBean searchCaseDoc;
		Connection connection = null;
		try{			
		 	 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseDocument(?,?,?,?,?,?,?,?,?)}"); 
			 
			 callStmt.registerOutParameter(7,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(8, Types.VARCHAR);
			 callStmt.registerOutParameter(9, Types.VARCHAR);
			 callStmt.setString(1, searchCaseDocBean.getDocumentid().trim()); 
			 callStmt.setString(2, searchCaseDocBean.getCaseid().trim()); 
			 callStmt.setString(3, searchCaseDocBean.getClientid().trim()); 
			 callStmt.setString(4, searchCaseDocBean.getDocumentname().trim()); 
			 callStmt.setString(5, searchCaseDocBean.getFromdate().trim()); 
			 callStmt.setString(6, searchCaseDocBean.getTodate().trim());   
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(7);
			 while (rs.next())
			    {
				 searchCaseDoc = new SearchCaseDocBean();
				 searchCaseDoc.setDocumentid(rs.getString(1));
				 searchCaseDoc.setCaseid(rs.getString(2));
				 searchCaseDoc.setClientid(rs.getString(3));
				 searchCaseDoc.setDocumentname(rs.getString(4));
				 searchCaseDoc.setComments(rs.getString(5)); 
				 retSearchCaseDocBean.add(searchCaseDoc);
				} 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return retSearchCaseDocBean;		
	}

	public String uploadCaseDocDoa(String txtCaseID, String txtClientID, String txtComment, File file, String fileName, String username, String password) {
		   String INSERT_FILE = " INSERT INTO " +
		   						" LOMS_CASE_DOC_INFO(DOC_ID,CASE_ID,CLIENT_ID,ACTUAL_DOC,COMMENTS,DOC_NAME,GEN_IST,GEN_USER_CD,UPD_IST,UPD_USER_CD) " +
		   		                " VALUES (?,?,?,?,?,?,?,?,?,?)";
		    Connection connection = null;	 	 
		    int maxDocId = 0;
		    connection = RakshaDBUtil.getCon(username,password);	
		    String retMsg="";
		    FileInputStream fis = null;
			PreparedStatement ps = null;
			
			maxDocId = getMaxDocNo(username,password);
			if(maxDocId == 0){
				maxDocId = 100000;
			}else{
				maxDocId = maxDocId;
			}
			Date currentDate; 
			SimpleDateFormat formatter;
			String curDate;
			
			formatter = new SimpleDateFormat ("dd-MMM-yy", Locale.getDefault());
	        currentDate = new Date();
	        curDate = formatter.format(currentDate);
			 
			try { 
				fis = new FileInputStream(file);
				ps = connection.prepareStatement(INSERT_FILE);
				ps.setInt(1, maxDocId);
				ps.setString(2,txtCaseID);
				ps.setString(3,txtClientID);
				ps.setBinaryStream(4, fis, (int) file.length());
				ps.setString(5,txtComment);
				ps.setString(6, fileName);
				ps.setString(7, curDate);
				ps.setString(8,username);
				ps.setString(9, curDate);
				ps.setString(10, username);
				
				ps.executeUpdate();
				retMsg = "E1049";
			} catch (Exception e) {
				retMsg = "E9999";
				
				e.printStackTrace();
			} finally {
				try {
					ps.close();
					fis.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return retMsg;
		 
		
	}
  public int getMaxDocNo(String username, String password){
	  Connection connection = null;	 	 
	  connection = RakshaDBUtil.getCon(username,password);
	  int maxDocId = 0;
	  String query = "SELECT MAX(DOC_ID)+1 FROM LOMS_CASE_DOC_INFO";  
	  Statement st;
	try {
		st = connection.createStatement();
		ResultSet rs = st.executeQuery(query);
		while (rs.next()) {
			  maxDocId = rs.getInt(1);			 
		}
	} catch (Exception e) {	 
		
		e.printStackTrace();
	}
		
	   return maxDocId;	
	  
	  
	  
  }
	public String addCaseInfoSaveDoa(AddCaseBean addCaseBean, String username, String password) {
		  Connection connection = null;	 	 
		  connection = RakshaDBUtil.getCon(username,password);	
		  String caseId = "";
		  String errMsg= "";
		  
		try{	
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.AddCaseInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			  callStmt.setString(1,addCaseBean.getClientid());
			  callStmt.setString(2,addCaseBean.getCasetype());
			  callStmt.setString(3, addCaseBean.getCasesubtype1());	
			  String caseSubType2 = addCaseBean.getCasesubtype2();
			  caseSubType2 = caseSubType2.replaceAll(",", "");
			   
			  caseSubType2 = caseSubType2.trim();
			  callStmt.setString(4, caseSubType2);
			  callStmt.setString(5, addCaseBean.getCaseno1());
			  callStmt.setString(6, addCaseBean.getCaseno2());
			  callStmt.setString(7, addCaseBean.getCaseno3());
			  callStmt.setString(8, addCaseBean.getCaseno4());
			  callStmt.setString(9, addCaseBean.getCaseno5());
			  callStmt.setString(10, addCaseBean.getCaseno6());			  			  
			  callStmt.setString(11, addCaseBean.getCourtdetails());			 			  
			  callStmt.setString(12, addCaseBean.getCasepriority());			 			  
			  callStmt.setString(13, addCaseBean.getCasestatus());			 			  
			  callStmt.setString(14, addCaseBean.getCaseJudgmentdate());			  			  
			  callStmt.setString(15, addCaseBean.getComments());			 			  
			  callStmt.registerOutParameter(16, Types.VARCHAR);
			  callStmt.registerOutParameter(17, Types.VARCHAR);
			  callStmt.registerOutParameter(18, Types.VARCHAR);
			   callStmt.executeUpdate();	
			   
			   errMsg = callStmt.getString(17);
			   if(errMsg == "E9999"){
				   caseId = errMsg;
				   
			   }else{
				   caseId = callStmt.getString(16);
			   }
			   
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
		return caseId;
	}

	public String editCaseInfoSaveDoa(AddCaseBean addCaseBean, String username, String password) {
		  Connection connection = null;	 	 
		  connection = RakshaDBUtil.getCon(username,password);	
		  String retMsg = "";
		try{		 
	
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.ModifyCaseInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			  callStmt.setString(1,addCaseBean.getCaseid());
			  callStmt.setString(2,addCaseBean.getClientid());
			  callStmt.setString(3,addCaseBean.getCasetype());
			  callStmt.setString(4, addCaseBean.getCasesubtype1());
			  callStmt.setString(5, addCaseBean.getCasesubtype2());			 			  
			  callStmt.setString(6, addCaseBean.getCaseno1());			 			  
			  callStmt.setString(7, addCaseBean.getCaseno2());			 			  
			  callStmt.setString(8, addCaseBean.getCaseno3());	
			  callStmt.setString(9, addCaseBean.getCaseno4());
			 callStmt.setString(10, addCaseBean.getCaseno5());			 			  
			  callStmt.setString(11, addCaseBean.getCaseno6());			 			  
			  callStmt.setString(12, addCaseBean.getCourtdetails());			 			  
			  callStmt.setString(13, addCaseBean.getCasepriority());			 			  
			  callStmt.setString(14, addCaseBean.getCasestatus());			 			  
			  callStmt.setString(15, addCaseBean.getCaseJudgmentdate());		 	 			  
			  callStmt.setString(16, addCaseBean.getComments());			 			  
			  callStmt.registerOutParameter(17, Types.VARCHAR);
			  callStmt.registerOutParameter(18, Types.VARCHAR);
		 
			   callStmt.executeUpdate();	
			   retMsg = callStmt.getString(17);
			   
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return retMsg;			   
		
	}

	public String downloadDocDoa(String hisdocid, String username, String password) {
		 Connection connection = null;	 
		 String errMsg = "";	
		try{		 
			 
			  connection = RakshaDBUtil.getCon(username,password);	
			 
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.DownloadCaseDocument(?,?,?)}");
			  callStmt.setString(1,hisdocid);
			  callStmt.registerOutParameter(2, Types.VARCHAR);
			  callStmt.registerOutParameter(3, Types.VARCHAR);
		 
			   callStmt.executeUpdate();	
			   errMsg = callStmt.getString(2);
			 
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
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

	public String addCaseHearSaveDoa(CaseHearingBean caseHearingBean, String username, String password) {
		 Connection connection = null;	 	 
		String retMsg = "";
		try{		 
			   
			  connection = RakshaDBUtil.getCon(username,password);	
			  	
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.AddCaseHearingInfo(?,?,?,?,?,?,?)}");
			  callStmt.setString(1,caseHearingBean.getClientid());
			  callStmt.setString(2,caseHearingBean.getCaseid());	
			  callStmt.setString(3,caseHearingBean.getCasehearingdate());
			  callStmt.setString(4,caseHearingBean.getCasehearingcomments());
			  callStmt.registerOutParameter(5, Types.VARCHAR);
			  callStmt.registerOutParameter(6, Types.VARCHAR);
			  callStmt.registerOutParameter(7, Types.VARCHAR);
			  callStmt.executeUpdate();
			 String errCode =  callStmt.getString(6);
			 if(!errCode.equals("E9999") ){
				 retMsg = callStmt.getString(5);
			 }else{
				 retMsg = errCode;
			 }
		  
			  
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}	finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		   
		
		return retMsg;
		
	}

	public ArrayList<CaseHearingBean> searchCaseHearingDoa(String hidclientid, String hidcaseid, String username, String password) {
		ArrayList<CaseHearingBean>  retCaseHearingBean = new ArrayList<CaseHearingBean> ();
		CaseHearingBean caseHearing;
		 String errorCode = "";
		 Connection connection = null;	 	 
		try{			
			 	 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
			
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseHearingInfoGeneric(?,?,?,?,?,?,?,?,?)}"); 
		 
			 callStmt.setString(1, null);
			 callStmt.setString(2, null);
			 callStmt.setString(3, null);
			 callStmt.setString(4, null);
			 callStmt.setString(5, null);
			 callStmt.setString(6, hidcaseid);			 
			 callStmt.registerOutParameter(7,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(8, Types.VARCHAR);
			 callStmt.registerOutParameter(9, Types.VARCHAR);
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(7);
			 while (rs.next())
			    {
				 caseHearing = new CaseHearingBean();
				 caseHearing.setCasehearingid(rs.getString(1));
				 caseHearing.setCaseid(rs.getString(2));
				 caseHearing.setClientid(rs.getString(3));
				 caseHearing.setCasehearingdate(rs.getString(4));
				 caseHearing.setCasehearingcomments(rs.getString(5)); 
				 retCaseHearingBean.add(caseHearing);
				} 
			 errorCode = callStmt.getString(8);
			 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return retCaseHearingBean;
	}

	public String deleteCaseHearingDoa(String hidcasehearid, String username, String password) {
		 
		  String rs = "";	
		  Connection connection = null;	 	 
		try{		 
			  	 
			  connection = RakshaDBUtil.getCon(username,password);				
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.DeleteCaseHearingInfo(?,?,?)}");
			  callStmt.setString(1,hidcasehearid); 
			  callStmt.registerOutParameter(2, Types.VARCHAR);
			  callStmt.registerOutParameter(3, Types.VARCHAR);
		 
			  callStmt.executeUpdate();	
			  rs = callStmt.getString(2);
			  
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rs;			   
		
	}

	public CaseHearingBean editCaseHearingDoa(String hidcasehearid, String username, String password) {
		CaseHearingBean caseHearing = new CaseHearingBean();
		String errCode= "";
		 Connection connection = null;	 	 
		try{			
			  
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseHearingInfo(?,?,?,?)}"); 
			  

			 callStmt.setString(1, hidcasehearid); 				  
			 callStmt.registerOutParameter(2,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(3, Types.VARCHAR);
			 callStmt.registerOutParameter(4, Types.VARCHAR);
             
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(2);
			 while (rs.next())
			    {			 
				 caseHearing.setCasehearingid(rs.getString(1));
				 caseHearing.setCaseid(rs.getString(2));
				 caseHearing.setClientid(rs.getString(3));
				 caseHearing.setCasehearingdate(rs.getString(4));
				 caseHearing.setCasehearingcomments(rs.getString(5)); 
 				} 
			 errCode = callStmt.getString(3);
			 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		return caseHearing;
		
	}

	public String editCaseHearSaveDoa(CaseHearingBean caseHearingBean, String username, String password) {
		  String retMsg = "";	
		  Connection connection = null;	 
			try{		 
				 	 
				  connection = RakshaDBUtil.getCon(username,password);				
				  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.ModifyCaseHearingInfo(?,?,?,?,?,?,?)}");
				  callStmt.setString(1,caseHearingBean.getCasehearingid());
				  callStmt.setString(2,caseHearingBean.getClientid());
				  callStmt.setString(3,caseHearingBean.getCaseid());				 
				  callStmt.setString(4,caseHearingBean.getCasehearingdate());
				  callStmt.setString(5,caseHearingBean.getCasehearingcomments());
				  callStmt.registerOutParameter(6, Types.VARCHAR);
				  callStmt.registerOutParameter(7, Types.VARCHAR);
			 
				  callStmt.executeUpdate();	
				  retMsg = callStmt.getString(6);
				 
				  callStmt.close();
				//  connection.close();
			}catch (Exception e) {
				
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return retMsg;		
		
	}

	public ArrayList newCaseSuiteDoa(String username, String password) {
		 ResultSet rsSuiteType;	
		 ArrayList retCivilSuiteType = new ArrayList();
		 Connection connection = null;	 	 
			try{		 
				 
				  connection = RakshaDBUtil.getCon(username,password);				
				  CallableStatement callStmt = connection.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilSuiteType(?,?,?)}");
				  callStmt.registerOutParameter(1,OracleTypes.CURSOR); 
				  callStmt.registerOutParameter(2, Types.VARCHAR);
				  callStmt.registerOutParameter(3, Types.VARCHAR);
			 
				  callStmt.executeUpdate();	
				  rsSuiteType = ((OracleCallableStatement)callStmt).getCursor(1);
					 while (rsSuiteType.next())
					    {
						 retCivilSuiteType.add(rsSuiteType.getString(2));
					    }
				  callStmt.close();
				//  connection.close();
			}catch (Exception e) {
				
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return retCivilSuiteType;		
		
	}

	public ArrayList newCaseAppealDoa(String username, String password) {
		 ResultSet rsAppealType;	
		 ArrayList retCivilAppealType = new ArrayList();
		 Connection connection = null;	 
			try{		 
				  	 
				  connection = RakshaDBUtil.getCon(username,password);				
				  CallableStatement callStmt = connection.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilAppealType(?,?,?)}");
				  callStmt.registerOutParameter(1,OracleTypes.CURSOR); 
				  callStmt.registerOutParameter(2, Types.VARCHAR);
				  callStmt.registerOutParameter(3, Types.VARCHAR);
			 
				  callStmt.executeUpdate();	
				  rsAppealType = ((OracleCallableStatement)callStmt).getCursor(1);
					 while (rsAppealType.next())
					    {
						 retCivilAppealType.add(rsAppealType.getString(2));
					    }
				  callStmt.close();
				//  connection.close();
			}catch (Exception e) {
				
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return retCivilAppealType;		
	}

	public ArrayList newCasePetitioneDoa(String username, String password) {
		 ResultSet rsPetitioneType;	
		 ArrayList retCivilPetitioneType = new ArrayList();
		 Connection connection = null;	 
			try{		 
				  	 
				  connection = RakshaDBUtil.getCon(username,password);				
				  CallableStatement callStmt = connection.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilPetitionType(?,?,?)}");
				  callStmt.registerOutParameter(1,OracleTypes.CURSOR); 
				  callStmt.registerOutParameter(2, Types.VARCHAR);
				  callStmt.registerOutParameter(3, Types.VARCHAR);
			 
				  callStmt.executeUpdate();	
				  rsPetitioneType = ((OracleCallableStatement)callStmt).getCursor(1);
					 while (rsPetitioneType.next())
					    {
						 retCivilPetitioneType.add(rsPetitioneType.getString(2));
					    }
				  callStmt.close();
				//  connection.close();
			}catch (Exception e) {
				
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return retCivilPetitioneType;		
	}

	public ArrayList newCaseExecutionDoa(String username, String password) {
		 ResultSet rsExecutionType;	
		 ArrayList retCivilExecutionType = new ArrayList();
		 Connection connection = null;	 	 
			try{		 
				  
				  connection = RakshaDBUtil.getCon(username,password);				
				  CallableStatement callStmt = connection.prepareCall("{call LOMS_STD_INFO_PKG.GetCivilExecutionType(?,?,?)}");
				  callStmt.registerOutParameter(1,OracleTypes.CURSOR); 
				  callStmt.registerOutParameter(2, Types.VARCHAR);
				  callStmt.registerOutParameter(3, Types.VARCHAR);
			 
				  callStmt.executeUpdate();	
				  rsExecutionType = ((OracleCallableStatement)callStmt).getCursor(1);
					 while (rsExecutionType.next())
					    {
						 retCivilExecutionType.add(rsExecutionType.getString(2));
					    }
				  callStmt.close();
				//  connection.close();
			}catch (Exception e) {
				
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return retCivilExecutionType;		
	}


	public ArrayList newCaseCriminalDoa(String username, String password) {
		 ResultSet rsCriminalType;	
		 ArrayList retCriminalType = new ArrayList();
		 Connection connection = null;	 	 
			try{		 
				  
				  connection = RakshaDBUtil.getCon(username,password);				
				  CallableStatement callStmt = connection.prepareCall("{call LOMS_STD_INFO_PKG.GetCriminalCaseType(?,?,?)}");
				  callStmt.registerOutParameter(1,OracleTypes.CURSOR); 
				  callStmt.registerOutParameter(2, Types.VARCHAR);
				  callStmt.registerOutParameter(3, Types.VARCHAR);
			 
				  callStmt.executeUpdate();	
				  rsCriminalType = ((OracleCallableStatement)callStmt).getCursor(1);
					 while (rsCriminalType.next())
					    {
						 retCriminalType.add(rsCriminalType.getString(2));
					    }
				  callStmt.close();
				//  connection.close();
			}catch (Exception e) {
				
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return retCriminalType;	
	}

	public String delDocumentDoa(String hisdocid, String username, String password) {
	 
		  String retMsg = "";	
		  Connection connection = null;	 	 
		try{		 
			   	 
			  connection = RakshaDBUtil.getCon(username,password);				
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.DeleteCaseDocument(?,?,?,?,?)}");
			  callStmt.setString(1,hisdocid); 
			  callStmt.setString(2,null); 
			  callStmt.setString(3,null); 
			  callStmt.registerOutParameter(4, Types.VARCHAR);
			  callStmt.registerOutParameter(5, Types.VARCHAR);
		 
			  callStmt.executeUpdate();	
			  retMsg = callStmt.getString(4);
			 
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return retMsg;			  
		
	}
	
	public ArrayList<AddCaseBean> searchIndCaseID(SearchCaseInfoBean searchCaseInfoBean, String username,
			String password) {
		ArrayList<AddCaseBean>  retAddCaseBean = new ArrayList<AddCaseBean>();
		AddCaseBean addCaseBean ;
		Connection connection = null;	 	 
		try{			
			 		 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseInfo(?,?,?,?,?,?,?,?,?,?,?,?)}"); 
			 
			 callStmt.setString(1, null); 
			 callStmt.setString(2, null); 
			 callStmt.setString(3, searchCaseInfoBean.getCaseType()); 
			 callStmt.setString(4, searchCaseInfoBean.getCaseNo()); 
			 callStmt.setString(5, searchCaseInfoBean.getFname()); 
			 callStmt.setString(6, searchCaseInfoBean.getLname()); 	
			 callStmt.setString(7, searchCaseInfoBean.getMobileno());
			 callStmt.setString(8, searchCaseInfoBean.getEmailId()); 
			 callStmt.setString(9, searchCaseInfoBean.getCourtId());  
			 callStmt.registerOutParameter(10,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(11, Types.VARCHAR);
			 callStmt.registerOutParameter(12, Types.VARCHAR);
			 callStmt.executeUpdate();	  
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(10);
			 while (rs.next())
			    {
				 addCaseBean = new AddCaseBean();
				 addCaseBean.setCaseid(rs.getString(1));				 
				 addCaseBean.setCasetype(rs.getString(4));				 
				 retAddCaseBean.add(addCaseBean);
				} 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return retAddCaseBean;		
	
		
	}
	
	
	
	public ArrayList<AddCaseBean> searchCaseIDForClientID(String txtClientId, String username,
			String password) {
		ArrayList<AddCaseBean>  retAddCaseBean = new ArrayList<AddCaseBean>();
		AddCaseBean addCaseBean ;
		Connection connection = null;	 	 
		try{			
			 		 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseInfo(?,?,?,?,?,?,?,?,?,?,?,?)}"); 
			 
			 callStmt.setString(1, null); 
			 callStmt.setString(2, txtClientId); 
			 callStmt.setString(3, null); 
			 callStmt.setString(4, null); 
			 callStmt.setString(5, null); 
			 callStmt.setString(6, null); 	
			 callStmt.setString(7, null);
			 callStmt.setString(8, null); 
			 callStmt.setString(9, null);  
			 callStmt.registerOutParameter(10,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(11, Types.VARCHAR);
			 callStmt.registerOutParameter(12, Types.VARCHAR);
			 callStmt.executeUpdate();	  
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(10);
			 while (rs.next())
			    {
				 addCaseBean = new AddCaseBean();
				 addCaseBean.setCaseid(rs.getString(1));				 
				 addCaseBean.setCasetype(rs.getString(4));				 
				 retAddCaseBean.add(addCaseBean);
				} 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return retAddCaseBean;		
	
		
	}

	public String addCaseOppInfoSaveDoa(OppDetailBean oppDetailBean,
			String username, String password) {
		Connection connection = null;	 	 
		  connection = RakshaDBUtil.getCon(username,password);	
		  String errStr = "";
		try{	
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.AddOpponentInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			  callStmt.setString(1, oppDetailBean.getCaseNo());
			  callStmt.setString(2, oppDetailBean.getClientId());
			  callStmt.setString(3, oppDetailBean.getOppPartyName());		
			  callStmt.setString(4, oppDetailBean.getOppPartyAddress());
			  callStmt.setString(5, oppDetailBean.getOppPartyTelNo());
			  callStmt.setString(6, oppDetailBean.getOppPartyMobNo());
			  callStmt.setString(7, oppDetailBean.getOppPartEmailId());
			  callStmt.setString(8, oppDetailBean.getOppPartyOrgName());
			  callStmt.setString(9, oppDetailBean.getOppPartyOrgRepName());
			  callStmt.setString(10, oppDetailBean.getOppPartyOrgAddress());			  			  
			  callStmt.setString(11, oppDetailBean.getOppPartyOrgTelNo());			 			  
			  callStmt.setString(12, oppDetailBean.getOppPartyOrgMobNo());			 			  
			  callStmt.setString(13, oppDetailBean.getOppPartyOrgEmailId());			 			  
			  callStmt.setString(14, oppDetailBean.getOppPartyLawyerName());			  			  
			  callStmt.setString(15, oppDetailBean.getOppPartyLawyerAddress());	
			  callStmt.setString(16, oppDetailBean.getOppPartyLawyerTelNo());
			  callStmt.setString(17, oppDetailBean.getOppPartyLawyerMobNo());
			  callStmt.setString(18, oppDetailBean.getOppPartyLawyerEmailId());			  			 			  
			  callStmt.registerOutParameter(19, Types.VARCHAR);
			  callStmt.registerOutParameter(20, Types.VARCHAR);
			   callStmt.executeUpdate();	
			   errStr = callStmt.getString(19);
			 
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return errStr;		
		 
		
	}

	public ArrayList<OppDetailBean> searchCaseOppDoa(String hidcaseid, String username,
			String password) {
		ArrayList<OppDetailBean>  retOppDetailBean = new ArrayList<OppDetailBean>();
		OppDetailBean oppDetailBean;
		Connection connection = null;	 	 
		try{			
		 		 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseInfoForUpdate(?,?,?,?,?)}"); 
			 
			
			 callStmt.setString(1, hidcaseid); 
			 callStmt.registerOutParameter(2,OracleTypes.CURSOR);	
			 callStmt.registerOutParameter(3,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(4, Types.VARCHAR);
			 callStmt.registerOutParameter(5, Types.VARCHAR);
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(3);
			 while (rs.next())
			    {
				 oppDetailBean = new OppDetailBean();
				 oppDetailBean.setOppId(rs.getString(1));
				 oppDetailBean.setCaseNo(rs.getString(2));
				 oppDetailBean.setClientId(rs.getString(3));
				 oppDetailBean.setOppPartyName(rs.getString(4));
				 oppDetailBean.setOppPartyAddress(rs.getString(5));
				 oppDetailBean.setOppPartyTelNo(rs.getString(6));			 			  
				 oppDetailBean.setOppPartyMobNo(rs.getString(7));			 			  
				 oppDetailBean.setOppPartEmailId(rs.getString(8));			 			  
				 oppDetailBean.setOppPartyOrgName(rs.getString(9));	
				 oppDetailBean.setOppPartyOrgRepName(rs.getString(10)); 
				 oppDetailBean.setOppPartyOrgAddress(rs.getString(11));			 			  
				 oppDetailBean.setOppPartyOrgTelNo(rs.getString(12));			 			  
				 oppDetailBean.setOppPartyOrgMobNo(rs.getString(13));			 			  
				 oppDetailBean.setOppPartyOrgEmailId(rs.getString(14));			 			  
				 oppDetailBean.setOppPartyLawyerName(rs.getString(15));			 			  
				 oppDetailBean.setOppPartyLawyerAddress(rs.getString(16));
				 oppDetailBean.setOppPartyLawyerTelNo(rs.getString(17));			 			  
				 oppDetailBean.setOppPartyLawyerMobNo(rs.getString(18)); 		 			  
				 oppDetailBean.setOppPartyLawyerEmailId(rs.getString(19));	
				 retOppDetailBean.add(oppDetailBean);
				 
				} 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return retOppDetailBean;
		
	}

	public OppDetailBean editCaseoppDoa(String hidcaseoppid, String username,
			String password) {
		Connection connection = null;	 	 
		OppDetailBean oppDetailBean = null;
		try{			
			 	 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchOpponentInfoForUpdate(?,?,?,?)}"); 
			 
			
			 callStmt.setString(1, hidcaseoppid); 
			 callStmt.registerOutParameter(2,OracleTypes.CURSOR);				 	 
			 callStmt.registerOutParameter(3, Types.VARCHAR);
			 callStmt.registerOutParameter(4, Types.VARCHAR);
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(2);
			 while (rs.next())
			    {
				 oppDetailBean = new OppDetailBean();
				 oppDetailBean.setOppId(rs.getString(1));
				 oppDetailBean.setCaseNo(rs.getString(2));
				 oppDetailBean.setClientId(rs.getString(3));
				 oppDetailBean.setOppPartyName(rs.getString(4));
				 oppDetailBean.setOppPartyAddress(rs.getString(5));
				 oppDetailBean.setOppPartyTelNo(rs.getString(6));			 			  
				 oppDetailBean.setOppPartyMobNo(rs.getString(7));			 			  
				 oppDetailBean.setOppPartEmailId(rs.getString(8));			 			  
				 oppDetailBean.setOppPartyOrgName(rs.getString(9));	
				 oppDetailBean.setOppPartyOrgRepName(rs.getString(10)); 
				 oppDetailBean.setOppPartyOrgAddress(rs.getString(11));			 			  
				 oppDetailBean.setOppPartyOrgTelNo(rs.getString(12));			 			  
				 oppDetailBean.setOppPartyOrgMobNo(rs.getString(13));			 			  
				 oppDetailBean.setOppPartyOrgEmailId(rs.getString(14));			 			  
				 oppDetailBean.setOppPartyLawyerName(rs.getString(15));			 			  
				 oppDetailBean.setOppPartyLawyerAddress(rs.getString(16));
				 oppDetailBean.setOppPartyLawyerTelNo(rs.getString(17));			 			  
				 oppDetailBean.setOppPartyLawyerMobNo(rs.getString(18)); 		 			  
				 oppDetailBean.setOppPartyLawyerEmailId(rs.getString(19));	
				 
				 
				} 
			 callStmt.close();
	}catch(Exception e){
		e.printStackTrace();	
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return oppDetailBean;
		
	}

	public String deleteCaseoppDoa(String hidcaseoppid, String username,
			String password) {
	 
		Connection connection = null;	 	 
		  String rs = "";	
		try{		 
			   	 	 
			  connection = RakshaDBUtil.getCon(username,password);				
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.DeleteOpponentInfo(?,?,?)}");
			  callStmt.setString(1,hidcaseoppid); 
			  callStmt.registerOutParameter(2, Types.VARCHAR);
			  callStmt.registerOutParameter(3, Types.VARCHAR);
		 
			  callStmt.executeUpdate();	
			  rs = callStmt.getString(2);
			  
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rs;			   
	}

	public String editCaseoppSaveDoa(OppDetailBean editoppDetailBean,
			String username, String password) {
		 Connection connection = null;	 	 
		  connection = RakshaDBUtil.getCon(username,password);	
		  String retMsg = "";
		try{		 
	
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.ModifyOpponentInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			  callStmt.setString(1,editoppDetailBean.getOppId());
			  callStmt.setString(2,editoppDetailBean.getCaseNo());
			  callStmt.setString(3,editoppDetailBean.getClientId());
			  callStmt.setString(4, editoppDetailBean.getOppPartyName());
			  callStmt.setString(5, editoppDetailBean.getOppPartyAddress());			 			  
			  callStmt.setString(6, editoppDetailBean.getOppPartyTelNo());			 			  
			  callStmt.setString(7, editoppDetailBean.getOppPartyMobNo());			 			  
			  callStmt.setString(8, editoppDetailBean.getOppPartEmailId());	
			  callStmt.setString(9, editoppDetailBean.getOppPartyOrgName());
			 callStmt.setString(10, editoppDetailBean.getOppPartyOrgRepName());			 			  
			  callStmt.setString(11, editoppDetailBean.getOppPartyOrgAddress());			 			  
			  callStmt.setString(12, editoppDetailBean.getOppPartyOrgTelNo());			 			  
			  callStmt.setString(13, editoppDetailBean.getOppPartyOrgMobNo());			 			  
			  callStmt.setString(14, editoppDetailBean.getOppPartyOrgEmailId());			 			  
			  callStmt.setString(15, editoppDetailBean.getOppPartyLawyerName());		 	 			  
			  callStmt.setString(16, editoppDetailBean.getOppPartyLawyerAddress());		
			  callStmt.setString(17, editoppDetailBean.getOppPartyLawyerTelNo());
			  callStmt.setString(18, editoppDetailBean.getOppPartyLawyerMobNo());
			  callStmt.setString(19, editoppDetailBean.getOppPartyLawyerEmailId());
			  callStmt.registerOutParameter(20, Types.VARCHAR);
			  callStmt.registerOutParameter(21, Types.VARCHAR);
		 
			   callStmt.executeUpdate();	
			   retMsg = callStmt.getString(20);
			  
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return retMsg;			   
		
	}

	public String deleteCaseInfoDao(String hidcaseid, String username,
			String password) {
		 
		  String rs = "";	
		  Connection connection = null;	 
		try{		 
				 
			  connection = RakshaDBUtil.getCon(username,password);				
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.DeleteCaseAndOpponentInfo(?,?,?)}");
			  callStmt.setString(1,hidcaseid); 
			  callStmt.registerOutParameter(2, Types.VARCHAR);
			  callStmt.registerOutParameter(3, Types.VARCHAR);
		 
			  callStmt.executeUpdate();	
			  rs = callStmt.getString(2);
			  
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rs;			
	}

	public AddCaseBean viewCaseInfoDoa(String hidcaseid, String username,
			String password) {
		
		ArrayList arrayCaseInfo = new ArrayList();
		 
		AddCaseBean addCaseBean = new AddCaseBean();
		  Connection connection = null;	 
		try{			
			  
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
			
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseInfoForUpdate(?,?,?,?,?)}"); 
			 
			
			 callStmt.setString(1, hidcaseid); 
			 callStmt.registerOutParameter(2,OracleTypes.CURSOR);	
			 callStmt.registerOutParameter(3,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(4, Types.VARCHAR);
			 callStmt.registerOutParameter(5, Types.VARCHAR);
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(2);
			 while (rs.next())
			    { 
				 addCaseBean.setCaseid(rs.getString(1));
				 addCaseBean.setClientid(rs.getString(2));
				 addCaseBean.setCasetype(rs.getString(3));
				 addCaseBean.setCasesubtype1(rs.getString(4));
			     addCaseBean.setCasesubtype2(rs.getString(5));			 			  
				 addCaseBean.setCaseno1(rs.getString(6));			 			  
				 addCaseBean.setCaseno2(rs.getString(7));			 			  
				 addCaseBean.setCaseno3(rs.getString(8));	
				 addCaseBean.setCaseno4(rs.getString(9)); 
				 addCaseBean.setCaseno5(rs.getString(10));			 			  
				 addCaseBean.setCaseno6(rs.getString(11));			 			  
				 addCaseBean.setCourtdetails(rs.getString(12));			 			  
				 addCaseBean.setCasepriority(rs.getString(13));			 			  
				 addCaseBean.setCasestatus(rs.getString(14));			 			  
				 addCaseBean.setCaseJudgmentdate(rs.getString(15)); 		 			  
				 addCaseBean.setComments(rs.getString(16));		 			  
				 
				}  
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		 
		return addCaseBean;
	}
	
	public ArrayList<OppDetailBean> viewOppInfoDoa(String hidcaseid, String username,
			String password){
		
		ArrayList<OppDetailBean>  retOppDetailBean = new ArrayList<OppDetailBean>();
		OppDetailBean oppDetailBean;
		  Connection connection = null;	 
		try{			
			  
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rsOpp;	
			
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchCaseInfoForUpdate(?,?,?,?,?)}"); 		 
			
			 callStmt.setString(1, hidcaseid); 
			 callStmt.registerOutParameter(2,OracleTypes.CURSOR);	
			 callStmt.registerOutParameter(3,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(4, Types.VARCHAR);
			 callStmt.registerOutParameter(5, Types.VARCHAR);
			 callStmt.executeUpdate();	  
		
			 rsOpp = ((OracleCallableStatement)callStmt).getCursor(3);
			 while (rsOpp.next())
			    { 
				 oppDetailBean = new OppDetailBean();
				 oppDetailBean.setOppId(rsOpp.getString(1));
				 oppDetailBean.setCaseNo(rsOpp.getString(2));
				 oppDetailBean.setClientId(rsOpp.getString(3));
				 oppDetailBean.setOppPartyName(rsOpp.getString(4));
				 oppDetailBean.setOppPartyAddress(rsOpp.getString(5));
				 oppDetailBean.setOppPartyTelNo(rsOpp.getString(6));			 			  
				 oppDetailBean.setOppPartyMobNo(rsOpp.getString(7));			 			  
				 oppDetailBean.setOppPartEmailId(rsOpp.getString(8));			 			  
				 oppDetailBean.setOppPartyOrgName(rsOpp.getString(9));	
				 oppDetailBean.setOppPartyOrgRepName(rsOpp.getString(10)); 
				 oppDetailBean.setOppPartyOrgAddress(rsOpp.getString(11));			 			  
				 oppDetailBean.setOppPartyOrgTelNo(rsOpp.getString(12));			 			  
				 oppDetailBean.setOppPartyOrgMobNo(rsOpp.getString(13));			 			  
				 oppDetailBean.setOppPartyOrgEmailId(rsOpp.getString(14));			 			  
				 oppDetailBean.setOppPartyLawyerName(rsOpp.getString(15));			 			  
				 oppDetailBean.setOppPartyLawyerAddress(rsOpp.getString(16));
				 oppDetailBean.setOppPartyLawyerTelNo(rsOpp.getString(17));			 			  
				 oppDetailBean.setOppPartyLawyerMobNo(rsOpp.getString(18)); 		 			  
				 oppDetailBean.setOppPartyLawyerEmailId(rsOpp.getString(19));	
				 retOppDetailBean.add(oppDetailBean); 
				 
				}
			}catch(Exception e){
					
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		 
		return retOppDetailBean;
	}

	public MailDataBean sendCaseMail(String caseId, String username, String password) {
		MailDataBean mailDataBean = null;
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.ComposeAddCaseEmail(?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, caseId);
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.registerOutParameter(6, Types.VARCHAR);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.registerOutParameter(10, Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			 
		 
				mailDataBean = new MailDataBean();
				mailDataBean.setClientIDIN(caseId);
				mailDataBean.setFromEmailIDOUT(callStmt.getString(2));
				mailDataBean.setFromEmailPwdOUT(callStmt.getString(3));
				mailDataBean.setToemailIdOUT(callStmt.getString(4));
				mailDataBean.setEmailSubjectOUT(callStmt.getString(5));				 
				mailDataBean.setEmailMsgOUT(callStmt.getString(6));
				mailDataBean.setMobileNoOUT(callStmt.getString(7));
				mailDataBean.setSmsMessageOUT(callStmt.getString(8));
				mailDataBean.setErrorCdOUT(callStmt.getString(9));
				mailDataBean.setErrorMsgOUT(callStmt.getString(10));

	 
			callStmt.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
		return mailDataBean;
	}

	public MailDataBean sendCaseHearMail(String retMsg, String username,
			String password) {
		MailDataBean mailDataBean = null;
		Connection connection = null;
		try {
			 
			connection = RakshaDBUtil.getCon(username, password);
			ResultSet rs;

			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_OFFICE_PKG.ComposeAddCaseHearingEmail(?,?,?,?,?,?,?,?,?,?)}");

			callStmt.setString(1, retMsg);
			callStmt.registerOutParameter(2, Types.VARCHAR);
			callStmt.registerOutParameter(3, Types.VARCHAR);
			callStmt.registerOutParameter(4, Types.VARCHAR);
			callStmt.registerOutParameter(5, Types.VARCHAR);
			callStmt.registerOutParameter(6, Types.VARCHAR);
			callStmt.registerOutParameter(7, Types.VARCHAR);
			callStmt.registerOutParameter(8, Types.VARCHAR);
			callStmt.registerOutParameter(9, Types.VARCHAR);
			callStmt.registerOutParameter(10, Types.VARCHAR);
			callStmt.executeUpdate();

			// connection.close();
			 
		 
				mailDataBean = new MailDataBean();
				mailDataBean.setClientIDIN(retMsg);
				mailDataBean.setFromEmailIDOUT(callStmt.getString(2));
				mailDataBean.setFromEmailPwdOUT(callStmt.getString(3));
				mailDataBean.setToemailIdOUT(callStmt.getString(4));
				mailDataBean.setEmailSubjectOUT(callStmt.getString(5));				 
				mailDataBean.setEmailMsgOUT(callStmt.getString(6));
				mailDataBean.setMobileNoOUT(callStmt.getString(7));
				mailDataBean.setSmsMessageOUT(callStmt.getString(8));
				mailDataBean.setErrorCdOUT(callStmt.getString(9));
				mailDataBean.setErrorMsgOUT(callStmt.getString(10));

	 
			callStmt.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
		return mailDataBean;
	}

	public String checkIfCourtExists(String username, String password) {
		Connection connection = null;
		CallableStatement callStmt = null;		
		String courtExistString = "";
		try{			 		 
			connection = RakshaDBUtil.getCon(username,password);	
				  	 
		    callStmt = connection.prepareCall("{call LOMS_STD_INFO_PKG.CheckIfCourtExists(?) }");		  // Calling Oracle Function  
		    callStmt.registerOutParameter(1, Types.VARCHAR);  
		    
			callStmt.executeUpdate();	 
			courtExistString = callStmt.getString(1);	 
			callStmt.close();
			connection.close();
 	}catch(Exception e){
		 System.err.println("--->"+e);
	} 
		 
		return courtExistString;
	 
	}
 
}