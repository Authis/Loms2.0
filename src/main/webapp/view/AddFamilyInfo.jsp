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
	<script type="text/javascript">
		var myCalendar;
		function doOnLoad() {
			myCalendar = new dhtmlXCalendarObject(["txtDateofBirth","txtMarriageDate"]);
		}
	</script>
	<script  src="/loms/view/js/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>	
	<script>
	function popOnload(){
		
	 
		document.getElementById("txtRelationName").value = "";
		document.getElementById("txtRelationType").value = "";
		document.getElementById("txtDateofBirth").value = "";
		document.getElementById("txtMobileNumber").value = "";
		document.getElementById("txtTelephoneNumber").value = "";
		document.getElementById("txtAddress").value = "";
		document.getElementById("txtMobileNumber").value = "";
		document.getElementById("flggender").value = "";
		document.getElementById("txtMaritalStatus").value = "";
		document.getElementById("txtMarriageDate").value = "";
		document.getElementById("txtComments").value = ""; 
		
		if(document.getElementById("retClientID").value){
		//alert("Family Info has been added Successfully for the Client ID "+document.getElementById("retClientID").value);
		document.getElementById("retClientID").value = "";
		}
	}
	 function onclickaction(formname,actionname){
			if(document.getElementById(formname)){		 
			 		document.getElementById(formname).action=actionname;		
			 		document.getElementById(formname).submit();			 
			 	}	
		 }
	 
	 function onMrgStat(){
 		 if(document.getElementById("txtMaritalStatus").value == 'SINGLE'){			 
			 document.getElementById("mrglable").style.display="none";	
			 document.getElementById("mrgtextbox").style.display="none";
			 document.getElementById("txtMarriageDate").value = "";
			 
		 }else{
			 document.getElementById("mrglable").style.display="inline";
			 document.getElementById("mrgtextbox").style.display="inline";	
		 }
		 
	 }
	 function searchClientID(val) {

			var url = "searchClientID.action?val="+val;
			window
					.open(url, "_blank",
							'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

			// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
		}
		function relTypechange(){
			 
			 if(document.getElementById("txtRelationType").value == 'OTHERS'){			 
				 document.getElementById("divOtherLable").style.display="inline";
				 document.getElementById("divOtherTxt").style.display="inline";
				
			 }else{
				 
				  document.getElementById("hidRelType").value = document.getElementById("txtRelationType").value;
				 document.getElementById("divOtherLable").style.display="none";
				 document.getElementById("divOtherTxt").style.display="none";
			 }
		}
		
		function assOthrRelTypeValue(){
		      document.getElementById("hidRelType").value = document.getElementById("txtOther").value;
		      if(document.getElementById("hidRelType").value == ""){
		      document.getElementById("hidRelType").value = document.getElementById("txtRelationType").value;
		      }
		       
			}
		
		function clrFrmVal(){
		   if(confirm("Do you want to reset the data?")){
			 
			  document.getElementById("txtRelationName").value = "";
			  document.getElementById("txtRelationType").value = "";			  
			  document.getElementById("txtDateofBirth").value = "";
			  document.getElementById("txtMobileNumber").value = "";
			  document.getElementById("txtTelephoneNumber").value = "";
			  document.getElementById("txtAddress").value = "";
			  document.getElementById("flggender").value = "";
			  document.getElementById("txtMaritalStatus").value = "";
			  document.getElementById("txtMarriageDate").value = "";
			  document.getElementById("txtComments").value = "";
			  document.getElementById("txtOther").value = "";
			  return true;
		   }else{
			   return false;
		   }
			 
		}
		
	  function statusMsg(){
				
			 document.getElementById("statusMsg1").style.display = "none";
			 
		} 
	</script>
</head>
<body onload="javascript:doOnLoad();popOnload();">
 <form id="addfaminfo" name="addfaminfo" action ="addFamInfo.action" method="post">
  <input type="hidden" name="hidclientid" id="hidclientid" />
    <s:hidden name="addfamilyinfo.relationtype" id="hidRelType" />
<jsp:include page="topHeader.jsp" />
<div style="padding:0px 10px; width:100%;">


 

<div id="content">
<!--<h3>Add Family Information</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Client Family Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--       <a href="#" onclick="javascript:onclickaction('addfaminfo','clientManagement.action');">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Client Management.png"  width="40" height="40"  /></div>
<p class="title">Add Family Information</p> 
 <a href="#" onclick="javascript:onclickaction('addfaminfo','clientManagement.action');"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Client Family Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
<s:if test="%{retClientID != ''}">
<tr>
<td colspan="4">
<div id="statusMsg1" style="display: inline;" >
  <div class="succ">Family Info has been added Successfully for the Client ID  <s:property value="retClientID" id="retClientID" />
  <s:hidden name="retClientID" id="retClientID" /></div>
</div>
  
  
</td>
</tr>
</s:if>
<tr> 
	<td colspan="2" ><div id="addfaminfo_errorloc" class="error_strings"></div></td>
	<td> &nbsp;</td>
</tr>
<tr>
	<td>Client ID:</td>
	<td>
	<s:if test="%{hidclientid!=''}">
	<s:property value="%{hidclientid}" />
	<s:hidden  name="addfamilyinfo.clientid" value="%{hidclientid}" id="txtClientId"></s:hidden>
	</s:if>
	<s:else>
		<s:property value="%{retClientID}" />
		<s:hidden  name="addfamilyinfo.clientid" value="%{retClientID}" id="txtClientId"></s:hidden>
   </s:else>	
	</td>
		  
</tr>
<tr>
	<td>Relation Name:<span class="mandi">*</span></td>
	<td><s:textfield theme="simple" name="addfamilyinfo.relationname" id="txtRelationName" maxlength="50" cssStyle="width: 200px;"> </s:textfield></td>	 
</tr>
<tr>
	<td>Relation Type:<span class="mandi">*</span></td>
	<td> <s:select theme="simple"   id="txtRelationType"  
		cssStyle="width: 210px;"   onchange="javascript:relTypechange();"
 list="#{'':'Select Relation Type','FATHER':'FATHER', 'MOTHER':'MOTHER','SISTER':'SISTER', 'BROTHER':'BROTHER','SPOUSE':'SPOUSE','SON':'SON','DAUGHTER':'DAUGHTER','UNCLE':'UNCLE','AUNT':'AUNT','NEPHEW':'NEPHEW','NIECE':'NIECE','FATHER IN LAW':'FATHER IN LAW','MOTHER IN LAW':'MOTHER IN LAW','BROTHER IN LAW':'BROTHER IN LAW','DAUGHTER IN LAW':'DAUGHTER IN LAW','OTHERS':'OTHERS'}"></s:select></td>	 
</tr>
 <tr>
 
  <td><div style="display: none;" id="divOtherLable">Other:<span class="mandi">*</span></div></td>
  <td><div style="display: none;" id="divOtherTxt"><s:textfield theme="simple" cssStyle="width: 200px;"  name="txtOther" id="txtOther" maxlength="25"> </s:textfield></div></td>
   
</tr>
<tr>
	<td>Date of Birth:</td>
	<td><s:textfield theme="simple" name="addfamilyinfo.dateofbirth" cssStyle="width: 200px;" id="txtDateofBirth" readonly="true"></s:textfield>
		 
	 </td>  
</tr>
<tr>
	<td>Mobile Number:</td>
	<td><s:textfield theme="simple" name="addfamilyinfo.mobilenumber" cssStyle="width: 200px;" id="txtMobileNumber" maxlength="20"> </s:textfield></td>
</tr>
 
<tr>
	<td>Telephone Number:</td>
	<td><s:textfield theme="simple" name="addfamilyinfo.telephonenumber" cssStyle="width: 200px;" id="txtTelephoneNumber" maxlength="20"></s:textfield> </td>  
</tr>
<tr>	
	<td>Address:</td>
	<td><s:textarea theme="simple" name="addfamilyinfo.address" cssStyle="width: 200px;" id="txtAddress"></s:textarea> </td> 
</tr> 
<tr>	
	<td>Gender:<span class="mandi">*</span></td>
	
	<td>
	<s:select theme="simple" name="addfamilyinfo.gender" id="flggender"   
		cssStyle="width: 210px;"  
 		list="#{'':'Select Gender','MALE':'MALE', 'FEMALE':'FEMALE','OTHER':'OTHER'}"></s:select>	
	 						
	 
  </td> 
</tr>

<tr>	
	<td>Marital Status:</td>
	<td> 
	<select name = "addfamilyinfo.maritalstatus" id="txtMaritalStatus" style="width: 210px;" onchange="javascript:onMrgStat();">
	<option value = "">Select Marital Status</option>	
	<option value = "SINGLE">Single</option>								
	<option value = "MARRIED">Married</option>	
	<option value = "DIVORCEE">Divorcee</option>	
	<option value = "WIDOW">Widow</option>								
	</select>
	
	</td> 
</tr>
<tr>	

	<td><div style="display: inline;" id="mrglable">Marriage Date:</div></td>
	<td>
	<div style="display: inline;" id="mrgtextbox">
	  <s:textfield cssStyle="width: 200px;" theme="simple"  name="addfamilyinfo.marriagedate" id="txtMarriageDate" readonly="true">
	  </s:textfield>
	 
	</div>
	
	 </td> 
 
</tr>
<tr>	
	<td>Comments:</td>
	<td><s:textarea theme="simple"  name="addfamilyinfo.comments" id="txtComments" cssStyle="width: 200px;"> </s:textarea></td> 
</tr>
 
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
 <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr>
<td>&nbsp;</td>
 <td><input type="submit" name="groovybtn1" class="groovybutton" value="Add Family Info"  onclick="javascript:assOthrRelTypeValue();statusMsg();"/>
 <input type="button" name="groovybtn1" class="groovybutton" value="   Reset   " onclick="javascript:clrFrmVal();"/>
  <input type="button" name="groovybtn1" class="groovybutton" value="Back" onclick="javascript:onclickaction('addfaminfo','searchresult.action')" /></td>
</tr>
 
</table>
</div>
</div> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
  <jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("addfaminfo");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
  frmvalidator.addValidation("txtClientId","req","Client ID cannot be blank");
  frmvalidator.addValidation("txtRelationName","req","Relation Name cannot be blank");  
  frmvalidator.addValidation("txtRelationName","alpha_s","Relation Name can contain only letters");
  frmvalidator.addValidation("txtComments","maxlen=1000","Comments cannot exceed 1000 characters");
  frmvalidator.addValidation("txtAddress","maxlen=500","Address cannot exceed 500 characters");
  frmvalidator.addValidation("txtRelationType","req","Relation Type cannot be blank");
  frmvalidator.setAddnlValidationFunction(chkOtherField);   
  frmvalidator.addValidation("txtMobileNumber","num_s", "Mobile No can contain only numbers(No spaces)");  
  frmvalidator.addValidation("txtMobileNumber", "minlen=10","Mobile No should contain a minimum of 10 digit");
  frmvalidator.addValidation("txtTelephoneNumber","num_s", "Telephone No can contain only numbers(No spaces)");  
  frmvalidator.addValidation("flggender","req","Please Select a Gender");
  //frmvalidator.addValidation("txtDateofBirth", "date");
 // frmvalidator.addValidation("txtMarriageDate", "date");
  frmvalidator.addValidation("txtAddress","alpha_addr","Address can contain only letters,numbers,comma(,), slash(/), hyphen(-), hash(#), ampersand(&), semi colon (;), colon (:) and period(.)");
  
  frmvalidator.setAddnlValidationFunction(yearValidationFamDate);   
//]]></script>
</body>

</html>
