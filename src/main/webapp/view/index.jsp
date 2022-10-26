<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
  
 
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>

 
 <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
 <!--  <BGSOUND ID="BGSOUND_ID" LOOP=1 VOLUME="-600" SRC="/loms/view/sounds/success.wav"></BGSOUND>-->
 <script>
 
 function getFull(cnt){
	 document.getElementById("showfull"+cnt).style.display="inline";
 }
 function hideFull(cnt){
	 document.getElementById("showfull"+cnt).style.display="none";
 }
 function onclickaction(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
	}
 </script>
 <style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
 </head>

<body onload="javascript:">
 <form id="mainfrm" method="post">
<jsp:include page="topHeader.jsp" />

 



<div id="content">
<!--<h3>Home</h3> -->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="#" onclick="javascript:onclickaction('mainfrm','login.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a></td>-->
<!--    </tr>-->
<!--</table>-->


 <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Dashboard.jpg"  width="40" height="40"  /></div>
<p class="title">Dashboard</p> 
 <a href="#" onclick="javascript:onclickaction('mainfrm','login.action')"><div class="back"></div></a>
</div>

<table width="100%">
<tr>
<td> 

<p>  <s:if test="%{searchPageVar=='value'}">


 
<s:if test="%{checkCourtExists=='NO'}">
<div class="courtErr">
	  <font color="red" ><b>No Court Added</font><a href="javascript:callaction('addstdcrtinfo.action');"> [Add Here]</b></a>	
 </div>
  </s:if>

<div class="reminder">

<fieldset><legend><b>Reminders:</b></legend>
 
	<table border="0" width="100%" >
 
		<s:if test="%{retReminderBean.size >= 1}">
		<tr><td>
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
			<a href="javascript:callaction('addreminder.action');">[Click here to Add]</a>		
			</s:if>		
		</td></tr>
			<s:iterator id="listval" value="retReminderBean" status="stat">
			
			<tr class="row<s:property value="#stat.index % 2"/>" > 
				<td align="left" >
				<ul><li>
				
				 <s:hidden id="hidreminderid%{#stat.index}"  value="%{retReminderBean[#stat.index].reminderid}"/> 				 
				<b><s:property value="retReminderBean[#stat.index].remindertype"  /></b> - 
				 <s:property value="retReminderBean[#stat.index].remindersubject" /> at
				 <s:property value="retReminderBean[#stat.index].reminderlocn"  />  on
				 <s:property value="retReminderBean[#stat.index].reminderdate"  /> 
				 <s:if test="%{retReminderBean[#stat.index].remindertime != ''}">
				 	between <s:property value="retReminderBean[#stat.index].remindertime"  /> 
		        </s:if>
		        <a href="#" onclick="javascript:getFull('<s:property value="#stat.index"/>');" 
				ondblclick="javascript:hideFull('<s:property value="#stat.index"/>');">
		       Click here to View 
		         
		        </a>
		        
				<s:div cssStyle="display: none;" id="showfull%{#stat.index}">
				 <div class="note">
					 <table><tr><td>		 
						 <s:property value="retReminderBean[#stat.index].remindermsg"  />
					 </td></tr></table>
			     </div>
				</s:div>
		        
				</li></ul></td>	
			</tr>
			</s:iterator>			
			<tr >
			    <td colspan="3" >&nbsp;</td> 
			    <td>&nbsp;</td>  
			</tr>
			 
		</s:if>
		<s:if test="%{retReminderBean.size==0}">
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td align="left" colspan="3" class="success"> No reminder(s) in the next seven days &nbsp;
				  <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				    <a href="javascript:callaction('addreminder.action');">[Click here to Add]</a>
				 </s:if>
				 </td>
				 
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp; </td>
			</tr>
		</s:if>
	</table>
	</fieldset>
	</div>
	
	
	<div class="reminder">
<fieldset><legend><b>Case Hearing:</b></legend>

	<table border="0" width="100%" >
    
		<s:if test="%{retCaseHearInfo.size >= 1}">
		<tr><td>
		<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
		<a href="javascript:callaction('addcaseHearviaMenu.action');">[Click here to Add]</a>
		</s:if>
		</td></tr>
		   <tr>
        <td> 
           <table border="0"  width="100%" class="grid" cellpadding="1" cellspacing="1" border="0" >
				<thead>
					<tr> 
					<th width="12%" align="center" nowrap>Case ID</th>
					<th width="12%" align="center" nowrap>Client ID</th>
					<th width="10%" align="center"  >Hearing <br/> Date</th>
					<th width="15%" align="center">Client Info</th>			 
					<th width="15%" align="center">Case Type</th>
					<th width="15%" align="center">Prime Case No</th>
					<th width="15%" align="center">Ref Case No</th>
					<th width="15%" align="center" >Court Details</th>
				    <th width="8%" align="center" >Case Status</th>
				    <th width="8%" align="center"  >Case Priority</th>
				    
						  
					</tr>
				</thead>
			</table> 
		 </td>
	 </tr>
	   <tr><td>
		
			 <div style="width:100%;height:250px;overflow:auto;" class="data_grid">
			<table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			
			<s:iterator id="listval" value="retCaseHearInfo" status="stat">
			<tr class="row<s:property value="#stat.index % 2"/>" > 
				 <td width="12%" align="center"><s:property value="retCaseHearInfo[#stat.index].CaseId" /> </td>
				 <td width="12%" align="center"><s:property value="retCaseHearInfo[#stat.index].ClientId" /></td>
				 <td width="10%" align="center"><s:property value="retCaseHearInfo[#stat.index].JudgmntDate" /></td>
				 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].ClientInfo" /></td>					 
				 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].CaseType" /></td>
				 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].PrimeCaseNo" /></td>
				 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].RefCaseNo" /></td>
				 <td width="15%" align="center"><s:property value="retCaseHearInfo[#stat.index].CourtDetails" /></td>
				 <td width="8%" align="center"><s:property value="retCaseHearInfo[#stat.index].CaseStatus" /></td>
				 <td width="8%" align="center"><s:property value="retCaseHearInfo[#stat.index].CasePriority" /></td>
				
			</tr>
			</s:iterator>
			</table>
			</div>
			</td></tr>
		</s:if>
		<s:if test="%{retCaseHearInfo.size==0}">
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td align="left" colspan="3" class="success"> No Case Hearing(s) in the next seven days &nbsp; 
				<s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
				<a href="javascript:callaction('addcaseHearviaMenu.action');">[Click here to Add]</a>
				</s:if>
				</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp; </td>
			</tr>
		</s:if>
	</table>
	</fieldset>
	</div> 
	
 </s:if>
 
  </p>

</td>
</tr>
 
 </table>
 

</div>
 

  <jsp:include page="Footer.jsp" />
</form>
</body>

</html>
