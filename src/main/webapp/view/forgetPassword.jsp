<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>

 
 <link rel="stylesheet" type="text/css" href="/loms/view/css/printfriendly.css" ></link>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
	<script>
	function onclickaction(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
</script>
	
</head>
<body>
<form name="fgtpwdfrm" id="fgtpwdfrm" method="post" onreset="return confirm('Do you want to reset the data?')">
<div style="position: absolute; left: 100px; top: 30px">

<table width="100%" border="0" border="2" align="center">


 <tr>
		<td colspan="2"> <div id="fgtpwdfrm_errorloc" class="error_strings"></div></td>
		<td align="right"></td>

	</tr>
	<tr>
		<td> 
		<table width="100%" align="center">

			<s:if test="%{errId == ''}">
				<tr>
					<td><font color="#5888C6"><b>Please Enter User ID:</b></font>
					</td>

				</tr>
		        <tr>
					<td><s:textfield theme="simple" id="userId" name="userId" /></td>

				</tr>
				<s:if test="%{emppasschangeBean.secquestion1 != null}">
					<tr>
						<td><font color="#5888C6"><b>Security Question 1:
						</b></font><s:textfield theme="simple" name="emppasschangeBean.secquestion1"
							id="txtSecQue1" cssStyle="width: 200px;" readonly="true" /></td>
					</tr>

					<tr>
						<td><font color="#5888C6"><b>Answer 1: </b></font><s:password
							theme="simple" name="emppasschangeBean.answer1" id="txtAnswer1"
							cssStyle="width: 200px;" /></td>
					</tr>

					<tr>
						<td><font color="#5888C6"><b>Security Question 2:</b></font>
						<s:textfield theme="simple"  name="emppasschangeBean.secquestion2"
							id="txtSecQue2" cssStyle="width: 200px;" readonly="true" /></td>
					</tr>

					<tr>
						<td><font color="#5888C6"><b>Answer 2:</b></font> <s:password
							theme="simple" name="emppasschangeBean.answer2" id="txtAnswer2"
							cssStyle="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="center"><input type="button" value="Submit"
							name="groovybtn1" class="groovybutton"
							onclick="javascript:onclickaction('fgtpwdfrm','sendpassmail.action');" /></td>

					</tr>
				</s:if>
				<s:if test="%{emppasschangeBean.secquestion1==null}">
					<tr>
						<td align="center"><input type="button" value="Submit"
							name="groovybtn1" class="groovybutton"
							onclick="javascript:onclickaction('fgtpwdfrm','getsecquestion.action');" /></td>

					</tr>
				</s:if>
			</s:if>
			<s:if test="%{errId != '' && errId != 'E9999'}">
				<table width="100%">
					<tr>
						<td><font color="#5888C6"><b><s:property
							value="retMsg" /> : Password :<s:property value="empPass" /> </b></font></td>

					</tr>
				</table>
			</s:if>
			<s:if test="%{errId != '' && errId == 'E9999'}">
				<table width="100%">
					<tr>
						<td><font color="red"><b><s:property
							value="retMsg" /> </b></font></td>

					</tr>
				</table>
			</s:if>
		</table>
		</td>

		<td></td>
	</tr>
</table>
</div>
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("fgtpwdfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("userId", "req", "Please enter User Name");


	//
</script>
</body>
 
</html>