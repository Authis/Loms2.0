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
 <span><img src="C:\PHOTOS(DO_NOT_DELETE_RENAME)\<s:property value="viewClientBean.clientid" />.jpg" width="18%" height="25%"/></span>
    
 <h3><s:if test="%{viewClientBean.gender == 'Male'}">Mr.  </s:if>
     <s:if test="%{viewClientBean.gender == 'Female'}">Ms.  </s:if>
      <s:property value="viewClientBean.firstname"/>  <s:property value="viewClientBean.lastname"/>  </h3>
 
  
 <fieldset>
   <legend>Client Info View</legend>
 <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 <tr>
	 <td width="25%">Telephone No</td>
	 <td width="25%"><s:property value="viewClientBean.telephoneno"   /></td>
	 <td>Mobile No</td>
	 <td><s:property value="viewClientBean.mobilenumber" /></td>
	 
 </tr>
 <tr>
	 <td nowrap>Permanent Address</td>
	 <td><s:property value="viewClientBean.permanentaddress" /></td>
	 <td nowrap>Org Name</td>
	 <td><s:property value="viewClientBean.organizationname" /></td>
 </tr>
 <tr>     
      <td>PAN Number</td>				
	 <td><s:property value="viewClientBean.pannumber" /></td>
	<td>TIN Number</td>				
	 <td><s:property value="viewClientBean.tinnumber"/></td>   
 </tr>
 <tr>
     <td nowrap>Org Telephone No</td>				
	 <td><s:property value="viewClientBean.organizationtelephoneno"    /></td>
      <td nowrap valign="top">Temporary Address</td>				 
	 <td><s:property value="viewClientBean.temporaryaddress" />     
 </tr>
 <tr>
  <td>Gender</td>				
   <td><s:property value="viewClientBean.gender" /></td>
   <td>Profession</td>
   <td><s:property value="viewClientBean.profession"/></td>    
 </tr>
 <tr>
   <td width="25%">Email ID</td>
   <td width="25%"><s:property value="viewClientBean.emailid" /></td>
   <td nowrap valign="top">Orgn Address</td>				 
    <td><s:property value="viewClientBean.organizationaddress" /></td>
 </tr>
 <tr>
   <td nowrap>Org Mobile No</td>				
	<td><s:property value="viewClientBean.organizationmobileno" /></td>
    <td>Date of Birth</td>				
  <td><s:property value="viewClientBean.dateofbirth" />  </td>
 </tr>
  
 </table>
 
  <div id="grid_control">
<p>Comments</p>
 </div>
  <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 
  <tr>
   <td></td>
   <td><s:property value="viewClientBean.comments"/></td>
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