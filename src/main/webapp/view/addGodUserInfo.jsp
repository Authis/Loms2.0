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
 <script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var k=document.getElementById("txtUserId").value;
var urls="view/pass.jsp?ver="+k;
 
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
        //document.getElementById("err").style.color="red";
        document.getElementById("err").innerHTML=xmlhttp.responseText;
 
    }
  }
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>

 
</head>
<body
	onload="javascript:doOnLoad();">
<form id="addempfrm" method="post" action="addGodUserInfo.action" onreset="return confirm('Do you want to reset the data?')">
<input type="hidden" name="smsService"  value="N" />
<jsp:include page="topHeaderOut.jsp" />
<div id="content">

<h3>Product Activation</h3>
 <!--  <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div> -->
  
 
 
<table border="0" width="125%" style="border-color: gray"> 
 
	  <tr > 
	       <td colspan="2" >
			<div id="addempfrm_errorloc" class="error_strings"></div>
			</td>
			<td align="right"></td>
		</tr>
 

	 <tr> 
	   <td>	   
	      <fieldset><!--  <legend>User Detail:-</legend>-->
	    	<table border="0" width="100%" style="border-color: gray"> 
	    		<tr>
	    		   <td>				   
					   	  <table border="0" width="100%" style="border-color: gray"> 
						   	    
					   	        <tr>
									<td>User ID:<span class="mandi">*</span></td>
									<td>
									<input type="text" name="addEmpBean.employeeid"	id="txtUserId" style="width: 200px;" 
									maxlength="20" onblur="loadXMLDoc();"/><span id="err"> </span>
									<!--  <img src="/loms/view/images/tick_white.png" alt="Check Availability"  /> -->
									</td>
								</tr>
								 <tr>
									<td>User Password:<span class="mandi">*</span></td>
									<td>
									<input type="text" name="addEmpBean.emppassword" id="txtUserPassword" style="width: 200px;" 
									maxlength="20" />
									 
									</td>
								</tr>
								 <tr>
									<td>Confirm User Password:<span class="mandi">*</span></td>
									<td>
									<input type="text" name="txtConfUserPassword"	id="txtConfUserPassword" style="width: 200px;" 
									maxlength="20" />
									</td>
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
									<td><select name="addEmpBean.gender" id="flggender" style="width: 205px;" >
										<option value="">Please Select Gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select></td>
								</tr>							
								<tr>
									<td>Nationality:<span class="mandi">*</span></td>
									<td><input type="text" name="addEmpBean.nationality"
										id="txtNationality" style="width: 200px;" maxlength="25"/></td>
								</tr>
								<tr>
									<td>Date of Birth:<span class="mandi">*</span></td>
									<td><input type="text" name="addEmpBean.dateofbirth"
										id="txtDateofBirth" style="width: 200px;" readonly="true"/> </td>
								</tr>
								<!-- <tr>
									<td>User Type:<span class="mandi">*</span></td>
									<td><select name="addEmpBean.usertype"  
										id="txtUserType" style="width: 205px;" >
										<option value="">Select User Type</option>
										<option value="GOD">GOD</option>		 		
									</select></td>
								</tr> -->
								
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
							<!-- <tr>
								<td>Activation Date:<span class="mandi">*</span></td>
								<td><input type="text" name="addEmpBean.dateofjoining"
									id="txtDateofJoining" style="width: 200px;" readonly="true"/>  </td>
							</tr> -->
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
								<td>Residential Address:</td>
								<td><textarea name="addEmpBean.address" id="txtResAddress" style="width: 200px;" > </textarea></td>
							</tr>	
							 <tr>
								<td>Office Address:<span class="mandi">*</span></td>
								<td><textarea name="addEmpBean.officeaddress" id="txtOfficeAddress" style="width: 200px;" > </textarea></td>
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
								<td>Answer 1:<span class="mandi">*</span></td>
								<td><input type="password" name="addEmpBean.answer1" id="txtAnswer1" style="width: 200px;" maxlength="100"/> 
								</td>
							</tr>
							<tr>
								<td>Re Enter Answer 1:<span class="mandi">*</span></td>
								<td><input type="password" name="txtAnswer11" id="txtAnswer11" style="width: 200px;" maxlength="100"/> 
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
								<td>Answer 2:<span class="mandi">*</span></td>
								<td><input type="password" name="addEmpBean.answer2" id="txtAnswer2" style="width: 200px;" />
								</td>
							</tr>
						    <tr>
								<td>Re Enter Answer 2:<span class="mandi">*</span></td>
								<td><input type="password" name="txtAnswer22" id="txtAnswer22" style="width: 200px;" />
								</td>
							</tr>		
						</table>
					</td>
					<td>
						<table border="0" width="100%" style="border-color: gray"> 
							<tr>
							  <td>
							    <!-- Explanation comes here -->
							  </td>
							</tr>
						</table>
					</td>
				</tr>
			  </table>
			  </fieldset>
		     </td>		     
		 </tr>
	 
	  <tr> 
	   <td >	   
		   <fieldset>  <!--  <legend>App Access Detail:-</legend>	 -->	      
		    <table border="0" width="100%" style="border-color: gray">  	
		      <tr>
			        <td >      
				    	<table border="0" width="95%" style="border-color: gray">  	 
							<tr>
								<td>Email ID:<span class="mandi">*</span></td>
								<td><input type="text" name="addEmpBean.empemail"
									id="txtEmailID" style="width: 200px;"  maxlength="200"/> </td>
							     
							</tr>
							<tr>
								<td>Password:<span class="mandi">*</span></td>
								<td><input type="password" name="addEmpBean.emailpassword"
									id="txtMailPassword" style="width: 200px;"  maxlength="200"/></td>
							</tr>
							<!--  <tr>
								<td>SMS Service:<span class="mandi">*</span></td>
								<td>Yes:<input type="radio" name="smsService"  id="smsService" value="Y" disabled="disabled" /> No:<input type="radio" name="smsService" value="N" disabled="disabled" checked="checked"/></td>
							</tr>-->
							<tr>
								<td nowrap>Email Service:<span class="mandi">*</span></td>
								<td><input type="radio" name="emailService" id="emailService" value="Y"/>Yes 
								<input type="radio" name="emailService" value="N"/>No</td>
							</tr> 
							<tr>
							<td> 
							   &nbsp;
							</td>
							</tr>
							<tr>
							<td colspan="2">
							
							  <font color="#c85600">NOTE: This Email ID and Password will be used for sending Automated and Customized Emails </font>
							</td>
							</tr>
						
						 </table>
					</td>
					 <!--  <td>
					    <div class="info"> This email id and password will be used for both EMAIL and SMS services. <br/>
					                 If you have not registered for SMS services with Mvayoo please disable SMS option. </div>
					               
					                 
					</td>		  -->	
				</tr>
			</table>
		  </fieldset>
			</td>
		 </tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			
			<td colspan="1" align="center"><input type="submit" name="groovybtn1"
				class="groovybutton" value="Add Employee" /> <input type="reset"
				name="groovybtn1" class="groovybutton" value="   Reset   " onclick="" />
			</td>
			<td>&nbsp;</td>
	
		</tr>
