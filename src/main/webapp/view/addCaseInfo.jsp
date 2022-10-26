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
  
  
function genarateTextBox()
{
 
var count = document.getElementById("txtCounter").value;
 if(count > 5){   // Opponent Count can be change here
 alert("Please enter 5 or Less then values");
 return false;
 }
 var str="";
for(var i = 1; i <= count ; i++)
{
  str = str + '<fieldset><legend>Opponent Details#'+i+':-</legend><table width=100% ><tr><td><fieldset><legend>Opp Part Detail:-</legend><table width=100% colspan=1  > <tr> <td>Opp Name   :</td> <td><input type=text name=oppDetailBean.oppPartyName id=oppPartyName'+i+' maxlength=100 /></td> </tr>	<tr> <td>Opp Mob No   : </td> <td><input type=text name=oppDetailBean.oppPartyMobNo id=oppPartyMobNo'+i+'  maxlength=20 /></td> </tr><tr> <td>Opp Tel No   : </td>			 <td><input type=text name=oppDetailBean.oppPartyTelNo   id=oppPartyTelNo'+i+'  maxlength=20/></td> </tr>	<tr><td>Opp Email  : </td> <td><input type=text name=oppDetailBean.oppPartEmailId id=oppPartEmailId'+i+'  maxlength=100/></td> </tr><tr> <td>Opp Address   : </td> <td><textarea name=oppDetailBean.oppPartyAddress id=oppPartyAddress'+i+' ></textarea></td>   </tr> </table></fieldset> </td> <td><fieldset>  <legend>Opp Organization Detail:-</legend>		 <table width=100% colspan=1  >  <tr> <td>Org Name   : </td> <td><input type=text name=oppDetailBean.oppPartyOrgName id=oppPartyOrgName'+i+'  maxlength=100/></td> </tr><tr><td>Org Mob No   : </td> <td><input type=text name=oppDetailBean.oppPartyOrgMobNo id=oppPartyOrgMobNo'+i+'  maxlength=20></td>  </tr><tr> <td>Org Tel No   : </td> <td><input type=text name=oppDetailBean.oppPartyOrgTelNo id=oppPartyOrgTelNo'+i+'  maxlength=20/></td> </tr><tr> <td>Org Email  : </td><td><input type=text name=oppDetailBean.oppPartyOrgEmailId id=oppPartyOrgEmailId'+i+'  maxlength=100/></td>  </tr><tr> <td>Org Rep  : </td><td><input type=text name=oppDetailBean.oppPartyOrgRepName id=oppPartyOrgRepName'+i+'  maxlength=100/></td>  </tr><tr> <td>Org Address   : </td>			 <td><textarea name=oppDetailBean.oppPartyOrgAddress id=oppPartyOrgAddress'+i+' ></textarea></td>  </tr></table></fieldset></td><td><fieldset>	   <legend>Opp Lawyer Detail:-</legend><table width=100% colspan=1  > <tr><td>Lawyer Name   : </td><td><input type=text name=oppDetailBean.oppPartyLawyerName id=oppPartyLawyerName'+i+'  maxlength=100/></td> </tr><tr> <td>Lawyer Mob No   : </td><td><input type=text name=oppDetailBean.oppPartyLawyerMobNo id=oppPartyLawyerMobNo'+i+'  maxlength=20/></td> </tr><tr><td>Lawyer Tel No  : </td> <td><input type=text name=oppDetailBean.oppPartyLawyerTelNo id=oppPartyLawyerTelNo'+i+'  maxlength=20 /></td> </tr><tr><td>Lawyer Email  :  </td><td><input type=text name=oppDetailBean.oppPartyLawyerEmailId id=oppPartyLawyerEmailId'+i+'  maxlength=100 ></td> </tr><tr><td>Lawyer Address   : </td><td><textarea name=oppDetailBean.oppPartyLawyerAddress id=oppPartyLawyerAddress'+i+' ></textarea></td></tr></table> </fieldset></td></tr></table></fieldset>' ;
}
document.getElementById("testdiv").innerHTML = str;
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
		
		//document.getElementById("txtClientId").value = "";		
		document.getElementById("txtCaseType").value = "";
		document.getElementById("txtCaseSubType").value = "";
		document.getElementById("txtSuitType").value = "";		
		document.getElementById("txtCounter").value = "0";
		document.getElementById("txtcaseNo1").value = "";
		document.getElementById("txtcaseNo2").value = "";
		document.getElementById("txtcaseNo3").value = "";
		document.getElementById("txtcaseNo4").value = "";
		document.getElementById("txtcaseNo5").value = "";		
		document.getElementById("txtcaseNo6").value = "";		
 		document.getElementById("txtCasePriority").value = "";		
		document.getElementById("txtCourtDetails").value = "";
		document.getElementById("txtCaseStatus").value = "";
		document.getElementById("txtCaseHearDate").value = "";
		document.getElementById("txtComment").value = ""; 
		
		if (document.getElementById("caseId").value) {
		//	alert("Case Info has been added Successfully \nCase ID is "
					//+ document.getElementById("caseId").value);
			document.getElementById("caseId").value = "";
		}
	}
	  
	function casesubsubtype(){
		/*if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		} */
		var casesubType = "";
		  casesubType = document.getElementById("txtCaseSubType").value;
	  
	 
	 if(casesubType == ""){
			casesubType = "";			
			 document.getElementById("subsubtype0").style.display = "inline";
			 document.getElementById("subsubtype1").style.display = "none";
			 document.getElementById("subsubtype2").style.display = "none";
			 document.getElementById("subsubtype3").style.display = "none";
			 document.getElementById("subsubtype4").style.display = "none";
			 document.getElementById("subsubtype5").style.display = "none";
		}	 
		if(casesubType == "APPEAL"){
			casesubType = "Appeal";
			 document.getElementById("subsubtype0").style.display = "none";
			 document.getElementById("subsubtype1").style.display = "inline";
			 document.getElementById("subsubtype2").style.display = "none";
			 document.getElementById("subsubtype3").style.display = "none";
			 document.getElementById("subsubtype4").style.display = "none";
			 document.getElementById("subsubtype5").style.display = "none";
		}
		if(casesubType == "EXECUTION"){
			casesubType = "Execution";
			 document.getElementById("subsubtype0").style.display = "none";
			 document.getElementById("subsubtype1").style.display = "none";
			 document.getElementById("subsubtype2").style.display = "inline";
			 document.getElementById("subsubtype3").style.display = "none";
			 document.getElementById("subsubtype4").style.display = "none";
			 document.getElementById("subsubtype5").style.display = "none";
		}
		if(casesubType == "PETITION"){
			casesubType = "Petition";
			document.getElementById("subsubtype0").style.display = "none";
			 document.getElementById("subsubtype1").style.display = "none";
			 document.getElementById("subsubtype2").style.display = "none";
			 document.getElementById("subsubtype3").style.display = "inline";
			 document.getElementById("subsubtype4").style.display = "none";
			 document.getElementById("subsubtype5").style.display = "none";
		}
		if(casesubType == "SUIT"){
			casesubType = "Suit";
			document.getElementById("subsubtype0").style.display = "none";
			 document.getElementById("subsubtype1").style.display = "none";
			 document.getElementById("subsubtype2").style.display = "none";
			 document.getElementById("subsubtype3").style.display = "none";
			 document.getElementById("subsubtype4").style.display = "inline";
			 document.getElementById("subsubtype5").style.display = "none";
		}
		if(casesubType == "CRIMINAL"){
			casesubType = "Criminal";
			document.getElementById("subsubtype0").style.display = "none";
			 document.getElementById("subsubtype1").style.display = "none";
			 document.getElementById("subsubtype2").style.display = "none";
			 document.getElementById("subsubtype3").style.display = "none";
			 document.getElementById("subsubtype4").style.display = "none";
			 document.getElementById("subsubtype5").style.display = "inline";
		}
		
		var casesubtype = casesubType +" Type :";	
		 
		document.getElementById("casesubtype").innerHTML = casesubtype;
		 
		 
	 
		
		 
	  }
	
	function frmClearVal(){
		
		var conf = confirm('Do you want to reset the data?');
		if(conf){		
		
		document.getElementById("txtClientId").value = "";		
		document.getElementById("txtCaseType").value = "";
		document.getElementById("txtCaseSubType").value = "";
		document.getElementById("txtSuitType").value = "";		
		document.getElementById("txtCounter").value = "0";
		document.getElementById("txtcaseNo1").value = "";
		document.getElementById("txtcaseNo2").value = "";
		document.getElementById("txtcaseNo3").value = "";
		document.getElementById("txtcaseNo4").value = "";
		document.getElementById("txtcaseNo5").value = "";		
		document.getElementById("txtcaseNo6").value = "";		
 		document.getElementById("txtCasePriority").value = "";		
		document.getElementById("txtCourtDetails").value = "";
		document.getElementById("txtCaseStatus").value = "";
		document.getElementById("txtCaseHearDate").value = "";
		document.getElementById("txtComment").value = ""; 
		}
	}
	 function statusMsg(){
			
		 document.getElementById("statusMsg1").style.display = "none";
		 document.getElementById("statusMsg2").style.display = "none";
		 
	} 
	 
		function goToAddCase(formname, actionname){
			if (document.getElementById(formname)) {		 
				 
				document.getElementById(formname).action = actionname;
				document.getElementById(formname).submit();

			}
			
		}
		
		  
		  function receiveDataFromPopup(actionname,formname){
			 alert("hi : "+actionname);
			 	//if(document.getElementById(formname)){	
			 		alert("hi in: "+actionname);
			 		 document.getElementById("addcaseinfofrm").action=actionname;		
			 		 document.getElementById("addcaseinfofrm").submit();	
			 	//}
			  
		  }
