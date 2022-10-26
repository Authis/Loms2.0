<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
  <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
  <script  src="/loms/view/js/gen_validatorv4.js" type="text/javascript" xml:space="preserve"></script>	
  <script>
 function onclickaction(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
	function popOnload(){
    if(document.getElementById("retCourtID").value){
		//alert("Court Detail has been Updated Successfully \nCourt ID is "+document.getElementById("retCourtID").value);
		document.getElementById("retCourtID").value = "";
		}
	}
	
	function onclickaction(formname, actionname) {
		document.getElementById("hidTxtState").value = document.getElementById("txtCourtState").value;
		 
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
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
<body onload="javascript:popOnload();">
 <form id="editcourtinfo" name="editcourtinfo" action="editCourtInfoSave.action" method="post">
 <s:hidden id="hidTxtState" name="hidTxtState"/> 
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;">

</div>
<div id="content">
<!--<h3>Update Court Information</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Modify Court Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--        <a href="#" onclick="javascript:onclickaction('editcourtinfo','lawStandardManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/law Standard Info.png"  width="40" height="40"  /></div>
<p class="title">Update Court Information</p> 
 <a href="#" onclick="javascript:onclickaction('editcourtinfo','lawStandardManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Modify Court Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="50%" style="border-color: gray"  cellpadding="10" cellspacing="10">
<s:if test="%{retCourtID != ''}">
<tr>
<td colspan="4"><div id="statusMsg1" style="display: inline;" ><div class="succ">Court Detail has been Updated Successfully. 
   <s:hidden name="retCourtID" id="retCourtID" />
   </div></div>
</td>
</tr>
</s:if>
<tr> 
	<td colspan="4"><div id="editcourtinfo_errorloc" class="error_strings"></div></td>
	<td align="right"> </td>
</tr>
<tr>
	<td>Court ID:</td>
	<td><s:property value="%{updCourtInfoBean.courtid}" />    
	 <s:hidden name="updCourtInfoBean.courtid" id="txtCourtID" value="%{updCourtInfoBean.courtid}"> </s:hidden>
	
	</td>	
</tr>
<tr>
	<td>Court Name:<font color="red">*</font></td>
	<td><s:textfield theme="simple" name="updCourtInfoBean.courtname" id="txtCourtName" maxlength="100"/> </td>	
</tr>
<tr>
	<td>Court Type:<font color="red">*</font></td>
	<td><s:textfield theme="simple" name="updCourtInfoBean.courttype" id="txtCourtType" maxlength="100"/> </td>
</tr> 
<tr>
	<td>Court Address:</td>
	<td><s:textarea theme="simple" name="updCourtInfoBean.courtaddress" id="txtCourtAddress"></s:textarea> </td>
</tr>
<tr>
	<td>Court City:</td>
	<td><s:textfield theme="simple" name="updCourtInfoBean.courtcity" id="txtCourtCity" maxlength="50"/> </td>
</tr> 
  
<tr>
		<td>Court State:<font color="red">*</font></td>
		<td><s:select theme="simple" name="updCourtInfoBean.courtstate" value="%{updCourtInfoBean.courtstate}" id="txtCourtState"
			headerValue="Select State" headerKey="" list="stateName"
			cssStyle="width:200px;" onchange="javascript:onclickaction('editcourtinfo','updStdCrtInfo.action');"
			></s:select></td>
	</tr>
 
	<tr>
		<td>Court District:<font color="red">*</font></td>
		<td> 
		  	 <s:select theme="simple" name="updCourtInfoBean.courtdist" value="%{updCourtInfoBean.courtdist}" id="txtCourtDistrict"
					headerValue="Select District" headerKey="" list="disName"
					cssStyle= "width:200px:"></s:select>
		 
		</td>
		 
	</tr>
	<tr>
		<td>Court Country:</td>
		<td><s:textfield theme="simple"
			name="updCourtInfoBean.courtcountry" id="txtCourtCountry" maxlength="50"/></td>
	</tr>
	
 

<tr>	
	<td>Comments:</td>
	<td><s:textarea theme="simple" name="updCourtInfoBean.comments" id="txtComments"/></td>
</tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr>
<td>&nbsp;</td>
	<td colspan="2">
		<input type="submit" name="groovybtn1" class="groovybutton" value="Update Court Info"  onclick="javascript:statusMsg();"/>
		<input type="reset" name="groovybtn1" class="groovybutton" value="Reset" />
		<input type="reset" name="groovybtn1" class="groovybutton" value="Back"  onclick="javascript:onclickaction('editcourtinfo','searchstdcrtinfo.action')"/>
	</td>
</tr>
<tr><td colspan=2>&nbsp;</td></tr>
</table>
</div>
 <jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("editcourtinfo");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("txtCourtName", "req", "Please enter Court Name");
frmvalidator.addValidation("txtCourtType", "req", "Please enter Court Type");

frmvalidator.addValidation("txtCourtCity", "alpha_s","Court City can contain alphabetic chars only");
frmvalidator.addValidation("txtCourtAddress", "maxlen=500","Court Address should be less then 500 Char"); 


frmvalidator.addValidation("txtCourtState", "req","Please Select Court State");
frmvalidator.addValidation("txtCourtDistrict", "req","Please Select Court District");

frmvalidator.addValidation("txtCourtCountry", "alpha_s", "Court Country can contain alphabetic chars only");
frmvalidator.addValidation("txtCourtName","alpha_court","Only few Special characters allowed in Court Name (- &)");	
frmvalidator.addValidation("txtCourtType","alpha_court","Only few Special characters allowed in Court Type (- &)");	

frmvalidator.addValidation("txtCourtAddress","alpha_addr","Only few Special characters allowed in Court Address field(, / - # & .)");	
frmvalidator.addValidation("txtComments", "maxlen=1000","Comments should be less then 500 Char"); 
 
//]]></script>
</body>

</html>
