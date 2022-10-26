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
			 document.getElementById("activateLoader").style.display="inline";	
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
		
		 
		
	}
</script>

<style>
.err{
	color:#333;
	padding:1% 1% 1% 1%;
	width:20%;
	margin-top:10px;
	margin-bottom:5px;
	background:#ffa4aa;
	/*background:#ffa4aa url(../img/err.png) no-repeat left ;*/
	border:solid 1px #800000;
	display:inline-block;
	clear:both;
	font-weight:normal;
	font-size:12px;
	
}
</style>
	
</head>
<body>
<form name="getActivationFrm" id="getActivationFrm" method="post"  onsubmit="openLoader();">
 

<table width="50%" border="0"  align="center">
 
     <tr> 
         <td width="20%"> <div id="getActivationFrm_errorloc" class="error_strings"></div></td>
	</tr>
	<s:if test="%{retActErrMsg != 'ACTIVATION_FAIL'}">
		<tr>
			<td nowrap align="center"><font color="#5888C6"><b>Please Enter Activation Code ID:</b></font><br/>
			<s:textfield theme="simple"  value=""  id="activationCd" name="activationCd"/></td>
		</tr>
	    <tr>
		    <td align="center"> <input type="button" value="Submit" name="groovybtn1" class="groovybutton" 
		    onclick="javascript:onclickaction('getActivationFrm','checkActivationCode.action')"/></td>
	    </tr>
	    
	    
	    
	 </s:if>
	 
	 <s:if test="%{retActErrMsg == 'ACTIVATION_FAIL'}">
	    <tr>
			<td align="center" class="err" nowrap>
			<b>Activation Failure.<br/>
			 Internet Connection might be gone. Please check.<br/>
			 Please contact Sunrays Technology Solutions.</b></td>
		</tr>
	 </s:if>
	 <s:if test="%{retActErrMsg == 'ALREADY_ACTIVATED'}">
	    <tr>
			<td><font color="#5888C6"><b>Activation Failure.<br/> Product seems to be activated already.</b></font></td>
		</tr>
	 </s:if>
	 <tr>
	      <td colspan="2" align="center"> 
	       <div style="display: none;" id="activateLoader">
	             <img src="/loms/view/images/LomsLoader.gif"  />
	      </div>
	      </td>
	    </tr>
</table>
 
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("getActivationFrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("activationCd", "req", "Please enter Activation Code");


	//
</script>
</body>
 
</html>