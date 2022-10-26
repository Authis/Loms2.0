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
	<script language="JavaScript" type="text/javascript" src="/loms/view/richtext.js"></script>
<script>
function statusMsg(){
	
	if(document.getElementById("statusMsg1")){
		 document.getElementById("statusMsg1").style.display = "none";
	  }else{
		 document.getElementById("statusMsg2").style.display = "none";
	  }
}

	function popOnload() {
		document.getElementById("txtSubject").value = "";
		document.getElementById("txtTo").value = "";
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
<script language="JavaScript" type="text/javascript">
<!--
function submitForm() {
//make sure hidden and iframe values are in sync before submitting form
updateRTE('txtBody'); //use this when syncing only 1 rich text editor ("rtel" is name of editor)
//updateRTEs(); //uncomment and call this line instead if there are multiple rich text editors inside the form
//alert("Submitted value: "+document.frmsendmail.txtBody.value) //alert submitted value
return true; //Set to false to disable form submission, for easy debugging.
}

//Usage: initRTE(imagesPath, includesPath, cssFile)
initRTE("/loms/view/images/", "/loms/view/", "/loms/view/");
//-->
</script>

</head>
<body
	onload="javascript:popOnload();">
<form id="frmsendmail" name="frmsendmail"
	action="SendEmail.action" method="post" enctype="multipart/form-data">
 

<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Send Email</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Send Email.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('frmsendmail','communicationManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/communication.png"  width="40" height="40"  /></div>
<p class="title">Send Email</p> 
 <a href="#" onclick="javascript:onclickaction('frmsendmail','communicationManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Send Email.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



 <div class="mandatory" align="center"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray">
  <s:if test="%{ mailErrorStr != '' && mailErrorStr == 'notSent'}">
		<tr>
			<td colspan="3">
			<div id="statusMsg1" style="display: inline;" >
			<div class="err">Mail has not been sent successfully </div>
			 </div>
			</td> 
		</tr>

	</s:if>
	<s:if test="%{ mailErrorStr == 'Sent' && mailErrorStr != 'notSent'}">
		<tr>
			<td colspan="3">
			<div id="statusMsg2" style="display: inline;" >
			<div class="succ">Mail has been sent successfully </div>
			 </div>
			</td> 
		</tr>

	</s:if>
  
	<tr>
		<td colspan="2">
		<div id="frmsendmail_errorloc" class="error_strings"></div>
		</td>
		<td></td>
	</tr>
 
	<!--  <tr>
		<td>From:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple"
			name="txtFrom" id="txtFrom" cssStyle="width: 400px;" maxlength="15">
		</s:textfield></td>
	</tr>-->
 
 
	<tr>
		<td>To:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="txtTo" cssStyle="width: 400px" 
			id="txtTo" readonly="true"/><a onclick="javascript:searchClientID('selmail');" ><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a></td>
	</tr>

   <tr>
		<td>Email Subject:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="txtSubject" cssStyle="width: 400px" 
			id="txtSubject" /></td>
	</tr>
     <tr>
		<td>Attachment:</td>
		<td><s:file theme="simple" name="fileUpload" cssStyle="width: 400px" 
			id="fileUpload" > </s:file></td>
	</tr>
   <tr>
		<td>Email Body:</td>
		<td> 
			
			<script language="JavaScript" type="text/javascript">
<!--
//Usage: writeRichText(fieldname, html, width, height, buttons, readOnly)
writeRichText('txtBody', '', 400, 200, true, false);
//-->
</script>
			
			</td>
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
			value="Send" onclick="javascript:submitForm();statusMsg();" /> <input
			type="reset" name="groovybtn1" class="groovybutton"
			value="   Reset   " onclick="" /></td>
	</tr>

</table>
</div>
</div>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("frmsendmail");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
 
	
	frmvalidator.addValidation("txtTo", "req",	"Email ID cannot be blank");
	
	frmvalidator.addValidation("txtSubject", "req",	"Email Subject cannot be blank");
	 
	
	//frmvalidator.addValidation("txtBody", "req","Email Body cannot be blank");
	 
	 

	//
</script>
</body>

</html>