</script>

</head>
<body
	onload="javascript:casesubsubtype();doOnLoad();popOnload();">
<form id="addcaseinfofrm" name="addcaseinfofrm"
	action="addCaseInfoSave.action" method="post">
	 
 
<jsp:include page="topHeader.jsp" />


<div style="padding:0px 10px; width:100%;">

 <div id="content">
<!--<h3>Add Case Info</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Case Information.pdf" target="_blank">-->
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
<p class="title">Add Case Info</p> 
 <a href="#" onclick="javascript:onclickaction('addcaseinfofrm','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Case Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


<div class="mandatory" align="right"><span class="mandi">*</span>Marked
fields are Mandatory</div>
<br />
<table border="0" width="100%" style="border-color: gray">
	<s:if test="%{caseId != 'E9999' && caseId != '' && mailErrorStr != 'notSent'}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Case Info has been added Successfully for the Client ID <s:property value="hidclientid" id="hidclientid" />   Case ID
			is <s:property value="hidcaseid" id="hidcaseid" /> <s:hidden name="hidcaseid"
				id="hidcaseid" /> <s:hidden name="hidclientid"
				id="hidclientid" /> <b>
				<a href="#" onclick="javascript:goToAddCase('addcaseinfofrm','addcaseHear.action');" >Click here to Add Case Hearing</a></b> 
				</div>
				</div>
			</td>
		</tr>
	</s:if>
	<s:if test="%{caseId != 'E9999' && caseId != ''  && mailErrorStr == 'notSent'}">
		<tr>
			<td colspan="3">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Case Info has been added Successfully for the Client ID <s:property value="hidclientid" id="hidclientid" />   Case ID
			is <s:property value="hidcaseid" id="hidcaseid" /> <s:hidden name="hidcaseid"
				id="hidcaseid" /> <s:hidden name="hidclientid"
				id="hidclientid" /> 
			  <b><a href="#" onclick="javascript:goToAddCase('addcaseinfofrm','addcaseHear.action');" >Click here to Add Case Hearing</a></b>	 	
				 <font color="red" >Note: Email has not been sent to the Client due to Internet Problem</font>
				
				 </div>
			 </div>
			</td>


		</tr>

	</s:if>
	
	
	<s:if test="%{caseId == 'E9999' }">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err">Case Info has not added Successfully</div>
				</div>
			</td>
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
		<table border="0" width="157%" style="border-color: gray">
			<tr>
				<td >&nbsp;&nbsp;&nbsp;Client ID:<span class="mandi">*</span></td>
				<td><s:textfield theme="simple" name="addCaseBean.clientid" 
					 id="txtClientId" cssStyle="width: 200px;" maxlength="8"></s:textfield> <a
					onclick="javascript:searchClientID('addcaseinfofrm', 'newcase.action');"><img
					src="/loms/view/images/Search.png" width="25" height="20"
					alt="Search Client ID"  /></a><s:textfield theme="simple" id="txtName" 
					cssStyle="border:2px solid white;" readonly="true" /></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
		</table>
		
		</fieldset>
		
		</td>
 
	</tr>
	<tr><td>&nbsp;</td></tr>

