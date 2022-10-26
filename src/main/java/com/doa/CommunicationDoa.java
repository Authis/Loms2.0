package com.doa;

import com.action.RakshaDBUtil;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class CommunicationDoa{
	
public String sendMailDoa(String username, String password){
	  String errCode = "";
	  String mailId = "";
	  String mailPass = "";
	  Connection connection = null;
	try {
		
		connection = RakshaDBUtil.getCon(username, password);
		 
		CallableStatement callStmt = connection
				.prepareCall("{call LOMS_SERVICE_PKG.GetEmailIDAndPassword(?,?,?,?)}");
		 
		 callStmt.registerOutParameter(1,java.sql.Types.VARCHAR);
		 callStmt.registerOutParameter(2,java.sql.Types.VARCHAR);	
		 callStmt.registerOutParameter(3,java.sql.Types.VARCHAR);
		 callStmt.registerOutParameter(4,java.sql.Types.VARCHAR);
 		 callStmt.executeUpdate(); 
 		errCode = callStmt.getString(3);
 		if(errCode != "E9999"){
 		   mailId = callStmt.getString(1);
 		   mailPass = callStmt.getString(2);
 		}
		 callStmt.close();
		 connection.close();
	} catch (Exception e) {
		
	}finally{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return mailId+"#"+mailPass;
	
}
}