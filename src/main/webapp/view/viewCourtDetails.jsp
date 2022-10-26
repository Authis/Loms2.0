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
   <h3> Court Name:  <s:property value="updCourtInfoBean.courtname" /> </h3>
 
  
 <fieldset>
   <legend>Court Info View</legend>
 <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 <tr>
	<td>Court ID:</td>
	<td><s:property value="updCourtInfoBean.courtid" /></td>	
</tr>
 
<tr>
	<td>Court Type: </td>
	<td><s:property value="updCourtInfoBean.courttype"/> </td>
</tr> 
<tr>
	<td>Court Address:</td>
	<td><s:property value="updCourtInfoBean.courtaddress"  /> </td>
</tr>
<tr>
	<td>Court City:</td>
	<td><s:property value="updCourtInfoBean.courtcity" /> </td>
</tr> 
  
<tr>
		<td>Court State:v</td>
		<td><s:property value="updCourtInfoBean.courtstate" /></td>
	</tr>
 
	<tr>
		<td>Court District: </td>
		<td><s:property value="updCourtInfoBean.courtdist" /></td>	 
	</tr>
	<tr>
		<td>Court Country:</td>
		<td><s:property	value="updCourtInfoBean.courtcountry" /></td>
	</tr> 
 
 </table>
 </fieldset>
 
   <div id="grid_control">
<p>Comments</p>
 </div>
  <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 
  <tr>
   <td></td>
   <td><s:property value="updCourtInfoBean.comments"/></td>
   <td></td>
   <td></td>
 </tr>
 </table>
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