<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script language="javascript" type="text/javascript"
	src="/loms/view/js/rakshaval.js"></script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
	function onclickaction(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
			document.getElementById(formname).action = "";
		}
	}

	function getclientId() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {

			if (document.getElementById("cltCheckVal" + x).checked == true) {
				document.getElementById("hidcaseid").value = document.getElementById("hidcaseid" + x).value;
				 

			}
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				document.getElementById("hidclientid").value = document.getElementById("hidclientid" + x).value;

			}
			
		}
		// alert(document.getElementById("hidclientid").value +"--"+ document.getElementById("hidcaseid").value);
	}
	
	 /*function getlinkCaseId(val){
		 alert(val);
		 document.getElementById("hidcaseid").value = val; 
		 
		 
	 }*/
	function selOneCaseInfo() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('mngcasefrm', 'editCaseInfo.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}

	}

	function selOneCaseDoc() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('mngcasefrm', 'addcasedoc.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}

	}
	function selOneCaseHear() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('mngcasefrm', 'addcaseHear.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}

	}

	function selOneSearchCaseHear() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('mngcasefrm', 'searchCaseHearing.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}

	}
	
	function selOneSearchCaseopp(){
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('mngcasefrm', 'searchCaseOpp.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}
		
	}
	function selOneCaseAddOpp(){
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('mngcasefrm', 'addCaseOpp.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}
		
	}
	
	function selOneDelCase(){
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
 		  
			if(confirm("Are you sure you want to delete the record?")){
				onclickaction('mngcasefrm', 'delCaseInfo.action');
				document.getElementById("selectOne").style.display = "none";
			}
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}
		
	}
	 function viewCaseInfo(val){
		 
		 var url = "viewCaseInfo.action?hidcaseid="+val;
			window
					.open(url, "_blank",
							'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
			 
	 }
	 
	 function searchClientID(val) {

			var url = "searchClientID.action?val="+val;
			window
					.open(url, "_blank",
							'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

			// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
		}
		
	 function searchCourtID(val){
			var url = "searchCourtID.action?val="+val;
		 
			window
					.open(url, "_blank",
							'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes'); 
			
		}
	function searchCaseID(){
		 document.getElementById("hidclientid").value = document.getElementById("txtClientId").value;	  
		 var url = "searchCaseID.action?hidclientid="+document.getElementById("hidclientid").value;
			window.open(url, "_blank",
							'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');
	}
	
	  
	 function viewClientInfo(val){
	 
		 var url = "viewClientInfo.action?hidclientid="+val;
			window
					.open(url, "_blank",
							'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
	 }
	 
	 function remAll(par){
		 
		 if(par == '1'){		 
			
			 document.getElementById("txtOsNo").value = "";
			 document.getElementById("txtIaNo").value = "";
			 document.getElementById("txtCaseId").value = "";
			 document.getElementById("txtFname").value = "";
			 document.getElementById("txtLname").value = "";
			 document.getElementById("txtMobileNo").value = "";
			 document.getElementById("txtEmailID").value = "";
			 document.getElementById("txtCourtDetails").value = "";
		 }
		 
		 if(par == '2'){		 
			 document.getElementById("txtClientId").value = "";
 			 document.getElementById("txtIaNo").value = "";
			 document.getElementById("txtCaseId").value = "";
			 document.getElementById("txtFname").value = "";
			 document.getElementById("txtLname").value = "";
			 document.getElementById("txtMobileNo").value = "";
			 document.getElementById("txtEmailID").value = "";
			 document.getElementById("txtCourtDetails").value = "";
		 }
		 if(par == '3'){		 
			 document.getElementById("txtClientId").value = "";
			 document.getElementById("txtOsNo").value = "";
 			 document.getElementById("txtCaseId").value = "";
			 document.getElementById("txtFname").value = "";
			 document.getElementById("txtLname").value = "";
			 document.getElementById("txtMobileNo").value = "";
			 document.getElementById("txtEmailID").value = "";
			 document.getElementById("txtCourtDetails").value = "";
		 }
		 if(par == '4'){		 
			 document.getElementById("txtClientId").value = "";
			 document.getElementById("txtOsNo").value = "";
			 document.getElementById("txtIaNo").value = "";
 			 document.getElementById("txtFname").value = "";
			 document.getElementById("txtLname").value = "";
			 document.getElementById("txtMobileNo").value = "";
			 document.getElementById("txtEmailID").value = "";
			 document.getElementById("txtCourtDetails").value = "";
		 }
		 if(par == '5'){		 
			 document.getElementById("txtClientId").value = "";
			 document.getElementById("txtOsNo").value = "";
			 document.getElementById("txtIaNo").value = "";
			 document.getElementById("txtCaseId").value = "";
 			 document.getElementById("txtLname").value = "";
			 document.getElementById("txtMobileNo").value = "";
			 document.getElementById("txtEmailID").value = "";
			 document.getElementById("txtCourtDetails").value = "";
		 }
		 if(par == '6'){		 
			 document.getElementById("txtClientId").value = "";
			 document.getElementById("txtOsNo").value = "";
			 document.getElementById("txtIaNo").value = "";
			 document.getElementById("txtCaseId").value = "";
			 document.getElementById("txtFname").value = "";
 			 document.getElementById("txtMobileNo").value = "";
			 document.getElementById("txtEmailID").value = "";
			 document.getElementById("txtCourtDetails").value = "";
		 }
		 if(par == '7'){		 
			 document.getElementById("txtClientId").value = "";
			 document.getElementById("txtOsNo").value = "";
			 document.getElementById("txtIaNo").value = "";
			 document.getElementById("txtCaseId").value = "";
			 document.getElementById("txtFname").value = "";
			 document.getElementById("txtLname").value = "";
 			 document.getElementById("txtEmailID").value = "";
			 document.getElementById("txtCourtDetails").value = "";
		 }
		 if(par == '8'){		 
			 document.getElementById("txtClientId").value = "";
			 document.getElementById("txtOsNo").value = "";
			 document.getElementById("txtIaNo").value = "";
			 document.getElementById("txtCaseId").value = "";
			 document.getElementById("txtFname").value = "";
			 document.getElementById("txtLname").value = "";
			 document.getElementById("txtMobileNo").value = "";
 			 document.getElementById("txtCourtDetails").value = "";
		 }
		 if(par == '9'){		 
			 document.getElementById("txtClientId").value = "";
			 document.getElementById("txtOsNo").value = "";
			 document.getElementById("txtIaNo").value = "";
			 document.getElementById("txtCaseId").value = "";
			 document.getElementById("txtFname").value = "";
			 document.getElementById("txtLname").value = "";
			 document.getElementById("txtMobileNo").value = "";
			 document.getElementById("txtEmailID").value = "";
 		 }
		 
	 }
	 function downloadFile(){
		 onclickaction('mngcasefrm','downloadCaseFile.action');
		 
	 }
</script>
<style type="text/css">
.row0 {
	background-color: #FFFFFF;
}

.row1 {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
<form id="mngcasefrm" name="mngcasefrm" method="post" action="searchCaseInforesult.action">
	<input type="hidden" name="hidcaseid" id="hidcaseid" />
	<input type="hidden" name="hidclientid" id="hidclientid" /> 	   
	<jsp:include page="topHeader.jsp" />
	 
	  
	 
<div id="content">
<!--  <h3>Manage Case Information</h3>-->
<!--  <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Case Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('mngcasefrm','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Manage Case Information</p> 
 <a href="#" onclick="javascript:onclickaction('mngcasefrm','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Case Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>
       
    <table border="0" align="center" width="100%" height="100%"	cellspacing="5" cellpadding="5" class="user_max_input">
		<tr>
			<td colspan="6">
			  <div style="display: none;" id="selectOne">
			    <table>
				  <tr>
					 <td>
						<ul class="TickList">
							<li><font color="blue">Please Select atleast one record</font></li>
						</ul>
					</td>
				 </tr>
			   </table>
			 </div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
			<div id="mngcasefrm_errorloc" class="error_strings"></div>
			</td>
		</tr>
	    <tr>	
		     <td>Client ID:</td>
			 <td  nowrap="nowrap"><s:textfield theme="simple"
				name="searchCaseInfoBean.clientid" id="txtClientId" maxlength="8"></s:textfield>
				<a onclick="javascript:searchClientID('searchcase');"><img
				src="/loms/view/images/Search.png" width="25" height="20"
				alt="Search Client ID"  onclick="javascript:remAll('1');"/></a> 
				</td>     
	
			 <td  nowrap="nowrap">Case Type:</td>
			 <td  nowrap="nowrap">
			   <s:textfield theme="simple" name="searchCaseInfoBean.caseType"	id="txtOsNo" onclick="javascript:remAll('2');"></s:textfield>
			 </td>
			 <td  nowrap="nowrap">Case No:</td>
			 <td  nowrap="nowrap">
			   <s:textfield theme="simple" name="searchCaseInfoBean.caseNo" id="txtIaNo" onclick="javascript:remAll('3');"></s:textfield>
		     </td>
	  </tr>	
	  <tr>
		<td>Case ID:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.caseid" maxlength="15"
			id="txtCaseId" onclick="javascript:remAll('4');"></s:textfield>
		</td>
		<td>First Name:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.fname"
			id="txtFname" onclick="javascript:remAll('5');"></s:textfield></td>
		<td>Last Name:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.lname"
			id="txtLname" onclick="javascript:remAll('6');"></s:textfield></td> 
	</tr>	
	<tr> 
		<td>Mobile No:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.mobileno"
			id="txtMobileNo" onclick="javascript:remAll('7');"></s:textfield></td>
		<td>Email Id:</td>
		<td><s:textfield theme="simple" name="searchCaseInfoBean.emailId"
			id="txtEmailID" onclick="javascript:remAll('8');"></s:textfield></td>
		<td>Court Id:</td>
		<td> <s:textfield theme="simple" name="searchCaseInfoBean.courtId"
					id="txtCourtDetails" readonly="true"/> <a
					onclick="javascript:searchCourtID('mngCase');"><img
					src="/loms/view/images/Search.png" width="25" height="20"
					alt="Search Client ID"  onclick="javascript:remAll('9');"/></a>					
	     </td>
		 
		 
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><input type="submit" name="groovybtn1" class="groovybutton"
			value="Search" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<s:if test="%{searchPageVar=='value'}">
	<div id="search_result">
	<table width="100%" >
   <tr> 
      <td align="left"><p>Search Result</p> </td>
      <s:if test="%{retCaseSearchResult.size >= 1}">
      <td align="center"> Download as XLS
					<a href="#"  onclick="javascript:downloadFile();"><img src="/loms/view/img/Download-icon.png" width="24px" height="24px" border="0" alt="Download as XLS" /> </a>
					
	  </td>
	  </s:if>
  </tr>
</table>
	</div>
 <div id="fake-scroll-container" align=center> 
	 <div id="header-container">
		   <table border="0" width="120%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-header" >	 
				<tr>
					<th style="width : 27px;" align="center">&nbsp;</th>
					<th align="center">Case ID</th>
					<th align="center">Client ID</th>
					<th align="center">Client Info</th>			 
					<th align="center">Case Type</th>
					<th  align="center">Prime Case No</th>
					<th  align="center">Ref Case No</th>
					<th align="center" nowrap>Court Details</th>
				    <th  align="center" nowrap>Case Status</th>
				</tr>	 
			</table>
    </div>
    <div id="scroll">
		<s:if test="%{retCaseSearchResult.size >= 1}">
		<!--   <div style="width:100%;height:250px;overflow:auto;" class="data_grid"> -->
			<table border="0" width="100%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-body">
				<s:iterator id="listval" value="retCaseSearchResult" status="stat">
					<tr class="row<s:property value="#stat.index % 2"/>">
						<td style="width : 20px;" align="center">
						  <input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();" />
					    </td>
						<td width="8%" align="center">					
						   <s:hidden id="hidcaseid%{#stat.index}" value="%{retCaseSearchResult[#stat.index].CaseId}"/> 
						   <s:hidden id="hidclientid%{#stat.index}"	value="%{retCaseSearchResult[#stat.index].ClientId}"/> 
						   <a href="#" name="cltLnkVal" id="<s:property value="retCaseSearchResult[#stat.index].CaseId"  />"	
						      onclick="javascript:viewCaseInfo(this.id);">						
						      <u> <s:property value="retCaseSearchResult[#stat.index].CaseId" /></u>
						   </a>
					    </td>					 
						<td width="8%" >						 
							<a href="#" name="cltLnkVal" id="<s:property value="retCaseSearchResult[#stat.index].ClientId"  />" 
							onclick="javascript:viewClientInfo(this.id);" >
							<u><s:property value="retCaseSearchResult[#stat.index].ClientId" /></u></a>
						</td> 					
						<td width="15%" align="center"><s:property value="retCaseSearchResult[#stat.index].ClientInfo" /></td>					 
						<td width="15%" align="center"><s:property value="retCaseSearchResult[#stat.index].CaseType" /></td>
						<td width="15%" align="center"><s:property value="retCaseSearchResult[#stat.index].PrimeCaseNo" /></td>
						<td width="15%" align="center"><s:property value="retCaseSearchResult[#stat.index].RefCaseNo" /></td>
						<td width="15%" align="center"><s:property value="retCaseSearchResult[#stat.index].CourtDetails" /></td>
						<td width="8%" align="center"><s:property value="retCaseSearchResult[#stat.index].CaseStatus" /></td>
	
					</tr>
				</s:iterator>			
		  </table>		 
	    
		</s:if>
		<s:if test="%{retCaseSearchResult.size==0}">
			<table border="0" width="100%" class="grid" cellpadding="0"
		cellspacing="0" border="0">
			<tr>
				<td >&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td >&nbsp;</td>
				<td align="center" class="success">No Record has been
				returned for the above search criteria.</td>
			</tr>
			<tr>
				<td >&nbsp;</td>
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
	 <s:if test="%{retCaseSearchResult.size >= 1}">
	   <table border="0" width="100%" class="grid" cellpadding="0"	cellspacing="0" border="0">		 
			<tr>
			 
				<td align="center" colspan="4" nowrap="nowrap">
				<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				<input type="button" name="groovybtn1" class="groovybutton" value="Edit Case Info" onclick="javascript:selOneCaseInfo();" /> 
				</s:if>
				
				<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				<input type="button" name="groovybtn1" class="groovybutton" value="Add Document" onclick="javascript:selOneCaseDoc();" /> 
				</s:if>
				
				<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				<input type="button" name="groovybtn1" class="groovybutton" value="Add Hearing" onclick="javascript:selOneCaseHear();" />
				</s:if>
				
				<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				<input type="button" name="groovybtn1" class="groovybutton" value="Add Opponent" onclick="javascript:selOneCaseAddOpp();" /> 
				</s:if>
				
				<input type="button" name="groovybtn1" class="groovybutton" value="Search Case Hearing" onclick="javascript:selOneSearchCaseHear();" />
				<input type="button" name="groovybtn1" class="groovybutton" value="Search Opponent"	onclick="javascript:selOneSearchCaseopp();" />
				<s:if test="%{retEmpType=='GOD'}">
				<input type="button" name="groovybtn1" class="groovybutton" value="Delete" onclick="javascript:selOneDelCase();" />
				</s:if>
				
				</td>
 
				<td>&nbsp;</td>
			</tr>
			
			</table>
			</s:if>
</s:if>
 </div>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("mngcasefrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("txtClientId", "alpha_num",
			"Client ID can contain alphanumeric only");
	frmvalidator.addValidation("txtFname", "alpha_num",
			"First Name can contain only alphabets");
	frmvalidator.addValidation("txtLname", "alpha_num",
			"Last Name can contain only alphabets");
	frmvalidator.addValidation("txtMobileNo", "alpha_num",
			"Mobile No can contain numeric chars only");

	frmvalidator.addValidation("txtCaseId", "alpha_num",
			"Case ID can contain alphanumeric only");
	frmvalidator.addValidation("txtOsNo", "alpha_num",
			"OS No can contain alphabetic chars only");
	frmvalidator.addValidation("txtIaNo", "alpha_num",
			"IA No can contain alphabetic chars only");
	frmvalidator.addValidation("txtEpNo", "alpha_num",
			"EP No can contain alphanumeric chars only");
	frmvalidator.addValidation("txtEaNo", "alpha_num",
			"EA No can contain alphanumeric chars only");
	frmvalidator.addValidation("txtAsNo", "alpha_num",
			"AS No can contain alphanumeric chars only");

	//
</script>
</form>
<jsp:include page="Footer.jsp" />
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
