<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
 <title>Loms</title>
 
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script type="text/javascript" src="/loms/view/js/rakshaval.js"></script>
 
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
	
	 <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
		
			myCalendar = new dhtmlXCalendarObject(["txtDateOfBirth"]);
			
			/*document.getElementById("txtFirstName").value = "";
			document.getElementById("txtTelephoneNo").value = "";
			document.getElementById("txtEmailId").value = "";
			document.getElementById("txtpermanentaddress").value = "";
			document.getElementById("txtorganizationname").value = "";
			document.getElementById("txtorgtelephoneno").value = "";
			document.getElementById("txtPanNum").value = "";
			document.getElementById("txtProfession").value = "";
			document.getElementById("txtComments").value = "";
			document.getElementById("txtLastName").value = "";
			document.getElementById("txtMobileNumber").value = "";
			document.getElementById("flggender").value = "";
			document.getElementById("txttemporaryaddress").value = "";
			document.getElementById("txtorganizationaddress").value = "";
			document.getElementById("txtorgmobileno").value = "";
			document.getElementById("txtTinNum").value = "";
			document.getElementById("txtDateOfBirth").value = "";
			document.getElementById("txtfilePath").value = "";*/
			 
		}
	</script>
<script type="text/javascript">
 

	function addClientInfo(formname, actionname) {

		if (document.getElementById(formname)) {

			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();

		}
	}
	
	function goToAddCase(formname, actionname){
		if (document.getElementById(formname)) {		 
			 
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();

		}
		
	}
	
	function popOnload() {

		if (document.getElementById("retClientID").value) {
			//alert("Client Info has been added Successfully \nClient ID is "
					//+ document.getElementById("retClientID").value);
			//document.getElementById("retClientID").value = "";
		}
	}
	function resClientval(){
		 if(confirm("Do you want to reset the data?")){
		document.getElementById("txtFirstName").value = "";
		document.getElementById("txtTelephoneNo").value = "";
		document.getElementById("txtEmailId").value = "";
		document.getElementById("txtpermanentaddress").value = "";
		document.getElementById("txtorganizationname").value = "";
		document.getElementById("txtorgtelephoneno").value = "";
		document.getElementById("txtPanNum").value = "";
		document.getElementById("txtProfession").value = "";
		document.getElementById("txtComments").value = "";
		document.getElementById("txtLastName").value = "";
		document.getElementById("txtMobileNumber").value = "";
		document.getElementById("flggender").value = "";
		document.getElementById("txttemporaryaddress").value = "";
		document.getElementById("txtorganizationaddress").value = "";
		document.getElementById("txtorgmobileno").value = "";
		document.getElementById("txtTinNum").value = "";
		document.getElementById("txtDateOfBirth").value = "";
		document.getElementById("txtfilePath").value = "";
		 return true;
		   }else{
			   return false;
		   }
		
	}
	/*function playSound(audioURL) {
		if (document.all)
			document.all['BGSOUND_ID'].src = audioURL;
		else
			self.iplayer.location.replace('jsplayer.htm?' + audioURL);
	}*/
 function statusMsg(){
		 
		if(document.getElementById("statusMsg1")){
			 document.getElementById("statusMsg1").style.display = "none";
		  }else{
			 document.getElementById("statusMsg2").style.display = "none";
		  }
	}
	
	
	
</script>

</head>
<body  
	onload="javascript:doOnLoad();popOnload();">
<form name="addcltmgmtfrm" id="addcltmgmtfrm"
	action="addClientInfo.action" method="post" onreset="return confirm('Do you want to reset the data?')" enctype="multipart/form-data">

<jsp:include page="topHeader.jsp" />


<div style="padding:0px 10px; width:100%;">
 


