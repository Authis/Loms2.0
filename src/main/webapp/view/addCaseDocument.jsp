dd<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
   <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
   <script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
  <script>
 function uploadDoc(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
 }
	function popOnload() {
		document.getElementById("txtDocName").value = "";
		document.getElementById("txtComments").value = "";
		 
		if (document.getElementById("retMsg").value != "" && document.getElementById("retMsg").value != "E9999" ) {
			//alert("Document has been Added Successfully.");
			document.getElementById("retMsg").value = "";
		}
	}
	function onclickaction(formname, actionname) {
		 
		if (document.getElementById(formname)) {
			document.getElementById(formname).action = actionname;
			document.getElementById(formname).submit();
		}
	}
	
	 function clrFrmVal(){
		 
		 if(confirm("Do you want to reset the data?")){
			 document.getElementById("txtComments").value = "";

			 var elem = document.getElementById("txtDocName");      
			 elem.parentNode.innerHTML = elem.parentNode.innerHTML;
			  
			  return true;
		   }else{
			   return false;
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
 <form name="addcasedocfrm" id="addcasedocfrm" action="uploadCaseDoc.action"   method="post"
	enctype="multipart/form-data">
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
<!--       -->
<!--        <a href="#" onclick="javascript:onclickaction('addcasedocfrm','caseManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Management.png"  width="40" height="40"  /></div>
<p class="title">Upload Case Document</p> 
 <a href="#" onclick="javascript:onclickaction('addcasedocfrm','caseManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Upload Case Document.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div>


 <div class="mandatory" align="right"><span class="mandi">*</span>Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
 <tr>
	 		 <td colspan="4">		
	 		    <div id="statusMsg1" style="display: inline;" >	 
			      <s:property escape="false" value="retErrorMsg" />	
			    </div>		
			  </td>
		</tr>
 <tr>
		<td colspan="2"><div id="addcasedocfrm_errorloc" class="error_strings"></div></td>
		<td align="right"></td>

	</tr>
<tr>
	<td>Case ID:</td>
	<td><s:textfield theme="simple" name="hidcaseid" id="txtCaseID" readonly="true"> </s:textfield></td>	  
</tr>
 
<tr>
	<td>Client ID:</td>
	<td><s:textfield theme="simple"  name="hidclientid" id="txtClientID" readonly="true"> </s:textfield></td>  
</tr>

<tr>
	<td>Document Path:<span class="mandi">*</span></td> 
	<td><s:file name="fileUpload" label="Select a File to upload" size="40" id="fileUpload"/></td>
</tr>
 
<tr>
	<td>Comments:</td>
	<td><s:textarea theme="simple"  name="txtComment" id="txtComment"></s:textarea> </td>
</tr>
 
 
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td> 

<input type="submit" name="groovybtn1" class="groovybutton" value="Add" onclick="javascript:statusMsg();"/>
<input type="button" name="groovybtn1" class="groovybutton" value="Reset" onclick="javascript:clrFrmVal();" />
<input type="button" name="groovybtn1" class="groovybutton" value="Back" onclick="javascript:onclickaction('addcasedocfrm','searchCaseInforesult.action')" /></td></tr>

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
	var frmvalidator = new Validator("addcasedocfrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("txtComment", "maxlen=1000","Comment cannot exceed 1000 characters"); 
	frmvalidator.addValidation("fileUpload", "req","Document Path cannot be blank");
	frmvalidator.addValidation("fileUpload", "maxlen=45","Document Name could not exceed 45 characters");

 
	  
	//
</script>
</body>

</html>
