<%@ page language="java"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<% String lang = request.getParameter("langsel");
 
%>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/sidemenu.css" ></link>

 
<table width="100%" cellpadding="0" cellspacing="0">
 
	<tr>
		<td>
		<div class="header-bar">
		<table width="100%" >
			<tr height="1px">
				<td width="15%"><img src="/loms/view/images/logo.png"></td>
				<td><div align="right" style="color:#fff;"> Welcome :<strong><%=session.getAttribute("username")%></strong></div></td>
			</tr>
		</table>
		</div>
		</td>
	</tr>

</table>
<div class="clear"></div>
 
<div id="bread">
		 
			<ul>
			<li><a href="javascript:callaction('home.action');">Home</a></li>
			<li><a href="javascript:callaction('managecase.action');">Manage Case</a></li>
			<s:if test="%{retEmpType=='GOD'}">
			
			<li><a href="javascript:callaction('editProductSet.action');">Edit Product Settings</a></li>
			</s:if>
			<li><a href="javascript:callaction('serviceRequest.action');">Service Request</a></li>
			<li><a href="javascript:callaction('searchJudgments.action');">Search Judgments</a></li>
			<li><a href="javascript:callaction('chgPwd.action');"> Change Password</a></li>
			<li><a href="javascript:callaction('chgSecQuestion.action');"> Change Security Questions</a></li>
			
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
			   <li><a href="javascript:callaction('chgEmailID.action');"> Change Email ID</a></li>
			</s:if>
			<li><a href="javascript:callaction('clklogout.action');"> Logout</a></li></ul>
</div>
<div style="clear:both"></div>