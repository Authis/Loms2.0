package com.doa;

import com.action.RakshaDBUtil;
import com.bean.IncomeExpenceBean;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;




public class IncomeExpenceDoa{

	public String addIncExpDetSaveDoa(IncomeExpenceBean incomeExpenceBean, String username, String password) {
		String retSucessMsg = "";
		 Connection connection = null;	 
		try{		 
			 	 
			  connection = RakshaDBUtil.getCon(username,password);	 
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_FINANCE_PKG.AddIncExpDetails(?,?,?,?,?,?,?,?)}");
			  callStmt.setString(1,incomeExpenceBean.getClientidin());
			  callStmt.setString(2,incomeExpenceBean.getCaseidin());
			  callStmt.setString(3, incomeExpenceBean.getPaidamtin());
			  callStmt.setString(4, incomeExpenceBean.getPaidistin());
			  callStmt.setString(5, incomeExpenceBean.getPaymnttypein());
			  callStmt.setString(6, incomeExpenceBean.getCommentsin());			  
			  callStmt.registerOutParameter(7, java.sql.Types.VARCHAR); 	
			  callStmt.registerOutParameter(8, java.sql.Types.VARCHAR); 
			//  ln("---->"+callStmt.getString(7));
			 // ln("---->"+callStmt.getString(8));			  
			  callStmt.executeUpdate();	
			  retSucessMsg = callStmt.getString(7);  
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		} finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		   
		return retSucessMsg;
	}

	public ArrayList<IncomeExpenceBean> searchManageincomeDetDoa(String transactionid,String caseid, String clientid,String payType,
			String fromdate, String todate, String username, String password) {
		
		ArrayList<IncomeExpenceBean>  retIncomeExpenceBean = new ArrayList<IncomeExpenceBean>();
		IncomeExpenceBean addIncomeExpence;
		Connection connection = null;	
		try{			
				 
			connection = RakshaDBUtil.getCon(username,password);		
			ResultSet rs;	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_FINANCE_PKG.SearchIncExpDetails(?,?,?,?,?,?,?,?,?)}"); 
			 
			 callStmt.registerOutParameter(7,OracleTypes.CURSOR);			 
			 callStmt.registerOutParameter(8,java.sql.Types.VARCHAR);
			 callStmt.registerOutParameter(9,java.sql.Types.VARCHAR);	
			 callStmt.setString(1, transactionid.trim()); 
			 callStmt.setString(2, clientid.trim() ); 
			 callStmt.setString(3, caseid.trim() ); 
			 callStmt.setString(4, payType.trim() ); 
			 callStmt.setString(5, fromdate.trim()); 
			 callStmt.setString(6, todate.trim());
	  	
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 rs = ((OracleCallableStatement)callStmt).getCursor(7);
			 while (rs.next())
			    {
				 addIncomeExpence = new IncomeExpenceBean();
				 addIncomeExpence.setTransactionid(rs.getString(1));
				 addIncomeExpence.setClientidin(rs.getString(2));
				 addIncomeExpence.setCaseidin(rs.getString(3));
				 addIncomeExpence.setPaidamtin(rs.getString(4));
				 addIncomeExpence.setPaidistin(rs.getString(5));
				 addIncomeExpence.setPaymnttypein(rs.getString(6)); 
				 addIncomeExpence.setCommentsin(rs.getString(7)); 
				 
				 
				 retIncomeExpenceBean.add(addIncomeExpence);
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
		 
		return retIncomeExpenceBean;
		
	}

	public void deleteIncExpDoa(String hidtransid, String username, String password) {
		Connection connection = null;	
		try{		 
			   	 
			  connection = RakshaDBUtil.getCon(username,password);	 
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_FINANCE_PKG.DeleteIncExpDetails(?,?,?,?,?)}");
			 		  		   
			  callStmt.setString(1,hidtransid);
			  callStmt.setString(2, null);			  
			  callStmt.setString(3, null); 	
			  callStmt.registerOutParameter(4,java.sql.Types.VARCHAR);
			  callStmt.registerOutParameter(5,java.sql.Types.VARCHAR);
						   
			  callStmt.executeUpdate();	
			  callStmt.close();
			//  connection.close();
		}catch (Exception e) {
			
		} finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		   	   
		
	}
	
}