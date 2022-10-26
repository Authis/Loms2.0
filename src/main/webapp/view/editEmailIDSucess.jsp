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
 
</head>
<body
	onload="javascript:">
<form name="chgEmailFrm" id="chgEmailFrm" >
<jsp:include page="topHeader.jsp" />


<div id="content">
<!--<h3>Change Email ID</h3>-->

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Change_password.png"  width="40" height="40"  /></div>
<p class="title">Change Email ID</p> 
 <a href="#"  onclick="javascript:onclickaction('chgEmailFrm','login.action')"><div class="back"></div></a>
</div>


<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<table border="0" width="75%"  style="border-color: gray">
<tr align="center"  >
<td>
    <table border="0" width="50%" >
 
	     
	<s:if test="%{retMsg != '' && retMsg != 'E9999'}">
		<tr align="center">
			<td colspan="4">
		 
			<div class="succ"><b>Email ID has been changed Successfully.</b> </div>
			 
			</td>
		</tr>
	</s:if>
	<s:if test="%{retMsg == 'E9999'}">
		<tr align="center">
			<td colspan="4">
			 
			<div class="err"><b>Email ID has not been changed Successfully. </b> </div>
				 
			</td>
		</tr> 
	</s:if> 
 
 
</table>
</td>
</tr>
</table>


</div>
<jsp:include page="Footer.jsp" />
</form>
 
</body>
</html>
