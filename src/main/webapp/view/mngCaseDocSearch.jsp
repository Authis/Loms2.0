<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
 <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
 <link rel="stylesheet" href="/loms/view/css/sample/jquery-ui-1.8.14.custom.css" type="text/css" media="all" />
<script src="/loms/view/js/jquery-1.5.1.min.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtFromDate","txtToDate"]);
		}
	</script>
<link rel="stylesheet" href="/loms/view/css/calendar.css" />
 <script>
 function onclickaction(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
 $(function() {
		$( "#txtFromDate" ).datepicker();
	});
 $(function() {
		$( "#txtToDate" ).datepicker();
	});
 
 
 function getclientId(){
	 
	 
	 
	 var i = document.getElementsByName("cltChkVal").length;
	 for (var x=0;x<i;x++){
		 
		 if(document.getElementById("cltCheckVal"+x).checked == true){
			 document.getElementById("hisdocid").value = document.getElementById("hisdocid"+x).value;
			 document.getElementById("downloadLink"+x).style.display = "inline";
			 
		 }else{
			 document.getElementById("downloadLink"+x).style.display = "none";
			 
		 }

	   } 
	 
	 
	 
	 
	 
	 }
 function selDelDoc(){
	 
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
			onclickaction('mngcasedocfrm', 'delDocument.action');
			document.getElementById("selectOne").style.display = "none";
			}
		} else {
			 
			document.getElementById("selectOne").style.display = "inline";
		}
	}
 
 
 function selOneDownload(){
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
		
			onclickaction('mngcasedocfrm', 'downloadDoc.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			 
			document.getElementById("selectOne").style.display = "inline";
		}
		
		
		
		
	 
 }
 function searchClientID(val) {

		var url = "searchClientID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
 
 function getlinkCaseId(val){
	 
	 document.getElementById("hidcaseid").value = val; 
	 
	 
 }
 function getlinkclientId(val){
	 
	 document.getElementById("hidclientid").value = val; 
	 
 }
 function viewClientInfo(val){
	 var url = "viewClientInfo.action?hidclientid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
 }

 function viewCaseInfo(val){
	 var url = "viewCaseInfo.action?hidcaseid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
		 
 }
 
 function statusMsg(){
	 
		if(document.getElementById("statusMsg1")){
			 document.getElementById("statusMsg1").style.display = "none";
		  }else{
			 document.getElementById("statusMsg2").style.display = "none";
		  }
	}
function remAll(par){
	 
	 if(par == '1'){		 
 		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
		 document.getElementById("txtDocumentName").value = "";		 
		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
	 }
	 if(par == '2'){		 
		 document.getElementById("txtDocumentId").value = "";
 		 document.getElementById("txtCaseId").value = "";
		 document.getElementById("txtDocumentName").value = "";		 
		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
	 }
	 if(par == '3'){		 
		 document.getElementById("txtDocumentId").value = "";
		 document.getElementById("txtClientId").value = "";
 		 document.getElementById("txtDocumentName").value = "";		 
		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
	 }
	 if(par == '4'){		 
		 document.getElementById("txtDocumentId").value = "";
		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
 		 document.getElementById("txtFromDate").value = "";
		 document.getElementById("txtToDate").value = "";
	 }
	 if(par == '5'){		 
		 document.getElementById("txtDocumentId").value = "";
		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
		 document.getElementById("txtDocumentName").value = "";		 
 	 }
	 if(par == '6'){		 
		 document.getElementById("txtDocumentId").value = "";
		 document.getElementById("txtClientId").value = "";
		 document.getElementById("txtCaseId").value = "";
		 document.getElementById("txtDocumentName").value = "";		 
 	 }
}
 
  
</script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>

<body onload="javascript:doOnLoad();">
 <form id="mngcasedocfrm" name="mngcasedocfrm" method="post">  
 <input type="hidden" name="hisdocid" id="hisdocid" />
 	<input type="hidden" name="hidcaseid" id="hidcaseid" />
	 <input type="hidden" name="hidclientid" id="hidclientid" /> 
<jsp:include page="topHeader.jsp" />


 <div style="padding:0px 10px; width:100%;">


 

<div id="content">
<!--<h3>Manage Case Document</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Case Document.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('mngcasedocfrm','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Manage Case Document</p> 
 <a href="#" onclick="javascript:onclickaction('mngcasedocfrm','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Case Document.pdf" target="_blank">
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

<s:if test="%{retMsg != 'E9999' && retMsg != ''}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" >
			<div class="succ">Document has been downloaded Successfully. (Please find it on <b>C:\LOMS_IMAGES_DOWNLOAD</b>) <s:hidden name="retMsg" id="retMsg" /></div>
			</div>
			</td>
		</tr>
	</s:if>
	<s:if test="%{retMsg == 'E9999' && retMsg != ''}">
		<tr>
			<td colspan="4">
			<div id="statusMsg2" style="display: inline;" >
			<div class="err">Document has not been downloaded Successfully.  <s:hidden name="retRemID" id="retRemID" /></div>
			
			</div></td>
		</tr>
	</s:if>


<tr>
	<td  nowrap="nowrap">Document ID:</td><td><s:textfield theme="simple" name="searchCaseDocBean.documentid" id="txtDocumentId" onclick="javascript:remAll('1');"></s:textfield> </td>
	<td  nowrap="nowrap">Client ID: </td><td><s:textfield theme="simple" name="searchCaseDocBean.clientid" id="txtClientId" onclick="javascript:remAll('2');"></s:textfield> 
	<a onclick="javascript:searchClientID('searchclientdoc');"><img	src="/loms/view/images/Search.png" width="25" height="20" alt="Search Client ID" /></a>
	 </td>	 
	<td  nowrap="nowrap">Case ID: </td><td><s:textfield theme="simple" name="searchCaseDocBean.caseid" id="txtCaseId" onclick="javascript:remAll('3');"></s:textfield> </td> 
	
</tr> 
 
<tr>
	<td  nowrap="nowrap">Document Name: </td><td><s:textfield theme="simple" name="searchCaseDocBean.documentname" id="txtDocumentName" onclick="javascript:remAll('4');"></s:textfield> </td>
	<td  nowrap="nowrap">From Date: </td><td><s:textfield theme="simple" name="searchCaseDocBean.fromdate" id="txtFromDate" onclick="javascript:remAll('5');"></s:textfield> 
	 </td>
	<td  nowrap="nowrap">To Date: </td><td><s:textfield theme="simple" name="searchCaseDocBean.todate" id="txtToDate" onclick="javascript:remAll('6');"></s:textfield>
	  </td>
</tr>
 
<tr>
<td >&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="button" name="groovybtn1" class="groovybutton" value="Search" onclick="javascript:onclickaction('mngcasedocfrm','searchdocresult.action');statusMsg();"/></td>
 </tr> 
<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
<s:if test="%{searchPageVar=='value'}">
<div id="search_result">
<p>Search Result</p>
 </div>
 <div id="fake-scroll-container" align=center> 
	 <div id="header-container">
		   <table border="0" width="120%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-header" >	
			 <tr>
				<th style="width : 27px;" align="center"> </th>
				<th style="width : 63px;"  >Document ID</th>
				<th style="width : 63px;" >Case ID</th>
				<th style="width : 63px;">Client ID</th>
				<th align="center">Document Name</th>
				<th align="center">Comments</th>
				<th align="center">&nbsp;</th> 
		    </tr>
 
        </table>
 </div>
 <div id="scroll">
	<s:if test="%{retSearchCaseDocBean.size >= 1}">
	 <!--  <div style="width:100%;height:250px;overflow:auto;" class="data_grid"> -->
 	<table border="0" width="100%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-body">
		<s:iterator id="listval" value="retSearchCaseDocBean" status="stat">
			   <tr class="row<s:property value="#stat.index % 2"/>" >
				<td align="center" style="width : 20px;" ><input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();"  /></td> 
				<td style="width : 60px;"><s:hidden id="hisdocid%{#stat.index}"  value="%{retSearchCaseDocBean[#stat.index].documentid}"></s:hidden> 	 
				<s:property value="retSearchCaseDocBean[#stat.index].documentid"  /></td> 
				<td style="width : 60px;"  ><s:hidden id="hidcaseid%{#stat.index}" value="%{retSearchCaseDocBean[#stat.index].caseid}"></s:hidden>
					 <s:hidden	id="hidclientid%{#stat.index}"	value="%{retSearchCaseDocBean[#stat.index].clientid}"></s:hidden> 
						<a href="#" name="cltLnkVal" id="<s:property value="retSearchCaseDocBean[#stat.index].caseid"  />"
						onclick="javascript:getlinkCaseId(this.id);viewCaseInfo(this.id);">			
					<u> <s:property value="retSearchCaseDocBean[#stat.index].caseid" /></u></a></td>					 
				<td style="width : 60px;">
					<s:hidden id="hidclientid%{#stat.index}"  value="%{retSearchCaseDocBean[#stat.index].clientid}"/> 
					<a href="#" name="cltLnkVal" id="<s:property value="retSearchCaseDocBean[#stat.index].clientid"  />" onclick="javascript:getlinkclientId(this.id);viewClientInfo(this.id);" >
					<u><s:property value="retSearchCaseDocBean[#stat.index].clientid"  /></u></a>
			    </td>	
			    
			    
				<td><s:property value="retSearchCaseDocBean[#stat.index].documentname"  /></td>
			 	<td><s:property value="retSearchCaseDocBean[#stat.index].comments"  /></td>
			 	<td>
			 	
			 	 
			 	
			 	<div style="display: none;" id="downloadLink<s:property value="#stat.index"/>"><a href="#" onclick="javascript:selOneDownload();statusMsg();" >Download</a></div>
			 	
			 	
			 	 </td> 
			 </tr>
		</s:iterator>
     </table> 
  </s:if>
 
	<s:if test="%{retSearchCaseDocBean.size==0}">
	<table border="0" width="100%" class="grid" cellpadding="0"
			cellspacing="0" border="0">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td >&nbsp;</td>
					<td align="center" class="success">No Record has been returned for the above search criteria.</td>
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
	 <s:if test="%{retSearchCaseDocBean.size >= 1}">
		 <table border="0" width="100%" class="grid" cellpadding="0"	cellspacing="0" border="0"> 
			<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td> 
			<td>
			<s:if test="%{retEmpType=='GOD'}">
			<input type="button" name="groovybtn1" class="groovybutton" value="Delete"  onclick="javascript:selDelDoc();"/>
			</s:if>
			</td> 
			<td>&nbsp;</td>
			</tr> 
		  </table>
  </s:if>
</s:if>
 </div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


  <jsp:include page="Footer.jsp" />
</form>
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
