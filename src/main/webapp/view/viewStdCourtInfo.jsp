<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
   <script  src="/loms/view/js/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>
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
	 	}	
 }
 
 var fieldName='cltChkVal';
 function getclientId(){
 var i = document.getElementsByName("cltChkVal").length;
 for (var x=0;x<i;x++){
	 
	 if(document.getElementById("cltCheckVal"+x).checked == true){
		 document.getElementById("hidcourtid").value = document.getElementById("hidcourtid"+x).value;
		 
	 }
 } 
 }
function popOnload(){
	    if(document.getElementById("retCourtID").value){
			//alert("Court Detail has been Updated Successfully \nCourt ID is "+document.getElementById("retCourtID").value);
			document.getElementById("retCourtID").value = "";
			}
		}

 function selOneUpdate(){
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
			 onclickaction('frmstdcrtinfo','updStdCrtInfo.action');
			 document.getElementById("selectOne").style.display="none";
		 }else{
			 document.getElementById("selectOne").style.display="inline";			
		 }
	 } 	
 function selOneDelete(){
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
		 onclickaction('frmstdcrtinfo','deleteCrtInfo.action');
		 document.getElementById("selectOne").style.display="none";
			}
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
 } 		 
 function getlinkcourtId(val){
	 
	 document.getElementById("hidcourtid").value = val; 
	 
 }
 
 function viewCourtInfo(val){
	 var url = "viewCourtInfo.action?hidcourtid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
 }
function remAll(par){
	 
	 if(par == '1'){		 
 		 document.getElementById("txtCourtName").value = "";
		 document.getElementById("txtCourtType").value = "";
		 document.getElementById("txtCourtCity").value = "";
		 document.getElementById("txtCourtDist").value = "";
		 document.getElementById("txtCourtState").value = "";
		 document.getElementById("txtCourtCountry").value = "";
		
	 }
	 
	 if(par == '2'){		 
		 document.getElementById("txtCourtId").value = "";
 		 document.getElementById("txtCourtType").value = "";
		 document.getElementById("txtCourtCity").value = "";
		 document.getElementById("txtCourtDist").value = "";
		 document.getElementById("txtCourtState").value = "";
		 document.getElementById("txtCourtCountry").value = "";
		
	 }
	 
	 if(par == '3'){		 
		 document.getElementById("txtCourtId").value = "";
		 document.getElementById("txtCourtName").value = "";
 		 document.getElementById("txtCourtCity").value = "";
		 document.getElementById("txtCourtDist").value = "";
		 document.getElementById("txtCourtState").value = "";
		 document.getElementById("txtCourtCountry").value = "";
		
	 }
	 
	 if(par == '4'){		 
		 document.getElementById("txtCourtId").value = "";
		 document.getElementById("txtCourtName").value = "";
		 document.getElementById("txtCourtType").value = "";
 		 document.getElementById("txtCourtDist").value = "";
		 document.getElementById("txtCourtState").value = "";
		 document.getElementById("txtCourtCountry").value = "";
		
	 }
	 
	 if(par == '5'){		 
		 document.getElementById("txtCourtId").value = "";
		 document.getElementById("txtCourtName").value = "";
		 document.getElementById("txtCourtType").value = "";
		 document.getElementById("txtCourtCity").value = "";
 		 document.getElementById("txtCourtState").value = "";
		 document.getElementById("txtCourtCountry").value = "";
		
	 }
	 
	 if(par == '6'){		 
		 document.getElementById("txtCourtId").value = "";
		 document.getElementById("txtCourtName").value = "";
		 document.getElementById("txtCourtType").value = "";
		 document.getElementById("txtCourtCity").value = "";
		 document.getElementById("txtCourtDist").value = "";
 		 document.getElementById("txtCourtCountry").value = "";
		
	 }
	 
	 if(par == '7'){		 
		 document.getElementById("txtCourtId").value = "";
		 document.getElementById("txtCourtName").value = "";
		 document.getElementById("txtCourtType").value = "";
		 document.getElementById("txtCourtCity").value = "";
		 document.getElementById("txtCourtDist").value = "";
		 document.getElementById("txtCourtState").value = "";
 		
	 }
}
 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>
<body  onload="javascript:popOnload();">
 <form id="frmstdcrtinfo" name="frmstdcrtinfo" action="searchstdcrtinfo.action" method="post">
 <input type="hidden" name="hidcourtid" id="hidcourtid" />
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;">