<div id="content" >
<!-- -->
<!-- <h3 >Add Client Information</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add a client.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a> -->
<!--       <a href="#" onclick="javascript:onclickaction('addcltmgmtfrm','clientManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a></td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Client Management.png"  width="40" height="40"  /></div>
<p class="title">Add Client Information</p> 
 <a href="#" onclick="javascript:onclickaction('addcltmgmtfrm','clientManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add a client.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 
 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<table border="0" width="100%" style="border-color: gray">
	
	<s:if test="%{retClientID != '' && retClientID != 'E9999' && mailErrorStr == 'Sent' }">
		<tr>
			<td colspan="3">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Client Info has been added Successfully Client ID is <s:property value="retClientID" id="retClientID" />
			 <s:hidden	name="retClientID" id="retClientID" />
			 
			 <b><a href="#" onclick="javascript:goToAddCase('addcltmgmtfrm','newcase.action');" >Click here to Add Case</a></b>
			  </div>
			 
			 </div>
			</td>


		</tr>

	</s:if>
	<s:if test="%{retClientID != '' && retClientID != 'E9999' && mailErrorStr == 'notSent'}">
		<tr>
			<td colspan="3">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Client Info has been added Successfully Client ID is <s:property value="retClientID" id="retClientID" />  <s:hidden
				name="retClientID" id="retClientID" />				
				 <font color="red" >Note: Email has not been sent to the Client due to Internet Problem</font>
				<b><a href="#" onclick="javascript:goToAddCase('addcltmgmtfrm','newcase.action');" >Click here to Add Case</a></b>
				 </div>
			 </div>
			</td>


		</tr>

	</s:if> 
	
		<s:if test="%{retClientID != '' && retClientID != 'E9999' && mailErrorStr == ''}">
        <tr>
      
			<td colspan="4">
			 <div id="statusMsg2" style="display: inline;" >
				<div class="succ">Client Info has been added Successfully Client ID is <s:property value="retClientID" id="retClientID" /> 
				      <s:hidden name="retClientID" id="retClientID" /> 
				      <b><a href="#" onclick="javascript:goToAddCase('addcltmgmtfrm','newcase.action');" >Click here to Add Case</a></b>
			   </div>
				</div> 
			
			</td>
    
		</tr>
      
	</s:if>
	
	<s:if test="%{retClientID == 'E9999'}">
        <tr>
      
			<td colspan="4">
			  <div id="statusMsg2" style="display: inline;" >
			    <div class="err">Client Info has not been added Successfully. </div>
			</div>
			</td>
    
		</tr>
      
	</s:if>
 

		<tr>
			<td colspan="10">		 
			<div id="addcltmgmtfrm_errorloc" class="error_strings"></div>		 
			</td>
		</tr>

		<tr>
			<td style="width:50%">
				<table width="100%" cellpadding="10" cellspacing="10">
		
					<tr>
						<td nowrap><s:property value="%{getText('global.loginfirstname')}"/> :<span class="mandi">*</span></td>
				 
					
						<td nowrap><s:textfield theme="simple" maxlength="50"
							name="addClientBean.firstname" id="txtFirstName"
							cssStyle="width: 200px;" tabindex="1"/></td>
					</tr>
					<tr>
						<td>Telephone No:</td>
						<td><s:textfield theme="simple" 
							name="addClientBean.telephoneno" id="txtTelephoneNo" maxlength="20"
							cssStyle="width: 200px;" tabindex="3"/></td>
					</tr>
					<tr>
						<td>Email ID:</td>
						<td><s:textfield theme="simple" name="addClientBean.emailid" maxlength="100"
							id="txtEmailId" cssStyle="width: 200px;" tabindex="5"/></td>
					</tr>
					<tr>
						<td nowrap>Permanent Address:<span class="mandi">*</span></td>
						<td><s:textarea theme="simple"
							name="addClientBean.permanentaddress" id="txtpermanentaddress" 
							cssStyle="width: 200px;" tabindex="7"></s:textarea></td>
					</tr>
					<tr>
						<td nowrap>Organization Name:</td>
						<td><s:textfield theme="simple" maxlength="100"
							name="addClientBean.organizationname" id="txtorganizationname"
							cssStyle="width: 200px;" tabindex="9"/></td>
					</tr>
					<tr>
						<td nowrap>Organization Telephone No:</td>
						<td><s:textfield theme="simple"
							name="addClientBean.organizationtelephoneno" id="txtorgtelephoneno"
							maxlength="20" cssStyle="width: 200px;" tabindex="11"/></td>
					</tr>
					<tr>
						<td>PAN Number:</td>
						<td><s:textfield theme="simple" name="addClientBean.pannumber" maxLength="25"
							id="txtPanNum"  cssStyle="width: 200px;" tabindex="13"/></td>
					</tr>
					<tr>
						<td>Profession:</td>
						<td><s:textfield theme="simple" name="addClientBean.profession"
							id="txtProfession" maxlength="50" cssStyle="width: 200px;" tabindex="15"/></td>
					</tr>
					<tr>
						<td>Comments:</td>
						<td><s:textarea theme="simple" name="addClientBean.comments"
							id="txtComments" cssStyle="width: 200px;" tabindex="17"></s:textarea></td>
					</tr>
					
				</table>
			</td>			
			
			<td style="width:50%" valign="top">
				<table width="100%" cellpadding="10" cellspacing="10">
		
					<tr>
						<td nowrap>Last Name:<span class="mandi">*</span></td>
						<td><s:textfield theme="simple" name="addClientBean.lastname" maxlength="50"
							id="txtLastName" cssStyle="width: 200px;" tabindex="2"/></td>
					</tr>
					<tr>
						<td>Mobile No:<span class="mandi">*</span></td>
						<td><s:textfield theme="simple"
							name="addClientBean.mobilenumber" id="txtMobileNumber"
							maxlength="20" cssStyle="width: 200px;" tabindex="4" /></td>
					</tr>
					<tr>
						<td>Gender:<span class="mandi">*</span></td>
						<td><s:select theme="simple" name="addClientBean.gender"  id="flggender"
							headerValue="Select Gender" headerKey="" list="retGender"
							cssStyle="width:205px;" tabindex="6"></s:select></td>
					</tr>
					<tr>
						<td nowrap>Temporary Address:</td>
						<td><s:textarea theme="simple"
							name="addClientBean.temporaryaddress" id="txttemporaryaddress"
							cssStyle="width: 200px;" tabindex="8">
						</s:textarea></td>
					</tr>
					<tr>
						<td nowrap>Organization Address:</td>
						<td><s:textarea theme="simple"
							name="addClientBean.organizationaddress"
							id="txtorganizationaddress" cssStyle="width: 200px;" tabindex="10"></s:textarea></td>
					</tr>
					<tr>
						<td nowrap>Organization Mobile No:</td>
						<td><s:textfield theme="simple" maxLength="20"
							name="addClientBean.organizationmobileno" id="txtorgmobileno"
							  cssStyle="width: 200px;" tabindex="12"/></td>
					</tr>
					<tr>
						<td>TIN Number:</td>
						<td><s:textfield theme="simple" name="addClientBean.tinnumber"  maxLength="25"
							id="txtTinNum"  cssStyle="width: 200px;" tabindex="14"/></td>
					</tr>
					<tr>
						<td>Date of Birth:</td>
						<td ><s:textfield theme="simple" onkeydown="javascript:checkShortcut();"
							name="addClientBean.dateofbirth" id="txtDateOfBirth" readonly="true"
							cssStyle="width: 200px;"  tabindex="16"/> 
						 
						</td>
					</tr>
					<!--  <tr>
						<td>Client's Photo:</td>
						 <td><s:file name="fileUpload" label="Select a File to upload" size="40" id="fileUpload" tabindex="18"/></td>
					 
					</tr>-->
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					
				</table>
			</td>
		</tr>
		<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
		</tr>
		<tr>
											
					<td align="right">
						<input type="submit" name="groovybtn1" class="groovybutton" value="Add" onclick="javascript:statusMsg();" />
						 <input type="button" name="groovybtn1" class="groovybutton" value="Reset"  onclick="javascript:resClientval();" />
						 
	
						
					</td>					
					<td></td>
		</tr>
		 
