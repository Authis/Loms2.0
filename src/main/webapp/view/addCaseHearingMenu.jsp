<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
       
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
		document.getElementById("txtClientId").value = "";
		document.getElementById("txtCaseId").value = "";
		document.getElementById("txtHearingDate").value = "";
		document.getElementById("txtComment").value = "";
		
 		if (document.getElementById("retMsg").value != "" ) {
			//alert("Case Hearing has been added Successfully.");
			document.getElementById("retMsg").value = "";	
			
		}
 		 
		
	}
 
	function searchClientID(val) {

		var url = "searchClientID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
	
 function searchCaseID(val){
	 
	 document.getElementById("hidclientid").value = document.getElementById("txtClientId").value;	  
	 var url = "searchCaseID.action?hidclientid="+document.getElementById("hidclientid").value+"&val="+val;
		window.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');
 }
 
 function clrFrmval(){
	 if(confirm("Do you want to reset the data?")){
		    document.getElementById("txtClientId").value = "";
			document.getElementById("txtCaseId").value = "";
			document.getElementById("txtHearingDate").value = "";
			document.getElementById("txtComment").value = "";
			
		  
		  return true;
	   }else{
		   return false;
	   }
 }
 
 function statusMsg(){
		
	 if(document.getElementById("statusMsg1")){
		 document.getElementById("statusMsg1").style.display = "none";
	  }else{
		 document.getElementById("statusMsg2").style.display = "none";
	  }
} 
 
 function goToAddCase(formname, actionname){
		if (document.getElementById(formname)) {		 
			 
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();

		}
		
	}
  </script>
 
</head>

<body onload="javascript:doOnLoad();">
 <form id="addcasehearinfrm" name="addcasehearinfrm" action="addCaseHearSavemenu.action" method="post" onreset="return confirm('Do you want to reset the data?')">
 <s:hidden name="hidcaseid" id="hidcaseid" />
  <s:hidden name="hidclientid" id="hidclientid" />
<jsp:include page="topHeader.jsp" />


<div style="padding:0px 10px; width:100%;">


 

<div id="content">
<!--<h3>Add Case Hearing Information</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Case Hearing Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       <a href="#" onclick="javascript:onclickaction('addcasehearinfrm','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Add Case Hearing Information</p> 
 <a href="#" onclick="javascript:onclickaction('addcasehearinfrm','caseManagement.action')"><div class="back"> </div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Case Hearing Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
  
<s:if test="%{retMsg != '' && retMsg != 'E9999' && mailErrorStr == 'Sent'}">
		<tr>
			<td colspan="4">
			 <div id="statusMsg1" style="display: inline;" >
			<div class="succ">Case Hearing has been added Successfully. Kindly Check your mail. <s:hidden name="retMsg" id="retMsg" /> <b><a href="#" onclick="javascript:goToAddCase('addcasehearinfrm','addcasedoc.action');" >Click here to Add Case Document</a></b></div>
			
			</div>
			</td>
		</tr>
 </s:if>
   
<s:if test="%{retMsg != '' && retMsg != 'E9999' && mailErrorStr == ''}">
		<tr>
			<td colspan="4">
			 <div id="statusMsg1" style="display: inline;" >
			<div class="succ">Case Hearing has been added Successfully. <s:hidden name="retMsg" id="retMsg" />
			<b><a href="#" onclick="javascript:goToAddCase('addcasehearinfrm','addcasedoc.action');" >Click here to Add Case Document</a></b>
			</div>
			</div>
			</td>
		</tr>
 </s:if>
 
 <s:if test="%{retMsg != '' && retMsg != 'E9999' && mailErrorStr == 'notSent'}">
		<tr>
			<td colspan="3">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Case Hearing has been added Successfully. <s:hidden name="retMsg" id="retMsg" />
			<b><a href="#" onclick="javascript:goToAddCase('addcasehearinfrm','addcasedoc.action');" >Click here to Add Case Document</a></b>			
				 <font color="red" >Note: Email has not been sent to the Client due to Internet Problem</font>
				
				 </div>
			 </div>
			</td>


		</tr>

	</s:if>
 
 <s:if test="%{retMsg == 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err">Case Hearing has not been added Successfully. <s:hidden name="retMsg" id="retMsg" /></div>
			</div></td>
		</tr>
	</s:if>
 
	 <tr>
		<td colspan="2"><div id="addcasehearinfrm_errorloc" class="error_strings"></div></td>
		<td align="right"></td>

	</tr>
 
<tr>
		<td>Client ID:<span class="mandi">*</span></td>
		<td   colspan="3">
		<s:textfield theme="simple"	name="caseHearingBean.clientid" id="txtClientId"
			cssStyle="width: 200px;" readonly="true"></s:textfield> <a onclick="javascript:searchClientID('casehear');"><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a> <s:textfield  theme="simple" id="txtName" cssStyle="border:0px; background:inherit;" readonly="true" /> 
			 </td>
	</tr>

	<tr>
		<td>Case ID:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="caseHearingBean.caseid"
			id="txtCaseId" cssStyle="width: 200px;" readonly="true" ></s:textfield>  
			<a onclick="javascript:searchCaseID('casehear');"><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a><s:textfield  theme="simple" id="txttype" cssStyle="width: 500px;border:0px; background:inherit;" readonly="true" /> 
		
			</td>
	</tr>


<tr>
	<td>Case Hearing Date:<span class="mandi">*</span></td>
	<td><s:textfield theme="simple"  name="caseHearingBean.casehearingdate" id="txtHearingDate" cssStyle="width: 200px;" readonly="true"> </s:textfield>
	
	 <script language="JavaScript">
	new tcal({
		// form name
		'formname' : 'addcasehearinfrm',
		// input name
		'controlname' : 'txtHearingDate'
	});
</script>
	</td>
</tr>
<tr>
	<td>Comments:</td>
	<td><s:textarea theme="simple"  name="caseHearingBean.casehearingcomments"  cssStyle="width: 200px;" id="txtComment"  ></s:textarea> </td>
 </tr>
<tr>&nbsp;</tr> 
 


<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td> 

<input type="submit" name="groovybtn1" class="groovybutton" value="Add" onclick="javascript:statusMsg();"/>
<input type="button" name="groovybtn1" class="groovybutton" value="Reset"  onclick="javascript:clrFrmval();"/></td></tr>


<tr><td colspan=2>&nbsp;</td></tr>
</table>

</div>
</div>

  <jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("addcasehearinfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("txtClientId", "req","Client ID cannot be blank");	
	frmvalidator.addValidation("txtCaseId", "req","Case ID cannot be blank");

	frmvalidator.addValidation("txtHearingDate", "req", "Case Hearing Date cannot be blank");
	frmvalidator.addValidation("txtComment", "maxlen=1000","Comment cannot exceed 1000 characters"); 
	frmvalidator.addValidation("txtHearingDate", "date");
	//
</script>
</body>

</html>
