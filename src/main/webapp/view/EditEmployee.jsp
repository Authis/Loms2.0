<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script type="text/javascript" src="/loms/view/js/rakshaval.js"></script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtDateofBirth","txtDateofJoining"]);
		}
	</script>
<script>
function onclickaction(formname, actionname) {
	if (document.getElementById(formname)) {
		document.getElementById(formname).action = actionname;
		document.getElementById(formname).submit();
	}
}
	function addEmpInfo(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	function popOnload() {
		if (document.getElementById("retEmpID").value != 'Failer') {
			//alert("Employee Info has been Updated Successfully");
			document.getElementById("retEmpID").value = "";

		}
	}
	
	function statusMsg(){
		
		if(document.getElementById("statusMsg1")){
			 document.getElementById("statusMsg1").style.display = "none";
		  }else{
			 document.getElementById("statusMsg2").style.display = "none";
		  }
	}
</script>
</head>
<body
	onload="javascript:doOnLoad();popOnload();">
<form id="editempfrm" id="editempfrm" method="post"
	action="editEmployeeInfo.action" onreset="return confirm('Do you want to reset the data?')">
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Update Employee</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Update Employee Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('editempfrm','employeeManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->



 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Employee Management.png"  width="40" height="40"  /></div>
<p class="title">Update Employee</p> 
 <a href="#" onclick="javascript:onclickaction('editempfrm','employeeManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Update Employee Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 


<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="50%" style="border-color: gray"  cellpadding="10" cellspacing="10">
	<s:if test="%{retEmpID != ''}">
		<tr>
			<td colspan="4">
			<div id="statusMsg1" style="display: inline;" ><div class="succ">Employee Info has been Updated Successfully <s:hidden
				name="retEmpID" id="retEmpID" /></div></div>
			</td>
		</tr>
	</s:if>
	<tr>
		<td colspan="2">
		<div id="editempfrm_errorloc" class="error_strings"></div>
		</td>
		<td align="right"></td>
	</tr>
	<tr>
		<td>Employee ID:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addEmpBean.employeeid"
			id="txtEmpId" cssStyle="width: 200px;"  readonly="true" /></td>
	</tr>
	<tr>
		<td>First Name:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addEmpBean.firstname"
			id="txtFirstName" cssStyle="width: 200px;" maxlength="50" /></td>
	</tr>
	<tr>
		<td>Last Name:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addEmpBean.lastname"
			id="txtLastName" cssStyle="width: 200px;" maxlength="50"/></td>
	</tr>
	<tr>
		<td>Gender:<span class="mandi">*</span></td>
		<td><s:select theme="simple" name="addEmpBean.gender"
			value="%{addEmpBean.gender}" headerValue="Select Gender" 
			headerKey="" id="flggender" list="retGender" cssStyle="width:200px;"></s:select>



		</td>
	</tr>
	<tr>
		<td>Address:</td>
		<td><s:textarea theme="simple" name="addEmpBean.address"
			id="txtAddress" cssStyle="width: 200px;">
		</s:textarea></td>
	</tr>

	<tr>
		<td>Nationality:</td>
		<td><s:textfield theme="simple" name="addEmpBean.nationality"
			id="txtNationality" cssStyle="width: 200px;" maxlength="25" /></td>
	</tr>
	<tr>
		<td>Date of Birth:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addEmpBean.dateofbirth"
			id="txtDateofBirth" cssStyle="width: 200px;"  readonly="true"/>  </td>
	</tr>
	<tr>
		<td>Telephone No:</td>
		<td><s:textfield theme="simple" name="addEmpBean.telephoneno"
			id="txtTelephoneNo" cssStyle="width: 200px;" maxlength="20" /></td>
	</tr>
	<tr>
		<td>Mobile No:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addEmpBean.mobileno"
			id="txtMobileNo" cssStyle="width: 200px;" maxlength="20" /></td>
	</tr>
	<tr>
		<td>Date of Joining:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="addEmpBean.dateofjoining"
			id="txtDateofJoining" cssStyle="width: 200px;" readonly="true"/>  </td>
	</tr>
	<tr>
		<td>PAN No:</td>
		<td><s:textfield theme="simple" name="addEmpBean.panno"
			id="txtPANNo" cssStyle="width: 200px;" maxlength="20"/></td>
	</tr>
	<tr>
		<td>License No:</td>
		<td><s:textfield theme="simple" name="addEmpBean.licenseno"
			id="txtLicenseNo" cssStyle="width: 200px;" maxlength="20"/></td>
	</tr>



	<tr>
		<td>User Type:<span class="mandi">*</span></td>
		<td><s:select theme="simple" name="addEmpBean.usertype"
			value="%{addEmpBean.usertype}" headerValue="Select User Type"
			headerKey="" id="txtUserType" list="retUserType"
			cssStyle="width:200px;"></s:select></td>
	</tr>
 

	<tr>
		<td>Comments:</td>
		<td><s:textarea theme="simple" name="addEmpBean.comments"
			id="txtComments" cssStyle="width: 200px;"></s:textarea></td>
	</tr>
	<tr>
		<td colspan="1">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="1">&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan="1">
		<input type="submit" name="groovybtn1"
			class="groovybutton" value="Update Employee"  onclick="javascript:statusMsg();"/> <input type="reset"
			name="groovybtn1" class="groovybutton" value="   Reset   " onclick="" />
		<input type="button" name="groovybtn1" class="groovybutton"
			value="Back"
			onclick="javascript:onclickaction('editempfrm','searchEmpInfoRes.action')" />
		</td>

	</tr>
</table>
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
	var frmvalidator = new Validator("editempfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	frmvalidator.setAddnlValidationFunction(editEmpDateChk);
	frmvalidator.addValidation("txtFirstName", "req","First Name cannot be blank");	 
	frmvalidator.addValidation("txtFirstName", "alpha_sp","First Name can contain only letters");
	frmvalidator.addValidation("txtLastName", "req","Last Name cannot be blank"); 
	frmvalidator.addValidation("txtLastName", "alpha_space","Last Name can contain only letters. No spaces, numbers, special characters allowed.");
	frmvalidator.addValidation("txtDateofJoining", "req","Date of Joining cannot be blank");
	
	frmvalidator.addValidation("txtPANNo", "alpha_PANnum","PAN Number can contain only letters and numbers");
	frmvalidator.addValidation("txtLicenseNo","alpha_tin","License can contain only letters,numbers and slash(/)");
	
	frmvalidator.addValidation("txtDateofBirth", "req","Date of Birth cannot be blank");
	frmvalidator.addValidation("flggender", "req", "Please Select a Gender");
	frmvalidator.addValidation("txtMobileNo", "req","Mobile Number cannot be blank");	 
	frmvalidator.addValidation("txtMobileNo", "num_s","Mobile number can contain only numbers");
	frmvalidator.addValidation("txtMobileNo", "mobzero","Mobile No should be greater then Zero");
	
	frmvalidator.addValidation("txtTelephoneNo", "num_s","Telephone number can contain only numbers");
	frmvalidator.addValidation("txtTelephoneNo", "mobzero","Telephone No should be greater then Zero");
	
	frmvalidator.addValidation("txtAddress","alpha_addr","Address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");
	
	
	
	frmvalidator.addValidation("txtNationality", "alpha_space","Nationality can contain only letters");

	frmvalidator.addValidation("txtAddress", "maxlen=500"," Address cannot exceed 500 characters"); 
	frmvalidator.addValidation("txtUserType", "req","User Type cannot be blank");	 	
	frmvalidator.addValidation("txtsecQue1", "req","Security Question 1 cannot be blank");	
	frmvalidator.addValidation("txtAnswer1", "req","Security Answer 1 cannot be blank");	
	frmvalidator.addValidation("txtAnswer11", "req","Re Enter Answer 1 cannot be blank");	
	frmvalidator.addValidation("txtsecQue2", "req",	"Security Question 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer2", "req",	"Security Answer 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer22", "req", "Security Re Enter Answer 2 cannot be blank");	
	frmvalidator.addValidation("txtsecQue2", "req",	"Security Question 2 cannot be blank");
	frmvalidator.addValidation("txtEmailID", "req",	"Email ID cannot be blank");
	frmvalidator.addValidation("txtEmailID", "email");	
	frmvalidator.addValidation("txtDateofBirth", "date");
	frmvalidator.addValidation("txtDateofJoining", "date");
	frmvalidator.addValidation("txtComments", "maxlen=500","Comments cannot exceed 500 characters"); 
	frmvalidator.setAddnlValidationFunction(yearValidationEmpEdit);
	//
</script>
</body>
</html>