</table>
</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("addcltmgmtfrm");
 
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	
	frmvalidator.setAddnlValidationFunction(addClientDateChk);
	frmvalidator.addValidation("txtFirstName", "req","First Name cannot be blank");	 
	frmvalidator.addValidation("txtFirstName", "alpha_sp","First Name can contain only letters, hyphens and apostrophes (No spaces)");
	frmvalidator.addValidation("txtLastName", "req", "Last Name cannot be blank");	 
	frmvalidator.addValidation("txtLastName", "alpha_s","Last Name can contain only letters, spaces, hyphens and apostrophes");
	frmvalidator.addValidation("txtpermanentaddress", "req","Permanent Address cannot be blank"); 
	frmvalidator.addValidation("txtTelephoneNo", "num_s",	"Telephone No can contain only numbers"); 
	frmvalidator.addValidation("txtMobileNumber", "req","Mobile No cannot be blank");
	frmvalidator.addValidation("txtMobileNumber", "num_s","Mobile No can contain only numbers(No spaces)");
	frmvalidator.addValidation("txtMobileNumber", "mobzero","Mobile No should be greater then Zero");
	frmvalidator.addValidation("txtMobileNumber", "minlen=10","Mobile No should contain a minimum of 10 digits");
 
	 
	frmvalidator.addValidation("txtEmailId", "email");
	frmvalidator.addValidation("flggender", "req", "Please select a Gender");	
	frmvalidator.addValidation("txtorganizationaddress", "maxlen=500","Organization Address cannot exceed 500 characters"); 
	frmvalidator.addValidation("txtpermanentaddress", "maxlen=500","Permanent Address cannot exceed 500 characters"); 
	frmvalidator.addValidation("txttemporaryaddress", "maxlen=500","Temporary Address cannot exceed 500 characters"); 

	
	frmvalidator.addValidation("txtorgtelephoneno", "num_s","Organization Telephone No can contain only numbers(No spaces)"); 
	frmvalidator.addValidation("txtorgtelephoneno", "mobzero","Organization Telephone No should be greater then Zero");
	frmvalidator.addValidation("txtorgtelephoneno", "minlen=10","Organization Telephone No should contain a minimum of 10 digits");
	
	frmvalidator.addValidation("txtorgmobileno", "num_s","Organization Mobile No can contain only numbers(No spaces)");
	frmvalidator.addValidation("txtorgmobileno", "mobzero","Organization Mobile No should be greater then Zero");
	frmvalidator.addValidation("txtorgmobileno", "minlen=10","Organization Mobile No should contain a minimum of 10 digits");
	
	
	frmvalidator.addValidation("txtPanNum", "alpha_PANnum","PAN Number can contain only letters and numbers(No spaces)");
	frmvalidator.addValidation("txtProfession", "alpha_s","Profession can contain only letters,spaces, hyphens and apostrophes");
	frmvalidator.addValidation("txtDateOfBirth", "date");	
	frmvalidator.addValidation("txtpermanentaddress","alpha_addr","Permanent address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&), semi colon (;), colon (:) and period(.)");	
	frmvalidator.addValidation("txttemporaryaddress","alpha_addr","Temporary address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&), semi colon (;), colon (:) and period(.)");	
	frmvalidator.addValidation("txtorganizationaddress", "alpha_addr","Organization address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) semi colon (;), colon (:) and period(.)");	
	frmvalidator.addValidation("txtTinNum","alpha_tin","Tin No can contain only letters,numbers, hyphen(-) and slash(/)");
	
	frmvalidator.addValidation("txtComments", "maxlen=1000","Comment cannot exceed 1000 characters"); 	 
	//
</script>
</body>

</html>
