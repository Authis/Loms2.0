<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
  <link rel="stylesheet" type="text/css" href="/loms/view/css/printfriendly.css" ></link>
<script>
	var fieldName = 'cltChkVal';
	function getclientId() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {

			if (document.getElementById("cltCheckVal" + x).checked == true) {
				document.getElementById("hidcourtid").value = document.getElementById("hidcourtid" + x).value;
				document.getElementById("hidcourtname").value = document.getElementById("hidcourtname" + x).value;
			}
		}
	}
	function selOneUpdate(formname, actionname) {
		 
		 var value = document.frmstdcrtinfo.val.value;
		 
		if (document.getElementById(formname)) {
			
			if(value == ""){
	 
			opener.document.addcaseinfofrm.txtCourtDetails.value = document.frmstdcrtinfo.hidcourtid.value;
			opener.document.addcaseinfofrm.txtCourtName.value = document.frmstdcrtinfo.hidcourtname.value;
			window.close();
			}
			if(value == "mngCase" && value != ""){
				opener.document.mngcasefrm.txtCourtDetails.value = document.frmstdcrtinfo.hidcourtid.value;
				window.close();
			}

		}
	}
</script>

<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
<style type="text/css">
* {
	font-family: calibri;
	font-size: 97%;
}

label {
	width: 10em;
	float: left;
}

label.error {
	float: none;
	color: red;
	padding-left: .5em;
	vertical-align: top;
}

p {
	clear: both;
}

.submit {
	margin-left: 12em;
}

em {
	font-weight: bold;
	padding-right: 1em;
	vertical-align: top;
}
</style>
</head>
<body bgcolor="#E0ECF8">
<form id="frmstdcrtinfo" name="frmstdcrtinfo" action="searchstdcourtinfo.action" method="post">
	<input type="hidden" name="hidcourtid" id="hidcourtid" />
	<input type="hidden" name="hidcourtname" id="hidcourtname" />
    
      <s:hidden name="val" id="val" />
<div id="content">
<h3>Standard Court info</h3>
<table border="0" width="100%" style="border-color: gray">

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
	<tr>
		<td colspan="3">
		<div id="frmstdcrtinfo_errorloc" class="error_strings"></div>
		</td>
		<td align="right"></td>
		<td align="right"></td>


	</tr>
	<tr>
		<td>Court ID:</td>
		<td><s:textfield theme="simple" name="stdCourtInfoBean.courtid"
			id="txtCourtId" /></td>
		<td>Court Name:</td>
		<td><s:textfield theme="simple" name="stdCourtInfoBean.courtname"
			id="txtCourtName" /></td>
		<td>Court Type:</td>
		<td><s:textfield theme="simple" name="stdCourtInfoBean.courttype"
			id="txtCourtType" /></td>
	</tr>

	<tr>
		<td>Court City:</td>
		<td><s:textfield theme="simple" name="stdCourtInfoBean.courtcity"
			id="txtCourtCity" maxlength="10" /></td>
		<td>Court Dist:</td>
		<td><s:textfield theme="simple" name="stdCourtInfoBean.courtdist"
			id="txtCourtDist" /></td>
		<td>Court State:</td>
		<td><s:textfield theme="simple"
			name="stdCourtInfoBean.courtstate" id="txtCourtState" maxlength="10" /></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>Court Country:</td>
		<td><s:textfield theme="simple"
			name="stdCourtInfoBean.courtcountry" id="txtCourtCountry" /></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><input type="submit" name="groovybtn1" class="groovybutton"
			value="Search" /></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<s:if test="%{searchPageVar=='value'}">
	<table border="0" width="100%" class="grid" cellpadding="0"
		cellspacing="0" border="0">
		<thead>
			<tr>
		    <th align="center"></th>
			<th align="center">Court ID</th>
			<th align="center">Court Name</th>
		</tr>
		</thead>
		<s:if test="%{arrStdCourtInfoBean.size >= 1}">
			<s:iterator id="listval" value="arrStdCourtInfoBean" status="stat">
				<tr class="row<s:property value="#stat.index % 2"/>">
					<td align="center">
					   <input type="radio" name="cltChkVal"	id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();" />
					</td>
					<td>
					     <s:hidden id="hidcourtid%{#stat.index}" value="%{arrStdCourtInfoBean[#stat.index].courtid}" /> 
					     <s:hidden id="hidcourtname%{#stat.index}" value="%{arrStdCourtInfoBean[#stat.index].courtname}" /> 
					     <s:property value="arrStdCourtInfoBean[#stat.index].courtid" />
					</td>
					<td>
					     <s:property value="arrStdCourtInfoBean[#stat.index].courtname" />
					</td>
			</s:iterator>
		</s:if>
		<s:if test="%{arrStdCourtInfoBean.size==0}">
			<tr>
			    <td >&nbsp;</td>
				<td >&nbsp;</td>
				<td>&nbsp;</td>  
			</tr>
			<tr>
				<td >&nbsp;</td>
				<td align="center" class="success">No Record has been
				returned for the above search criteria.</td>
				<td >&nbsp;</td>
			</tr>
			<tr>
				<td >&nbsp;</td>
				<td>&nbsp;</td>
				<td >&nbsp;</td>
			 
			</tr>
		</s:if>

		 
		<tr>
			<td >&nbsp;</td>
			<td align="center"  ><input type="button" name="groovybtn1"
				class="groovybutton" value="Select Court ID"
				onclick="javascript:selOneUpdate('frmstdcrtinfo','newcase.action');" />
			<td>&nbsp;</td>
		</tr>
	</table>
</s:if></div>

</form>

</body>
</html>
