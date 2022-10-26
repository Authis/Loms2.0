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
  
 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>
  
<body onload="javascript:doOnLoad();">
 <form id="frmviewappeal" name="frmviewappeal" action="searchAppeals.action" method="post">
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;">


</div>

<div id="content">
<h3>View Appeals</h3>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
 <tr> 
	<td colspan="2"><div id="frmcasehear_errorloc" class="error_strings"></div></td>
	<td align="right"> </td>
	 
</tr>
<tr><td >&nbsp;</td><td >&nbsp;</td></tr>
<tr>
	<td> From Date: </td>
	<td><s:textfield theme="simple" name="fromdate" id="txtFromDate" readonly="true"/> 
   
	</td>
	
	<td> To Date: </td>
	<td><s:textfield theme="simple" name="todate" id="txtToDate"  readonly="true"/>
	 
	</td>
</tr>
 
<tr>
<td width="10%">&nbsp;</td>
<td width="25%" align="right"><input type="submit" name="groovybtn1" class="groovybutton" value="Search" /></td>
 </tr>
<tr><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
<s:if test="%{searchPageVar=='value'}">
<div id="search_result">
<p>Search Result</p>
 </div>
<table border="0"  width="100%" class="grid" cellpadding="1" cellspacing="1" border="0" >
	<thead>
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
      <th width="8%" align="center" nowrap>Case Judgment Date</th>
  
</tr>
</thead>
</table>

<s:if test="%{retCaseHearInfo.size >= 1}">
<div style="width:100%;height:250px;overflow:auto;" class="data_grid">
<table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >

<s:iterator id="listval" value="retCaseHearInfo" status="stat">
<tr class="row<s:property value="#stat.index % 2"/>" > 
	 <td width="8%" align="center"><s:property value="retCaseHearInfo[#stat.index].CaseId" /> </td>
	 <td width="8%" align="center"><s:property value="retCaseHearInfo[#stat.index].ClientId" /></td>
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
</div>
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
</s:if>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
  <jsp:include page="Footer.jsp" />
</form>
 <script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("frmviewappeal");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
  frmvalidator.addValidation("txtFromDate","req","Please enter From Date");
  frmvalidator.addValidation("txtToDate","req","Please enter To Date");
 
//]]></script>
</body>
</html>