</div>
<div id="content">
<!--<h3>Standard Court info</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Court Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('frmstdcrtinfo','lawStandardManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/law Standard Info.png"  width="40" height="40"  /></div>
<p class="title">Standard Court info</p> 
 <a href="#" onclick="javascript:onclickaction('frmstdcrtinfo','lawStandardManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Court Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 


<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
<s:if test="%{retCourtID != ''}">
<tr>
<td>
   <s:hidden name="retCourtID" id="retCourtID" />
</td>
</tr>
</s:if>
<tr>
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
	<td colspan="6"><div id="frmstdcrtinfo_errorloc" class="error_strings"></div></td>
	 
	 
 
</tr>
<tr>
	<td  nowrap="nowrap">Court ID:</td><td><s:textfield theme="simple" name="stdCourtInfoBean.courtid" id="txtCourtId"  onclick="javascript:remAll('1');" maxlength="20"/></td>	
	 <td  nowrap="nowrap">Court Name: </td><td><s:textfield theme="simple" name="stdCourtInfoBean.courtname" id="txtCourtName" onclick="javascript:remAll('2');" maxlength="100"/></td>
	 <td  nowrap="nowrap">Court Type: </td><td><s:textfield theme="simple" name="stdCourtInfoBean.courttype" id="txtCourtType" onclick="javascript:remAll('3');" maxlength="100"/> </td>
</tr> 

<tr>	
	<td  nowrap="nowrap">Court City: </td><td><s:textfield theme="simple" name="stdCourtInfoBean.courtcity" id="txtCourtCity"  maxlength="50" onclick="javascript:remAll('4');"/></td>
	<td  nowrap="nowrap">Court Dist: </td><td><s:textfield theme="simple" name="stdCourtInfoBean.courtdist" id="txtCourtDist" onclick="javascript:remAll('5');"  maxlength="50" /> </td>
	<td  nowrap="nowrap">Court State: </td><td><s:textfield theme="simple" name="stdCourtInfoBean.courtstate" id="txtCourtState"  maxlength="50" onclick="javascript:remAll('6');"/></td>
</tr>

<tr>
	<td >&nbsp;</td><td >&nbsp;</td>
	<td>Court Country: </td><td><s:textfield theme="simple" name="stdCourtInfoBean.courtcountry" id="txtCourtCountry" onclick="javascript:remAll('7');"  maxlength="50" /> </td>
	<td >&nbsp;</td><td >&nbsp;</td>
</tr>
 
<tr>
<td >&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="groovybtn1" class="groovybutton" value="Search" /></td>
<td>&nbsp;</td>
 </tr>
<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
<s:if test="%{searchPageVar=='value'}">
<div id="search_result">
<p>Search Result</p>
 </div>
 <div id="fake-scroll-container" align="center"> 
	 <div id="header-container">
		   <table border="0" width="120%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-header" >
		<tr>
<th align="center" style="width : 27px;" >&nbsp;</th>
<th align="center">Court ID</th>
<th align="center">Court Name</th>
<th align="center">Court Type</th>
<th align="center">Court City</th>
<th align="center">Court Dist</th>
<th align="center">Court State</th> 
<th align="center">Court Country</th> 
</tr>
 
</table>
   </div>
 <div id="scroll">
<s:if test="%{arrStdCourtInfoBean.size >= 1}">
 <!--  <div style="width:100%;height:250px;overflow:auto;" class="data_grid">  -->
	<table border="0" width="100%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-body">
		<s:iterator id="listval" value="arrStdCourtInfoBean" status="stat">
		<tr class="row<s:property value="#stat.index % 2"/>" >
		<td align="center" style="width : 20px;" ><input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();"/></td> 
		<td><s:hidden id="hidcourtid%{#stat.index}"  value="%{arrStdCourtInfoBean[#stat.index].courtid}"></s:hidden> 
		<a href="#" name="cltLnkVal" id="<s:property value="arrStdCourtInfoBean[#stat.index].courtid"  />" onclick="javascript:getlinkcourtId(this.id);viewCourtInfo(this.id);" >
		<u><s:property value="arrStdCourtInfoBean[#stat.index].courtid"  /></u></a></td>
		
		<td><s:property value="arrStdCourtInfoBean[#stat.index].courtname"  /></td>
		<td><s:property value="arrStdCourtInfoBean[#stat.index].courttype"  /></td>
		<td><s:property value="arrStdCourtInfoBean[#stat.index].courtcity"  /></td>
		<td><s:property value="arrStdCourtInfoBean[#stat.index].courtdist"  /></td>
		<td><s:property value="arrStdCourtInfoBean[#stat.index].courtstate"  /></td>
		<td><s:property value="arrStdCourtInfoBean[#stat.index].courtcountry"  /></td>
		</tr>
		
		</s:iterator>
</table>
 </s:if> 
 
<s:if test="%{arrStdCourtInfoBean.size==0}">
<table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
     <tr >
			  <td  >&nbsp;</td> 
			  <td>&nbsp;</td>  
			</tr>
			<tr >
			  <td >&nbsp;</td> 
			  <td align="center" class="success">No Record has been returned for the above search criteria.</td>  
			</tr>
			<tr >
			    <td  >&nbsp;</td> 
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
</s:if>
<s:if test="%{arrStdCourtInfoBean.size >= 1}">
	<table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
	<tr>
	<td >&nbsp;</td>
	<td  align="center">
	<!-- <input type="button" name="groovybtn1" class="groovybutton" value="Add Court Info" onclick="javascript:onclickaction('frmstdcrtinfo','addstdcrtinfo.action');" />
	 -->
	 <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
	<input type="button" name="groovybtn1" class="groovybutton" value="Edit"  onclick="javascript:selOneUpdate();"/>
	 
	<input type="button" name="groovybtn1" class="groovybutton" value="Delete"  onclick="javascript:selOneDelete();"/>
	 
	</s:if>
	</td>
	<td>&nbsp;</td>
	</tr>
	</table>
</s:if>

</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
  <jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("frmstdcrtinfo");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
  frmvalidator.addValidation("txtCourtId","alpha_num","Court ID can contain only letters and numbers");
  frmvalidator.addValidation("txtCourtName","alpha_court","Court Name can contain only letters,numbers, hyphen(-) and ampersand(&)");
  frmvalidator.addValidation("txtCourtType","alpha_court","Court Type can contain only letters,numbers, hyphen(-) and ampersand(&)");
  frmvalidator.addValidation("txtCourtCity","alpha_s","Court City can contain only letters");
  frmvalidator.addValidation("txtCourtDist","alpha_s","Court District can contain only letters");
  frmvalidator.addValidation("txtCourtState","alpha_s","Court State can contain only letters");
  frmvalidator.addValidation("txtCourtCountry","alpha_s","Court Country can contain only letters");
  
  
//]]></script>
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
