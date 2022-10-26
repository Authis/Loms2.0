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

	function getoppId() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {

			if (document.getElementById("cltCheckVal" + x).checked == true) {
				document.getElementById("hidcaseoppid").value = document
						.getElementById("hidcaseoppid" + x).value;

			}

		}
	}

	function selOneEditCaseOpp() {
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
			onclickaction('mngcaseOpp', 'editCaseopp.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}
	}

	function selOneDelCaseOpp() {
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
			onclickaction('mngcaseOpp', 'deleteCaseOpp.action');
			document.getElementById("selectOne").style.display = "none";
			}
		} else {
			document.getElementById("selectOne").style.display = "inline";
		}
	}
	function popOnload() {
		 
		if (document.getElementById("retDelvar").value) {
			 
			document.getElementById("retDelvar").value = "";
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
	onload="javascript:popOnload();">
<form id="mngcaseOpp" name= "mngcaseOpp" method="post">
<input type="hidden" name="hidcaseoppid" id="hidcaseoppid" />
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 
<div id="content">
<!--<h3>Manage Case Opponent</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Opponent Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('mngcaseOpp','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->


 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Manage Case Opponent</p> 
 <a href="#" onclick="javascript:onclickaction('mngcaseOpp','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Opponent Information.pdf" target="_blank">
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
 <s:if test="%{retDelvar != '' && retDelvar != 'E9999'}">
		<tr>
			<td colspan="4"><div class="succ">Opponent has been deleted Successfully. </div></td>
		</tr>
	</s:if>
	<s:if test="%{retDelvar == 'E9999'}">
		<tr>
			<td colspan="4"><div class="err">Opponent has not been deleted Successfully.</div></td>
		</tr>
	</s:if>
 <div id="search_result">
<p>Search Result</p>
 </div>
 <table border="0" width="100%" class="grid" cellpadding="1"
	cellspacing="1" >
	<thead>
		<tr>
			<th width="1%" align="center"></th>
			<th width="10%" align="center">Opp Party Name</th>				
			<th width="10%"  align="center">Party Mob No</th>
			<th width="10%" align="center">Party EmailId</th>
			<th width="10%" align="center">Org Name</th>	
			<th width="10%" align="center">Org Rep Name</th>			
			<th width="10%" align="center">Org Mob No</th>
			<th width="10%" align="center">Org EmailId</th>
			<th width="10%" align="center">Lawyer Name</th>			
			<th width="10%" align="center">Lawyer Mob No</th>
			<th width="10%" align="center">Lawyer EmailId</th>
			
		</tr>
	</thead>
	</table>
	<s:if test="%{arroppDetailBean.size >= 1}">
	 <div style="width:100%;height:250px;overflow:auto;" class="data_grid">
	 <table border="0" width="100%" class="grid" cellpadding="1" 
		cellspacing="1" border="0">
		<s:iterator id="listval" value="arroppDetailBean" status="stat">
			<tr  class="row<s:property value="#stat.index % 2"/>">
				<td width="2%" align="center"><input type="radio" name="cltChkVal"	id="cltCheckVal<s:property value="#stat.index"/>"
					onclick="javascript:getoppId();" /></td>
				<td width="10%" ><s:hidden id="hidcaseoppid%{#stat.index}" value="%{arroppDetailBean[#stat.index].oppId}"></s:hidden>
				<s:property value="arroppDetailBean[#stat.index].oppPartyName" /></td>
				<td width="10%"><s:property value="arroppDetailBean[#stat.index].oppPartyMobNo" /></td>
				<td width="10%"  > <s:property value="arroppDetailBean[#stat.index].oppPartEmailId" /></td>
				<td width="10%" ><s:property value="arroppDetailBean[#stat.index].oppPartyOrgName" /> </td>
				<td width="10%"><s:property	value="arroppDetailBean[#stat.index].oppPartyOrgRepName" /></td>
				<td width="10%"><s:property value="arroppDetailBean[#stat.index].oppPartyOrgMobNo" /></td>
				<td width="10%"><s:property	value="arroppDetailBean[#stat.index].oppPartyOrgEmailId" /></td>
				<td width="10%"><s:property value="arroppDetailBean[#stat.index].oppPartyLawyerName" /></td>
				<td width="10%"><s:property	value="arroppDetailBean[#stat.index].oppPartyLawyerMobNo" /></td>
				<td width="10%"><s:property	value="arroppDetailBean[#stat.index].oppPartyLawyerEmailId" /></td>			
				 
			</tr>
		</s:iterator>
		</table>
			</div>
				<table border="0" width="100%" class="grid" cellpadding="0"	cellspacing="0" border="0">
			 
					<tr> 
				 
					<td align="center">
						<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
						<input type="button" name="groovybtn1"	class="groovybutton" value="Edit Opponent Detail"	onclick="javascript:selOneEditCaseOpp();" /> 
						</s:if>
						<s:if test="%{retEmpType=='GOD'}">
						<input type="button" name="groovybtn1" class="groovybutton" value="Delete Opponent Detail"	onclick="javascript:selOneDelCaseOpp();" /> 
						</s:if>
						<input type="button" name="groovybtn1" class="groovybutton" value="Back" onclick="javascript:onclickaction('mngcaseOpp','searchCaseInforesult.action')" />
					</td>
					</tr>
					
			</table>
	</s:if>
	<s:if test="%{arroppDetailBean.size==0}">
	<table border="0" width="100%" class="grid" cellpadding="0"	cellspacing="0" border="0">
		<tr>
			<td colspan="3">&nbsp;</td>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
			<td align="center" colspan="4" class="success">No Record has been
			returned for the above search criteria.</td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
			<td colspan="4">&nbsp;</td>
		</tr>
		</table>
	</s:if>





</div>
</div>


<jsp:include page="Footer.jsp" />
</form>
</body>

</html>
