<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script language="javascript" type="text/javascript"
	src="/loms/view/js/rakshaval.js"></script>
 <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	 <link rel="stylesheet" href="/loms/view/jqtimepicker/jquery-ui-1.8.14.custom.css" type="text/css" />
    <link rel="stylesheet" href="/loms/view/jqtimepicker/jquery.ui.timepicker.css?v=0.2.9" type="text/css" />
    <script type="text/javascript" src="/loms/view/jqtimepicker/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="/loms/view/jqtimepicker/jquery.ui.core.min.js"></script>
	<script type="text/javascript" src="/loms/view/jqtimepicker/jquery.ui.timepicker.js?v=0.2.9"></script>
	  
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtReminderDate"]);
		}
	</script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
	function popOnload() {
		if (document.getElementById("retRemID").value) {
			//alert("Reminder has been added Successfully.");
			document.getElementById("retRemID").value = "";
		}
	}
	function conTime() {
		
		 
		var time = document.forms["addreminder"].remfromtime.value + "-"
				+ document.forms["addreminder"].remtotime.value ;
		
		  
		document.getElementById("txtReminderTime").value = time;
		 
	}
	
	 function statusMsg(){
			 
			if(document.getElementById("statusMsg1")){
				 document.getElementById("statusMsg1").style.display = "none";
			  }else{
				 document.getElementById("statusMsg2").style.display = "none";
			  }
		}
	 
	 function onclickaction(formname, actionname,val) {
		 document.forms["addreminder"].txtUserId.value = val;	 
			 
			if (document.getElementById(formname)) {
				document.getElementById(formname).action = actionname;
				document.getElementById(formname).submit();
			}
		}
</script>
</head>
<body
	onload="javascript:doOnLoad();popOnload();">
<form id="addreminder" name="addreminder"
	action="addremindersave.action" method="post">
<s:hidden id="txtReminderTime" name="reminderBean.remindertime" />
<s:hidden id="txtUserId" name="txtUserId" />
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Add Reminder</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Reminder Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('addreminder','reminderManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Reminder Management.png"  width="40" height="40"  /></div>
<p class="title">Add Reminder</p> 
 <a href="#" onclick="javascript:onclickaction('addreminder','reminderManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Court Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="50%" style="border-color: gray"  cellpadding="10" cellspacing="10">
	<s:if test="%{retRemID != '' && retRemID != 'E9999'}">
		<tr>
			<td colspan="4"><div id="statusMsg1" style="display: inline;" ><div class="succ">Reminder has been added Successfully. <s:hidden name="retRemID" id="retRemID" />
			</div>
			</div></td>
		</tr>
	</s:if>
	<s:if test="%{retRemID == 'E9999'}">
		<tr>
			<td colspan="4"><div id="statusMsg2" style="display: inline;" ><div class="err">Reminder has not been added Successfully. <s:hidden name="retRemID" id="retRemID" />
			</div>
			</div></td>
		</tr>
	</s:if>


	<tr>
		<td colspan="2">
		<div id="addreminder_errorloc" class="error_strings"></div>
		</td>
		<td></td>
	</tr>

	<tr>
		<td>Reminder Type:<span class="mandi">*</span></td>
		<td> 
		
		<s:select theme="simple" name="reminderBean.remindertype" 
		headerValue="Select Reminder Type" headerKey="" id="txtReminderType" 
		list="retReminderList" cssStyle="width:205px;" onchange="javascript:onclickaction('addreminder','addreminder.action',this.value);"></s:select> <s:property value="userName"/>	
		</td>
	</tr>
	<tr>
		<td>Reminder Subject:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple"
			name="reminderBean.remindersubject" id="txtReminderSub" cssStyle="width: 200px;" maxlength="50">
		</s:textfield></td>
	</tr>

	<tr>
		<td>Location:</td>
		<td><s:textfield theme="simple" name="reminderBean.reminderlocn"
			id="txtReminderLocn" cssStyle="width: 200px;" maxlength="100"></s:textfield></td>
	</tr>
	<tr>
		<td>Reminder Date:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="reminderBean.reminderdate"
			id="txtReminderDate" maxlength="15" cssStyle="width: 200px;" readonly="true">
		</s:textfield>  </td>
	</tr>

 
	
	<tr>
		<td>Reminder Time:</td>
		<td>From :<s:textfield readonly="true" theme="simple" name="remfromtime" id="txtReminderFromTime.[1]" cssStyle="width: 50px" 
		
		 />
		<script type="text/javascript">
            $(document).ready(function() {
                $('#txtReminderFromTime\\.\\[1\\]').timepicker();
            });
        </script>         
		    To: <s:textfield readonly="true" theme="simple" name="remtotime" id="txtReminderToTime.[1]" cssStyle="width: 50px" />
		    <script type="text/javascript">
            $(document).ready(function() {
                $('#txtReminderToTime\\.\\[1\\]').timepicker();
            });
        </script>         
		</td>
	</tr>
 
	<tr>
		<td>Reminder Message:</td>
		<td><s:textarea theme="simple" name="reminderBean.remindermsg" cssStyle="width: 200px;" 
			id="txtReminderMsg" ></s:textarea></td>
	</tr>


	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr> 
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="groovybtn1" class="groovybutton"
			value="Add Reminder" onclick="javascript:conTime();statusMsg();" /> <input
			type="reset" name="groovybtn1" class="groovybutton"
			value="   Reset   " onclick="" /></td>
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
	var frmvalidator = new Validator("addreminder");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();

	
	frmvalidator.addValidation("txtReminderMsg", "maxlen=500","Max length for Reminder Message is 500");
	frmvalidator.addValidation("txtReminderType", "req","Reminder Type cannot be blank");
	frmvalidator.addValidation("txtReminderSub", "req","Reminder Subject cannot be blank");
	frmvalidator.addValidation("txtReminderSub", "alpha_s","Reminder Subject can contain only letters");
	frmvalidator.addValidation("txtReminderLocn", "alpha_s","Location can contain only letters");	
	frmvalidator.addValidation("txtReminderDate", "req","Reminder Date cannot be blank");	
	frmvalidator.addValidation("txtReminderDate", "date");
	frmvalidator.setAddnlValidationFunction(toDateValidationReminder);

	//
</script>
</body>

</html>
