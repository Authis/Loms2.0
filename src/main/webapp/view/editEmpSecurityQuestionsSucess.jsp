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


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Change Security Questions</h3>-->
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Change-Security-Question.png"  width="40" height="40"  /></div>
<p class="title">Change Security Questions</p> 
 <a href="#"  onclick="javascript:onclickaction('chgEmailFrm','login.action')"><div class="back"></div></a>
</div>
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
		<tr>
			<td colspan="4">
			 
			<div class="succ">Security Questions has been changed Successfully.  </div>
			 
			</td>
		</tr>
	</s:if>
	<s:if test="%{retMsg == 'E9999'}">
		<tr>
			<td colspan="4">
			 
			<div class="err">Security Questions has not been changed Successfully.  </div>
				 
			</td>
		</tr> 
	</s:if>
 
 
</table>
</td>
</tr>
</table>
</div>

</div>
<jsp:include page="Footer.jsp" />
</form>
 
</body>
</html>
