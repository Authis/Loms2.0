<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>lawyers office management system</title>
<link href="styles/app.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script>

<script>
	function onclickaction1() {
 
		var url = "fgtPwd.action";
		window
				.open(url, "_blank",
						'resizable=no,width=350,height=400,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('loms/view/ClientID.jsp','','width=300,height=300');
	}
	 
	function popOnload() {
		if (document.getElementById("caseId").value) {
			alert("Case Info has been added Successfully \nCase ID is "
					+ document.getElementById("caseId").value);
			document.getElementById("caseId").value = "";
		}
	}

	function onclickaction(formname, actionname) {

		var val = document.forms["loginfrm"].language.value;

		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname
					+ "?request_locale=" + val;
			document.getElementById(formname).submit();
		}
	}
</script>
<SCRIPT type="text/javascript">
	function changeLocale() {
		 
		var selLang = document.getElementById('selectLang').value;
		if (selLang == '1') {
			 
			document.URL = "locale.action?request_locale=EN";
		}
		if (selLang == '2') {
			
			document.URL = "locale.action?request_locale=TA";
		}

	}
	
 
	
	function openEulaDoc() {

		var url = "EulaDoc.action";
		window
				.open(url, "_blank",
						'resizable=no,width=600,height=700,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
	function openTroubleDoc(){
		var url = "openTroubleDoc.action";
		window
				.open(url, "_blank",
						'resizable=no,width=600,height=700,scrollbars=yes,left=30,top=30,status=yes');

	}
</SCRIPT>

</head>

<body>
<div class="wrapper">
<div class="login_box">
<div class="login_left"></div>
<div class="login_mid">
<div class="logo"></div>
<div class="user_inputs">
<form name="loginfrm" id="loginfrm" method="post" >
<table width="100%" border="0" >
	<tr>
		<td colspan="2" > <s:property escape="false" value="logOurStr" /></td>
	</tr>
	<tr>
		<td colspan="2" >&nbsp;</td>
	</tr>
	
	 
	
	
	<tr>
		<td><s:property value="%{getText('global.username')}" /></td>
		<td><input type="text" name="bean.userName" id="txtusername"
			value="loms_mstr" maxlength="20"></td>
	</tr>
	<tr>
		<td><s:property value="%{getText('global.password')}" /></td>
		<td><input type="password" name="bean.passWord" id="txtpassword"
			value="loms_mstr" maxlength="24"></td>
	</tr>
	
	
	
	<tr>
		<td>&nbsp;</td>
		<td></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
		<input type="button" onclick="javascript:onclickaction('loginfrm','login.action');" name="button" id="button" value="LOGIN" class="btn" />
		<input type="reset" name="button" id="button" value="RESET" class="btn" />


		</td>
	</tr>
	<!--  <tr>
		<td>&nbsp;</td>
		<td><select name="language" id="selectLang"
			onchange="javascript:changeLocale();">
			<option value="-1">Select Language</option>
			<option value="1">English</option>
			<option value="2">Tamil</option>
		</select></td>

	</tr>-->
	<!-- Temp assigned instead of lang combo box -->
	<input type="hidden" name="language" value="1"  />
	
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
<div class="sub_link" align="center">Forgot your Password? <a href="#" onclick="javascript:onclickaction1();">Click here to reset</a></div>
</div>
<div class="other_links">
 <a href="/loms/view/PDF/Loms_User_Guide_v1.0.pdf" target="_blank" ><s:property value="%{getText('global.applicationguide')}" /> </a>
 <a href="/loms/view/PDF/LOMS_End_Users_License_Agreement.pdf"  target="_blank" > <s:property value="%{getText('global.Enduserlicenseagreement')}" /> </a>  
 <a href="/loms/view/PDF/LOMS_Troubleshooting_Guide_v1.0.pdf"  target="_blank" style="border: none;"> <s:property value="%{getText('global.troubleshootingguide')}" /> </a>
	
 </div>
</div>
<div class="login_right"></div>

</div> 
</div> 
<div class="footer">
<jsp:include page="Footer.jsp" />
</div>
</body>

</html>
