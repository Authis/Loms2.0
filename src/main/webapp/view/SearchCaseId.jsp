<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/printfriendly.css" ></link>
   
 
<link rel="stylesheet" href="/loms/view/css/calendar.css" />
<script>
 function getclientId(){
 var i = document.getElementsByName("cltChkVal").length;
 for (var x=0;x<i;x++){
	 
	 if(document.getElementById("cltCheckVal"+x).checked == true){
		 document.getElementById("hidcaseid").value = document.getElementById("hidcaseid"+x).value;
		 //document.getElementById("hidname").value = document.getElementById("hidfirstname"+x).value+" "+document.getElementById("hidlastname"+x).value;
		 
		 
	 }
       
    }
   } 
 function selOneUpdate(formname){
	 var value = document.searchcaseInd.val.value;
 
	 if(document.getElementById(formname)){	
		 
	 	 if(value == "searchincome" && value != ""){  /* Only if page is Search income exp menu link*/ 	 
	  		 
		 	   opener.document.mngexpdet.txtCaseId.value = document.searchcaseInd.hidcaseid.value;
		 	   //opener.document.mngexpdet.txtCaseId.value = "";
		 	  opener.document.mngexpdet.txtCaseId.focus(); // Added for Clear remaining fields in Search Incme page 
			
		 }	 
  		window.close();
 		 
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
 <form id="searchcaseInd" name="searchcaseInd" action="searchresultIndCaseId.action" >
  <s:hidden name="hidcaseid" id="hidcaseid" />
    <s:hidden name="hidname" id="hidname" />
      <s:hidden name="val" id="val" />
  
<div id="content" >
<h3>Manage Case </h3>
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
	    <td  nowrap="nowrap">Case Type:</td>
		<td  nowrap="nowrap"><s:textfield theme="simple" name="searchCaseInfoBean.caseType"
			id="txtOsNo"></s:textfield></td>

		<td>First Name:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.fname"
			id="txtFname"></s:textfield></td>

		<td>Last Name:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.lname"
			id="txtLname"></s:textfield></td>




	</tr>
	
	<tr> 
		<td>Mobile No:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.mobileno"
			id="txtEaNo"></s:textfield></td>


		<td>Email Id:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.emailId"
			id="txtAsNo"></s:textfield></td>

		<td>Court Id:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.courtId"
			id="txtCrmpNo"></s:textfield></td>
		<td></td> 
	</tr>
	
		
	<tr> 
		<td>Case No:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.caseNo"
			id="txtEaNo"></s:textfield></td>
 
		 
	</tr>
<tr>
<td >&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="groovybtn1" class="groovybutton" value="Search Record" /></td>
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
			<th align="center">Case ID</th>
			<th align="center">Case Type</th>
		
		</tr>
		</thead>
		<s:if test="%{retAddCaseBean.size >= 1}">
		
			<s:iterator id="listval" value="retAddCaseBean" status="stat">
			<tr class="row<s:property value="#stat.index % 2"/>" >
			<td align="left" ><input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();"/></td> 
			<td align="left"><s:hidden id="hidcaseid%{#stat.index}"  value="%{retAddCaseBean[#stat.index].caseid}"></s:hidden> 
							<s:hidden id="hidtype%{#stat.index}"  value="%{retAddCaseBean[#stat.index].casetype}"></s:hidden>							 
							<s:property value="retAddCaseBean[#stat.index].caseid"  /></td>				
			<td align="left"><s:property value="retAddCaseBean[#stat.index].casetype"  />
			    
			
			</tr>
			</s:iterator>			
		 <tr>
			<td align="center">&nbsp;</td> 
			<td align="center">
			<input type="button" name="groovybtn1" class="groovybutton" value="Select ID" onclick="javascript:selOneUpdate('searchcaseInd');" />
			</td>
			<td align="center">&nbsp;</td> 
		</tr>
		</s:if>
		<s:if test="%{retAddCaseBean.size==0}">
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