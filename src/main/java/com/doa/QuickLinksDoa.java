package com.doa;

import com.action.RakshaDBUtil;
import com.bean.CaseSearchResultBean;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.sql.*;
import java.util.ArrayList;

public class QuickLinksDoa{

	public ArrayList<CaseSearchResultBean> searchCaseHearInfoDoa(String fromdate, String todate,String viewType, String username, String password) {
		 
		//ArrayList<CaseHearInfoBean>  retCaseHearInfo = new ArrayList<CaseHearInfoBean> ();  // Not in use
		//CaseHearInfoBean addCaseHearInfo; // Not in use
		
		ArrayList<CaseSearchResultBean>  retCaseHearInfo = new ArrayList<CaseSearchResultBean>();
		CaseSearchResultBean addCaseHearInfo ;
		Connection connection = null;	
		try{			
				 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.ViewCaseHearing(?,?,?,?,?,?)}"); 
			 
			 callStmt.registerOutParameter(4,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(5, Types.VARCHAR);
			 callStmt.registerOutParameter(6, Types.VARCHAR);
			 callStmt.setString(1, viewType); 
			 callStmt.setString(2, fromdate); 
			 callStmt.setString(3, todate); 
			 
			 callStmt.executeUpdate();	
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(4);
			 while (rs.next())
			    {
				 addCaseHearInfo = new CaseSearchResultBean();
				 addCaseHearInfo.setCaseId(rs.getString(1));
				 addCaseHearInfo.setClientId(rs.getString(2));
				 addCaseHearInfo.setClientInfo(rs.getString(3));
				 addCaseHearInfo.setCaseType(rs.getString(4));				 			  
				 addCaseHearInfo.setPrimeCaseNo(rs.getString(5));			 			  
				 addCaseHearInfo.setRefCaseNo(rs.getString(6));			 			  
				 addCaseHearInfo.setCourtDetails(rs.getString(7));			 			  
				 addCaseHearInfo.setCasePriority(rs.getString(8));			 			  
				 addCaseHearInfo.setCaseStatus(rs.getString(9));
				 addCaseHearInfo.setJudgmntDate(rs.getString(10));
				 addCaseHearInfo.setCaseComments(rs.getString(11));				 
			 	  				 
				 retCaseHearInfo.add(addCaseHearInfo);
				} 
			 callStmt.close();
	}catch(Exception e){
			
	}finally{
		try {
			if(connection != null){
			connection.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}		
		return retCaseHearInfo;
	}
	
	
}