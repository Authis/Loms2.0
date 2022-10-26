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

		if (document.getElementById("retOppId").value) {

			document.getElementById("retOppId").value = "";
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
<form id="addcaseinfofrm" name="addcaseinfofrm" action="addCaseOppSave.action"
	method="post">
 <s:hidden name="txtCounter" id="txtCounter" value="1"></s:hidden>

<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Add Opponent</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Opponent Information.pdf" target="_blank">-->
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
<p class="title">Add Opponent</p> 
 <a href="#" onclick="javascript:onclickaction('addcaseinfofrm','caseManagement.action')"><div class="back"> </div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Opponent Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>

 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
<br />
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
	<s:if test="%{retOppId != '' && retOppId != 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Opponent has been added Successfully. <s:hidden
				name="retOppId" id="retOppId" /></div>
				</div>
			</td>
		</tr>
	</s:if>
	<s:if test="%{retOppId == 'E9999'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err">Opponent has not been added Successfully. <s:hidden
				name="retBookId" id="retOppId" /></div>
				</div>
			</td>
		</tr> 
	</s:if>


	<tr>
		<td colspan="2">
		<div id="addcaseinfofrm_errorloc" class="error_strings"></div>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>Client ID:<span class="mandi">*</span></td>
		<td nowrap  colspan="3">
		<s:textfield theme="simple"	name="hidcaseid" id="txtClientId" readonly="true"
			cssStyle="width: 200px;" ></s:textfield>  
			 </td>
	</tr>

	<tr>
		<td>Case ID:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="hidclientid" readonly="true"
			id="txtCaseId" cssStyle="width: 200px;" ></s:textfield>   
		
			</td>
	</tr>

 
			<tr>
				<td>
				<fieldset><legend>Opp Part Detail:-</legend>
				<table width=100% cellpadding="10" cellspacing="10">
					<tr>
						<td>Opp Name :</td>
						<td><input type=text name=oppDetailBean.oppPartyName
							id=oppPartyName1 /></td>
					</tr>
					<tr>
						<td>Opp Mob No :</td>
						<td><input type=text name=oppDetailBean.oppPartyMobNo
							id=oppPartyMobNo1 /></td>
					</tr>
					<tr>
						<td>Opp Tel No :</td>
						<td><input type=text name=oppDetailBean.oppPartyTelNo
							id=oppPartyTelNo1 /></td>
					</tr>
					<tr>
						<td>Opp Email :</td>
						<td><input type=text name=oppDetailBean.oppPartEmailId
							id=oppPartEmailId1 /></td>
					</tr>
					<tr>
						<td>Opp Address :</td>
						<td><textarea name=oppDetailBean.oppPartyAddress
							id=oppPartyAddress1 ></textarea></td>
					</tr>
				</table>
				</fieldset>
				</td>
				<td>
				<fieldset><legend>Opp Organization Detail:-</legend>
				<table width=100% cellpadding="10" cellspacing="10">
					<tr>
						<td>Org Name :</td>
						<td><input type=text name=oppDetailBean.oppPartyOrgName
							id=oppPartyOrgName1 /></td>
					</tr>
					<tr>
						<td>Org Mob No :</td>
						<td><input type=text name=oppDetailBean.oppPartyOrgMobNo
							id=oppPartyOrgMobNo1 /></td>
					</tr>
					<tr>
						<td>Org Tel No :</td>
						<td><input type=text name=oppDetailBean.oppPartyOrgTelNo
							id=oppPartyOrgTelNo1 /></td>
					</tr>
					<tr>
						<td>Org Email :</td>
						<td><input type=text name=oppDetailBean.oppPartyOrgEmailId
							id=oppPartyOrgEmailId1 /></td>
					</tr>
					<tr>
						<td>Org Rep :</td>
						<td><input type=text name=oppDetailBean.oppPartyOrgRepName
							id=oppPartyOrgRepName1 /></td>
					</tr>
					<tr>
						<td>Org Address :</td>
						<td><textarea name=oppDetailBean.oppPartyOrgAddress
							id=oppPartyOrgAddress1 ></textarea></td>
					</tr>
				</table>
				</fieldset>
				</td>
				<td>
				<fieldset><legend>Opp Lawyer Detail:-</legend>
				<table width=100% cellpadding="10" cellspacing="10">
					<tr>
						<td>Lawyer Name :</td>
						<td><input type=text name=oppDetailBean.oppPartyLawyerName
							id=oppPartyLawyerName1 /></td>
					</tr>
					<tr>
						<td>Lawyer Mob No :</td>
						<td><input type=text name=oppDetailBean.oppPartyLawyerMobNo
							id=oppPartyLawyerMobNo1 /></td>
					</tr>
					<tr>
						<td>Lawyer Tel No :</td>
						<td><input type=text name=oppDetailBean.oppPartyLawyerTelNo
							id=oppPartyLawyerTelNo1 /></td>
					</tr>
					<tr>
						<td>Lawyer Email :</td>
						<td><input type=text name=oppDetailBean.oppPartyLawyerEmailId
							id=oppPartyLawyerEmailId1  /></td>
					</tr>
					<tr>
						<td>Lawyer Address :</td>
						<td><textarea name=oppDetailBean.oppPartyLawyerAddress
							id=oppPartyLawyerAddress1 ></textarea></td>
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
			value="Add Opponent" onclick="javascript:statusMsg();" />
			 <input type="reset" name="groovybtn1" class="groovybutton" value="   Reset   " onclick="" />
			 <input type="button" name="groovybtn1" class="groovybutton" value="Back" onclick="javascript:onclickaction('addcaseinfofrm','searchCaseInforesult.action')" />
			 </td>
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
	frmvalidator.setAddnlValidationFunction(addOppCheck);

	//
</script>
</body>

</html>
