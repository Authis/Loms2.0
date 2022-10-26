<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>LOMS</title>
 
  	<link rel="stylesheet" href="/loms/view/css/print/app.css"  type="text/css"  title="blue" media="screen"/>
     
</head>
 <body>
 <!-- Content wrapper(application wrapper)-->
 <div id="contentwrap">
 <span> </span>
    
 
 <form>
  
 <fieldset>
   <legend>Employee Info View</legend>
 <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 <tr>
	<td width="25%">Employee ID:</td>
	<td width="25%"><s:property value="addEmpBean.employeeid" /></td>
	<td width="25%">User ID:</td> 
	<td width="25%"><s:property value="addEmpBean.username" /> </td> 
 
 </tr>
 <tr>
     <td>First Name:</td>
	 <td><s:property value="addEmpBean.firstname" /></td>
	 <td >Last Name:</td>
	 <td><s:property value="addEmpBean.lastname" /></td>	 
 </tr>
 <tr>     
     <td >Gender:</td>
	 <td><s:property value="addEmpBean.gender" /></td>
	<td>Address:</td>				
	 <td><s:property value="addEmpBean.address"/></td>   
 </tr>
 <tr>
     <td>Nationality:</td>				
	 <td><s:property value="addEmpBean.nationality"    /></td>
      <td>Date of Birth:</td>				 
	 <td><s:property value="addEmpBean.dateofbirth" />     
 </tr>
 <tr>
  <td>Telephone No:</td>				
   <td><s:property value="addEmpBean.telephoneno" /></td>
   <td>Mobile No:</td>
   <td><s:property value="addEmpBean.mobileno"/></td>    
 </tr>
 <tr>
    <td>License No:</td>				
	<td><s:property value="addEmpBean.licenseno" /></td>
    <td>PAN No:</td>				 
    <td><s:property value="addEmpBean.panno" /></td>
 </tr>
 <tr>
    <td>Date of Joining:</td>
    <td><s:property value="addEmpBean.dateofjoining" /></td>  
    <td>User Type:</td>				
    <td><s:property value="addEmpBean.usertype" />  </td>
 </tr>
  
 </table>
 
  <div id="grid_control">
<p>Comments</p>
 </div>
  <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 
  <tr>
   <td></td>
   <td><s:property value="addEmpBean.comments"/></td>
   <td></td>
   <td></td>
 </tr>
 </table>
 </fieldset>
  <br/>


 <!---------- Notes----------->
<!--<div class="note"><b>Note:</b>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
 </div> -->
<!---------- END of notes----------->
 <br/><br/>
  <div id="btn_wrap">
    
   <input type="button" name="groovybtn1" class="groovybutton" value="Print" onclick="window.print();" />
   <input type="button" name="groovybtn1" class="groovybutton" value="Close" onclick="window.close();" />
   
 </div>
 
 </div> <!-- End of cont_bg -->
 </div> <!-- End of Content Wrapper -->
 </body>
 </html>