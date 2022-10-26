<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
 function searchval(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
 function onclickaction(formname,actionname){
	 if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
 
 var fieldName='cltChkVal';
 function getRemId(){
 var i = document.getElementsByName("cltChkVal").length;
 for (var x=0;x<i;x++){
	 
	 if(document.getElementById("cltCheckVal"+x).checked == true){
		 document.getElementById("hidreminderid").value = document.getElementById("hidreminderid"+x).value;
		 
	 }

   } 
 }
 
 function selOneDelete(){
	 var i = document.getElementsByName("cltChkVal").length;
	 for (var x=0;x<i;x++){		 
		 if(document.getElementById("cltCheckVal"+x).checked == true){
			 chk = 2;	
			 break;	
		 }else{			 		 	
			 chk = 1;	
		 }
	 } 
	 if(chk == 2){
		 if(confirm("Are you sure you want to delete the record?")){
		 onclickaction('mngreminder','delReminder.action');
		 document.getElementById("selectOne").style.display="none";
		 }
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
	 
 }
 
 
 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>
<body onload="javasript:">
<form id="mngreminder" name="mngreminder" method="post">
 <s:hidden name="hidreminderid" id="hidreminderid" />
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;">

</div>
<div id="content" >
<!--<h3>Manage Reminder</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Reminder Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--          -->
<!--         <a href="#" onclick="javascript:onclickaction('mngreminder','reminderManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Reminder Management.png"  width="40" height="40"  /></div>
<p class="title">Manage Reminder</p> 
 <a href="#" onclick="javascript:onclickaction('mngreminder','reminderManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Reminder Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 


<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
<tr>
 <td>
	<div style="display: none;" id="selectOne">
		 <table><tr><td>		 
			<ul class="TickList"><li><font color="blue">Please Select atleast one record</font></li></ul>
		 </td></tr></table>
	</div>
</td>
</tr>
<tr> 
	<td><div id="mngclient_errorloc" class="error_strings"></div></td>
	<td align="right"> </td>
	<td align="right"></td>
 
</tr>
 
<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
<s:if test="%{searchPageVar=='value'}">
<div id="search_result">
<p>Search Result</p>
 </div>
<div id="fake-scroll-container" align="center"> 
	 <div id="header-container">
		   <table border="0" width="120%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-header" >
				<tr>
					<th style="width : 27px;"  align="center"></th>
					<th width="10%" align="center">Reminder ID</th>
					<th width="10%" align="center">Reminder Type</th>
					<th width="10%" align="center">Subject</th>
					<th width="10%" align="center">Location</th>
					<th width="10%" align="center">Date</th>
					<th width="10%" align="center">Time</th>		
				</tr>
          </table>
     </div>
     <div id="scroll">
		<s:if test="%{retReminderBean.size >= 1}">
		<!--  <div style="width:100%;height:250px;overflow:auto;" class="data_grid">  -->
	     <table border="0" width="100%" class="grid" cellpadding="1" cellspacing="1" border="0" id="table-body">
			<s:iterator id="listval" value="retReminderBean" status="stat">
			<tr class="row<s:property value="#stat.index % 2"/>" >
			<td style="width : 20px;"  align="center" ><input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getRemId();"/></td> 
			<td width="10%"><s:hidden id="hidreminderid%{#stat.index}"  value="%{retReminderBean[#stat.index].reminderid}"></s:hidden> <s:property value="retReminderBean[#stat.index].reminderid"  /></td>				
			<td width="10%"><s:property value="retReminderBean[#stat.index].remindertype"  /></td>
			<td width="10%"><s:property value="retReminderBean[#stat.index].remindersubject" /> </td>
			<td width="10%"><s:property value="retReminderBean[#stat.index].reminderlocn"  /></td>
			<td width="10%"><s:property value="retReminderBean[#stat.index].reminderdate"  /></td>		
	        <td width="10%"><s:property value="retReminderBean[#stat.index].remindertime"  /></td>	
			</tr>
			</s:iterator>
		 </table>
	   </s:if> 
		<s:if test="%{retReminderBean.size==0}">
			<table border="0" width="100%" class="grid" cellpadding="0"	cellspacing="0" border="0">
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			
				<td align="center" colspan="3" class="success">No reminder(s) found.</td>
					<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</table>
		
		</s:if>	 
		</div>

        <div id="y-fake-scroll">
		<div id="y-table-emulator" style="width:40px;">
		&nbsp;
		</div>
		</div>
		
		<div id="x-fake-scroll">
		<div id="x-table-emulator">
		&nbsp;
		</div>
		</div> 
	 </div>
<s:if test="%{retReminderBean.size >= 1}">

	 <table border="0" width="100%" class="grid" cellpadding="0" cellspacing="0" border="0">
				<tr>
					 
					<td colspan="2" align="center">
					<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
					<input type="button" name="groovybtn1" class="groovybutton" value="Delete" onclick="javascript:selOneDelete();" />
					</s:if>
				</tr>
	 </table>
 
 
 	</s:if>
	</s:if>
	</div>
 
  <jsp:include page="Footer.jsp" />
 
</form>
 <script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("mngreminder");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
  frmvalidator.addValidation("txtClientID","alpha_num","Client ID can contain alphanumeric only");
  
  
//]]></script>
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
