
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
 <script src="/loms/view/js/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>
<link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css"></link>
<script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script>

 
<script>
	function searchval(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}

	var fieldName = 'cltCheckVal';
	function getclientId() {
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {

			if (document.getElementById("cltCheckVal" + x).checked == true) {
				document.getElementById("hidcaseid").value = document
						.getElementById("hidcaseid" + x).value;

			}
		}
	}
	function clearaction() {
		if (document.getElementById("casetype")) {
			document.getElementById("casetype").value = "";
		}
	}
	function selOneDelete() {
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
			searchval('frmcaseinfo', 'deleteCaseInfo.action');
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
<form id="frmcaseinfo" name="frmcaseinfo" action="mngCaseInfo.action" method="post"><input
	type="hidden" name="hidcaseid" id="hidcaseid" /> 
	<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;">
<div id="content">
<!--<h3>Standard Case Info</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Case Type.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('frmcaseinfo','lawStandardManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/law Standard Info.png"  width="40" height="40"  /></div>
<p class="title">Standard Case Info</p> 
 <a href="#" onclick="javascript:onclickaction('frmcaseinfo','lawStandardManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Case Type.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%"
	cellspacing="5" cellpadding="5" class="user_max_input">
	<tr>
		<td>
		<table border="0" width="100%" style="border-color: gray">
			<tr>
				<td colspan="2">
				<div style="display: none;" id="selectOne">
				<table>
					<tr>
						<td>
						<ul class="TickList">
							<li><font color="blue">Please Select atleast one
							record</font></li>
						</ul>
						</td>
					</tr>
				</table>
				</div>
				</td>
				<td>&nbsp;</td>
			</tr>
			
			<tr> 
				<td colspan="2" ><div id="frmcaseinfo_errorloc" class="error_strings"></div></td>
				<td> &nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Action</td>
				<td><s:select label="Action" theme="simple" list="actionList"
					name="txtAction" headerValue="Please Select Action" headerKey="--" 
					onchange="javascript:clearaction();searchval('frmcaseinfo','mngCaseInfo.action');"
					 /></td>
				<td>Case Type</td>
				<td><s:select theme="simple" list="caseList" name="txtCaseType" headerValue="Please Select Case" headerKey="--" 
					onchange="javascript:clearaction();searchval('frmcaseinfo','mngCaseInfo.action');"
					/></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		<s:if test="%{searchPageVar=='value'}">

			<table border="0" width="75%" class="grid" cellpadding="0"
				cellspacing="0" border="0">
				<thead>
					<s:if test="%{txtAction=='Search' && txtCaseType =='Suit'}">
						<div id="search_result">
						<p>Search Result</p>
						</div>
						<tr>
							<th align="center"></th>
							<th align="center">Suit ID</th>
							<th align="center">Suit Type</th>
						</tr>
					</s:if>

					<s:if test="%{txtAction=='Search' && txtCaseType =='Appeal'}">
						<div id="search_result">
						<p>Search Result</p>
						</div>
						<tr>
							<th align="center"></th>
							<th align="center">Appeal ID</th>
							<th align="center">Appeal Type</th>
						<tr>
					</s:if>

					<s:if test="%{txtAction=='Search' && txtCaseType =='Petition'}">
						<div id="search_result">
						<p>Search Result</p>
						</div>
						<tr>
							<th align="center"></th>
							<th align="center">Petition ID</th>
							<th align="center">Petition Type</th>
						</tr>
					</s:if>

					<s:if test="%{txtAction=='Search' && txtCaseType =='Criminal'}">
						<div id="search_result">
						<p>Search Result</p>
						</div>
						<tr>
							<th align="center"></th>
							<th align="center">Criminal ID</th>
							<th align="center">Criminal Type</th>
						</tr>
					</s:if>

					<s:if test="%{txtAction=='Search' && txtCaseType =='Execution'}">
						<div id="search_result">
						<p>Search Result</p>
						</div>
						<tr>
							<th align="center"></th>
							<th align="center">Execution ID</th>
							<th align="center">Execution Type</th>
						</tr>
					</s:if>
					<s:if test="%{txtAction=='Search' && txtCaseType !=''}">

						<s:if test="%{arrStdCaseInfoBean.size >= 1}">

							<s:iterator id="listval" value="arrStdCaseInfoBean" status="stat">
								<tr class="row<s:property value="#stat.index % 2"/>">
									<td align="center"><input type="radio" name="cltChkVal"
										id="cltCheckVal<s:property value="#stat.index"/>"
										onclick="javascript:getclientId();" /></td>
									<td><s:hidden id="hidcaseid%{#stat.index}"
										value="%{arrStdCaseInfoBean[#stat.index].caseid}"></s:hidden>
									<s:property value="arrStdCaseInfoBean[#stat.index].caseid" /></td>
									<td><s:property
										value="arrStdCaseInfoBean[#stat.index].casetype" /></td>
								</tr>
							</s:iterator>


							<tr>
								<td colspan="2">&nbsp;</td>
								<td>
								 <s:if test="%{retEmpType=='GOD' || retEmpType=='USER'}">
								<input type="button" name="groovybtn1"
									class="groovybutton" value="Delete"
									onclick="javascript:selOneDelete();" />
									</s:if>
									</td>

							</tr>
						</s:if>
						<s:if test="%{arrStdCaseInfoBean.size==0}">

							<tr>
								<td colspan="1">&nbsp;</td>
								<td align="center" colspan="3" class="success">No Record
								has been returned for the above search criteria.</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</s:if>

					</s:if>
					<s:if test="%{txtAction=='Add'}">
				 
		                <tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<s:if test="%{txtAction=='Add' && txtCaseType =='Suit'}">
					 <s:if test="%{arrStdCaseInfoBean[0].caseid != 'E9999'}">					  
						  <div class="succ"> <p>Suit Added Sucessfully</p></div>
					 </s:if>
							<tr>
								<td align="center" >Add Suit Type: <s:textfield label="Add Suit Type"
									name="casetype" id="casetype" maxlength="100"/></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
							</tr>
						</s:if>

						<s:if test="%{txtAction=='Add' && txtCaseType =='Appeal'}">
						 <s:if test="%{arrStdCaseInfoBean[0].caseid != 'E9999'}">					  
						  <div class="succ"> <p>Appeal Added Sucessfully</p></div>
					 </s:if>
							<tr>
								<td align="center">Add Appeal Type: <s:textfield label="Add Appeal Type"
									name="casetype" id="casetype"  maxlength="100"/></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
							<tr>
						</s:if>

						<s:if test="%{txtAction=='Add' && txtCaseType =='Petition'}">
						 <s:if test="%{arrStdCaseInfoBean[0].caseid != 'E9999'}">					  
						  <div class="succ"> <p>Petition Added Sucessfully</p></div>
					    </s:if>
							<tr>
								<td align="center">Add Petition Type: <s:textfield  
									name="casetype" id="casetype"  maxlength="100"/></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>

							</tr>
						</s:if>

						<s:if test="%{txtAction=='Add' && txtCaseType =='Criminal'}">
						 <s:if test="%{arrStdCaseInfoBean[0].caseid != 'E9999'}">					  
						  <div class="succ"> <p>Criminal Added Sucessfully</p></div>
					      </s:if>
							<tr>
								<td align="center">Add Criminal Type: <s:textfield 
									name="casetype" id="casetype"  maxlength="100"/></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>

							</tr>
						</s:if>

						<s:if test="%{txtAction=='Add' && txtCaseType =='Execution'}">
						 <s:if test="%{arrStdCaseInfoBean[0].caseid != 'E9999'}">					  
						  <div class="succ"> <p>Execution Added Sucessfully</p></div>
					 </s:if>
							<tr>
								<td align="center">Add Execution Type: <s:textfield
									name="casetype" id="casetype"  maxlength="100"/></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>

							</tr>
						</s:if>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
						
							<td align="center"><input type="Submit" name="groovybtn1"
								class="groovybutton" value="Submit"/></td>
							<td>&nbsp;</td>
						   <td>&nbsp;</td>
						</tr>
					</s:if>
			</table>

			<s:if
				test="%{(txtAction==null && txtCaseType==null) || (txtAction=='' && txtCaseType=='')}">
				<table border="0" colspan="2" align="left" width="60%">
					<tr>
						<td>&nbsp;</td>
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
						<td><input type="Submit" name="groovybtn1"
							class="groovybutton" value="Submit"/></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</s:if>
		</s:if></td>
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
	var frmvalidator = new Validator("frmcaseinfo");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.addValidation("casetype", "req", "Case Sub Type (Appeal / Execution / Petition / Suit / Criminal) cannot be blank");
	
	frmvalidator.addValidation("casetype","alpha_case","Case Type can contain only letters,numbers,slash(/), hyphen(-), ampersand(&)");	
	//
</script>
</body>
</html>
