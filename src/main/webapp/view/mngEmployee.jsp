<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
  <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
 <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtDateOfBirth","txtDateOfJoin"]);
		}
	</script>
 <script>
 function onclickaction(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
 
 function getEmpId(){
	 var i = document.getElementsByName("cltChkVal").length;
	 for (var x=0;x<i;x++){
		 
		 if(document.getElementById("cltCheckVal"+x).checked == true){
			 document.getElementById("hidempid").value = document.getElementById("hidempid"+x).value;
			 
		 }

	   } 
	 
	 }
 
function selOneDelEmp(){
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
		 onclickaction('mngempfrm','delEmpDet.action');
		 document.getElementById("selectOne").style.display="none";
		 }
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
}
function selOneModEmp(){
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
		 onclickaction('mngempfrm','editEmpDet.action');
		 document.getElementById("selectOne").style.display="none";
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
	
}



function getlinkclientId(val){
	 
	 document.getElementById("hidempid").value = val; 
	 
}

function viewClientInfo(val){
	 var url = "viewEmpInfo.action?hidempid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
}
function remAll(par){
	 
	 if(par == '1'){		 
 		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNumber").value = "";
		 document.getElementById("txtPANNumber").value = "";
		 document.getElementById("txtLicenseNumber").value = "";
		 document.getElementById("txtDateOfBirth").value = "";
		 document.getElementById("txtDateOfJoin").value = "";
		 
	 }
	 if(par == '2'){		 
		 document.getElementById("txtEmployeeID").value = "";
 		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNumber").value = "";
		 document.getElementById("txtPANNumber").value = "";
		 document.getElementById("txtLicenseNumber").value = "";
		 document.getElementById("txtDateOfBirth").value = "";
		 document.getElementById("txtDateOfJoin").value = "";
		 
	 }
	 if(par == '3'){		 
		 document.getElementById("txtEmployeeID").value = "";
		 document.getElementById("txtFirstName").value = "";
 		 document.getElementById("txtMobileNumber").value = "";
		 document.getElementById("txtPANNumber").value = "";
		 document.getElementById("txtLicenseNumber").value = "";
		 document.getElementById("txtDateOfBirth").value = "";
		 document.getElementById("txtDateOfJoin").value = "";
		 
	 }
	 if(par == '4'){		 
		 document.getElementById("txtEmployeeID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
 		 document.getElementById("txtPANNumber").value = "";
		 document.getElementById("txtLicenseNumber").value = "";
		 document.getElementById("txtDateOfBirth").value = "";
		 document.getElementById("txtDateOfJoin").value = "";
		 
	 }
	 if(par == '5'){		 
		 document.getElementById("txtEmployeeID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNumber").value = "";
 		 document.getElementById("txtLicenseNumber").value = "";
		 document.getElementById("txtDateOfBirth").value = "";
		 document.getElementById("txtDateOfJoin").value = "";
		 
	 }
	 if(par == '6'){		 
		 document.getElementById("txtEmployeeID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNumber").value = "";
		 document.getElementById("txtPANNumber").value = "";
 		 document.getElementById("txtDateOfBirth").value = "";
		 document.getElementById("txtDateOfJoin").value = "";
		 
	 }
	 if(par == '7'){		 
		 document.getElementById("txtEmployeeID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNumber").value = "";
		 document.getElementById("txtPANNumber").value = "";
		 document.getElementById("txtLicenseNumber").value = "";
 		 document.getElementById("txtDateOfJoin").value = "";
		 
	 }
	 if(par == '8'){		 
		 document.getElementById("txtEmployeeID").value = "";
		 document.getElementById("txtFirstName").value = "";
		 document.getElementById("txtLastName").value = "";
		 document.getElementById("txtMobileNumber").value = "";
		 document.getElementById("txtPANNumber").value = "";
		 document.getElementById("txtLicenseNumber").value = "";
		 document.getElementById("txtDateOfBirth").value = "";
 		 
	 }
}
 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>

<body onload="javascript:doOnLoad();">
 <form id="mngempfrm" id="mngempfrm" action="searchEmpInfoRes.action" method="post">
  <s:hidden name="hidempid" id="hidempid" />
<jsp:include page="topHeader.jsp" />


 <div style="padding:0px 10px; width:100%;">


 

<div id="content">
<!--<h3>Manage Employee</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Employee Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--           <a href="#" onclick="javascript:onclickaction('mngempfrm','employeeManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Employee Management.png"  width="40" height="40"  /></div>
<p class="title">Manage Employee</p> 
 <a href="#" onclick="javascript:onclickaction('mngempfrm','employeeManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Employee Information.pdf" target="_blank">
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
		<td colspan="6">
		<div id="mngempfrm_errorloc" class="error_strings"></div>
		</td>
		<td align="right"></td>
	</tr>

<tr>
	<td  nowrap="nowrap">Employee ID:</td><td><s:textfield theme="simple" name="searchempidbean.employeeid" id="txtEmployeeID" onclick="javascript:remAll('1');"></s:textfield> </td>
    <td  nowrap="nowrap">First Name: </td><td><s:textfield theme="simple"  name="searchempidbean.firstname" id="txtFirstName" onclick="javascript:remAll('2');"></s:textfield></td>
    <td  nowrap="nowrap">Last Name: </td><td><s:textfield theme="simple"  name="searchempidbean.lastname" id="txtLastName" onclick="javascript:remAll('3');"></s:textfield> </td>
</tr> 
 
<tr>
 <td  nowrap="nowrap">Mobile Number: </td><td><s:textfield theme="simple"  name="searchempidbean.mobilenumber" id="txtMobileNumber"  maxlength="15" onclick="javascript:remAll('4');"></s:textfield> </td>
 <td  nowrap="nowrap">PAN Number: </td><td><s:textfield theme="simple"  name="searchempidbean.pannumber" id="txtPANNumber" onclick="javascript:remAll('5');"></s:textfield> </td>
 <td  nowrap="nowrap">License Number: </td><td><s:textfield theme="simple"  name="searchempidbean.licensenumber" id="txtLicenseNumber" onclick="javascript:remAll('6');"></s:textfield> </td>

</tr>
 
 <tr>

 <td>Date of Birth: </td><td><s:textfield theme="simple"  name="searchempidbean.dateofbirth" id="txtDateOfBirth"  maxlength="15" onclick="javascript:remAll('7');" readonly="true"></s:textfield>
   
 </td>
 <td>Date of Joining: </td><td><s:textfield theme="simple"  name="searchempidbean.dataofjoin" id="txtDateOfJoin" onclick="javascript:remAll('8');" readonly="true"></s:textfield>
   
 </td>
<td >&nbsp;</td> <td >&nbsp;</td>

</tr>
<tr>
<td >&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="groovybtn1" class="groovybutton" value="Search"  /></td>
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
					<th style="width : 27px;"   width= "1%"></th>
					<th   width= "10%">Employee ID</th>
					<th   width= "10%">First Name</th>
					<th   width= "10%">Last Name</th>
					<th   width= "10%">Nationality</th>
					<th   width= "10%">Date of Birth</th>
					<th   width= "10%">Mobile No</th> 
					<th   width= "10%">Date of Joining</th> 
					<th   width= "10%">PAN No</th> 
					<th   width= "10%">License No</th> 
		      </tr>
        </table>
     </div>
 <div id="scroll">
<s:if test="%{retAddEmpBean.size >= 1}">
  <!--  <div style="width:100%;height:250px;overflow:auto;" class="data_grid"> -->
 	<table border="0" width="100%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-body">
		<s:iterator id="listval" value="retAddEmpBean" status="stat">		
			<tr class="row<s:property value="#stat.index % 2"/>">
				<td align="center"  style="width : 20px;"><input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getEmpId();"/></td> 
				 <td  width= "10%">
				 <a href="#" name="cltLnkVal" id="<s:property value="retAddEmpBean[#stat.index].employeeid" />"  onclick="javascript:getlinkclientId(this.id);viewClientInfo(this.id);" /><u><s:hidden id="hidempid%{#stat.index}" value="%{retAddEmpBean[#stat.index].employeeid}"></s:hidden> 
				 <s:property value="retAddEmpBean[#stat.index].employeeid"  /></u></a></td>				
				 
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].firstname"  /></td>
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].lastname"  /></td>
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].nationality"  /></td>
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].dateofbirth"  /></td>
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].mobileno"  /></td>
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].dateofjoining"  /></td>
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].panno"  /></td>
				<td width= "10%"><s:property value="retAddEmpBean[#stat.index].licenseno"  /></td>		 
			</tr>		
		</s:iterator>
    </table>
 </s:if> 
 
	<s:if test="%{retAddEmpBean.size==0}">
	     <table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td >&nbsp;</td>
					<td align="center" class="success">No Record has been
					returned for the above search criteria.</td>
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
<s:if test="%{retAddEmpBean.size >= 1}">
	 <table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td colspan="2">
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
			<input type="button" name="groovybtn1" class="groovybutton" value="Edit"   onclick="javascript:selOneModEmp();" />
			</s:if>
			<s:if test="%{retEmpType=='GOD'}">
			<input type="button" name="groovybtn1" class="groovybutton" value="Delete"  onclick="javascript:selOneDelEmp();"  />
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
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("mngempfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether(); 
	frmvalidator.addValidation("txtEmployeeID", "alpha_num","Employee ID can contain only letters and numbers");	 
	frmvalidator.addValidation("txtFirstName", "alpha_sp","First Name can contain only letters(No spaces)");
	frmvalidator.addValidation("txtLastName", "alpha_s","Last Name can contain only letters");
 	frmvalidator.addValidation("txtMobileNumber", "num_s","Mobile number can contain only numbers");
	frmvalidator.addValidation("txtMobileNumber", "mobzero","Mobile No should be greater then Zero");
 	frmvalidator.addValidation("txtPANNumber", "alpha_PANnum","PAN Number can contain only letters and numbers(No spaces)");
 	frmvalidator.addValidation("txtLicenseNumber","alpha_tin","License can contain only letters,numbers and slash(/)");

 
	
	
	
	//
</script>
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
