<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
  <script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
  <script>
 
  
	function onclickaction(formname, actionname) {
		 
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	
	function searchClientID(val) {

		var url = "searchClientID.action?val="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');

	 
	}
	
 function searchCaseID(val){
	 //document.getElementById("hidclientid").value = document.getElementById("txtClientId").value;	  
	 var url = "searchCaseID.action?hidclientid="+document.getElementById("txtClientID").value+"&val="+val;
		window.open(url, "_blank",
						'resizable=yes,width=750,height=500,scrollbars=yes,left=30,top=30,status=yes');
 }
 
 function clrFrmVal(){
	 
	 if(confirm("Do you want to reset the data?")){
		    document.getElementById("txtClientID").value = "";
			document.getElementById("txtCaseID").value = "";
			document.getElementById("txtComment").value = ""; 
			 var elem = document.getElementById("fileUpload");       
			 elem.parentNode.innerHTML = elem.parentNode.innerHTML; 
			 
		  return true;
	   }else{
		   return false;
	   }
}
 function statusMsg(){
	 
		
	 if(document.getElementById("statusMsg1")){
		 document.getElementById("statusMsg1").style.display = "none";
	  } 
} 
  
 </script>
</head>

<body onload="javascript:">
 <form id="addCaseDocumentFrm"  action="uploadCaseDocmenu.action" method="post" enctype="multipart/form-data">
   
<jsp:include page="topHeader.jsp" />
<div style="padding:0px 10px; width:100%;">

 

<div id="content">
<!--<h3>Upload Case Document</h3>-->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Upload Case Document.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('addCaseDocumentFrm','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Upload Case Document</p> 
 <a href="#" onclick="javascript:onclickaction('addCaseDocumentFrm','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Upload Case Document.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
 <table border="0" width="100%" style="border-color: gray"  cellpadding="10" cellspacing="10">
	     <tr>
	 		 <td colspan="4">		
	 		    <div id="statusMsg1" style="display: inline;" >	 
			      <s:property escape="false" value="retErrorMsg" />	
			    </div>		
			  </td>
		</tr>
     <tr>
		<td colspan="2"><div id="addCaseDocumentFrm_errorloc" class="error_strings"></div></td>
		<td align="right"></td>

	 </tr>
 
    <tr>
		<td>Client ID:<span class="mandi">*</span></td>
		<td colspan="3">
		<s:textfield theme="simple"	name="txtClientID" id="txtClientID"
			cssStyle="width: 200px;"  readonly="true"></s:textfield> 
			<a onclick="javascript:searchClientID('casedoc');">
			<img src="/loms/view/images/Search.png" width="25" height="20" alt="Search Client ID" /></a> 
			<s:textfield theme="simple" id="txtClientName" name="txtClientName"  cssStyle="border:0px; background:inherit;"  readonly="true" /> 
			 </td>
	</tr>

	<tr>
		<td>Case ID:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="txtCaseID" id="txtCaseID" cssStyle="width: 200px;" readonly="true"></s:textfield>  
			<a onclick="javascript:searchCaseID('casedoc');">
			<img src="/loms/view/images/Search.png" width="25" height="20" alt="Search Client ID" /></a>
			<s:textfield  theme="simple" id="txtCaseName" name="txtCaseName"  cssStyle="width: 500px;border:0px; background:inherit;"    readonly="true" /> 
		</td>
	</tr>

<tr>
	<td>Document Path:<span class="mandi">*</span></td>
	 
	<td><s:file name="fileUpload" id="fileUpload" label="Select a File to upload" size="40" /></td>
</tr>
 
<tr>
	<td>Comments:</td>
	<td><s:textarea theme="simple"  name="txtComment" id="txtComment" value=""></s:textarea> </td>
</tr>
 
 
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
<tr>
     <td>&nbsp;</td>
	<td align="left"> 
	<input type="submit" name="groovybtn1" class="groovybutton" value="Add" onclick="javascript:statusMsg();"/>
	<input type="button" name="groovybtn1" class="groovybutton" value="Reset" onclick="javascript:clrFrmVal();" />
	</td>
</tr>
<tr><td colspan=2>&nbsp;</td></tr>
</table>

</div>
 </div>
  <jsp:include page="Footer.jsp" />
</form>
 <script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("addCaseDocumentFrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("txtClientID", "req","Client ID cannot be blank");	
	frmvalidator.addValidation("txtCaseID", "req",	"Case ID cannot be blank");
	frmvalidator.addValidation("txtComment", "maxlen=1000","Comment cannot exceed 1000 characters"); 
	frmvalidator.addValidation("fileUpload", "req","Document Path cannot be blank");
	frmvalidator.addValidation("fileUpload", "maxlen=45","Document Name could not exceed 45 characters");

 
	  
	//
</script>
</body>

</html>
