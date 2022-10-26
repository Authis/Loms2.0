package com.doa;

import com.action.RakshaDBUtil;
import com.bean.ProductSetBean;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;



public class LomsCommonDoa {

	public ProductSetBean editProductSetDoa(String username, String password) {
		 
		ProductSetBean productSetBean = new ProductSetBean();
		Connection connection = null;
		try{			
					 
			connection = RakshaDBUtil.getCon(username,password);		
		 	
		 
			 CallableStatement callStmt = connection.prepareCall("{call LOMS_SERVICE_PKG.GetApplicationMasterInfo(?,?,?,?,?,?,?,?)}");  
			 callStmt.registerOutParameter(1,java.sql.Types.VARCHAR);			 
			 callStmt.registerOutParameter(2,java.sql.Types.VARCHAR);
			 callStmt.registerOutParameter(3,java.sql.Types.VARCHAR);             
			 callStmt.registerOutParameter(4,java.sql.Types.VARCHAR);			 
			 callStmt.registerOutParameter(5,java.sql.Types.VARCHAR);
			 callStmt.registerOutParameter(6,java.sql.Types.VARCHAR);
			 callStmt.registerOutParameter(7,java.sql.Types.VARCHAR);
			 callStmt.registerOutParameter(8,java.sql.Types.VARCHAR);
			 
			 callStmt.executeUpdate();	 
			
			// connection.close();
			 		 
			 productSetBean.setEmailIdOUT(callStmt.getString(1));
			 productSetBean.setEmailPwdOUT(callStmt.getString(2));
			 productSetBean.setEmailFlgOUT(callStmt.getString(3));
			 productSetBean.setSmsFlgOUT(callStmt.getString(4));
			 productSetBean.setProductIdOUT(callStmt.getString(5));
			 productSetBean.setActivationIdOUT(callStmt.getString(6));
			 productSetBean.setErrorCdOUT(callStmt.getString(7));
			 productSetBean.setErrorMsgOUT(callStmt.getString(8)); 
			 
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
		return productSetBean;
		
		
		
		
	}

	public String updateProdSetDoa(ProductSetBean productSetBean, String username, String password) { 
		String retErrId = "";
		Connection connection = null;
		try {
			
			connection = RakshaDBUtil.getCon(username,password);
			CallableStatement callStmt = connection
					.prepareCall("{call LOMS_SERVICE_PKG.UpdateApplicationMasterInfo(?,?,?,?,?,?)}");
			callStmt.setString(1, productSetBean.getEmailIdOUT());
			callStmt.setString(2, productSetBean.getEmailPwdOUT());
			callStmt.setString(3, productSetBean.getEmailFlgOUT());
			callStmt.setString(4, productSetBean.getSmsFlgOUT());			
			callStmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			callStmt.registerOutParameter(6, java.sql.Types.VARCHAR);
			callStmt.executeUpdate();

			retErrId = callStmt.getString(5);
			 
			callStmt.close();
			 connection.close();
		} catch (Exception e) {
			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
		}		

		return retErrId;
	}

}
