<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script language="javascript" type="text/javascript"
	src="/loms/view/js/rakshaval.js"></script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script language="JavaScript" src="/loms/view/js/calendar_us.js"></script>
<link rel="stylesheet" href="/loms/view/css/calendar.css" />
	 <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
		
			myCalendar = new dhtmlXCalendarObject(["txtDateOfBirth"]);
		}
	</script>
<script>
  function updClintinfo(formname,actionname){
		 if(document.getElementById(formname)){		 
		 		document.getElementById(formname).action=actionname;		
		 		document.getElementById(formname).submit();			 
		 	}	
	 }
	 
 function gobackmain(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
}
 
 function popOnload(){
		if(document.getElementById("retClientID").value){
		//alert("Client Info has been Updated Successfully \nClient ID is "+document.getElementById("retClientID").value);
		document.getElementById("retClientID").value = "";
		}
	}
 function statusMsg(){
		
	 document.getElementById("statusMsg1").style.display = "none";
	 
}	
 </script>
</head>
<body
	onload="javascript:doOnLoad();popOnload();">
<form id="editclientinfo" name="editclientinfo"
	action="updSaveClinetInfo.action" method="post"
	onreset="return confirm('Do you want to reset the data?')">
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Update Client Information</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Edit Client Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('editclientinfo','clientManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Client Management.png"  width="40" height="40"  /></div>
<p class="title">Update Client Information</p> 
 <a href="#" onclick="javascript:onclickaction('editclientinfo','clientManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Edit Client Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>

<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
	<s:if test="%{retClientID != ''}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Client Info has been Updated Successfully
			Client ID is <s:property value="retClientID" id="retClientID" /> <s:hidden
				name="retClientID" id="retClientID" /></div>
				</div>
			</td>
		</tr>
	</s:if>
	<tr>
		<td colspan="4">
		<div id="editclientinfo_errorloc" class="error_strings"></div>
		</td>
		<td align="right"></td>
		<td align="right"></td>
		<td align="right"></td>
	</tr>
	<tr>
		<td>Client ID:</td>
		<td><s:property value="%{addClientBean.clientid}" /> <s:hidden
			name="addClientBean.clientid" id="txtClientId"
			value="%{addClientBean.clientid}">
		</s:hidden></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>


	<tr>
		<td>First Name:<font color="red">*</font></td>
		<td><s:textfield name="addClientBean.firstname" maxlength="50"
			value="%{addClientBean.firstname}" id="txtFirstName" theme="simple">
		</s:textfield></td>
		<td>Last Name:<font color="red">*</font></td>
		<td><s:textfield value="%{addClientBean.lastname}" maxlength="50"
			name="addClientBean.lastname" id="txtLastName" theme="simple">
		</s:textfield></td>
	</tr>

	<tr>
		<td>Telephone No:</td>
		<td><s:textfield value="%{addClientBean.telephoneno}" 
			maxlength="20" name="addClientBean.telephoneno" id="txtTelephoneNo"
			theme="simple"></s:textfield></td>
		<td>Mobile No:<font color="red">*</font></td>
		<td><s:textfield value="%{addClientBean.mobilenumber}"
			name="addClientBean.mobilenumber" id="txtMobileNumber" maxlength="20"
			theme="simple"></s:textfield></td>
	</tr>
	<tr>
		<td>Email ID:</td>
		<td><s:textfield value="%{addClientBean.emailid}"  maxlength="100"
			name="addClientBean.emailid" id="txtEmailId" theme="simple"></s:textfield>
		</td>
		<td>Gender:<font color="red">*</font></td>

		<td><s:select theme="simple" name="addClientBean.gender"
			value="%{addClientBean.gender}" id="flggender"
			headerValue="Please Select Gender" headerKey="" list="retGender"></s:select>
		</td>
	</tr>

	<tr>
		<td>Permanent Address:<font color="red">*</font></td>
		<td><s:textarea value="%{addClientBean.permanentaddress}"
			name="addClientBean.permanentaddress" id="txtPermanentAddress"
			theme="simple"></s:textarea></td>
		<td>Temporary Address:</td>
		<td><s:textarea value="%{addClientBean.temporaryaddress}"
			name="addClientBean.temporaryaddress" id="txtTemporaryAddress"
			theme="simple"></s:textarea></td>
	</tr>
	<tr>
		<td>Organization Name:</td>
		<td><s:textfield value="%{addClientBean.organizationname}" maxlength="100"
			name="addClientBean.organizationname" id="txtOrganizationName"
			theme="simple"></s:textfield></td>
		<td>Organization Address:</td>
		<td><s:textarea value="%{addClientBean.organizationaddress}"
			name="addClientBean.organizationaddress" id="txtOrganizationAddress"
			theme="simple"></s:textarea></td>
	</tr>
	<tr>
		<td>Organization Telephone No:</td>
		<td><s:textfield value="%{addClientBean.organizationtelephoneno}"
			maxlength="20" name="addClientBean.organizationtelephoneno"
			id="txtOrganizationTelephoneNo" theme="simple"></s:textfield></td>
		<td>Organization Mobile No:</td>
		<td><s:textfield value="%{addClientBean.organizationmobileno}"
			maxlength="20" name="addClientBean.organizationmobileno"
			id="txtOrganizationMobileNo" theme="simple"></s:textfield></td>
	</tr>
	<tr>
		<td>PAN Number:</td>
		<td><s:textfield value="%{addClientBean.pannumber}" maxlength="25" 
			name="addClientBean.pannumber" id="txtPanNumber" theme="simple"></s:textfield>
		</td>
		<td>TIN Number:</td>
		<td><s:textfield value="%{addClientBean.tinnumber}" maxlength="25" 
			name="addClientBean.tinnumber" id="txtTinNumber" theme="simple"></s:textfield>
		</td>
	</tr>
	<tr>
		<td>Profession:</td>
		<td><s:textfield value="%{addClientBean.profession}" maxlength="50" 
			name="addClientBean.profession" id="txtProfession" theme="simple"></s:textfield>
		</td>
		<td>Date of Birth:</td>
		<td><s:textfield value="%{addClientBean.dateofbirth}"
			name="addClientBean.dateofbirth" id="txtDateOfBirth" readonly="true" theme="simple"></s:textfield>
		</td>
	</tr>
	<tr>
		<td>Comments:</td>
		<td ><s:textarea value="%{addClientBean.comments}"
			name="addClientBean.comments" id="txtComments" theme="simple"></s:textarea></td>
			
		 
		<!--<td>Client's Photo:</td>
		<td ><s:file theme="simple"	name="filePath" id="txtfilePath" cssStyle="width: 200px;"  ></s:file> </td>   -->
			 
			

	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		 
		<td colspan="4" align="center"><input type="submit" name="groovybtn1"
			class="groovybutton" value="Save" onclick="javascrip:statusMsg();"/> <input type="reset"
			name="groovybtn1" class="groovybutton" value="Reset" /> <input
			type="button" name="groovybtn1" class="groovybutton" value="Back"
			onclick="javascript:gobackmain('editclientinfo','searchresult.action')" /></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
</div>
</div>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("editclientinfo");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
    frmvalidator.setAddnlValidationFunction(editClientDateChk);	 
    frmvalidator.addValidation("txtFirstName", "req","First Name cannot be blank");	 
	frmvalidator.addValidation("txtFirstName", "alpha_sp","First Name can contain only letters, spaces, hyphens and apostrophes (No spaces)");
	frmvalidator.addValidation("txtLastName", "req", "Last Name cannot be blank");	 
	frmvalidator.addValidation("txtLastName", "alpha_s","Last Name can contain only letters, spaces, hyphens and apostrophes");
	frmvalidator.addValidation("txtPermanentAddress", "req","Permanent Address cannot be blank"); 
	frmvalidator.addValidation("txtTelephoneNo", "num_s",	"Telephone No can contain only numbers(No spaces)"); 
	
	frmvalidator.addValidation("txtMobileNumber", "req","Mobile No cannot be blank");	
	frmvalidator.addValidation("txtMobileNumber", "num_s","Mobile No can contain only numbers(No spaces)");
	frmvalidator.addValidation("txtMobileNumber", "mobzero","Mobile No should be greater then Zero");
	frmvalidator.addValidation("txtMobileNumber", "minlen=10","Mobile No should contain a minimum of 10 digits");

	
	 
	frmvalidator.addValidation("txtEmailId", "email");
	frmvalidator.addValidation("flggender", "req", "Please select a Gender");	
	frmvalidator.addValidation("txtOrganizationAddress", "maxlen=500","Organization Address cannot exceed 500 characters"); 
	frmvalidator.addValidation("txtPermanentAddress", "maxlen=500","Permanent Address cannot exceed 500 characters"); 
	frmvalidator.addValidation("txtTemporaryAddress", "maxlen=500","Temporary Address cannot exceed 500 characters"); 
		 
	
	frmvalidator.addValidation("txtOrganizationTelephoneNo", "num_s","Organization Telephone No can contain only numbers(No spaces)"); 
	frmvalidator.addValidation("txtOrganizationTelephoneNo", "mobzero","Organization Telephone No should be greater then Zero");
	frmvalidator.addValidation("txtOrganizationTelephoneNo", "minlen=10","Organization Telephone No should contain a minimum of 10 digits");
	
	
	frmvalidator.addValidation("txtOrganizationMobileNo", "num_s","Organization Mobile No can contain only numbers(No spaces)");	
	frmvalidator.addValidation("txtOrganizationMobileNo", "mobzero","Organization Mobile No should be greater then Zero");
	frmvalidator.addValidation("txtOrganizationMobileNo", "minlen=10","Organization Mobile No should contain a minimum of 10 digits");
	
	
	frmvalidator.addValidation("txtPanNumber", "alpha_PANnum","PAN Number can contain only letters and numbers(No spaces)");
	frmvalidator.addValidation("txtProfession", "alpha_s","Profession can contain only letters,spaces, hyphens and apostrophes");
	frmvalidator.addValidation("txtDateOfBirth", "date");	
	frmvalidator.addValidation("txtPermanentAddress","alpha_addr","Permanent address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&), semi colon (;), colon (:) and period(.)");	
	frmvalidator.addValidation("txtTemporaryAddress","alpha_addr","Temporary address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&), semi colon (;), colon (:) and period(.)");	
	frmvalidator.addValidation("txtOrganizationAddress", "alpha_addr","Organization address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&), semi colon (;), colon (:) and period(.)");	
	frmvalidator.addValidation("txtTinNumber","alpha_tin","Tin No can contain only letters,numbers, hyphen(-) and slash(/)");
	
	frmvalidator.addValidation("txtComments", "maxlen=1000","Comment cannot exceed 1000 characters"); 
//]]></script>
</body>
</html>
