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
<link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtPaymentdate"]);
		}
	</script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
	function addIncExp(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	function popOnload() {
		if (document.getElementById("retSucessMsg").value) {
			//alert("Inc\Exp has been added Successfully");
			document.getElementById("retSucessMsg").value = "";
		}
	}
	function searchClientID(val) {

		var url = "searchClientID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
	
 function searchCaseID(){
	 document.getElementById("hidclientid").value = document.getElementById("txtClientId").value;	  
	 var url = "searchCaseID.action?hidclientid="+document.getElementById("hidclientid").value;
		window.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');
 }
 
 function trType(val){
	 
	 if(val == "PERSONAL"){
		 
		 document.getElementById("clientlbl").style.display="none";	
		 document.getElementById("clientval").style.display="none";	
		 document.getElementById("caselbl").style.display="none";	
		 document.getElementById("caseval").style.display="none";		 
	 }else if(val == "OFFICIAL"){
		 document.getElementById("clientlbl").style.display="inline";	
		 document.getElementById("clientval").style.display="inline";	
		 document.getElementById("caselbl").style.display="inline";	
		 document.getElementById("caseval").style.display="inline";		
	 }
 }
 
 function clrFrmVal(){
	 if(confirm("Do you want to reset the data?")){
		    document.getElementById("txtClientId").value = "";
			document.getElementById("txtCaseId").value = "";
			document.getElementById("txtPaidAmount").value = "";
			document.getElementById("txtPaymentType").value = "";
			document.getElementById("txtPaymentdate").value = "";
		    document.getElementById("txtTransactionComments").value = "";		  
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
</script>
</head>
<body
	onload="javascript:doOnLoad();popOnload();">
<form name="addcaseinfofrm" id="addcaseinfofrm"
	action="addIncExpDetSave.action" method="post">
	    <s:hidden name="hidclientid" id="hidclientid" />
	    <s:hidden name="val" id="val" />
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Income / Expense</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Income Expense Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--          <a href="#" onclick="javascript:onclickaction('addcaseinfofrm','incExpManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->


 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Income Expense Management 2.png"  width="40" height="40"  /></div>
<p class="title">Income / Expense</p> 
 <a href="#" onclick="javascript:onclickaction('addcaseinfofrm','incExpManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Income Expense Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 


<div class="mandatory" align="right"><span class="mandi">*</span>Marked
fields are Mandatory</div>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray"  cellpadding="10" cellspacing="10">
	<s:if test="%{retSucessMsg != ''}">
		<tr>
			<td colspan="2">
			<div id="statusMsg1" style="display: inline;" >
		 <div class="succ"> Inc\Exp has been added Successfully 
			<s:hidden name="retSucessMsg" id="retSucessMsg" /></div></div>
			</td>
		</tr>
	</s:if>
	<tr>
		<td colspan="2">
		<div id="addcaseinfofrm_errorloc" class="error_strings"></div>
		</td>
		 
	</tr>
	<!-- <tr>
		<td width="25%">Transaction Type:</td>
		<td width="75%"><input type="radio" name="transType" id="transType" value="PERSONAL"  onclick="javascript:trType('PERSONAL');"/> Personal
		<input type="radio" name="transType" id="transType"  value="OFFICIAL" onclick="javascript:trType('OFFICIAL');" checked="checked"/>Official </td>
	</tr> -->
	<tr>
		<td><div style="display: inline;" id="clientlbl">Client ID:</div></td>
		<td ><div style="display: inline;" id="clientval"><s:textfield theme="simple" readonly="true"
			name="incomeExpenceBean.clientidin" value="" id="txtClientId"
			cssStyle="width: 200px;" /> <a onclick="javascript:searchClientID('income');"><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a> <s:textfield  theme="simple" id="txtName" cssStyle="border:0px; background:inherit;"  readonly="true" /> 
			 </div></td>
	</tr>

	<tr>
		<td><div style="display: inline;" id="caselbl">Case ID:</div></td>
		<td><div style="display: inline;" id="caseval"><s:textfield theme="simple" name="incomeExpenceBean.caseidin"
			id="txtCaseId" cssStyle="width: 200px;" readonly="true" />  
			<a onclick="javascript:searchCaseID();"><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a><s:textfield  theme="simple" id="txttype" cssStyle="border:0px; background:inherit;"  readonly="true" /> 
		</div>
			</td>
	</tr>

	<tr>
		<td>Paid Amount:<span class="mandi">*</span></td>
		<td ><s:textfield theme="simple"
			name="incomeExpenceBean.paidamtin" id="txtPaidAmount" maxlength="30"
			cssStyle="width: 200px;" /></td>
	</tr>

	<tr>
		<td>Payment Type:<span class="mandi">*</span></td>
		<td> 
			<select name="incomeExpenceBean.paymnttypein"  
			id="txtPaymentType" style="width: 205px;" >
			<option value="">Select Payment Type</option>
			<option value="CREDIT">CREDIT</option>
			<option value="DEBIT">DEBIT</option>
		    </select>
	    </td>
	</tr>

	<tr>
		<td>Payment Date:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple"
			name="incomeExpenceBean.paidistin" id="txtPaymentdate"
			cssStyle="width: 200px;" readonly="true"/>  </td>
	</tr>

	<tr>
		<td>Transaction Comments:</td>
		<td><s:textarea theme="simple"
			name="incomeExpenceBean.commentsin" id="txtTransactionComments"
			cssStyle="width: 200px;">
		</s:textarea></td>
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
		<input type="submit" name="groovybtn1" class="groovybutton"	value="Add" onclick="javascript:statusMsg();"/> 
		<input type="button" name="groovybtn1"	class="groovybutton" value="Reset" onclick="javascript:clrFrmVal();" /></td>
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
	var frmvalidator = new Validator("addcaseinfofrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("txtPaidAmount", "req","Paid Amount cannot be blank");	
	frmvalidator.addValidation("txtPaidAmount", "amount","Paid Amount can contain only numbers");
	frmvalidator.addValidation("txtPaidAmount", "amountZero","Paid Amount cannot be Zero");
	
	frmvalidator.addValidation("txtPaymentType", "req",	"Payment Type cannot be blank");
	frmvalidator.addValidation("txtPaymentType", "alpha_s",	"Payment Type can contain only letters");
	frmvalidator.addValidation("txtPaymentdate", "req",	"Payment Date cannot be blank");
	frmvalidator.addValidation("txtTransactionComments", "maxlen=1000","Transaction Comments cannot exceed 1000 characters"); 
 	  frmvalidator.addValidation("txtPaymentdate", "date");
 	  
 	 frmvalidator.setAddnlValidationFunction(addIncDateChk);  
	//
</script>
</body>
</html>
