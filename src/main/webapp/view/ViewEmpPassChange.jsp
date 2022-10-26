<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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


<script>
	function onclickaction(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	function popOnload() {
		if (document.getElementById("retMsg").value != 'E9999' && document.getElementById("retMsg").value != '') {
			//alert("Password has been changed Successfully");
			document.getElementById("retMsg").value = "";
		}
	}

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
	onload="javascript:popOnload();">
<form name="emppasschange" id="emppasschange" action="updatePassword.action" method="post" onreset="return confirm('Do you want to reset the data?')">
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Password Management</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Forgot Password.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a></td>-->
<!--    </tr>-->
<!--</table>-->
<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Change_password.png"  width="40" height="40"  /></div>
<p class="title">Password Management</p> 
 <a href="#"  onclick="javascript:onclickaction('emppasschange','login.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Forgot Password.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="50%" style="border-color: gray" cellpadding="10" cellspacing="10">
	<s:if test="%{retSucessMsg != ''}">
		<tr>
			<td colspan="2"><s:hidden name="retMsg" id="retMsg" /></td>
		</tr>
	</s:if>
	<s:if test="%{retMsg != '' && retMsg != 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Password has been changed Successfully. <s:hidden
				name="retOppId" id="retOppId" /></div>
				</div>
			</td>
		</tr>
	</s:if>
	<s:if test="%{retMsg == 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err">Password has not been changed Successfully. <s:hidden
				name="retBookId" id="retOppId" /></div>
				</div>
			</td>
		</tr> 
	</s:if>
	
	<tr>
		<td colspan="2">
		<div id="emppasschange_errorloc" class="error_strings"></div>
		</td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td>User Name:</td>
		<td><s:textfield theme="simple" name="emppasschangeBean.username"
			id="txtUserName" cssStyle="width: 200px;" readonly="true" /></td>
	</tr>

	<tr>
		<td>Old Password:<span class="mandi">*</span></td>
		<td><s:password theme="simple"
			name="emppasschangeBean.oldpassword" id="txtOldPwd" maxlength="10"
			cssStyle="width: 200px;" /></td>
	</tr>

	<tr>
		<td>New Password:<span class="mandi">*</span></td>
		<td><s:password theme="simple"
			name="emppasschangeBean.newpassword" id="txtNewPwd"
			cssStyle="width: 200px;" /></td>
	</tr>
	<tr>
		<td>Confirm New Password:<span class="mandi">*</span></td>
		<td><s:password theme="simple"
			name="emppasschangeBean.newpasswordconf" id="txtNewPwdConf"
			cssStyle="width: 200px;" /></td>
	</tr>

	<tr>
		<td>Security Question 1:</td>
		<td><s:textfield theme="simple"
			name="emppasschangeBean.secquestion1" id="txtSecQue1"
			cssStyle="width: 200px;" readonly="true" /></td>
	</tr>

	<tr>
		<td>Answer 1:<span class="mandi">*</span></td>
		<td><s:password theme="simple" name="emppasschangeBean.answer1"
			id="txtAnswer1" cssStyle="width: 200px;" /></td>
	</tr>

	<tr>
		<td>Security Question 2:</td>
		<td><s:textfield theme="simple"
			name="emppasschangeBean.secquestion2" id="txtSecQue2"
			cssStyle="width: 200px;" readonly="true" /></td>
	</tr>

	<tr>
		<td>Answer 2:<span class="mandi">*</span></td>
		<td><s:password theme="simple" name="emppasschangeBean.answer2"
			id="txtAnswer2" cssStyle="width: 200px;" /></td>
	</tr>

	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td ><input type="submit" name="groovybtn1" class="groovybutton"
			value="Change Password"  onclick="javascript:statusMsg();"/> <input type="reset" name="groovybtn1"
			class="groovybutton" value="   Reset   " /></td>
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
	var frmvalidator = new Validator("emppasschange");

	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("txtOldPwd", "req", "Please enter Old Password");
	frmvalidator.addValidation("txtNewPwd", "req", "Please enter New Password");
	frmvalidator.addValidation("txtNewPwdConf", "req","Please enter Confirm New Password");
	frmvalidator.addValidation("txtNewPwd", "minlen=6", "New Password should be atleast 6 characters");
	
	frmvalidator.addValidation("txtNewPwd", "pass_alpha_num", "New Password can contain only letters, numbers, underscore(_)");
	 
	frmvalidator.addValidation("txtAnswer1", "req", "Please enter Answer 1");
	frmvalidator.addValidation("txtAnswer2", "req", "Please enter Answer 2");
	frmvalidator.setAddnlValidationFunction(compPass);

	//
</script>
</body>
</html>
