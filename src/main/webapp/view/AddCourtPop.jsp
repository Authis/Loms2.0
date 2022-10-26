<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script language="javascript" type="text/javascript"
	src="/loms/view/js/rakshaval.js"></script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
	function addCourtInfo(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	function popOnload() {
		if (document.getElementById("retCourtID").value) {
			//alert("Court Detail has been Added Successfully");
			document.getElementById("retCourtID").value = "";
		}
	}
	function onclickaction(formname, actionname) {
		document.getElementById("hidTxtState").value = document.getElementById("txtCourtState").value;
		 
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	function frmClearVal(){
		
	
		
		if(confirm("Do you want to reset the data?")){
			document.getElementById("txtCourtName").value = "";
			document.getElementById("txtCourtType").value = "";
			document.getElementById("txtCourtAddress").value = "";
			document.getElementById("txtCourtCity").value = "";
			document.getElementById("txtCourtState").value = "";
			document.getElementById("txtCourtDistrict").value = "";
			document.getElementById("txtCourtCountry").value = "";	 
			document.getElementById("txtComments").value = "";	  
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
	onload="javascript:popOnload();">
<form id="addcourtinfo" name="addcourtinfo"
	action="addCourtInfoPopSave.action" method="post">
	<s:hidden id="hidTxtState" name="hidTxtState"/> 
 

 

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
 <br/>
 <br/>
<div class="mandatory" align="right"><span class="mandi">*</span>Marked
fields are Mandatory</div>
<h3>Add Court Information</h3>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="50%"  style="border-color: gray">
	<s:if test="%{retCourtID != '' && retCourtID != 'E9999' }">
		<tr>
			<td colspan="4"><div id="statusMsg1" style="display: inline;" >
			<div class="succ">Court Detail has been Added Successfully. <input type="hidden" name="retCourtID" id="retCourtID" />
			</div></div></td>
		</tr>
	</s:if>
	
	<s:if test="%{retCourtID == 'E9999'}">
        <tr>
      
			<td colspan="4">
			  <div id="statusMsg2" style="display: inline;" >
			   <div class="err">Court Detail has not been Added Successfully. <input type="hidden" name="retCourtID" id="retCourtID" />
			</div>
			</div>
			</td>
    
		</tr>
      
	</s:if>
	<tr>
		<td colspan="4">
		<div id="addcourtinfo_errorloc" class="error_strings"></div>
		</td>

	</tr>
	<tr>
		<td>Court Name:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addCourtInfoBean.courtname"
			id="txtCourtName" maxlength="100" /></td>
	</tr>
	<tr>
		<td>Court Type:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addCourtInfoBean.courttype"
			id="txtCourtType" maxlength="100" /></td>
	</tr>
	<tr>
		<td>Court Address:</td>
		<td><s:textarea theme="simple"
			name="addCourtInfoBean.courtaddress" id="txtCourtAddress" /></td>
	</tr>
	<tr>
		<td>Court City:</td>
		<td><s:textfield theme="simple" name="addCourtInfoBean.courtcity" 
			id="txtCourtCity" maxlength="50"/></td>
	</tr>
	<tr>
		<td>Court State:<span class="mandi">*</span></td>
		<td><s:select theme="simple" name="addCourtInfoBean.courtstate" id="txtCourtState"
			headerValue="Select State" headerKey="" list="stateName"
			cssStyle="width:200px;" onchange="javascript:onclickaction('addcourtinfo','addstdcrtinfoDisSelPop.action');"></s:select></td>
	</tr>
	<tr>
		<td>Court District:<span class="mandi">*</span></td>
		<td> 
			<s:select theme="simple" name="addCourtInfoBean.courtdist" id="txtCourtDistrict"
			headerValue="Select District" headerKey="" list="disName"
			cssStyle="width:200px;" ></s:select>
			</td>
	</tr>

	<tr>
		<td>Court Country:</td>
		<td><s:textfield theme="simple"
			name="addCourtInfoBean.courtcountry" id="txtCourtCountry" maxlength="50"/></td>
	</tr>
	<tr>
		<td>Comments:</td>
		<td><s:textarea theme="simple" name="addCourtInfoBean.comments"
			id="txtComments" /></td>
	</tr>

	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="groovybtn1" class="groovybutton"
			value="Add"  onclick="javascript:statusMsg();"/> <input type="button" name="groovybtn1"
			class="groovybutton" value="Reset" onclick="javascript:frmClearVal();"/></td>
	</tr>

	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
</table>
 
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("addcourtinfo");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("txtCourtName", "req", "Court Name cannot be blank");
	frmvalidator.addValidation("txtCourtType", "req", "Court Type cannot be blank");	
	frmvalidator.addValidation("txtCourtCity", "alpha_s","Court City can contain only letters");
	frmvalidator.addValidation("txtCourtAddress", "maxlen=1000","Court Address cannot exceed 1000 characters"); 	
	frmvalidator.addValidation("txtComments", "maxlen=1000","Comments cannot exceed 1000 characters"); 
	frmvalidator.addValidation("txtCourtState", "req","Court State cannot be blank");
	frmvalidator.addValidation("txtCourtDistrict", "req","Court District cannot be blank");	 
	frmvalidator.addValidation("txtCourtCountry", "alpha_s","Court Country can contain only letters");
	frmvalidator.addValidation("txtCourtName","alpha_court","Court Name can contain only letters,numbers, hyphen(-) and ampersand(&)");	
	frmvalidator.addValidation("txtCourtType","alpha_court","Court Type can contain only letters,numbers, hyphen(-) and ampersand(&)");		
	frmvalidator.addValidation("txtCourtAddress","alpha_addr","Court Address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");	
	//
</script>
</body>

</html>