<tr>
<td colspan="2">
<fieldset  ><legend ><b>Case Detail :</b></legend>
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
<tr>
		 	 
	<td> &nbsp;&nbsp;&nbsp;Case Type:<span class="mandi">*</span></td>
	<td><s:select theme="simple" name="addCaseBean.casetype"
		id="txtCaseType" headerValue="Select Case Type" headerKey=""
		list="retCaseType" cssStyle="width:200px;"
	 ></s:select></td>

	<td>Case Sub Type:<span class="mandi">*</span></td>
	<td><s:select
		theme="simple" name="addCaseBean.casesubtype1" id="txtCaseSubType" onchange="javascript:casesubsubtype();"
		cssStyle="width: 200px;"  
		list="#{'':'Select Case Type','APPEAL':'APPEAL', 'EXECUTION':'EXECUTION', 'PETITION':'PETITION', 'SUIT':'SUIT','CRIMINAL':'CRIMINAL'}"></s:select>
	</td>
	
	<td><div id="casesubtype"></div></td>	
	 		 
	<td>	
	<div id="subsubtype0" style="display: inline;">
	    <s:select theme="simple"  
		headerValue="Select Case Sub Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[0]" cssStyle="width:200px;"></s:select>
	</div>	
	<div id="subsubtype1" style="display: inline;">
	    <s:select theme="simple" name="addCaseBean.casesubtype2"
		headerValue="Select Appeal Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[1]" cssStyle="width:200px;"></s:select>
	</div>
	<div id="subsubtype2" style="display: none;">
		<s:select theme="simple" name="addCaseBean.casesubtype2"
		headerValue="Select Execution Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[2]" cssStyle="width:200px;"></s:select>
    </div>
    <div id="subsubtype3" style="display: none;">
		<s:select theme="simple" name="addCaseBean.casesubtype2"
		headerValue="Select Petition Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[3]" cssStyle="width:200px;"></s:select>
    </div>
    <div id="subsubtype4" style="display: none;">
		<s:select theme="simple" name="addCaseBean.casesubtype2"
		headerValue="Select Suit Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[4]" cssStyle="width:200px;"></s:select>
	</div>
	<div id="subsubtype5" style="display: none;">
		<s:select theme="simple" name="addCaseBean.casesubtype2"
		headerValue="Select Criminal Type" headerKey="" id="txtSuitType" 
		list="retCivilSuiteType[5]" cssStyle="width:200px;"></s:select> 
    </div>
	</td>
		
		 
		 
