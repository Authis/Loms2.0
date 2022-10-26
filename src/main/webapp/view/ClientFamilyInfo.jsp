<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script language="javascript" type="text/javascript"
	src="/loms/view/js/rakshaval.js"></script>
<script>
	function searchval(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	function onclickaction(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}

	var fieldName = 'cltChkVal';
	function getclientId() {

		var i = document.getElementsByName("cltChkVal").length;

		for ( var x = 0; x < i; x++) {

			if (document.getElementById("cltCheckVal" + x).checked == true) {
				document.getElementById("hidclientid").value = document
						.getElementById("hidclientid" + x).value;
				document.getElementById("hidRelname").value = document
						.getElementById("hidRelname" + x).value;
				document.getElementById("hidReltype").value = document
						.getElementById("hidReltype" + x).value;
				// alert(document.getElementById("hidclientid").value+"--"+document.getElementById("hidRelname").value+"---"+document.getElementById("hidReltype").value);
			}

		}
	}

	function selOneDel() {
		var i = document.getElementsByName("cltChkVal").length;
		var chk = 1;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
			onclickaction('managefamily', 'delFamInfoView.action');
			document.getElementById("selectOne").style.display = "none";
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
<body
	onload="javascript:">
</head>
<form id="managefamily" name="managefamily" method="post"><input
	type="hidden" name="hidclientid" id="hidclientid" /> <input
	type="hidden" name="hidRelname" id="hidRelname" /> <input
	type="hidden" name="hidReltype" id="hidReltype" /> <jsp:include
	page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Manage Family Information</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Client Family Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       <a href="#" onclick="javascript:onclickaction('managefamily','clientManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Client Management.png"  width="40" height="40"  /></div>
<p class="title">Search Client Family Information</p> 
 <a href="#" onclick="javascript:onclickaction('managefamily','clientManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Client Family Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%"
	cellspacing="5" cellpadding="5" class="user_max_input">
	<tr>
		<td>
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
<s:if test="%{searchPageVar=='value'}">
	<div id="search_result">
	<p>Search Result</p>
	</div>
	<table border="0" width="100%" class="grid" cellpadding="0"
		cellspacing="1" border="0">
		<thead>
			<tr>
				<th align="center"></th>				 
				<th align="center">Name</th>
				<th align="center">Relation Type</th>
				<th align="center">Date</br> of Birth</th>
				<th align="center">Mob No</th>
				<th align="center">Tel No</th>
				<th align="center">Address </th>
			 	<th align="center">Gender </th>
			 	<th align="center">Marital Status </th>
				<th align="center">Marriage Date</th>
				<th align="center">Comments</th>
			 
			</tr>
		</thead>
		<s:if test="%{arrClientFambean.size>=1}">
			<s:iterator id="listval" value="arrClientFambean" status="stat">
				<tr class="row<s:property value="#stat.index % 2"/>">
					<td align="center">
					   <input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();" />
					</td>
					 
					<td><s:hidden id="hidclientid%{#stat.index}" value="%{arrClientFambean[#stat.index].clientid}"></s:hidden>
					    <s:hidden id="hidRelname%{#stat.index}"	value="%{arrClientFambean[#stat.index].relationname}"></s:hidden>
					<s:hidden id="hidReltype%{#stat.index}"	value="%{arrClientFambean[#stat.index].relationtype}"></s:hidden>
					<s:property value="arrClientFambean[#stat.index].relationname" /></td>
					
					<td><s:property value="arrClientFambean[#stat.index].relationtype" /></td>
					<td><s:property	value="arrClientFambean[#stat.index].dateofbirth" /></td>
					<td><s:property	value="arrClientFambean[#stat.index].mobilenumber" /></td>
					<td ><s:property value="arrClientFambean[#stat.index].telephonenumber" /></td>
					<td ><s:property value="arrClientFambean[#stat.index].address" /></td>
					<td ><s:property value="arrClientFambean[#stat.index].gender" /></td>
					<td ><s:property value="arrClientFambean[#stat.index].maritalstatus" /></td>
					<td ><s:property value="arrClientFambean[#stat.index].marriagedate" /></td>
					<td ><s:property value="arrClientFambean[#stat.index].comments" /></td> 
				</tr>
			</s:iterator>
			
			<tr>
			 
			<td align="right" colspan="7">
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
			<input type="button" name="groovybtn1" class="groovybutton" value="Add Family Info"
				onclick="javascript:onclickaction('managefamily','addFamInfoView.action');" />
			</s:if>
			<s:if test="%{retEmpType=='GOD'}">
			<input type="button" name="groovybtn1" class="groovybutton"
				value="Delete Family Info" onclick="javascript:selOneDel();" />
			</s:if>
		    <input type="button" name="groovybtn1" class="groovybutton" value="Back"
				onclick="javascript:onclickaction('managefamily','searchresult.action')" /></td>


		</tr>
		</s:if>
		<s:if test="%{arrClientFambean.size==0}">
			<tr>
				<td colspan="11">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" colspan="11" class="success">No Record has
				been returned for the above search criteria.</td>
			</tr>
			
			<tr>
			 
			<td align="center" colspan="11">
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
			<input type="button" name="groovybtn1" class="groovybutton" value="Add Family Info"
				onclick="javascript:onclickaction('managefamily','addFamInfoView.action');" />
			</s:if>
			 </td>


		</tr>
		</s:if>

		 
		
	</table>
</s:if></div>
</div>
<jsp:include page="Footer.jsp" /></form>
</body>

</html>
