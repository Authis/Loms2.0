<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
	<link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
	</head>
<body onload="javascript:">
 <form name="addcltmgmtfrm" id="addcltmgmtfrm"  action="addClientInfo.action" method="post">

<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;">


</div> 
<div id="content">
<h3>Add Client Management Success</h3>
<table border="0" width="100%"  style="border-color: gray">
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr> <td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
<td class="success">Client Info has been added Successfully. Client ID is <s:property value="%{retClientID}"/></td></tr>

</table>

</div>
<jsp:include page="Footer.jsp" />

</form>
 
</body>

</html>