</tr>
<tr>	
 <td>&nbsp;&nbsp;&nbsp;Case No:<span class="mandi">*</span></td> <td><s:textfield theme="simple" name="addCaseBean.Caseno1" id="txtcaseNo1" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>

</tr> 
 
</table> 
</fieldset>
</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td>
<fieldset><legend><b>&nbsp;&nbsp;&nbsp;Reference Case Numbers :</b></legend> 
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
<tr>	
 <td>&nbsp;&nbsp;&nbsp;Ref Case No 1:</td> <td><s:textfield theme="simple" name="addCaseBean.Caseno2" id="txtcaseNo2" maxlength="100"  cssStyle="width: 200px;"></s:textfield>  </td>
 <td>Ref Case No 2:</td> <td><s:textfield theme="simple" name="addCaseBean.Caseno3" id="txtcaseNo3" maxlength="100" cssStyle="width: 200px;"> </s:textfield> </td>
 <td>Ref Case No 3:</td> <td><s:textfield theme="simple" name="addCaseBean.Caseno4" id="txtcaseNo4" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td> 	
</tr> 
<tr>	 
 <td>&nbsp;&nbsp;&nbsp;Ref Case No 4:</td> <td><s:textfield theme="simple" name="addCaseBean.Caseno5" id="txtcaseNo5" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>
 <td>Ref Case No 5:</td> <td><s:textfield theme="simple" name="addCaseBean.Caseno6" id="txtcaseNo6" maxlength="100" cssStyle="width: 200px;"></s:textfield>  </td>
 <td>&nbsp;</td> 	
