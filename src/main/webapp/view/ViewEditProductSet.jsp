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
		 
		if(document.getElementById("smsServicehid").value == "Y"){			
			document.getElementById('smsServiceY').checked = true;
		}
		if(document.getElementById("smsServicehid").value == "N"){				
			document.getElementById('smsServiceN').checked = true;
		}
		
		if(document.getElementById("emailServicehid").value == "Y"){			
			document.getElementById('emailServiceY').checked = true;
		}
		if(document.getElementById("emailServicehid").value == "N"){				
			document.getElementById('emailServiceN').checked = true;
		}
		
		
		
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
	 
	 function smsSerSel(val){
		 document.getElementById("smsServicehid").value = val;		 
	 }
    function emailSerSel(val){
    	document.getElementById("emailServicehid").value = val; 		 
	 }
</script>
</head>
<body
	onload="javascript:popOnload();">
<form name="editProdSetFrm" id="editProdSetFrm" action="updateProdSet.action" method="post" onreset="return confirm('Do you want to reset the data?')">
<s:hidden name="productSetBean.smsFlgOUT" id="smsServicehid" value="Y" />


<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Edit Product Settings</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Edit Product Settings.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a></td>-->
<!--    </tr>-->
<!--</table>-->



<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Edit_Setings.jpg"  width="40" height="40"  /></div>
<p class="title">Edit Product Settings</p> 
 <a href="#"  onclick="javascript:onclickaction('editProdSetFrm','login.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Edit Product Settings.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
	<s:if test="%{retSucessMsg != ''}">
		<tr>
			<td colspan="2"><s:hidden name="retMsg" id="retMsg" /></td>
		</tr>
	</s:if>
	<s:if test="%{retMsg != '' && retMsg != 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Product Settings has been updated Successfully. <s:hidden
				name="retOppId" id="retOppId" /></div>
				</div>
			</td>
		</tr>
	</s:if>
	<s:if test="%{retMsg == 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err">Product Settings has not been changed Successfully. <s:hidden
				name="retBookId" id="retOppId" /></div>
				</div>
			</td>
		</tr> 
	</s:if>
	
	<tr>
		<td colspan="2">
		<div id="editProdSetFrm_errorloc" class="error_strings"></div>
		</td>
		<td>&nbsp;</td>
	</tr>
   	 
     <tr>
		<td>Email ID:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" cssStyle="width: 200px;" name="productSetBean.emailIdOUT"
			id="txtEmailID"  maxlength="200"/></td>
	</tr>
	<tr>
		<td>Email Password:<span class="mandi">*</span></td>
		<td><s:password theme="simple" cssStyle="width: 200px;"  name="productSetBean.emailPwdOUT"
			id="txtMailPassword" maxlength="200"/></td>
	</tr>
	<tr>
		<td>Confirm Email Password:<span class="mandi">*</span></td>
		<td><s:password theme="simple" cssStyle="width: 200px;"  name="txtConfMailPassword"
			id="txtConfMailPassword" maxlength="200"/></td>
	</tr>
<!-- 	<tr>
	 <s:hidden name="productSetBean.smsFlgOUT" id="smsServicehid" />
		<td>SMS Service:<span class="mandi">*</span></td>
		<td>Yes:<input type="radio" name="smsService" id="smsServiceY" value="Y" onclick="javascript:smsSerSel('Y');"/> 
		    No:<input type="radio" name="smsService" id="smsServiceN" value="N" onclick="javascript:smsSerSel('N');"/></td>
	</tr>  -->
	<tr>
	    <s:hidden name="productSetBean.emailFlgOUT" id="emailServicehid" />
		<td>Email Service:<span class="mandi">*</span></td>
		<td>Yes:<input type="radio" name="emailService" id="emailServiceY" value="Y" onclick="javascript:emailSerSel('Y');"/> 
		    No:<input type="radio" name="emailService" id="emailServiceN" value="N" onclick="javascript:emailSerSel('N');"/></td>
	</tr> 
	
	<tr>	
		<td colspan="2">
		    <!--  <div class="info"> This email id and password will be used for both EMAIL and SMS services. <br/>
			                 If you have not registered for SMS services with Mvayoo please disable SMS option. </div>-->
			<div class="info"> This email id and password will be used for EMAIL. <br/>
			                 </div>
		 </td>	
	</tr> 
	<tr>
		<td>&nbsp;</td>
		<td ><input type="submit" name="groovybtn1" class="groovybutton"
			value="Update"  onclick="javascript:statusMsg();"/> <input type="reset" name="groovybtn1"
			class="groovybutton" value="   Reset   " /></td>
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
	var frmvalidator = new Validator("editProdSetFrm");

	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	
	frmvalidator.addValidation("txtEmailID", "req",	"Please enter the Email ID");
	frmvalidator.addValidation("txtEmailID", "email",	"Please enter Valid Email ID");
	frmvalidator.addValidation("txtMailPassword", "req",	"Please enter the Email Password");
	frmvalidator.addValidation("txtConfMailPassword", "req",	"Please enter Confirm Email Password");
	frmvalidator.setAddnlValidationFunction(compPassProdSet);
	
	//frmvalidator.addValidation("smsService", "selone_radio",	"Please select SMS Service",true);
   frmvalidator.addValidation("emailService", "selone_radio","Please select E-Mail Service",true);
	

	//
</script>
</body>
</html>
