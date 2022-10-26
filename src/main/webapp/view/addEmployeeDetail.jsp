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
	function addEmpInfo(formname, actionname) {
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	function popOnload() {
		if (document.getElementById("retEmpID").value) {
			
			document.getElementById("retEmpID").value = "";
			document.getElementById("retUserName").value = "";
			document.getElementById("retPassword").value = "";
		}
	}
	
	
	function statusMsg(){
			
			   if(document.getElementById("statusMsg1")){
				 document.getElementById("statusMsg1").style.display = "none";
			  }
		}
</script>
</head>
<body
	onload="javascript:doOnLoad();popOnload();">
<form id="addempfrm" method="post" action="addEmployeeInfo.action" onreset="return confirm('Do you want to reset the data?')">
<jsp:include page="topHeader.jsp" />


<div style="padding:0px 10px; width:100%;">
 

<div id="content">
<!--<h3>Add Employee</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Employee Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('addempfrm','employeeManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Employee Management.png"  width="40" height="40"  /></div>
<p class="title">Add Client Information</p> 
 <a href="#" onclick="javascript:onclickaction('addempfrm','employeeManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Employee Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 


 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="60%" style="border-color: gray"  cellpadding="10" cellspacing="10">
	<s:if test="%{errMsg != '' && errMsg != 'E9999' && mailErrorStr !='notSent'}">
		<tr>
			<td colspan="4"><div id="statusMsg1" style="display: inline;" >	<div class="succ">		
			<table width = "100%">
			<tr><td>Employee Info has been added Successfully. Employee ID is: <s:property value="retEmpID" id="retEmpID" /></td></tr>
			<tr><td><b>User Name:</b> <s:property value="retUserName" id="retUserName" /></td></tr>
			<tr><td><b>Password:</b> <s:property value="retPassword" id="retPassword" /></td></tr>	 
			<tr><td>Your Credentials has been sent to Your Email ID.</td></tr>
			</table>
			</div></div></td>
			<td><s:hidden name="retEmpID" id="retEmpID" />
			<s:hidden name="retUserName" id="retUserName" />
			<s:hidden name="retPassword" id="retPassword" /></td>
		</tr>
	</s:if>
	<s:if test="%{errMsg != '' && errMsg != 'E9999' && mailErrorStr =='notSent'}">
		<tr>
			<td colspan="4"><div id="statusMsg1" style="display: inline;" >	<div class="succ">		
			<table width = "100%">
			<tr><td>Employee Info has been added Successfully. Employee ID is: <s:property value="retEmpID" id="retEmpID" /></td></tr>
			<tr><td><b>User Name:</b> <s:property value="retUserName" id="retUserName" /></td></tr>
			<tr><td><b>Password:</b> <s:property value="retPassword" id="retPassword" /></td></tr>	 
			<tr><td>Your Credentials has been sent to Your Email ID.</td></tr>
			<tr><td> <font color="red" >Note: Email has not been sent to the Client due to Internet Problem</font></td></tr>
			</table>
			</div></div></td>
			<td><s:hidden name="retEmpID" id="retEmpID" />
			<s:hidden name="retUserName" id="retUserName" />
			<s:hidden name="retPassword" id="retPassword" /></td>
		</tr>
	</s:if>
	<s:if test="%{errMsg != '' && errMsg == 'E9999'}">
		<tr>
			<td colspan="4"><div id="statusMsg1" style="display: inline;" >	<div class="err">		
			<table width = "100%">
			<tr><td>Employee Info has not been added Successfully.</td></tr>			 
			</table>
			</div></div></td>
			<td><s:hidden name="retEmpID" id="retEmpID" />
			<s:hidden name="retUserName" id="retUserName" />
			<s:hidden name="retPassword" id="retPassword" /></td>
		</tr>
	</s:if>
	
	<tr>
		<td colspan="2">
		<div id="addempfrm_errorloc" class="error_strings"></div>
		</td>
		<td align="right"></td>
	</tr>
	<tr>
		<td>First Name:<span class="mandi">*</span></td>
		<td><input type="text" name="addEmpBean.firstname"
			id="txtFirstName" style="width: 200px;" maxlength="50" /></td>
	</tr>
	<tr>
		<td>Last Name:<span class="mandi">*</span></td>
		<td><input type="text" name="addEmpBean.lastname"
			id="txtLastName" style="width: 200px;" maxlength="50"/></td>
	</tr>
	<tr>
		<td>Gender:<span class="mandi">*</span></td>
		<td>	 
		 <select name="addEmpBean.gender" id="flggender" style="width: 205px;" >
			<option value="">Select Gender</option>
			<option value="MALE">MALE</option>
			<option value="FEMALE">FEMALE</option>
			<option value="OTHER">OTHER</option>
		</select>
		
		</td>
	</tr>
	<tr>
		<td>Address:</td>
		<td><textarea name="addEmpBean.address" id="txtAddress" style="width: 200px;" > </textarea></td>
	</tr>

	<tr>
		<td>Nationality:</td>
		<td><input type="text" name="addEmpBean.nationality"
			id="txtNationality" style="width: 200px;" maxlength="25"/></td>
	</tr>
	<tr>
		<td>Date of Birth:<span class="mandi">*</span></td>
		<td><input type="text" name="addEmpBean.dateofbirth"
			id="txtDateofBirth" style="width: 200px;" readonly="true"/> </td>
	</tr>
	<tr>
		<td>Telephone No:</td>
		<td><input type="text" name="addEmpBean.telephoneno"
			id="txtTelephoneNo" style="width: 200px;" maxlength="20"/></td>
	</tr>
	<tr>
		<td>Mobile No:<span class="mandi">*</span></td>
		<td><input type="text" name="addEmpBean.mobileno"
			id="txtMobileNo" style="width: 200px;" maxlength="20" /></td>
	</tr>
	<tr>
		<td>Date of Joining:<span class="mandi">*</span></td>
		<td><input type="text" name="addEmpBean.dateofjoining"
			id="txtDateofJoining" style="width: 200px;" readonly="true"/>  </td>
	</tr>
	<tr>
		<td>PAN No:</td>
		<td><input type="text" name="addEmpBean.panno" id="txtPANNo" style="width: 200px;" maxlength="20" /></td>
	</tr>
	<tr>
		<td>License No:</td>
		<td><input type="text" name="addEmpBean.licenseno"
			id="txtLicenseNo" style="width: 200px;" maxlength="20"/></td>
	</tr>
	
	<tr>
		<td>Email ID:<span class="mandi">*</span></td>
		<td><input type="text" name="addEmpBean.empemail"
			id="txtEmailID" style="width: 200px;"  maxlength="100"/></td>
	</tr>
	
	<tr>
		<td>User Type:<span class="mandi">*</span></td>
		<td><select name="addEmpBean.usertype"  
			id="txtUserType" style="width: 205px;" >
			<option value="">Select User Type</option>
			<option value="ADMIN">ADMIN</option>
			<option value="USER">USER</option>			
		</select></td>
	</tr>
	<tr>
		<td>Security Question 1:<span class="mandi">*</span></td>
		<td><select name="addEmpBean.secquestion1"  
			id="txtsecQue1" style="width: 300px;" >
			<option value="">Select Security Question</option>
			<option value="Last Name of Family Doctor">Last Name of
			Family Doctor</option>
			<option value="Who is your all time favorite cricketer">Who
			is your all time favorite cricketer</option>
			<option value="Which web-site you created your first e-mail account">Which
			web-site you created your first e-mail account</option>
			<option value="Last 4 digits of your passport number">Last 4
			digits of your passport number</option>
			<option value="In Which Month does your Father's Birthday come">In
			Which Month does your Father's Birthday come</option>

		</select></td>
	</tr>
	<tr>
		<td>Security Answer 1:<span class="mandi">*</span></td>
		<td><input type="password" name="addEmpBean.answer1" id="txtAnswer1" style="width: 200px;" maxlength="20"/> 
		</td>
	</tr>
	<tr>
		<td>Re Enter Security Answer 1:<span class="mandi">*</span></td>
		<td><input type="password" name="txtAnswer11" id="txtAnswer11" style="width: 200px;" maxlength="20"/> 
		</td>
	</tr>
	
	<tr>
		<td>Security Question 2:<span class="mandi">*</span></td>
		<td><select name="addEmpBean.secquestion2" 
			id="txtsecQue2" style="width: 300px;" >
			<option value="">Select Security Question</option>
			<option value="What is the Brand of the First vehicle you owned">What
			is the Brand of the First vehicle you owned</option>
			<option value="Preferred brand of Shampoo">Preferred brand
			of Shampoo</option>
			<option value="Which Brand of Mobile Phone did you first own">Which
			Brand of Mobile Phone did you first own</option>
			<option value="How many brother/sisters does your father have">How
			many brother/sisters does your father have</option>
			<option value="You can write in how many languages">You can
			write in how many languages</option>
		</select></td>
	</tr>
	<tr>
		<td>Security Answer 2:<span class="mandi">*</span></td>
		<td><input type="password" name="addEmpBean.answer2" id="txtAnswer2" style="width: 200px;" maxlength="20"/>
		</td>
	</tr>
     <tr>
		<td>Re Enter  Answer 2:<span class="mandi">*</span></td>
		<td><input type="password" name="txtAnswer22" id="txtAnswer22" style="width: 200px;" maxlength="20" />
		</td>
	</tr>
	<tr>
		<td>Comments:</td>
		<td><textarea type="text" name="addEmpBean.comments"
			id="txtComments" style="width: 200px;" ></textarea></td>
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
		<input type="submit" name="groovybtn1"	class="groovybutton" value="Add" onclick="javascript:statusMsg();"  />
			 <input type="reset" name="groovybtn1" class="groovybutton" value="Reset" onclick="" />
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
	var frmvalidator = new Validator("addempfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	

	
	frmvalidator.addValidation("txtFirstName", "req","First Name cannot be blank");	 
	frmvalidator.addValidation("txtFirstName", "alpha_sp","Spaces not allowed in First Name");
	frmvalidator.addValidation("txtLastName", "req","Last Name cannot be blank"); 
	frmvalidator.addValidation("txtLastName", "alpha_space","Last Name can contain only letters. No spaces, numbers, special characters allowed.");
	frmvalidator.addValidation("txtDateofJoining", "req","Date of Joining cannot be blank");
	
	frmvalidator.addValidation("txtPANNo", "alpha_PANnum","PAN Number can contain only letters and numbers(No spaces)");
	frmvalidator.addValidation("txtLicenseNo","alpha_tin","License can contain only letters,numbers and slash(/)");
	frmvalidator.addValidation("txtDateofBirth", "req","Date of Birth cannot be blank");
	frmvalidator.addValidation("flggender", "req", "Please Select a Gender");
	
	frmvalidator.addValidation("txtAddress","alpha_addr","Address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&) and period(.)");
	
	frmvalidator.addValidation("txtMobileNo", "req","Mobile Number cannot be blank");	 
	frmvalidator.addValidation("txtMobileNo", "num_s","Mobile number can contain only numbers");
	frmvalidator.addValidation("txtMobileNo", "mobzero","Mobile No should be greater then Zero");
	
	frmvalidator.addValidation("txtTelephoneNo", "num_s","Telephone number can contain only numbers");
	frmvalidator.addValidation("txtTelephoneNo", "mobzero","Telephone No should be greater then Zero");
	
	
	frmvalidator.addValidation("txtNationality", "alpha_space","Nationality can contain only letters");
	
	frmvalidator.addValidation("txtAddress", "maxlen=500"," Address cannot exceed 500 characters"); 
	frmvalidator.addValidation("txtUserType", "req","User Type cannot be blank");	 	
	
	
	frmvalidator.addValidation("txtsecQue1", "req","Security Question 1 cannot be blank");	
	frmvalidator.addValidation("txtAnswer1", "req","Security Answer 1 cannot be blank");	
	frmvalidator.addValidation("txtAnswer11", "req","Re Enter Answer 1 cannot be blank");
	frmvalidator.addValidation("txtAnswer1", "alpha_PANnum","Security Answer 1 can contain only numbers and letters");	

	frmvalidator.addValidation("txtsecQue2", "req",	"Security Question 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer2", "req",	"Security Answer 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer22", "req", "Security Re Enter Answer 2 cannot be blank");	
	frmvalidator.addValidation("txtAnswer2", "alpha_PANnum","Security Answer 2 can contain only numbers and letters");	
 	

	
	frmvalidator.addValidation("txtEmailID", "req",	"Email ID cannot be blank");
	frmvalidator.addValidation("txtEmailID", "email");	
	frmvalidator.addValidation("txtDateofBirth", "date");
	frmvalidator.addValidation("txtDateofJoining", "date");
	
	frmvalidator.addValidation("txtComments", "maxlen=500","Comments cannot exceed 500 characters");  
	
	frmvalidator.setAddnlValidationFunction(yearValidationEmp);
	 frmvalidator.setAddnlValidationFunction(addEmpDateChk);
	frmvalidator.setAddnlValidationFunction(secAns1Check);	
	frmvalidator.setAddnlValidationFunction(secAns2Check);
	
	
	
	
	//
</script>
</body>
</html>