</tr> 
 </table> 

</fieldset>
</td>
</tr>
<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2">
		<fieldset><legend><b>Opposition Party Detail:</b></legend>
	     <table width="100%"  >
			<tr>
				 <td><b>&nbsp;&nbsp;&nbsp;Select Number of Opponent :</b>
					  <select  name="txtCounter" id="txtCounter" style="width: 50px;" onchange="javascript:genarateTextBox();"/> 
					  <option value="0">NA</option>					  
					  <%for(int i= 1;i<=5;i++) {%>			
					      <option value=<%=i %>><%=i %></option>		
					  <%} %>  
					  </select>	
					  
					 		
				 </td>
			</tr>
			 
			<tr>
			   <td>
			      <div id="testdiv"></div>
			   </td>
			</tr>
		 <tr><td>&nbsp;</td></tr>
		</table>
		</fieldset>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="3">
		<fieldset><legend><b>Case Details:</b></legend>
		<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Case Priority:<span class="mandi">*</span></td>
				<td><s:select theme="simple" name="addCaseBean.casepriority"
					id="txtCasePriority" headerValue="Select Case Priority"
					headerKey="" list="retCasePriority" cssStyle="width:200px;"></s:select>

				</td>
				<td>Court Detail:<span class="mandi">*</span></td>
				<td><s:textfield theme="simple" name="addCaseBean.courtdetails"
					id="txtCourtDetails" cssStyle="width: 200px;" readonly="true"/> <a
					onclick="javascript:searchCourtID();"><img
					src="/loms/view/images/Search.png" width="25" height="20"
					alt="Search Client ID" /></a>
					 <s:textfield  theme="simple" id="txtCourtName" cssStyle="width: 200px;border:2px solid white;" readonly="true" />
					</td>
					 
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Case Status:<span class="mandi">*</span></td>
				<td><s:select theme="simple" name="addCaseBean.casestatus"
					id="txtCaseStatus" headerValue="Select Case Priority" headerKey=""
					list="retCaseStatus" cssStyle="width:200px;"></s:select></td>
				<td>Judgment Date: </td>
				<td><input type="text" name="addCaseBean.caseJudgmentdate"
					id="txtCaseHearDate" style="width: 200px;" readonly="readonly" />  </td>
			 
			</tr>

			<tr>
				<td>&nbsp;&nbsp;&nbsp;Comments:</td>
				<td colspan="5"><textarea type="text"
					name="addCaseBean.comments" id="txtComment" style="width: 10cm;"></textarea></td>
			</tr>
 		</table>
		</fieldset>
		</td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td align="center" colspan="3"><input type="submit"
			name="groovybtn1" class="groovybutton" value="Add"  onclick="javascript:statusMsg();" /> <input
			type="button" name="groovybtn1" class="groovybutton" value="Reset" onclick="javascript:frmClearVal();genarateTextBox();"/></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
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
	frmvalidator.setAddnlValidationFunction(addOppCheck);
	frmvalidator.setAddnlValidationFunction(casTypeSel);
	
	//
</script>
</html>
