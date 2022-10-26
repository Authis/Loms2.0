<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
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
	 		document.getElementById(formname).action= "";
	 	}	
 }
 
 
 function getclientId(){
 var i = document.getElementsByName("cltChkVal").length;
 for (var x=0;x<i;x++){
	 
	 if(document.getElementById("cltCheckVal"+x).checked == true){
		 document.getElementById("hidclientid").value = document.getElementById("hidclientid"+x).value;
		  
	 }

   } 
 }
 
 function getlinkclientId(val){
	 
	 document.getElementById("hidclientid").value = val; 
	 
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
		
		 onclickaction('mngclient','updClinetInfo.action');
		 document.getElementById("selectOne").style.display="none";
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
	 
 }
 function selOneGetFam(){
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
		 onclickaction('mngclient','getCliFamInfo.action');
		 document.getElementById("selectOne").style.display="none";
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
	 
	 
 }
 
 function selOneAddFam(){
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
		 onclickaction('mngclient','addFamInfoView.action');
		 document.getElementById("selectOne").style.display="none";
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
 }
 
 function downloadFile(){
	 onclickaction('mngclient','downloadFile.action');
	 
 }
 
 function viewClientInfo(val){
	 var url = "viewClientInfo.action?hidclientid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
 }
 
 function searchClientID(val) {

		var url = "searchClientID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
 
 function remAll(par){
	 
	 if(par == '1'){		 
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNo").value = "";
		 document.getElementById("txtPanNo").value = "";
		 document.getElementById("txtTinNo").value = "";
	 }
	 if(par == '2'){
		 document.getElementById("txtClientID").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNo").value = "";
		 document.getElementById("txtPanNo").value = "";
		 document.getElementById("txtTinNo").value = "";
	 }
	 
	 if(par == '3'){
		 document.getElementById("txtClientID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtMobileNo").value = "";
		 document.getElementById("txtPanNo").value = "";
		 document.getElementById("txtTinNo").value = "";
	 }
	 
	 if(par == '4'){
		 document.getElementById("txtClientID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtPanNo").value = "";
		 document.getElementById("txtTinNo").value = "";
	 }
	 
	 if(par == '5'){
		 document.getElementById("txtClientID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNo").value = "";
		 document.getElementById("txtTinNo").value = "";
	 }
	 
	 if(par == '6'){
		 document.getElementById("txtClientID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNo").value = "";
		 document.getElementById("txtPanNo").value = "";
	 }
	 
 }
 </script>
 
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>
<body >
<form id="mngclient" name="mngclient" action="searchresult.action" method="post">
 <s:hidden name="hidclientid" id="hidclientid" />
<jsp:include page="topHeader.jsp" />
 

 
<div id="content" >
<!--<h3>Manage Client Information</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Client Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--       <a href="#" onclick="javascript:onclickaction('mngclient','clientManagement.action');">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Client Management.png"  width="40" height="40"  /></div>
<p class="title">Manage Client Information</p> 
 <a href="#" onclick="javascript:onclickaction('mngclient','clientManagement.action');"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Client Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
<tr>
 <td colspan="3">
	<div style="display: none;" id="selectOne">
		 <table><tr><td >		 
			<ul class="TickList"><li><font color="blue">Please Select atleast one record</font></li></ul>
		 </td></tr></table>
	</div>
</td>
</tr>
<tr> 
	<td colspan="4"><div id="mngclient_errorloc" class="error_strings"></div></td>
	<td align="right"> </td>
	 
 
</tr>
<tr>
	<td nowrap="nowrap">Client ID:</td><td><s:textfield  theme="simple" name="searchbean.clientId" id="txtClientID" onclick="javascript:remAll('1');" maxlength="8"></s:textfield></td>
	<td nowrap="nowrap">First Name: </td><td><s:textfield theme="simple" name="searchbean.firstName" id="txtFirstName" onclick="javascript:remAll('2');" maxlength="50"></s:textfield></td>
	<td nowrap="nowrap">Last Name: </td><td><s:textfield theme="simple" name="searchbean.lastName" id="txtLastName" onclick="javascript:remAll('3');" maxlength="50"></s:textfield></td>	  
</tr> 
 <tr>
	<td nowrap="nowrap">Mobile No: </td><td><s:textfield theme="simple" name="searchbean.mobNo" id="txtMobileNo" onclick="javascript:remAll('4');" maxlength="20"> </s:textfield></td>
	<td nowrap="nowrap">PAN Number: </td><td><s:textfield theme="simple" name="searchbean.panNo" id="txtPanNo" onclick="javascript:remAll('5');" maxlength="25"> </s:textfield></td>
	<td nowrap="nowrap">TIN Number: </td><td><s:textfield theme="simple" name="searchbean.tinNo" id="txtTinNo" onclick="javascript:remAll('6');" maxlength="25"> </s:textfield></td>
</tr>
<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
 
<tr>
<td >&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="groovybtn1" class="groovybutton" value="Search" /></td>
 </tr>

</table>
<s:if test="%{searchPageVar=='value'}">
 <div id="search_result">
<table width="100%" >
   <tr> 
      <td align="left"><p>Search Result</p> </td>
      <s:if test="%{retvaladdClientBean.size >= 1}">
      <td align="right"> Download as Excel
					<a href="#"  onclick="javascript:downloadFile();"><img src="/loms/view/img/Download-icon.png" width="24px" height="24px" border="0" alt="Download as XLS" /> </a>
					
	  </td>
	  </s:if>
  </tr>
</table>

 </div>
 <div id="fake-scroll-container" align=center> 
	 <div id="header-container">
		<table width="100%" id="table-header" cellpadding="1" cellspacing="1"> 	 
			<tr>
				<th style="width : 20px;"  align="center"></th>
				<th  align="center">Client ID</th>
				<th  align="center">Name</th>
				<th  align="center">Mobile Number</th>
				<th  align="center">Telephone Number</th>
				<th  align="center">PAN Number</th>
				<th  align="center">TIN Number</th>
				<th  align="center">Address</th>		
			</tr> 
	   </table>
  </div>
 <div id="scroll">
 <s:if test="%{retvaladdClientBean.size >= 1}">
  <!--  <div style="width:100%;height:250px;overflow:auto;"> -->
        <table id="table-body" cellpadding="0" cellspacing="0">
			<s:iterator id="listval" value="retvaladdClientBean" status="stat" >
			<tr class="row<s:property value="#stat.index % 2"/>" >
			<td align="center" style="width : 20px;">
				<input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getclientId();"/>
			</td> 
			<td>
				<s:hidden id="hidclientid%{#stat.index}"  value="%{retvaladdClientBean[#stat.index].clientid}"/> 
				<a href="#" name="cltLnkVal" id="<s:property value="retvaladdClientBean[#stat.index].clientid"  />" onclick="javascript:getlinkclientId(this.id);viewClientInfo(this.id);" >
				<u><s:property value="retvaladdClientBean[#stat.index].clientid"  /></u></a>
			</td>				
			<td  width="20%"><s:property value="retvaladdClientBean[#stat.index].firstname"  />
			   <s:property value="retvaladdClientBean[#stat.index].lastname"  /> &nbsp;</td>
			<td width="15%"><s:property value="retvaladdClientBean[#stat.index].mobilenumber"  />&nbsp;</td>
			<td width="15%"><s:property value="retvaladdClientBean[#stat.index].telephoneno"  />&nbsp;</td>		
			
			<td width="10%"><s:property value="retvaladdClientBean[#stat.index].pannumber"  />&nbsp;</td>
			<td width="10%"><s:property value="retvaladdClientBean[#stat.index].tinnumber"  />&nbsp;</td>		
			
			<td width="39%" >
				<s:if test="%{retvaladdClientBean[#stat.index].temporaryaddress != null}">			
					<s:property value="retvaladdClientBean[#stat.index].temporaryaddress"  />
				</s:if> 
				<s:else>
					<s:property value="retvaladdClientBean[#stat.index].permanentaddress"  />
				</s:else>			
			&nbsp;</td> 
			</tr>
			</s:iterator>			
	</table>
	<!--   </div> -->
	
		</s:if>
		<s:if test="%{retvaladdClientBean.size==0}">
		<table border="0" width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td align="center" colspan="2" class="success">No Record has been
				returned for the above search criteria.</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
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
	  <s:if test="%{retvaladdClientBean.size >= 1}">
	 <table border="0" width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr>
				 
				<td align="center" colspan="2">
				<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				<input type="button" name="groovybtn1" class="groovybutton" value="Edit Client Information" onclick="javascript:selOneUpdate();" />
				</s:if>
				 
				<input type="button" name="groovybtn1" class="groovybutton" value="Get Family Information"  onclick="javascript:selOneGetFam();"/>
				 
				<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				<input type="button" name="groovybtn1" class="groovybutton" value="Add Family Information"  onclick="javascript:selOneAddFam();" />
				 </s:if>
				</td>
			   
			</tr>
 	</table>
	 </s:if>
	 
	</s:if>
 </div>
 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
 
</form>
<br clear="all" class="clear">
 <script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("mngclient");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
  frmvalidator.addValidation("txtClientID","alpha_num","Client ID can contain only letters and numbers");
  frmvalidator.addValidation("txtFirstName","alpha_s","First Name can contain only letters");
  frmvalidator.addValidation("txtLastName","alpha_s","Last Name can contain only letters");
  frmvalidator.addValidation("txtMobileNo","numeric","Mobile No can contain only numbers");
  frmvalidator.addValidation("txtPanNo","alpha_num","Pan No can contain only letters and numbers");
  frmvalidator.addValidation("txtTinNo","alpha_num","Tin No can contain only letters,numbers and slash(/)");
  
 // frmvalidator.setAddnlValidationFunction(searchPageClient);
  
//]]></script>
  <jsp:include page="Footer.jsp" />

</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
