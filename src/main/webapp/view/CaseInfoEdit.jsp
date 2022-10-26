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
    <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtCaseHearDate"]);
		}
	</script>
 
<script>
function onclickaction(formname, actionname) {
	if (document.getElementById(formname)) {
		document.getElementById(formname).action = actionname;
		document.getElementById(formname).submit();
	}
}
	function addCaseInfo(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}

	function searchClientID() {

		var url = "searchClientID.action";
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');
		 
		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
	
	function searchCourtID(){
		var url = "searchCourtID.action";
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes'); 
		
	}
	function popOnload() {

		if (document.getElementById("retMsg").value != ""
				&& document.getElementById("retMsg").value != "E9999") {
			//alert("Case Info has been Updated Successfully.");
			document.getElementById("retMsg").value = "";
		}
	}
	 

		function casesubsubtype(){
	 
			var casesubType = document.getElementById("txtCaseSubType").value;
			if(casesubType == "APPEAL"){
				casesubType = "Appeal";
				 document.getElementById("subsubtype0").style.display = "inline";
				 document.getElementById("subsubtype1").style.display = "none";
				 document.getElementById("subsubtype2").style.display = "none";
				 document.getElementById("subsubtype3").style.display = "none";
				 document.getElementById("subsubtype4").style.display = "none";
			}
			if(casesubType == "EXECUTION"){
				casesubType = "Execution";
				 document.getElementById("subsubtype0").style.display = "none";
				 document.getElementById("subsubtype1").style.display = "inline";
				 document.getElementById("subsubtype2").style.display = "none";
				 document.getElementById("subsubtype3").style.display = "none";
				 document.getElementById("subsubtype4").style.display = "none";
			}
			if(casesubType == "PETITION"){
				casesubType = "Petition";
				 document.getElementById("subsubtype0").style.display = "none";
				 document.getElementById("subsubtype1").style.display = "none";
				 document.getElementById("subsubtype2").style.display = "inline";
				 document.getElementById("subsubtype3").style.display = "none";
				 document.getElementById("subsubtype4").style.display = "none";
			}
			if(casesubType == "SUIT"){
				casesubType = "Suit";
				 document.getElementById("subsubtype0").style.display = "none";
				 document.getElementById("subsubtype1").style.display = "none";
				 document.getElementById("subsubtype2").style.display = "none";
				 document.getElementById("subsubtype3").style.display = "inline";
				 document.getElementById("subsubtype4").style.display = "none";
			}
			if(casesubType == "CRIMINAL"){
				casesubType = "Criminal";
				 document.getElementById("subsubtype0").style.display = "none";
				 document.getElementById("subsubtype1").style.display = "none";
				 document.getElementById("subsubtype2").style.display = "none";
				 document.getElementById("subsubtype3").style.display = "none";
				 document.getElementById("subsubtype4").style.display = "inline";
			}
			
			var casesubtype = casesubType +" Type :";	
			 
			document.getElementById("casesubtype").innerHTML = casesubtype;
			 
		  }
 
</script>

</head>
<body
	onload="javascript:casesubsubtype();doOnLoad();popOnload();">
<form id="addcaseinfofrm" name="addcaseinfofrm"
	action="editCaseInfoSave.action" method="post"
	onreset="return confirm('Do you want to reset the data?')"> 
 
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Edit Case Info</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Modify Case Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('addcaseinfofrm','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->


 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Edit Case Information</p> 
 <a href="#" onclick="javascript:onclickaction('addcaseinfofrm','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Modify Case Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>
       
<div class="mandatory" align="right"><span class="mandi">*</span>Marked
fields are Mandatory</div>
<br />
<table border="0" width="100%" style="border-color: gray">
	<s:if test="%{retMsg != ''}">
		<tr>
			<td colspan="4"><div class="succ">Case Info has been Updated Successfully.<s:hidden name="retMsg" id="retMsg" /></div></td>
		</tr>
	</s:if>
	<tr>
		<td>
		<div id="addcaseinfofrm_errorloc" class="error_strings"></div>
		</td>
		<td align="right"></td>
		<td align="right"></td>
		<td align="right"></td>
	</tr>

	<tr>
		<td>
		<fieldset><legend><b>Client ID:</b></legend>
		<table border="0" width="157%" style="border-color: gray" cellpadding="10" cellspacing="10">	 
			
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Case ID:</td>
				<td><s:textfield theme="simple" readonly="true"
					name="editCaseBean.caseid" id="txtCaseId" cssStyle="width:200px;"></s:textfield></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Client ID:</td>
				<td><s:textfield readonly="true" theme="simple"
					name="editCaseBean.clientid" id="txtClientId"
					cssStyle="width:200px;"></s:textfield></td>
			</tr>
			
 		</table>
		</fieldset>
		</td>
 
	</tr>
	
<tr><td>&nbsp;</td></tr>
<tr>
<td colspan="2">
<fieldset><legend><b>Case Detail :</b></legend>
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
<tr>
		 	 
	<td>&nbsp;&nbsp;&nbsp;Case Type:<span class="mandi">*</span></td>
	<td><s:select theme="simple" name="editCaseBean.casetype"
		id="txtCaseType" headerValue="Select Case Type" headerKey=""
		list="retCaseType" cssStyle="width:200px;"></s:select></td>

	<td>Case Sub Type:<span class="mandi">*</span></td>
	<td><s:select
		theme="simple" name="editCaseBean.casesubtype1" id="txtCaseSubType" onchange="javascript:casesubsubtype();"
		cssStyle="width: 200px;"  
		list="#{'':'Select Case Type','APPEAL':'APPEAL', 'EXECUTION':'EXECUTION', 'PETITION':'PETITION', 'SUIT':'SUIT','CRIMINAL':'CRIMINAL'}"></s:select>
	</td>
	
	<td><div id="casesubtype"></div></td>
	
	<td>
	<div id="subsubtype0" style="display: inline;">
	    <s:select theme="simple" name="editCaseBean.casesubtype2"
		headerValue="Select Appeal Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[0]" cssStyle="width:200px;"></s:select>
	</div>
	<div id="subsubtype1" style="display: none;">
		<s:select theme="simple" name="editCaseBean.casesubtype2"
		headerValue="Select Execution Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[1]" cssStyle="width:200px;"></s:select>
    </div>
    <div id="subsubtype2" style="display: none;">
		<s:select theme="simple" name="editCaseBean.casesubtype2"
		headerValue="Select Petition Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[2]" cssStyle="width:200px;"></s:select>
    </div>
    <div id="subsubtype3" style="display: none;">
		<s:select theme="simple" name="editCaseBean.casesubtype2"
		headerValue="Select Suit Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[3]" cssStyle="width:200px;"></s:select>
	</div>
	<div id="subsubtype4" style="display: none;">
		<s:select theme="simple" name="editCaseBean.casesubtype2"
		headerValue="Select Criminal Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[4]" cssStyle="width:200px;"></s:select> 
    </div>
	</td>
	
		
		
</tr>
<tr>	
 <td>&nbsp;&nbsp;&nbsp;Case No:<span class="mandi">*</span></td> <td><s:textfield theme="simple" name="editCaseBean.Caseno1" id="txtcaseNo1" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>
 
</tr> 
 </table> 
</fieldset>
</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td>
<fieldset><legend><b>Reference Case Nos :</b></legend> 
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
<tr>	
 
 <td>&nbsp;&nbsp;&nbsp;Ref Case No 1:</td> <td><s:textfield theme="simple" name="editCaseBean.Caseno2" id="txtcaseNo2" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>
 <td>Ref Case No 2:</td> <td><s:textfield theme="simple" name="editCaseBean.Caseno3" id="txtcaseNo3" maxlength="100" cssStyle="width: 200px;"> </s:textfield> </td> 	
 <td>Ref Case No 3:</td> <td><s:textfield theme="simple" name="editCaseBean.Caseno4" id="txtcaseNo4" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>
</tr> 
<tr> 
 <td>&nbsp;&nbsp;&nbsp;Ref Case No 4:</td> <td><s:textfield theme="simple" name="editCaseBean.Caseno5" id="txtcaseNo5" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>
 <td>Ref Case No 5:</td> <td><s:textfield theme="simple" name="editCaseBean.Caseno6" id="txtcaseNo6" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>
  <td>&nbsp;</td> 	
</tr> 
 </table> 

</fieldset>
</td>
</tr> 
<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
		<fieldset><legend><b>Case Detail:</b></legend>
		<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Case Priority:<span class="mandi">*</span></td>
				<td><s:select theme="simple" name="editCaseBean.casepriority"
					id="txtCasePriority" headerValue="Select Case Priority"
					headerKey="" list="retCasePriority" cssStyle="width:200px;"></s:select>

				</td>
				<td>Court Detail:<span class="mandi">*</span></td>
				<td><s:textfield theme="simple" name="editCaseBean.courtdetails"
					id="txtCourtDetails" cssStyle="width: 200px;" readonly="true"/> <a
					onclick="javascript:searchCourtID();"  ><img
					src="/loms/view/images/Search.png" width="25" height="20"
					alt="Search Client ID" /></a></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Case Status:<span class="mandi">*</span></td>
				<td><s:select theme="simple" name="editCaseBean.casestatus"
					id="txtCaseStatus" headerValue="Select Case Priority" headerKey=""
					list="retCaseStatus" cssStyle="width:200px;"></s:select></td>
				<td>judgment Date: </td>
				<td><s:textfield theme="simple" name="editCaseBean.caseJudgmentdate"
					id="txtCaseHearDate" cssStyle="width: 200px;" readonly="true" />  </td>
			</tr>

			<tr>
				<td>&nbsp;&nbsp;&nbsp;Comments:</td>
				<td colspan="5"><s:textarea  theme="simple"
					name="editCaseBean.comments" id="txtComment" cssStyle="width:200px;"></s:textarea></td>
			</tr>
 		</table>
		</fieldset>
		</td>
	</tr>
<tr><td>&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>

     <tr align="center">
     
		<td >
		 <input type="submit" name="groovybtn1" class="groovybutton" value=" Update Case " /> 
		 <input type="reset" name="groovybtn1" class="groovybutton" value="Reset"   />
		 <input type="button" name="groovybtn1" class="groovybutton" value="Back" onclick="javascript:onclickaction('addcaseinfofrm','searchCaseInforesult.action')" />
		</td>
		
	 
	</tr>

	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
</table>
</div>
</div>
<jsp:include page="Footer.jsp" />

</form>
</body>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("addcaseinfofrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
 
	frmvalidator.addValidation("txtClientId", "req","Client ID cannot be blank"); 
	frmvalidator.addValidation("txtClientId", "alpha_num","Client ID can contain only numbers");
	frmvalidator.addValidation("txtCaseType", "req","Case Type cannot be blank");	
	frmvalidator.addValidation("txtCaseType", "alpha_s","Case Type can contain only letters");	
	frmvalidator.addValidation("txtCaseSubType", "req",	"Case Sub Type cannot be blank");	
 	
	frmvalidator.addValidation("txtCourtDetails", "req","Court Detail cannot be blank");
	frmvalidator.addValidation("txtCasePriority", "req","Case Priority cannot be blank");
	frmvalidator.addValidation("txtCaseStatus", "req","Case Status cannot be blank");
	frmvalidator.addValidation("txtcaseNo1", "req","Please enter atleast one Case No and Case No:1 cannot be blank");
	frmvalidator.addValidation("txtcaseNo1","alpha_addr","Case No #1 can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");	
	frmvalidator.addValidation("txtcaseNo2","alpha_addr","Case No #2 can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");	
	frmvalidator.addValidation("txtcaseNo3","alpha_addr","Case No #3 can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");	
	frmvalidator.addValidation("txtcaseNo4","alpha_addr","Case No #4 can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");	
	frmvalidator.addValidation("txtcaseNo5","alpha_addr","Case No #5 can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");	
	frmvalidator.addValidation("txtcaseNo6","alpha_addr","Case No #6 can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");	
	frmvalidator.addValidation("txtComment", "maxlen=4000","Comments cannot exceed 4000 characters"); 
	frmvalidator.setAddnlValidationFunction(casTypeSel);
	//
</script>
</html>
