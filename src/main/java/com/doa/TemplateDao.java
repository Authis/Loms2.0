package com.doa;

import com.action.RakshaDBUtil;
import com.bean.TemplateBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TemplateDao {

	 
 
	public ArrayList<TemplateBean> getTemplateDao(String downloadTempType, String tempName,String lang,String username,
			String password) {
		Connection connection = null;  
		TemplateBean templateBean;
		ArrayList<TemplateBean>  retTemplateBean = new ArrayList<TemplateBean>();
		
		
		String whereCond = "";
		 
		if(!downloadTempType.isEmpty()){
			whereCond += " TEMPLATE_TYPE = '"+downloadTempType+"'";
		}
		if(!tempName.isEmpty()){
			whereCond += " AND TEMPLATE_NAME LIKE '%"+tempName+"%'";
		}
		if(!lang.isEmpty()){
			whereCond += " AND TEMPLATE_LANG LIKE '%"+lang+"%'";
		}
		
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			 if(connection != null){
			        Statement statement = connection.createStatement(); 	
			        String temQuery = "SELECT TEMPLATE_ID,TEMPLATE_NAME,TEMPLATE_TYPE " +
			            											 " FROM LAWYERS_TEMPLATES " +
			            											 " WHERE " + whereCond;
			            											  
			       
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) { 
			            	templateBean = new TemplateBean();
			            	templateBean.setTemplateID(resultSet.getString("TEMPLATE_ID"));   
			            	templateBean.setTemplateName(resultSet.getString("TEMPLATE_NAME"));  
			            	templateBean.setTemplateType(resultSet.getString("TEMPLATE_TYPE")); 
			            	retTemplateBean.add(templateBean); 
			            } 
	            
			 }else{
				 retTemplateBean = null;
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
		return retTemplateBean; 
		
	}
	
	
	
	public ArrayList  getTemplateDocNameDao(String downloadTempType,String username,String password) {
		Connection connection = null;  
		ArrayList retDocName = new ArrayList();
		
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			 if(connection != null){
			        Statement statement = connection.createStatement(); 	
			        String temQuery = "SELECT TEMPLATE_NAME " +
			            											 " FROM LAWYERS_TEMPLATES WHERE TEMPLATE_TYPE = '"+downloadTempType+"'";
			            											  
			       
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) { 
			            	retDocName.add(resultSet.getString("TEMPLATE_NAME"));
			            	 
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
		return retDocName; 
		
	}
	
	
	
	
	
	public ArrayList  getTemplateLangDao(String username,String password) {
		Connection connection = null;  
		ArrayList retLang = new ArrayList();
		
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			 if(connection != null){
			        Statement statement = connection.createStatement(); 	
			        String temQuery = "SELECT DISTINCT TEMPLATE_LANG " +
			            											 " FROM LAWYERS_TEMPLATES ";
			            											  
			       
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) { 
			            	retLang.add(resultSet.getString("TEMPLATE_LANG"));
			            	 
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
		return retLang; 
		
	}
	
	public ArrayList  getTemplateFormLocDao(String downloadFormType, String username,String password) {
		Connection connection = null;  
		ArrayList retLoc = new ArrayList();
		
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			 if(connection != null){
			        Statement statement = connection.createStatement(); 	
			        String temQuery = "SELECT DISTINCT FORM_STATE " +
			            											 " FROM  FORMS_INFO WHERE FORM_TYPE = '"+downloadFormType+"'";
			            											  
			       System.out.println("temQuery : "+temQuery);
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) { 
			            	retLoc.add(resultSet.getString("FORM_STATE"));
			            	 
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
		return retLoc; 
		
	}
	
	
	public ArrayList<TemplateBean> getTemplateFormListDao(String downloadFormType, String downloadFormLoc,String formsKeyWord,String username,
			String password) {
		Connection connection = null;  
		TemplateBean templateBean;
		ArrayList<TemplateBean>  retTemplateBean = new ArrayList<TemplateBean>();
		
		
		String whereCond = "";
		 
		if(!downloadFormType.isEmpty()){
			whereCond += " FORM_TYPE = '"+downloadFormType+"'";
		}
		if(!downloadFormLoc.isEmpty()){
			whereCond += " AND FORM_STATE LIKE '%"+downloadFormLoc+"%'";
		}
		if(!formsKeyWord.isEmpty()){
			whereCond += " AND FORM_NAME LIKE '%"+formsKeyWord+"%'";
		}
		
		try{		 
			connection = RakshaDBUtil.getServerJudgmentCon();	
			 if(connection != null){
			        Statement statement = connection.createStatement(); 	
			        String temQuery = "SELECT FORM_ID,FORM_NAME " +
			            											 " FROM FORMS_INFO " +
			            											 " WHERE " + whereCond;
			            											  
			       System.out.println("Form Download Qry : "+ temQuery);
			        ResultSet resultSet = statement.executeQuery(temQuery);
			            
			            while (resultSet.next()) { 
			            	templateBean = new TemplateBean();
			            	templateBean.setTemplateID(resultSet.getString("FORM_ID"));   
			            	templateBean.setTemplateName(resultSet.getString("FORM_NAME"));  
			            	//templateBean.setTemplateType(resultSet.getString("TEMPLATE_TYPE")); 
			            	retTemplateBean.add(templateBean); 
			            } 
	            
			 }else{
				 retTemplateBean = null;
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
		return retTemplateBean; 
		
	}
	

}
