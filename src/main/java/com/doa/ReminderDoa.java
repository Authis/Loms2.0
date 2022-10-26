package com.doa;

import com.action.RakshaDBUtil;
import com.bean.ReminderBean;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

import java.sql.*;
import java.util.ArrayList;

public class ReminderDoa {	
	
	ArrayList retReminderList = new ArrayList();
 
		public String addremindersaveDao(ReminderBean reminderBean, String username, String password){
			 
			String retRemID = "";
			Connection connection = null;
			try{		 
				  	 	 
				  connection = RakshaDBUtil.getCon(username,password);	 
				  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.AddEventReminder(?,?,?,?,?,?,?,?)}");			 		  		   
				  callStmt.setString(1,reminderBean.getRemindertype());
				  callStmt.setString(2, reminderBean.getRemindersubject());
				  callStmt.setString(3, reminderBean.getReminderlocn());
				  callStmt.setString(4, reminderBean.getReminderdate());
				  callStmt.setString(5, reminderBean.getRemindertime());
				  callStmt.setString(6, reminderBean.getRemindermsg()); 	
				  callStmt.registerOutParameter(7, Types.VARCHAR);
				  callStmt.registerOutParameter(8, Types.VARCHAR);
				  callStmt.executeUpdate();	
				  
				  retRemID = callStmt.getString(7);
				  
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
			return retRemID;		
		}

		public ArrayList<ReminderBean> viewreminderDao(String username, String password, String place) {
		
			ArrayList<ReminderBean>  retReminderBean = new ArrayList<ReminderBean> ();
			ReminderBean reminderBean ;
			Connection connection = null;
			try{			
				 	 
				connection = RakshaDBUtil.getCon(username,password);	
				
				CallableStatement callStmt = null;
				ResultSet rs;	
				System.out.println("---------------------->"+place);
			 if(place == "frmMenu"){
				   callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchEventReminderByUserName(?,?,?,?)}"); 
			 }else if(place == "frmHome"){
				   callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.SearchEventReminderForDB(?,?,?,?)}"); 
			 }
				 callStmt.registerOutParameter(2,OracleTypes.CURSOR);			 
				 callStmt.registerOutParameter(3, Types.VARCHAR);
				 callStmt.registerOutParameter(4, Types.VARCHAR);
				 callStmt.setString(1, username); 
				 callStmt.executeUpdate();	 
				
				// connection.close();
				 rs = ((OracleCallableStatement)callStmt).getCursor(2);
				 while (rs.next())
				    {
					 reminderBean = new ReminderBean();
					 reminderBean.setReminderid(rs.getString(1));
					 reminderBean.setRemindertype(rs.getString(2));
					 reminderBean.setRemindersubject(rs.getString(3));
					 reminderBean.setReminderlocn(rs.getString(4));
					 reminderBean.setReminderdate(rs.getString(5));
					 
					  
					    reminderBean.setRemindertime(rs.getString(6));
				       
					 reminderBean.setRemindermsg(rs.getString(7)); 
					 retReminderBean.add(reminderBean);
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
		return retReminderBean;
			
			
		} 
		
		public String delReminderDao(String hidreminderid, String username, String password) {
			Connection connection = null;
			try{
			  	 
			  connection = RakshaDBUtil.getCon(username,password);	 
			  
			  CallableStatement callStmt = connection.prepareCall("{call LOMS_OFFICE_PKG.DeleteEventReminder(?)}");
			  callStmt.setString(1,hidreminderid);
				   
			  callStmt.executeUpdate();				   
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
		
		return null;
		}

		public ArrayList getactiveUserList(String retEmpType,String username, String password) {
			
			Connection connection = null;
			try{		 
				
				connection = RakshaDBUtil.getCon(username,password);			 
		        Statement statement = connection.createStatement(); 
		        String sel_query = " SELECT USER_NAME,FIRST_NAME,LAST_NAME " +
		        				   " FROM LOMS_EMP_INFO" +
		        				   " WHERE OBSLT_IST IS NULL";
		        
		        ResultSet resultSet = statement.executeQuery(sel_query);
				        retReminderList.add("PERSONAL");
						retReminderList.add("OFFICIAL");
				 if(retEmpType.equals("GOD")){
		            while (resultSet.next()) {           	 
		            	retReminderList.add(resultSet.getString("USER_NAME").toUpperCase());
		            	//retReminderList.add(resultSet.getString("FIRST_NAME").toUpperCase()+ " "+resultSet.getString("LAST_NAME").toUpperCase()); 		             	 
		            	   //contentInBytes = resultSet.getBytes("ACTUAL_DOC");   
		            }   
				 }
			}catch (Exception e) {
				
				 
			}finally{
				try {
					connection.close();
				} catch (SQLException e) {
					 
					e.printStackTrace();
				}
			}
			return retReminderList;
			
		}

		public String getactiveUserName(String txtUserId,String username,
				String password) {
			Connection connection = null;
			String userName = "";
			try{		 
				connection = RakshaDBUtil.getCon(username,password);	
				 
		        Statement statement = connection.createStatement(); 
		        String sel_query = " SELECT FIRST_NAME,LAST_NAME " +
		        				   " FROM LOMS_EMP_INFO" +
		        				   " WHERE UPPER(USER_NAME) = '"+txtUserId +"'";
		        
		        ResultSet resultSet = statement.executeQuery(sel_query);
				      
						 
		            while (resultSet.next()) {           	 
		            	 
		            	userName = resultSet.getString("FIRST_NAME").toUpperCase()+ " "+resultSet.getString("LAST_NAME").toUpperCase(); 		             	 
		            	 
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
	
}