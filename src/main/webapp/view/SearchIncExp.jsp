<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
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
 function onclickaction(formname,actionname){
	 if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();	
	 		document.getElementById(formname).action = "";
	 	}	
 }
 
 var fieldName='cltChkVal';
 function getclientId(){
 var i = document.getElementsByName("cltChkVal").length;
 for (var x=0;x<i;x++){
	 
	 if(document.getElementById("cltCheckVal"+x).checked == true){
		 document.getElementById("hidtransid").value = document.getElementById("hidtransid"+x).value;
		 
	 }
 } 
 }
 
 function selOneDel(){
		var i = document.getElementsByName("cltChkVal").length;
		 for (var x=0;x<i;x++){		 
			 if(document.getElementById("cltCheckVal"+x).checked == true){
				 chk = 2;	
				 break;			 
			 }else{			 
				 chk = 1;			  
			 }
		 }
 		 if(chk == 2){
 			if(confirm("Are you sure you want to delete the record?")){
			 onclickaction('mngexpdet','deleteIncExp.action');
			 document.getElementById("selectOne").style.display="none";
 			}
		 }else{
			 document.getElementById("selectOne").style.display="inline";			
		 }
		
	}
 function searchClientID(val) {

		var url = "searchClientID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
 
 
 function searchIndCaseID(val) {

		var url = "searchIndCaseID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
 
 
function searchCaseID(){
	 document.getElementById("hidclientid").value = document.getElementById("txtClientId").value;	  
	 var url = "searchCaseID.action?hidclientid="+document.getElementById("hidclientid").value;
		window.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');
}

function remAll(par){
	 
	 if(par == '1'){		 
 		 document.getElementById("txtCaseId").value = "";
		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
		 document.getElementById("txtTransactionId").value = "";
		 document.getElementById("payType").value = "";
	 }
	 if(par == '2'){		 
		 document.getElementById("txtClientId").value = "";
 		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
		 document.getElementById("txtTransactionId").value = "";
		 document.getElementById("payType").value = "";
	 }
	 if(par == '3'){		 
		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
 		 document.getElementById("txtTransactionId").value = "";
		 document.getElementById("payType").value = "";
	 }
	 if(par == '4'){		 
		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
 		 document.getElementById("txtTransactionId").value = "";
		 document.getElementById("payType").value = "";
	 }
	 if(par == '5'){		 
		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
 		 document.getElementById("payType").value = "";
	 }
	 if(par == '6'){		 
		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
		 document.getElementById("txtTransactionId").value = "";
 	 }
	 
}

function downloadFile(){
	 onclickaction('mngexpdet','downloadIncxpFile.action');
	 
}

 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>
<body onload="javascript:doOnLoad();">
 <form id="mngexpdet" name="mngexpdet" action="searchManageinc.action" method="post">
 <input type="hidden" name="hidtransid" id="hidtransid" />
<s:hidden name="hidclientid" id="hidclientid" />

<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;">


</div>

<div id="content">
<!--<h3>Manage Income / Expense Details </h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Income.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--          <a href="#" onclick="javascript:onclickaction('mngexpdet','incExpManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Income Expense Management 2.png"  width="40" height="40"  /></div>
<p class="title">Manage Income / Expense Details </p> 
 <a href="#" onclick="javascript:onclickaction('mngexpdet','incExpManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Income.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
<tr>
 <td colspan="2">
	<div style="display: none;" id="selectOne">
		 <table><tr><td>		 
			<ul class="TickList"><li><font color="blue">Please Select atleast one record</font></li></ul>
		 </td></tr></table>
	</div>
</td>
</tr>
<tr>
	<td colspan="4">		 
	<div id="mngexpdet_errorloc" class="error_strings"></div>		 
	</td>
</tr>
<tr>
	<td  nowrap="nowrap">Client ID:</td><td  nowrap="nowrap"><s:textfield  name="clientid" id="txtClientId" theme="simple"  onfocus="javascript:remAll('1');" maxlength="10"></s:textfield>
	<a onclick="javascript:searchClientID('searchincome');"><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a> </td>	
    <td  nowrap="nowrap"> Case ID: </td><td><s:textfield   name="caseid" id="txtCaseId" theme="simple" onfocus="javascript:remAll('2');" maxlength="12"></s:textfield>  
    
    <a onclick="javascript:searchIndCaseID('searchincome');"><img
			src="/loms/view/images/Search.png" width="25" height="20"
			alt="Search Client ID" /></a>  
    </td>	
</tr> 

<tr>
	<td  nowrap="nowrap"> From Date: </td><td><s:textfield  name="fromdate" id="txtFromDate" theme="simple" onclick="javascript:remAll('3');" readonly="true"></s:textfield> 
	 
	</td>		 
	<td  nowrap="nowrap"> To Date: </td><td><s:textfield   name="todate" id="txtToDate" theme="simple" maxlength="10" onclick="javascript:remAll('4');" readonly="true"></s:textfield>
	 
	</td>
</tr>

<tr>
 <td  nowrap="nowrap"> Transaction ID:</td>
 <td> <s:textfield   name="transactionid" id="txtTransactionId"  maxlength="10" theme="simple" onclick="javascript:remAll('5');"></s:textfield></td>
 
  <td  nowrap="nowrap"> Payment Type:</td>
 <td>
 <select name="payType"  
			id="payType" style="width: 205px;" onchange="javascript:remAll('6');">
			<option value="">Select Payment Type</option>
			<option value="CREDIT">CREDIT</option>
			<option value="DEBIT">DEBIT</option>
		    </select>
 
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
<table width="100%" >
   <tr> 
      <td align="left"><p>Search Result</p> </td>
      <s:if test="%{retIncomeExpenceBean.size >= 1}">
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
					<th style="width : 27px;" align="center"></th>			
					<th width="10%" align="center">Transaction ID</th>
					<th width="10%" align="center">Client ID</th>
					<th width="10%" align="center">Case ID</th>
					<th width="15%" align="center">Paid Amount</th>
					<th width="10%" align="center">Paid IST</th>
					<th width="10%" align="center">Payment Type</th> 
					<th width="15%" align="center">Comments</th> 
              </tr>  
           </table>
    </div>
 <div id="scroll">
    <s:if test="%{retIncomeExpenceBean.size >= 1}">
<!-- <div style="width:100%;height:250px;overflow:auto;" class="data_grid"> -->
	<table border="0" width="100%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-body">
		<s:iterator id="listval" value="retIncomeExpenceBean" status="stat">
			<tr class="row<s:property value="#stat.index % 2"/>" >
			<td  style="width : 20px;" align="center" ><input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();"/></td> 
			<td width="10%"><s:hidden id="hidtransid%{#stat.index}"  value="%{retIncomeExpenceBean[#stat.index].transactionid}"></s:hidden> <s:property value="retIncomeExpenceBean[#stat.index].transactionid"  /></td>
			
			<td width="10%"><s:property value="retIncomeExpenceBean[#stat.index].clientidin"  /></td>
			<td width="10%"><s:property value="retIncomeExpenceBean[#stat.index].caseidin"  /></td>
			<td width="15%" align="right"><s:property value="retIncomeExpenceBean[#stat.index].paidamtin"  /></td>
			<td width="10%"><s:property value="retIncomeExpenceBean[#stat.index].paidistin"  /></td>
			<td width="10%"><s:property value="retIncomeExpenceBean[#stat.index].paymnttypein"  /></td>
			<td width="15%"><s:property value="retIncomeExpenceBean[#stat.index].commentsin"  /></td>
			</tr>		
		</s:iterator>
	 </table>
  </s:if> 
 
  <s:if test="%{retIncomeExpenceBean.size==0}">
	 <table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
				<tr>
					<td colspan="3">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td >&nbsp;</td>
					<td align="center"  class="success">No Record has been returned for the above search criteria.</td>
				</tr>
				<tr>
					<td >&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
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
	 <s:if test="%{retIncomeExpenceBean.size >= 1}">
		 <table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr> 
			 <s:if test="%{retEmpType=='GOD'}">
			 <td align="center"> <input type="button" name="groovybtn1" class="groovybutton" value="Delete"  onclick="javascript:selOneDel();"/></td>
			  </s:if>
			</tr>
		
			<tr>
			  <td>
			     <pre> <b>Credit Amount :- <s:property value="strCreditAmt" />   Debit Amount :- <s:property value="strDebitAmt"  /></b> </pre>
			  </td>
			</tr>
			<tr>
			   <td>
			     <pre><b>Total :- <s:property value="strTotalAmt"  /></b></pre>
			   </td>
			</tr>
		</table>
	</s:if>
	</s:if>
	</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


  <jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("mngexpdet");
 
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	
	frmvalidator.setAddnlValidationFunction(yearValidationExpDet);
	frmvalidator.setAddnlValidationFunction(toDateValidationExpDet);
	  frmvalidator.addValidation("txtClientId","alpha_num","Client ID can contain only letters and numbers");
	  frmvalidator.addValidation("txtCaseId","alpha_num","Case ID can contain only letters and numbers");
	  frmvalidator.addValidation("txtTransactionId","alpha_num","Transaction ID can contain only letters and numbers");

	//
</script>
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
