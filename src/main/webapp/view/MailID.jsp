<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/printfriendly.css" ></link>
   
 
<link rel="stylesheet" href="/loms/view/css/calendar.css" />
<script>
  
 function selOneUpdate(){	
	 var value = document.searchclient.val.value;
	 
	 if(value == "selmail" && value != ""){	
	 opener.document.frmsendmail.txtTo.value = document.getElementById("hidmail").value;	
	 }else if(value == "selmobile" && value != ""){
	 
	 opener.document.frmsendsms.txtsendNo.value = document.getElementById("hidmobile").value;	
	 }
  		window.close(); 	
}
 
 function addmailids()
 {
	 var value = document.searchclient.val.value;
	if(value == "selmail" && value != ""){			
		 var chks = document.getElementsByName('cltChkVal');
		 var hasChecked = false;
		 var maiIds = new Array();
		 for (var i = 0; i < chks.length; i++)
		 {
			 if (chks[i].checked)
			 {
				 hasChecked = true;
				 maiIds.push(document.getElementById("hidmailid"+i).value);
			 }  
	     }	 
 	     document.getElementById("hidmail").value = maiIds;
	}else if(value == "selmobile" && value != ""){
		var chks = document.getElementsByName('cltChkVal');
		 var hasChecked = false;
		 var mobileNos = new Array();
		 for (var i = 0; i < chks.length; i++)
		 {
			 if (chks[i].checked)
			 {
				 hasChecked = true;
				 mobileNos.push(document.getElementById("hidMobileNo"+i).value);
			 }  
	     }	 
	     document.getElementById("hidmobile").value = mobileNos;
	}
 }
 
 
 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
<style type="text/css">
* { font-family: calibri; font-size: 97%; }
label { width: 10em; float: left; }
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
p { clear: both; }
.submit { margin-left: 12em; }
em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
</head>
<title>Loms</title>
<body bgcolor="#E0ECF8">
 <form id="searchclient" name="searchclient" action="searchresultmailCase.action" >
  <s:hidden name="hidmail" id="hidmail" />
    <s:hidden name="hidmobile" id="hidmobile" />        
   <s:hidden name="val" id="val" />
<div id="content" >
<h3>Manage Client </h3>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" height="100%" style="border-color: gray">
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
<tr>
	<td>Client ID:</td><td><s:textfield theme="simple" name="searchbean.clientId" id="txtClientID"> </s:textfield></td>
	<td>First Name: </td><td><s:textfield theme="simple" name="searchbean.firstName" id="txtFirstName">  </s:textfield></td>
	<td>Last Name: </td><td><s:textfield theme="simple" name="searchbean.lastName" id="txtLastName"> </s:textfield></td>	  
</tr> 
<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
<tr>
	<td>Mobile No: </td><td><s:textfield theme="simple" name="searchbean.mobNo" id="txtMobileNo"  maxlength="10"> </s:textfield></td>
	<td>PAN Number: </td><td><s:textfield theme="simple" name="searchbean.panNo" id="txtPanNo"> </s:textfield></td>
	<td>TIN Number: </td><td><s:textfield theme="simple" name="searchbean.tinNo" id="txtTinNo"> </s:textfield></td>
</tr>
<tr>
<td >&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="groovybtn1" class="groovybutton" value="Search Client" /></td>
 </tr>
<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
<s:if test="%{searchPageVar=='value'}">
<div id="search_result">
	<p>Search Result</p>
 </div>
	<table border="0" width="100%" class="grid" cellpadding="0"
		cellspacing="0" border="0">
		<thead>
			<tr>
		    <th align="center"></th>
			<th align="center">Client ID</th>
			<th align="center">Name</th>
			<th align="center">Mail ID</th>
		    <th align="center">Mobile No</th>
		</tr>
		</thead>
		<s:if test="%{retvaladdClientBean.size >= 1}">
			<s:iterator id="listval" value="retvaladdClientBean" status="stat">
			<tr class="row<s:property value="#stat.index % 2"/>" >
			<td align="left" ><input type="checkbox" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:addmailids();"/></td> 
			<td align="left"><s:hidden id="hidclientid%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].clientid}"></s:hidden> 
							<s:hidden id="hidfirstname%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].firstname}"></s:hidden>
							<s:hidden id="hidlastname%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].lastname}"></s:hidden>
							<s:property value="retvaladdClientBean[#stat.index].clientid"  /></td>				
			<td align="left"><s:property value="retvaladdClientBean[#stat.index].firstname"  />
			   <s:property value="retvaladdClientBean[#stat.index].lastname"  /> </td>
			   
			  <td> <s:property value="retvaladdClientBean[#stat.index].emailid"  />
			  <s:hidden id="hidmailid%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].emailid}"></s:hidden>  </td>
			  
			  <td> <s:property value="retvaladdClientBean[#stat.index].mobilenumber"  />
			  <s:hidden id="hidMobileNo%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].mobilenumber}"></s:hidden>  </td>
			</tr>
			</s:iterator>			
		 <tr>
			<td align="center">&nbsp;</td> 
			<td align="center">
			<input type="button" name="groovybtn1" class="groovybutton" value="Select Client ID " onclick="javascript:selOneUpdate();" />
			</td>
			<td align="center">&nbsp;</td> 
		</tr>
		</s:if>
		<s:if test="%{retvaladdClientBean.size==0}">
			<tr >
			  <td align="center">&nbsp;</td> 
			  <td align="center">&nbsp;</td>  
			  <td align="center">&nbsp;</td>  
			</tr>
			<tr >
			  <td align="center">&nbsp;</td> 
			  <td align="center" class="success" nowrap>No Record has been returned for the above search criteria.</td>  
			  <td align="center">&nbsp;</td> 
			</tr>
		 
		</s:if>	
	</table>
</s:if>

</div> 
</form>
</body>
</html>