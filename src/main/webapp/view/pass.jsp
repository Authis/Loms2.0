<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
String username1 = "loms_admin";
String password1 = "Pa$$w0rd";
            String sn=request.getParameter("ver");
 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
	         Connection con = DriverManager.getConnection("jdbc:sqlserver://122.165.92.78:1433;databaseName=loms_LawyersInfo",  
	       		  username1, password1);  
                    Statement st=con.createStatement();
                    //ResultSet rs = st.executeQuery("select * from emp where empno="+sn);
                    ResultSet rs = st.executeQuery("SELECT * FROM LAWYERS_INFO WHERE USER_NAME='"+sn+"'");  // this is for name
                  
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Name already taken");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");
 
                    }
 
rs.close();
st.close();
con.close();
 
%>