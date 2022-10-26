<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
  <link rel="stylesheet" type="text/css" href="/loms/view/css/printfriendly.css" ></link>
<script>
function callaction(actionname,formname){	 
	//window.opener.receiveDataFromPopup(actionname,formname);
	//window.close();
	 
		 if(document.getElementById(formname)){		 
		 		document.getElementById(formname).action=actionname;		
		 		document.getElementById(formname).submit();			 
		 	}	
 
	 
	
	 }
</script>

<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
<style type="text/css">
* {
	font-family: calibri;
	font-size: 97%;
}

label {
	width: 10em;
	float: left;
}

label.error {
	float: none;
	color: red;
	padding-left: .5em;
	vertical-align: top;
}

p {
	clear: both;
}

.submit {
	margin-left: 12em;
}

em {
	font-weight: bold;
	padding-right: 1em;
	vertical-align: top;
}
</style>
</head>
<body bgcolor="#E0ECF8">
<form id="frmstdcrtinfo" name="frmstdcrtinfo" action="searchstdcourtinfo.action" method="post">
	<input type="hidden" name="hidcourtid" id="hidcourtid" />
	<input type="hidden" name="hidcourtname" id="hidcourtname" />
    
      <s:hidden name="val" id="val" />
<div id="content">
<font color="red" ><b>No Court Added</font><a href="javascript:callaction('addstdcrtinfoPop.action','frmstdcrtinfo');"> [Add Here]</b></a>	
 </div>

</form>

</body>
</html>
