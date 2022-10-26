<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
      <script  src="/loms/view/js/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>	
      <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtFromDate","txtToDate"]);
		}
	</script>
  <script>
 function searchval(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
 function viewCaseInfo(val){
	 var url = "viewCaseInfo.action?hidcaseid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
 }
 function viewClientInfo(val){
	 var url = "viewClientInfo.action?hidclientid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
 }
 function onclickaction(formname,actionname){
	 if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();	
	 		document.getElementById(formname).action= "";
	 	}	
 }
 function downloadFile(){
	 onclickaction('frmviewcase','downloadQuickFile.action');
	 
 }
 
 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>
<body onload="javascript:doOnLoad();">
 <form id="frmviewcase" name="frmviewcase" action="searchviewCase.action" method="post">
 <input type="hidden" name="hidcaseid" id="hidcaseid" />
	 <input type="hidden" name="hidclientid" id="hidclientid" /> 
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;">


</div>

<div id="content">
<!--<h3>View Case</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/View Case Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('frmviewcase','quickLinksManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Quick Links.png"  width="40" height="40"  /></div>
<p class="title">View Case</p> 
 <a href="#" onclick="javascript:onclickaction('frmviewcase','quickLinksManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/View Case Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
 <tr> 
	<td colspan="4"><div id="frmviewcase_errorloc" class="error_strings"></div></td>
	<td align="right"> </td>
	 
</tr>
<tr><td >&nbsp;</td><td >&nbsp;</td></tr>

 

<tr>

   <td  nowrap="nowrap">Case Type:<span class="mandi">*</span> </td>
	<td  nowrap="nowrap"><s:select
		theme="simple" name="txtCaseType" id="txtCaseType" 
		cssStyle="width: 200px;"  
		list="#{'':'Select Case Type','APPEAL':'APPEAL', 'EXECUTION':'EXECUTION', 'PETITION':'PETITION', 'SUIT':'SUIT','CRIMINAL':'CRIMINAL','CASE HEARING':'CASE HEARING'}"></s:select> </td>
	<td  nowrap="nowrap"> From Date:<span class="mandi">*</span> </td>
	<td  nowrap="nowrap"><s:textfield theme="simple" name="fromdate" id="txtFromDate" readonly="true"/> </td>
	
	<td  nowrap="nowrap"> To Date:<span class="mandi">*</span> </td>
	<td  nowrap="nowrap"><s:textfield theme="simple" name="todate" id="txtToDate"  readonly="true"/> </td>
</tr>
 
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td align="right"><input type="submit" name="groovybtn1" class="groovybutton" value="Search" /></td>
<td>&nbsp;</td>

<td>&nbsp;</td>
<td>&nbsp;</td>
 </tr>
<tr><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
<s:if test="%{searchPageVar=='value'}">
<div id="search_result">
<table width="100%" >
   <tr> 
      <td align="left"><p>Search Result</p> </td>
      <s:if test="%{retCaseHearInfo.size >= 1}">
      <td align="center"> Download as XLS
					<a href="#"  onclick="javascript:downloadFile();"><img src="/loms/view/img/Download-icon.png" width="24px" height="24px" border="0" alt="Download as XLS" /> </a>
					
	  </td>
	  </s:if>
  </tr>
</table>
 </div>
 <div id="fake-scroll-container" align="center"> 
	 <div id="header-container">
		   <table border="0" width="120%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-header" >
		<tr>
 
	<th width="8%" align="center">Case ID</th>
	<th width="8%" align="center">Client ID</th>
	<th width="15%" align="center">Client Info</th>			 
	<th width="15%" align="center">Case Type</th>
	<th width="15%" align="center">Prime Case No</th>
	<th width="15%" align="center">Ref Case No</th>
	<th width="15%" align="center" nowrap>Court Details</th>
    <th width="8%" align="center" nowrap>Case Status</th>
     <th width="8%" align="center" nowrap>Case Priority</th>
      <th width="8%" align="center" nowrap>Case Hearing Date</th>
  
</tr>
 
</table> 
 </div>
 <div id="scroll">

<s:if test="%{retCaseHearInfo.size >= 1}">
<!-- <div style="width:100%;height:250px;overflow:auto;" class="data_grid"> -->
<table border="0" width="100%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-body">

<s:iterator id="listval" value="retCaseHearInfo" status="stat">
<tr class="row<s:property value="#stat.index % 2"/>" >  
	 <td width="8%" align="center">
	 <s:hidden id="hidcaseid%{#stat.index}" value="%{retCaseHearInfo[#stat.index].CaseId}"/> 
	 <s:hidden	id="hidclientid%{#stat.index}"	value="%{retCaseHearInfo[#stat.index].ClientId}"/> 
	  <a href="#" name="cltLnkVal" id="<s:property value="retCaseHearInfo[#stat.index].CaseId"  />"
	  onclick="javascript:viewCaseInfo(this.id);">					
	<u> <s:property value="retCaseHearInfo[#stat.index].CaseId" /></u></a>
	 </td>
					 
	 <td width="8%" >
		<s:hidden id="hidclientid%{#stat.index}"  value="%{retCaseHearInfo[#stat.index].ClientId}"/> 
		<a href="#" name="cltLnkVal" id="<s:property value="retCaseHearInfo[#stat.index].ClientId"  />" 
		   onclick="javascript:viewClientInfo(this.id);" >
		<u><s:property value="retCaseHearInfo[#stat.index].ClientId"  /></u></a>
     </td>	 
	 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].ClientInfo" /></td>					 
	 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].CaseType" /></td>
	 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].PrimeCaseNo" /></td>
	 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].RefCaseNo" /></td>
	 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].CourtDetails" /></td>
	 <td width="8%" align="center"><s:property value="retCaseHearInfo[#stat.index].CaseStatus" /></td>
	 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].CasePriority" /></td>
	 <td width="8%" align="center"><s:property value="retCaseHearInfo[#stat.index].JudgmntDate" /></td>
</tr>
</s:iterator>
</table>
  </s:if> 
 
<s:if test="%{retCaseHearInfo.size==0}">
 <table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr >
			  <td colspan="3">&nbsp;</td> 
			  <td align="center" colspan="4" class="success">No Record has been returned for the above search criteria.</td> 
			  <td>&nbsp;</td>  
			</tr>
		<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
 </s:if> 
</div>

        <div id="y-fake-scroll">
		<div id="y-table-emulator" style="width:40px;">
		&nbsp;
		</div>
		</div>
		
		<div id="x-fake-scroll">
		<div id="x-table-emulator">
		&nbsp;
		</div>
		</div> 
	 </div>
	 </s:if>
	 </div>
	 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
  <jsp:include page="Footer.jsp" />
</form>
 <script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("frmviewcase");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
  frmvalidator.addValidation("txtFromDate","req","From Date cannot be blank");
  frmvalidator.addValidation("txtToDate","req","To Date cannot be blank");  
  frmvalidator.addValidation("txtCaseType","req","Case Type cannot be blank");
 
//]]></script>
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
