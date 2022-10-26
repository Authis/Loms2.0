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
<form name="chgSecQueFrm" id="chgSecQueFrm" action="updateSecQuestions.action" method="post" onreset="return confirm('Do you want to reset the data?')">
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Change Security Questions</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Change Security Questions.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a></td>-->
<!--    </tr>-->
<!--</table>-->

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Change-Security-Question.png"  width="40" height="40"  /></div>
<p class="title">Change Security Questions</p> 
 <a href="#"  onclick="javascript:onclickaction('chgSecQueFrm','login.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Change Security Questions.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="75%" style="border-color: gray" cellpadding="10" cellspacing="10">
	 
	<s:if test="%{retMsg != '' && retMsg != 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ"><b>Security Questions has been changed Successfull</b><s:hidden
				name="retOppId" id="retOppId" /></div>
				</div>
			</td>
		</tr>
	</s:if>
	<s:if test="%{retMsg == 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err"><b>Security Questions has not been changed Successfully.</b> <s:hidden
				name="retBookId" id="retOppId" /></div>
				</div>
			</td>
		</tr> 
	</s:if>
	
	<tr>
		<td colspan="2">
		<div id="chgSecQueFrm_errorloc" class="error_strings"></div>
		</td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td>User Name:</td>
		<td><s:textfield theme="simple" name="addEmpBean.username"  
			id="txtUserName" cssStyle="width: 200px;" readonly="true" /></td>
	</tr>
    <tr>
		<td>Security Question 1:<span class="mandi">*</span></td>
		<td>
		
		<s:select
		theme="simple" name="addEmpBean.secquestion1" value="%{addEmpBean.secquestion1}" id="txtsecQue1" 
		cssStyle="width: 300px;"  headerKey="" headerValue="Select Security Question1"
	       list="retEmqSeqQuestion1"> 
	 

		</s:select></td>
	</tr>
	<tr>
		<td>Security Answer 1:<span class="mandi">*</span></td>
		<td><input type="password" name="addEmpBean.answer1" id="txtAnswer1" style="width: 200px;" maxlength="20"/> 
		</td>
	</tr>
	<tr>
		<td>Re Enter Security Answer 1:<span class="mandi">*</span></td>
		<td><input type="password" name="txtAnswer11" id="txtAnswer11" style="width: 200px;" maxlength="20"/> 
		</td>
	</tr>
	
	<tr>
		<td>Security Question 2:<span class="mandi">*</span></td>
		<td>
		
		<s:select theme="simple" name="addEmpBean.secquestion2" value="%{addEmpBean.secquestion2}" id="txtsecQue2" 
		cssStyle="width: 300px;" headerKey=""   headerValue="Select Security Question2"
		list="retEmqSeqQuestion2"> 
	 

		</s:select>
		 </td>
	</tr>
	<tr>
		<td>Security Answer 2:<span class="mandi">*</span></td>
		<td><input type="password" name="addEmpBean.answer2" id="txtAnswer2" style="width: 200px;" maxlength="20"/>
		</td>
	</tr>
     <tr>
		<td>Re Enter  Answer 2:<span class="mandi">*</span></td>
		<td><input type="password" name="txtAnswer22" id="txtAnswer22" style="width: 200px;" maxlength="20" />
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
</div>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("chgSecQueFrm");

	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	
	frmvalidator.addValidation("txtsecQue1", "req","Security Question 1 cannot be blank");	
	frmvalidator.addValidation("txtAnswer1", "req","Security Answer 1 cannot be blank");	
	frmvalidator.addValidation("txtAnswer11", "req","Re Enter Answer 1 cannot be blank");
	frmvalidator.addValidation("txtAnswer1", "alpha_PANnum","Security Answer 1 can contain only numbers and letters");	

	frmvalidator.addValidation("txtsecQue2", "req",	"Security Question 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer2", "req",	"Security Answer 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer22", "req", "Security Re Enter Answer 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer2", "alpha_PANnum","Security Answer 2 can contain only numbers and letters");	
	
	frmvalidator.setAddnlValidationFunction(updSecAns1Check);	
	frmvalidator.setAddnlValidationFunction(updSecAns2Check);

	//
</script>
</body>
</html>
