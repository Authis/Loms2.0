 package com.action;


 import com.opensymphony.xwork2.ActionSupport;

 import java.sql.Connection;
 import java.sql.DriverManager;
 public class RakshaDBUtil  extends ActionSupport {
 
	        public static Connection getCon(){
	        	 
 			String serverName = "127.0.0.1";
 		    String portNumber = "1521";
 		    String sid = "XE";
 			Connection con = null;
 			try	{
 			 Class.forName( "oracle.jdbc.driver.OracleDriver" ); 			 
			 String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
			 con = DriverManager.getConnection( url, "LOMS_MSTR", "LOMS_MSTR" );
			 con.setAutoCommit(false);
 			}catch( Exception e ){
 				//e.printStackTrace(); 
 				 	
 				}
 			return con; 			
 			}		
	        
	public static Connection getCon(String username, String password){
		
		String serverName = "127.0.0.1";
	    String portNumber = "1521";
	    String sid = "XE";
		Connection con = null;
		try	{
		 Class.forName( "oracle.jdbc.driver.OracleDriver" ); 			 
		 String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
		 con = DriverManager.getConnection( url, username, password);
		 con.setAutoCommit(false);
		 con.commit();
		 			 
		}catch( Exception e ){
			 e.printStackTrace(); 			 
	    }
	   
		return con; 			
	 }
	
	/*
	 * * Method used to determine Oracle is Started and connections there or not
	 * *
	 * *
	 */
	
public static String checkCon(String username, String password){
		
		String serverName = "127.0.0.1";
	    String portNumber = "1521";
	    String sid = "XE";
		Connection con = null;
		String connectionStr = "";
		try	{
		 Class.forName( "oracle.jdbc.driver.OracleDriver" ); 			 
		 String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
		 con = DriverManager.getConnection( url, username, password);
		 con.setAutoCommit(false);
		 con.commit();

		 connectionStr = "SUCESS";			 
		}catch( Exception e ){		 
			System.out.println("------------>"+e);			 
			 e.printStackTrace(); 
			 connectionStr = e.toString();
	    }
	   
		return connectionStr; 			
	 }
	

	public static Connection getServerJudgmentActivationCon(){
		 Connection connection = null;
		 String username1 = "loms_admin";
		 String password1 = "Pa$$w0rd";
		try {  
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
	         connection = DriverManager.getConnection("jdbc:sqlserver://122.165.92.78:1433;databaseName=loms_LawyersInfo",  
	       		  username1, password1);  
	     
	   } catch (Exception e) {  
	       e.printStackTrace();  
	   }  
	  
		return connection; 	
	}

	
	/*public static Connection getServerJudgmentCon(){
		 Connection connection = null;
		 String username1 = "loms_admin";
		 String password1 = "Pa$$w0rd";
		try {  
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
             connection = DriverManager.getConnection("jdbc:sqlserver://122.165.92.78:1433;databaseName=loms_JudgmntInfo",  
           		  username1, password1);  
             
          
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
	   
		return connection; 	
	}*/
	
	public static Connection getServerJudgmentCon(){
		 Connection connection = null;
		  
		try {  
			 Class.forName("org.sqlite.JDBC");  
            connection = DriverManager.getConnection("jdbc:sqlite:C:\\SQLiteDB\\JudgmentDB.sqlite");  
            
         
       } catch (Exception e) {  
           e.printStackTrace();  
       }  
	   
		return connection; 	
	}

				
 	}