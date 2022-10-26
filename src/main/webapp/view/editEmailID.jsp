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
	onload="javascript:">
<form name="chgEmailFrm" id="chgEmailFrm" action="updateEmailID.action" method="post" onreset="return confirm('Do you want to reset the data?')">
<jsp:include page="topHeader.jsp" />



<div id="content">
<!--<h3>Change Email ID</h3>-->

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Change_password.png"  width="40" height="40"  /></div>
<p class="title">Change Email ID</p> 
 <a href="#"  onclick="javascript:onclickaction('chgEmailFrm','login.action')"><div class="back"></div></a>
</div>



<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="75%" style="border-color: gray">
	 
	
	
	<tr>
		<td colspan="2">
		<div id="chgEmailFrm_errorloc" class="error_strings"></div>
		</td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td>User Name:</td>
		<td><s:textfield theme="simple" name="empID"  
			cssStyle="width: 200px;" readonly="true" /></td>
	</tr>
    <tr>
		<td>Old Email ID:<span class="mandi">*</span></td>
		<td>
		<s:textfield theme="simple" name="oldEmailID"  
			 cssStyle="width: 200px;" readonly="true" />
		</td>
	</tr>
	  <tr>
		<td>New Email ID:<span class="mandi">*</span></td>
		<td>
		<s:textfield theme="simple" name="addEmpBean.empemail"  
			id="txtEmpEmailID" cssStyle="width: 200px;"  maxlength="100" />
		</td>
	</tr>
	 <tr>
		<td>Re-Enter New Email ID:<span class="mandi">*</span></td>
		<td>
		<s:textfield theme="simple" name="txtEmpReEmailID"  
			id="txtEmpReEmailID" cssStyle="width: 200px;"  />
		</td>
	</tr>
	

	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
		     <input type="submit" name="groovybtn1" class="groovybutton" value="Update"  onclick="javascript:statusMsg();"/>
			 <input type="reset" name="groovybtn1" class="groovybutton" value="   Reset   " />
	    </td>
	</tr>
</table>

</div>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("chgEmailFrm");

	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("txtEmpEmailID", "email");
	frmvalidator.addValidation("txtEmpEmailID", "req","New Email ID cannot be blank"); 
	
	frmvalidator.setAddnlValidationFunction(compEmail);
	

	//
</script>
</body>
</html>
