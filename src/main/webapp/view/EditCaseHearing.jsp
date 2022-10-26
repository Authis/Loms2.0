<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
      <link rel="stylesheet" href="/loms/view/css/sample/jquery-ui-1.8.14.custom.css" type="text/css" media="all" />
 
<link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtHearingDate"]);
		}
	</script>
   <script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
  <script>
 function onclickaction(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
 
 function popOnload() {
	 
		if (document.getElementById("retMsg").value != "" ) {
			//alert("Case Hearing has been updated Successfully.");
			document.getElementById("retMsg").value = "";
		}
	}
 
 
  </script>
 
</head>

<body onload="javascript:doOnLoad();popOnload();">
 <form id="editcasehearinfrm" name="editcasehearinfrm" action="editCaseHearSave.action" method="post">
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;">


</div>

<div id="content">
<!--<h3>Edit Case Hearing Info</h3>-->
<!---->
<!--<table width="100%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Modify Case Hearing Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a></td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Add Case Info</p> 
 <a href="#" onclick="javascript:onclickaction('editcasehearinfrm','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Modify Case Hearing Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 
 
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray">
<s:if test="%{retMsg != '' && retMsg != 'E9999'}">
		<tr>
			<td colspan="4"><div class="succ">Case Hearing has been updated Successfully. <s:hidden name="retMsg" id="retMsg" /></div></td>
		</tr>
	</s:if>
	
	<s:if test="%{retMsg != '' && retMsg == 'E9999'}">
		<tr>
			<td colspan="4"><div class="err">Case Hearing has not been updated Successfully. <s:hidden name="retMsg" id="retMsg" /></div></td>
		</tr>
	</s:if>
	 <tr>
		<td colspan="2"><div id="editcasehearinfrm_errorloc" class="error_strings"></div></td>
		<td align="right"></td>

	</tr>
<tr>
	<td>Case Hearing Id:</td>
	<td><s:textfield theme="simple" readonly="true" name="caseHearingBean.casehearingid" id="txtCaseId"></s:textfield> </td>
		  
</tr>
<tr>
	<td>Case ID:</td>
	<td><s:textfield theme="simple" readonly="true" name="caseHearingBean.caseid" id="txtCaseId"></s:textfield> </td>
		  
</tr>
<tr>
	<td>Client ID:</td>
	<td><s:textfield theme="simple" readonly="true" name="caseHearingBean.clientid" id="txtClientId"></s:textfield> </td>
		  
</tr> 
<tr>
	<td>Case Hearing Date:<span class="mandi">*</span></td>
	<td><s:textfield theme="simple"  name="caseHearingBean.casehearingdate" id="txtHearingDate"> </s:textfield>
	  
	</td>
</tr>
<tr>
	<td>Comments:<span class="mandi">*</span></td>
	<td><s:textarea theme="simple"  name="caseHearingBean.casehearingcomments" id="txtComment"  ></s:textarea> </td>
 </tr>
<tr>&nbsp;</tr> 
 


<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td> 

<input type="submit" name="groovybtn1" class="groovybutton" value="Update" />
<input type="button" name="groovybtn1" class="groovybutton" value="Back" onclick="javascript:onclickaction('editcasehearinfrm','searchCaseInforesult.action')" /></td></tr>

<tr><td colspan=2>&nbsp;</td></tr>
</table>

</div>
  <jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("editcasehearinfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("txtHearingDate", "req",	"Case hearing date cannot be blank");
	
	frmvalidator.addValidation("txtComment", "req",	"Comments date cannot be blank"); 
	frmvalidator.addValidation("txtComment", "maxlen=1000","Comment cannot exceed 500 characters"); 
	frmvalidator.addValidation("txtHearingDate", "date");
	//
</script>
</body>

</html>
