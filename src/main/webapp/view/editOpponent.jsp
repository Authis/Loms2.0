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
function onclickaction(formname, actionname) {
	if (document.getElementById(formname)) {
		document.getElementById(formname).action = actionname;
		document.getElementById(formname).submit();
	}
}
	function popOnload() {

		if (document.getElementById("retEditvar").value) {

			document.getElementById("retEditvar").value = "";
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
<form id="editOppDet" name="editOppDet" action="editCaseOppSave.action"
	method="post">
 <s:hidden name="hidclientid" id="hidclientid" />
  <s:hidden name="txtCounter" id="txtCounter" value="1"/>
 
<s:hidden name="editoppDetailBean.oppId"  ></s:hidden>
<jsp:include page="topHeader.jsp" />
 

<div id="content">
<!--<h3>Edit Opponent</h3>-->
<!-- <table width="100%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Modify Opponent Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a></td>-->
<!--    </tr>-->
<!--</table>-->


 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Edit Opponent</p> 
 <a href="#" onclick="javascript:onclickaction('editOppDet','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Modify Opponent Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
<br />
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray">
	<s:if test="%{retEditvar != '' && retEditvar != 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Opponent has been modified Successfully. <s:hidden
				name="retEditvar" id="retEditvar" /></div>
				</div>
			</td>
		</tr>
	</s:if>
	<s:if test="%{retEditvar == 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err">Opponent has not been modified Successfully. <s:hidden
				name="retEditvar" id="retEditvar" /></div>
				</div>
			</td>
		</tr> 
	</s:if>


	<tr>
		<td colspan="2">
		<div id="editOppDet_errorloc" class="error_strings"></div>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>Client ID: 
		<s:textfield theme="simple"	name="editoppDetailBean.clientId" id="txtClientId" readonly="true"
			cssStyle="width: 200px;" /> 
			 </td>
	</tr>

	<tr>
		<td>Case ID:&nbsp;&nbsp;
		 <s:textfield theme="simple" name="editoppDetailBean.caseNo" id="txtCaseId" readonly="true"
			 cssStyle="width: 200px;" /> 
		
			</td>
	</tr>
	 
 
			<tr>
				<td>
				<fieldset><legend>Opp Part Detail:-</legend>
				<table width=100% colspan=1>
					<tr>
						<td>Opp Name :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyName"
							id="oppPartyName1" /></td>
					</tr>
					<tr>
						<td>Opp Mob No :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyMobNo"
							id="oppPartyMobNo1" /></td>
					</tr>
					<tr>
						<td>Opp Tel No :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyTelNo"
							id="oppPartyTelNo1" /></td>
					</tr>
					<tr>
						<td>Opp Email :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartEmailId"
							id="oppPartEmailId1" /></td>
					</tr>
					<tr>
						<td>Opp Address :</td>
						<td><s:textarea theme="simple" name="editoppDetailBean.oppPartyAddress"
							id="oppPartyAddress1" /></td>
					</tr>
				</table>
				</fieldset>
				</td>
				<td>
				<fieldset><legend>Opp Organization Detail:-</legend>
				<table width=100% colspan=1>
					<tr>
						<td>Org Name :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyOrgName"
							id="oppPartyOrgName1" /></td>
					</tr>
					<tr>
						<td>Org Mob No :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyOrgMobNo"
							id="oppPartyOrgMobNo1" /></td>
					</tr>
					<tr>
						<td>Org Tel No :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyOrgTelNo"
							id="oppPartyOrgTelNo1" /></td>
					</tr>
					<tr>
						<td>Org Email :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyOrgEmailId"
							id="oppPartyOrgEmailId1" /></td>
					</tr>
					<tr>
						<td>Org Rep :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyOrgRepName"
							id="oppPartyOrgRepName1" /></td>
					</tr>
					<tr>
						<td>Org Address :</td>
						<td><s:textarea theme="simple" name="editoppDetailBean.oppPartyOrgAddress"
							id="oppPartyOrgAddress1" /></td>
					</tr>
				</table>
				</fieldset>
				</td>
				<td>
				<fieldset><legend>Opp Lawyer Detail:-</legend>
				<table width=100% colspan=1>
					<tr>
						<td>Lawyer Name :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyLawyerName"
							id="oppPartyLawyerName1" /></td>
					</tr>
					<tr>
						<td>Lawyer Mob No :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyLawyerMobNo"
							id="oppPartyLawyerMobNo1" /></td>
					</tr>
					<tr>
						<td>Lawyer Tel No :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyLawyerTelNo"
							id="oppPartyLawyerTelNo1" /></td>
					</tr>
					<tr>
						<td>Lawyer Email :</td>
						<td><s:textfield theme="simple" name="editoppDetailBean.oppPartyLawyerEmailId"
							id="oppPartyLawyerEmailId1"  /></td>
					</tr>
					<tr>
						<td>Lawyer Address :</td>
						<td><s:textarea theme="simple" name="editoppDetailBean.oppPartyLawyerAddress"
							id="oppPartyLawyerAddress1" /></td>
					</tr>
				</table>
				</fieldset>
				</td>
			</tr>
		 


	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="groovybtn1" class="groovybutton"
			value="Save" onclick="javascript:statusMsg();"/> <input type="reset" name="groovybtn1"
			class="groovybutton" value="Reset"  /> 
			<input type="button" name="groovybtn1"
			class="groovybutton" value="Back" onclick="javascript:onclickaction('editOppDet','searchCaseInforesult.action')" /></td>
	</tr>

</table>

</div>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("editOppDet");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	frmvalidator.setAddnlValidationFunction(editOppCheck);

	//
</script>
</body>

</html>
