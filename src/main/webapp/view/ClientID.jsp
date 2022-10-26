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
		 document.getElementById("hidclientid").value = document.getElementById("hidclientid"+x).value;
		 document.getElementById("hidname").value = document.getElementById("hidfirstname"+x).value+" "+document.getElementById("hidlastname"+x).value;
		 
		 
	 }
       
    }
   } 
 function selOneUpdate(formname){
	 var value = document.searchclient.val.value;
	 
	 if(document.getElementById(formname)){	 	
		 if(value == ""){ /* Only if page is Add/Edit Case*/
		 
 	    opener.document.addcaseinfofrm.txtClientId.value = document.searchclient.hidclientid.value;		
 	   opener.document.addcaseinfofrm.txtName.value = document.searchclient.hidname.value;	
		 }
 	   if( value == "income" && value != ""){  /* Only if page is Add Income/Exp*/
 		  opener.document.addcaseinfofrm.txtClientId.value = document.searchclient.hidclientid.value;		
 	 	   opener.document.addcaseinfofrm.txtName.value = document.searchclient.hidname.value;	
 		  
 	    opener.document.addcaseinfofrm.txtCaseId.value = "";
 	   opener.document.addcaseinfofrm.txttype.value = "";
	    }
 	  if(value == "faminfo" && value != ""){  /* Only if page is Add Family Info menu link*/ 	 
 		 
 	 	   opener.document.addfaminfo.txtClientId.value = document.searchclient.hidclientid.value;		
 	 	   opener.document.addfaminfo.txtName.value = document.searchclient.hidname.value;	
 		    }
 	  if(value == "casehear" && value != ""){  /* Only if page is Add Family Info menu link*/ 	 
  		 
	 	   opener.document.addcasehearinfrm.txtClientId.value = document.searchclient.hidclientid.value;		
	 	   opener.document.addcasehearinfrm.txtName.value = document.searchclient.hidname.value;	
	 	   
	 	   opener.document.addcasehearinfrm.txtCaseId.value = "";
	 	   opener.document.addcasehearinfrm.txttype.value = "";
		    }
 	 
 	 if(value == "casedoc" && value != ""){  /* Only if page is Add Document menu link*/ 	 
  		 
	 	  // opener.document.addCaseDocumentFrm.txtClientID.value = document.searchclient.hidclientid.value;		
	 	  // opener.document.addCaseDocumentFrm.txtClientName.value = document.searchclient.hidname.value;
	 	   opener.document.getElementById("txtClientID").value = document.searchclient.hidclientid.value;		
	 	   opener.document.getElementById("txtClientName").value = document.searchclient.hidname.value;
	 	   
	  
	 	  //opener.document.addCaseDocumentFrm.txtCaseID.value = "";
	 	 //  opener.document.addCaseDocumentFrm.txtCaseName.value = "";
	 	  opener.document.getElementById("txtCaseID").value = "";
	 	  opener.document.getElementById("txtCaseName").value = "";
  		
		    }
 	 if(value == "searchincome" && value != ""){  /* Only if page is Search income exp menu link*/ 	 
  		 
	 	   opener.document.mngexpdet.txtClientId.value = document.searchclient.hidclientid.value;
	 	  opener.document.mngexpdet.txtClientId.focus(); // Added for Clear remaining fields in Search Incme page 
	 	   opener.document.mngexpdet.txtCaseId.value = "";  
		
	 }
 	if(value == "searchcase" && value != ""){  /* Only if page is Add Document menu link*/ 	 
 		 
	 	   opener.document.mngcasefrm.txtClientId.value = document.searchclient.hidclientid.value;		
	  
	 	  opener.document.mngcasefrm.txtCaseId.value = "";
		
		    } 
 	
	 if(value == "searchclient" && value != ""){  /* Only if page is Search income exp menu link*/ 	 
  		 
	 	   opener.document.mngclient.txtClientID.value = document.searchclient.hidclientid.value; 
	 }
 	
 	 if(value == "searchclientdoc" && value != ""){  /* Only if page is Search income exp menu link*/ 	 
  		 
	 	   opener.document.mngcasedocfrm.txtClientId.value = document.searchclient.hidclientid.value; 
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
 <form id="searchclient" name="searchclient" action="searchresultClientCase.action" >
  <s:hidden name="hidclientid" id="hidclientid" />
    <s:hidden name="hidname" id="hidname" />
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
			<th align="center">Client ID</th>
			<th align="center">Name</th>
		
		</tr>
		</thead>
		<s:if test="%{retvaladdClientBean.size >= 1}">
			<s:iterator id="listval" value="retvaladdClientBean" status="stat">
			<tr class="row<s:property value="#stat.index % 2"/>" >
			<td align="left" ><input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();"/></td> 
			<td align="left"><s:hidden id="hidclientid%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].clientid}"></s:hidden> 
							<s:hidden id="hidfirstname%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].firstname}"></s:hidden>
							<s:hidden id="hidlastname%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].lastname}"></s:hidden>
							<s:property value="retvaladdClientBean[#stat.index].clientid"  /></td>				
			<td align="left"><s:property value="retvaladdClientBean[#stat.index].firstname"  />
			   <s:property value="retvaladdClientBean[#stat.index].lastname"  /> </td>
			
			</tr>
			</s:iterator>			
		 <tr>
			<td align="center">&nbsp;</td> 
			<td align="center">
			<input type="button" name="groovybtn1" class="groovybutton" value="Select ID" onclick="javascript:selOneUpdate('searchclient');" />
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