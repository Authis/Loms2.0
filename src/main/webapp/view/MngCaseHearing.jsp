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
<link rel="stylesheet"
	href="/loms/view/css/sample/jquery-ui-1.8.14.custom.css"
	type="text/css" media="all" />
<script src="/loms/view/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="/loms/view/js/jquery-ui-1.8.14.custom.min.js"
	type="text/javascript"></script>
<script>
	function onclickaction(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}

	function getclientId() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {

			if (document.getElementById("cltCheckVal" + x).checked == true) {
				document.getElementById("hidcasehearid").value = document
						.getElementById("hidcasehearid" + x).value;

			}

		}
	}

	function selOneEditCaseHear() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('mngcasehearing', 'editCaseHearing.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}
	}

	function selOneDelCaseHear() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			if(confirm("Are you sure you want to delete the record?")){
			onclickaction('mngcasehearing', 'deleteCaseHearing.action');
			document.getElementById("selectOne").style.display = "none";
			}
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}
	}
</script>
<style type="text/css">
.row0 {
	background-color: #FFFFFF;
}

.row1 {
	background-color: #f2f2f2;
}
</style>
</head>

<body
	onload="javascript:">
<form id="mngcasehearing" method="post">
<input type="hidden" name="hidcasehearid" id="hidcasehearid" />
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Manage Case Hearing</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Case Hearing Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('mngcasehearing','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->


 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Manage Case Hearing</p> 
 <a href="#" onclick="javascript:onclickaction('mngcasehearing','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Case Hearing Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>

<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->

<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
	<tr>
		<td colspan="6">
		<div style="display: none;" id="selectOne">
		<table>
			<tr>
				<td>
				<ul class="TickList">
					<li><font color="blue">Please Select atleast one record</font></li>
				</ul>
				</td>
			</tr>
		</table>
		</div>
		</td>
	</tr>
 </table>
 <div id="search_result">
<p>Search Result</p>
 </div>
 <table border="0" width="100%" class="grid" cellpadding="0"
	cellspacing="0" border="0">
	<thead>
		<tr>
			<th align="center"></th>
			<th align="center">Case Hearing ID</th>
			<th align="center">Case ID</th>
			<th align="center">Client ID</th>
			<th align="center">Case Hearing Date</th>
			<th align="center">Comments</th>
			<th align="center">&nbsp;</th>
		</tr>
	</thead>
	
	<s:if test="%{retCaseHearingBean.size >= 1}">
		<s:iterator id="listval" value="retCaseHearingBean" status="stat">
			<tr class="row<s:property value="#stat.index % 2"/>">
				<td align="center"><input type="radio" name="cltChkVal"
					id="cltCheckVal<s:property value="#stat.index"/>"
					onclick="javascript:getclientId();selectall();" /></td>
				<td><s:hidden id="hidcasehearid%{#stat.index}"
					value="%{retCaseHearingBean[#stat.index].casehearingid}"></s:hidden>
				<s:property value="retCaseHearingBean[#stat.index].casehearingid" /></td>
				<td><s:property value="retCaseHearingBean[#stat.index].caseid" /></td>
				<td><s:property
					value="retCaseHearingBean[#stat.index].clientid" /></td>
				<td><s:property
					value="retCaseHearingBean[#stat.index].casehearingdate" /></td>
				<td><s:property
					value="retCaseHearingBean[#stat.index].casehearingcomments" /></td>
				<td>&nbsp;</td>
			</tr>
		</s:iterator>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>

			<td colspan="4">
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
			<input type="button" name="groovybtn1"	class="groovybutton" value="Edit Case Hearing"
				onclick="javascript:selOneEditCaseHear();" />
				</s:if>
				<s:if test="%{retEmpType=='GOD'}">
				 <input type="button" name="groovybtn1" class="groovybutton" value="Delete Case Hearing"
				onclick="javascript:selOneDelCaseHear();" />
				</s:if>
				 <input type="button" name="groovybtn1" class="groovybutton" value="Back"
				onclick="javascript:onclickaction('mngcasehearing','searchCaseInforesult.action')" /></td>



		</tr>
	</s:if>
	<s:if test="%{retCaseHearingBean.size==0}">
		<tr>
			<td colspan="3">&nbsp;</td>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
			<td align="left" colspan="4" class="success">No Record has been
			returned for the above search criteria.</td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
			<td colspan="4">&nbsp;</td>
		</tr>
	</s:if>


</table>
</div>

</div>



<jsp:include page="Footer.jsp" />
</form>
</body>

</html>
