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
 
 
 function getTempId(){
 var i = document.getElementsByName("cltChkVal").length;
 for (var x=0;x<i;x++){
	
	 if(document.getElementById("cltCheckVal"+x).checked == true){
		 document.getElementById("hidBareid").value = document.getElementById("hidBareid"+x).value;
		 document.getElementById("downloadLink"+x).style.display = "inline";
	 
	 }else{
		 document.getElementById("downloadLink"+x).style.display = "none";
	 
	 }

   }
   
 }
 
 function selOneDownload(){
		var i = document.getElementsByName("cltChkVal").length;
		for ( var x = 0; x < i; x++) {
			if (document.getElementById("cltCheckVal" + x).checked == true) {
				
				chk = 2;
				break;
			} else {
				chk = 1;
			}
		}
		if (chk == 2) {
		
			onclickaction('downBareRulesFrm', 'downBareActsTemplate.action');
			document.getElementById("selectOne").style.display = "none";
		} else {
			 
			document.getElementById("selectOne").style.display = "inline";
		}
	 
}
 
 
 </script>
 
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>
<body onload="javasript:">
<form id="downBareRulesFrm" name="downBareRulesFrm" action="searchdownBareRules.action" method="post">
 <s:hidden name="hidBareid" id="hidBareid" />
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;">

</div>
<div id="content" >
<!--<h3>Download Templates</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Modify Opponent Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('downTemplate','templateManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->


<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Case Filing Templates.png"  width="40" height="40"  /></div>
<p class="title">Download Bare Acts and Rules</p> 
 <a href="#"  onclick="javascript:onclickaction('downBareRulesFrm','judgmentManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Send Email.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%"  cellpadding="10" cellspacing="10" class="user_max_input">
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
	<td colspan="3"><div id="downBareRulesFrm_errorloc" class="error_strings"></div></td>
	 
 
</tr>
<tr>
   
     <td>Select Type:<span class="mandi">*</span> </td>
     <td><s:select
		theme="simple" name="downloadBareRulesType" id="downloadBareRulesType"  
		cssStyle="width: 200px;"  
		list="#{'':'Select Act Type','BARE ACT':'Bare Acts', 'RULE':'Rules'}"  
		 ></s:select>
	</td>
 </tr> 
  
 <tr>
      <td>Enter a Keyword:</td>
     <td>  <s:textfield theme="simple" name="bareRulesKeyWord"	id="bareRulesKeyWord"   cssStyle="width:600px;" ></s:textfield>
     
      </td> 
 </tr>
  

 
<tr> 
	<td >&nbsp;</td>
	 
	<td align="left" nowrap><input type="submit" name="groovybtn1" class="groovybutton" value="Search"  /> 
	 </td>
 
 
</tr>

</table>
<s:if test="%{searchPageVar=='value'}">
 <div id="search_result">
<p>Search Result</p>
 </div>
	<table border="0" width="100%" class="grid" cellpadding="1" cellspacing="1" border="0" >
	<thead>
		<tr>
			<th  width="2%"  align="center"></th>
			<th  width="20%"  align="center">Bare Act / Rule Name</th>
			<th  width="10%"  align="center">Download</th>	
		</tr>
		</thead>
		
 </table>
 <s:if test="%{retBareRulesTemplateBean.size >= 1}">
  <div style="width:100%;height:250px;overflow:auto;" class="data_grid">
 <table border="0" width="100%" class="grid" cellpadding="1" cellspacing="1" border="0" >
			<s:iterator id="listval" value="retBareRulesTemplateBean" status="stat" >
			<tr class="row<s:property value="#stat.index % 2"/>" >
				<td  width="2%"  align="center"  >
					<input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getTempId();"/>
					<s:hidden id="hidBareid%{#stat.index}"  value="%{retBareRulesTemplateBean[#stat.index].templateID}"/> 
				</td> 		 			
				<td width="20%" align="left"><s:property value="retBareRulesTemplateBean[#stat.index].templateName"  /> </td>		 
			    <td width="10%" align="center"><div style="display: none;" id="downloadLink<s:property value="#stat.index"/>">
			    <a href="#" onclick="javascript:selOneDownload();">Download</a></div> </td>	
		
			</tr>
			</s:iterator>			
	</table>
	</div>
	 
		</s:if>
		<s:if test="%{retBareRulesTemplateBean.size==0}">
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
    <s:if test="%{retBareRulesTemplateBean==null}">
		<table border="0" width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td align="center" colspan="2" class="err">Internet Connection might be gone. Please check.</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</table>	
		</s:if>
		
		 <s:if test="%{retBareRulesTemplateBean[0].templateID == 'Expired'}">
		<table border="0" width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td align="center" colspan="2" class="err">Your Licence has been Expired.</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</table>	
		</s:if>
</s:if>

</div> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="footer">
  <jsp:include page="Footer.jsp" />
</div>
</form>
 <script language="JavaScript" type="text/javascript" xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("downBareRulesFrm");
  frmvalidator.EnableOnPageErrorDisplaySingleBox();
  frmvalidator.EnableMsgsTogether();
 
	frmvalidator.addValidation("downloadBareRulesType", "req","Please select Template Type");
	 
	
  
//]]></script>
</body>
</html>