</table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("addempfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	frmvalidator.setAddnlValidationFunction(addEmpDateChk);
	
	frmvalidator.setAddnlValidationFunction(secAns1Check);	
	frmvalidator.setAddnlValidationFunction(secAns2Check);
	
	frmvalidator.addValidation("txtUserId", "req","Please enter the User ID");
	frmvalidator.addValidation("txtUserId", "alnum","User ID contain letters and numbers");
 
	
	frmvalidator.addValidation("txtFirstName", "req","Please enter the First Name");
 	frmvalidator.addValidation("txtFirstName", "alpha_space","Name can contain alphabetic chars only");
	frmvalidator.addValidation("txtLastName", "req",	"Please enter the Last Name");
 	frmvalidator.addValidation("txtLastName", "alpha_space","Last Name can contain only letters. No spaces, numbers, special characters allowed");
 	
 	frmvalidator.addValidation("txtUserPassword", "req","Please enter the User Password");
	
 	frmvalidator.addValidation("txtNationality", "req","Please enter Nationality");
 	
 	frmvalidator.addValidation("txtConfUserPassword", "req","Please enter the Confirm User Password"); 	
 	frmvalidator.addValidation("txtUserPassword", "minlen=6", "User Password should be atleast 6 characters");
 	frmvalidator.setAddnlValidationFunction(compGodPass);
 	
 	
	// frmvalidator.addValidation("txtDateofJoining", "req","Please select the Date of Joining");	 
	frmvalidator.addValidation("txtDateofBirth", "req",	"Please select the Date of Birth");
	frmvalidator.addValidation("flggender", "req", "Please Select Gender");
	frmvalidator.addValidation("txtMobileNo", "req","Please enter the Mobile Number");
	frmvalidator.addValidation("txtMobileNo", "maxlen=15","Max length for Mobile Number is 15");
	frmvalidator.addValidation("txtMobileNo", "numeric","Mobile number can contain numbers only");
	frmvalidator.addValidation("txtOfficeAddress", "req"," Please enter Office Address"); 
	frmvalidator.addValidation("txtResAddress", "maxlen=500"," Residential Address should be less then 500 Char"); 
	frmvalidator.addValidation("txtOfficeAddress", "maxlen=500","Office Address should be less then 500 Char"); 
	// frmvalidator.addValidation("txtUserType", "req", "Please enter the User Type");
	 
	
	 frmvalidator.addValidation("txtDateofBirth", "date");
 	frmvalidator.addValidation("txtsecQue1", "req","Please select Security Question 1");	
	frmvalidator.addValidation("txtAnswer1", "req",	"Please enter Security Answer 1");	
	frmvalidator.addValidation("txtAnswer11", "req",	"Please enter Security Re Enter Answer 1");	
	frmvalidator.addValidation("txtsecQue2", "req",	"Please select Security Question 2");	
	frmvalidator.addValidation("txtAnswer2", "req",	"Please enter Security Answer 2");	
	
	frmvalidator.addValidation("txtAnswer22", "req",	"Please enter Security Re Enter Answer 2");	
	frmvalidator.addValidation("txtsecQue2", "req",	"Please select Security Question 2");
	
	frmvalidator.addValidation("txtEmailID", "req",	"Please enter the Email ID");
	frmvalidator.addValidation("txtEmailID", "email", "Please enter Valid Email ID");
	frmvalidator.addValidation("txtMailPassword", "req","Please enter the Email Password");	
	//frmvalidator.addValidation("smsService", "selone_radio", 	"Please select SMS Service",true);
	frmvalidator.addValidation("emailService", "selone_radio",	"Please select E-Mail Service",true);	

	

	
	
	
	//
</script>
</body>
</html>
