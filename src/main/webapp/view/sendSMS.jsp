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
<script language="JavaScript" src="/loms/view/js/calendar_us.js"></script>
<link rel="stylesheet" href="/loms/view/css/calendar.css" />
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
	function popOnload() {
		if (document.getElementById("retRemID").value) {
			//alert("Reminder has been added Successfully.");
			document.getElementById("retRemID").value = "";
		}
	}
	function searchClientID(val) {

		var url = "searchMailID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
	 
</script>
</head>
<body
	onload="javascript:popOnload();">
<form id="frmsendsms" name="frmsendsms"
	action="sendSMS.action" method="post">
     
    
    

<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;"><jsp:include
	page="leftMenu.jsp" /></div>

<div id="content">
<h3>Send SMS</h3>
 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray">
 
  
	<tr>
		<td colspan="2">
		<div id="frmsendsms_errorloc" class="error_strings"></div>
		</td>
		<td></td>
	</tr>
 
	<tr>
		<td>Send To:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple"
			name="txtsendNo" id="txtsendNo" cssStyle="width: 200px;" maxlength="115"   readonly="true"/>
		 <a onclick="javascript:searchClientID('selmobile');"><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a></td>
	</tr>
 
 
	<tr>
		<td>Message:<span class="mandi">*</span></td>
		<td><s:textarea theme="simple" name="txtSendMsg" cssStyle="width: 200px;height: 100px" 
			id="txtSendMsg" ></s:textarea></td>
	</tr>


	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="groovybtn1" class="groovybutton"
			value="Send SMS" onclick="javascript:remSpace();"/> <input
			type="reset" name="groovybtn1" class="groovybutton"
			value="   Reset   " onclick="" /></td>
	</tr>

</table>

</div>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("frmsendsms");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	
	frmvalidator.addValidation("txtsendNo", "req",	"Mobile No cannot be blank");
	
	frmvalidator.addValidation("txtSendMsg", "req",	"Message cannot be blank");
	 

	//
</script>
</body>

</html>
