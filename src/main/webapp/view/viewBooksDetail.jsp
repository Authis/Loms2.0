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
  
    
 <h3>Book Title:  <s:property value="bookBean.bookTitleIN"/>  </h3>
 
  
 <fieldset>
   <legend>Book Detail</legend>
 <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 <tr>
		<td>Book Rack No:<span class="mandi">*</span></td>
		<td><s:property value="bookBean.bookRackNoIN" />  </td>
	</tr> 
 
	<tr>
		<td>Book Row No:<span class="mandi">*</span></td>
		<td><s:property value="bookBean.bookRowNoIN" /></td>
	</tr>
	<tr>
		<td>Book Position:</td>
		<td><s:property value="bookBean.bookNoIN" />
		 </td>
	</tr> 
	
	<tr>
		<td>Book Status:</td>
		<td><s:property value="bookBean.bookStatusIN" />
		 </td>
	</tr> 
	
	<tr>
		<td>Book Author:<span class="mandi">*</span></td>
		<td><s:property value="bookBean.bookAuthorIN"/></td>
	</tr>
	<tr>
		<td>Book Co-Author:</td>
		<td><s:property value="bookBean.bookCoAuthorIN" />  </td>
	</tr>
	<tr>
		<td>Book Subject:<span class="mandi">*</span></td>
		<td><s:property value="bookBean.bookSubjectIN" />  </td>
	</tr>
	<tr>
		<td>Book Type:</td>
		<td><s:property value="bookBean.bookTypeIN" />  </td>
	</tr>
	<tr>
		<td>Book Year:</td>
		<td><s:property value="bookBean.bookYearIN" />  </td>
	</tr>
    <tr>
		<td>Book Publisher:</td>
		<td><s:property value="bookBean.bookPublisherIN"/>  </td>
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