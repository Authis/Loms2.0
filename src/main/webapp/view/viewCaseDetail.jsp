<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>LOMS</title>
 
<link rel="stylesheet" href="/loms/view/css/print/app.css"  type="text/css"  title="blue" media="screen"/>
    
</head>
 <body>
  <form>
 <!-- Content wrapper(application wrapper)-->
 <div id="contentwrap">
 <span>&nbsp;</span>
    
 <h3>&nbsp;</h3>

  
 <fieldset>
   <legend>Case Info View</legend>
 <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 <tr>
	 <td width="25%">Client ID:</td>
	 <td width="25%"><s:property value="addCaseBean.clientid" /></td>
	 <td>Case Type:</td>
	 <td><s:property value="addCaseBean.casetype"/></td>
 </tr>
 <tr>
	<td>Case Sub Type 1:</td>
	<td><s:property value="addCaseBean.casesubtype1"/></td>
	<td>Case Sub Type 2:</td>
	<td><s:property value="addCaseBean.casesubtype2"/></td>
 </tr>
 <tr>
   <td nowrap>Prime Case No:</td>
		<td><s:property value="addCaseBean.Caseno1" /></td>
   <td nowrap>Ref Case No:</td>
	<td ><s:property value="addCaseBean.Caseno2"/>/<s:property value="addCaseBean.Caseno3"/>/<s:property value="addCaseBean.Caseno4"/>/
			<s:property value="addCaseBean.Caseno5"/>/<s:property value="addCaseBean.Caseno6"/>
		</td>
 </tr>
 <tr>
      <td>Case Priority:</td>				
	  <td><s:property value="addCaseBean.casepriority"/></td>
	  <td>Case Status:</td>				
	  <td><s:property value="addCaseBean.casestatus" /></td>
 </tr>
 <tr>
	<td>Court Detail</td>				 
	<td><s:property value="addCaseBean.courtdetails"/></td>
	<td>judgment Date:</td>		
	<td><s:property value="addCaseBean.caseJudgmentdate" /></td>
 </tr>
 
 <tr>
 
 </tr> 
 
 <s:iterator id="listval" value="arroppDetailBean" status="stat">
 <tr class="row<s:property value="#stat.index % 2"/>">
  <fieldset>
  <legend>Opponent Details#<s:property value="#stat.index"/>:-</legend>
  <table width="100%" >
    <tr>
      <td>
       <fieldset>
	       <legend>Opp Part Detail:-</legend>
		         <table width="100%" colspan="1" >
				     <tr> 
					     <td>Opp Name   :</td> 
						 <td><s:property value="arroppDetailBean[#stat.index].oppPartyName" /></td> 
					  </tr>	
					  <tr> 
					    <td>Opp Mob No   : </td> 
						<td><s:property value="arroppDetailBean[#stat.index].oppPartyMobNo" /></td> 
					  </tr>
					  <tr>
                          <td>Opp Tel No   : </td>		
						  <td><s:property value="arroppDetailBean[#stat.index].oppPartyTelNo" /></td> 
					   </tr>	
					   <tr>
					       <td>Opp Email  : </td> 
						   <td><s:property value="arroppDetailBean[#stat.index].oppPartEmailId"/></td> 
					   </tr>
					   <tr > 
						   <td>Opp Address   : </td> 
						   <td ><s:property value="arroppDetailBean[#stat.index].oppPartyAddress"/></td>   
					   </tr> 
					</table>
					</fieldset> 
		</td> 
		<td>
			 <fieldset> 
			    <legend>Opp Organization Detail:-</legend>		
				   <table width="100%" colspan="1"  >  
				       <tr> 
					      <td>Org Name   : </td> 
						  <td><s:property value="arroppDetailBean[#stat.index].oppPartyOrgName"/></td> 
					    </tr>
						<tr>
							<td>Org Mob No   : </td> 
							<td><s:property value="arroppDetailBean[#stat.index].oppPartyOrgMobNo"/></td>  
						</tr>
						<tr> 
						    <td>Org Tel No   : </td> 
							<td><s:property value="arroppDetailBean[#stat.index].oppPartyOrgTelNo"/></td> 
						</tr>
						<tr> 
						    <td>Org Email  : </td>
							<td><s:property value="arroppDetailBean[#stat.index].oppPartyOrgEmailId" /></td> 
						</tr>
						<tr> 
							<td>Org Rep  : </td>
							<td><s:property value="arroppDetailBean[#stat.index].oppPartyOrgRepName" /></td> 
						</tr>
						<tr> 
						   <td>Org Address   : </td>			
						   <td><s:property value="arroppDetailBean[#stat.index].oppPartyOrgAddress" /></td>
						</tr>
					</table>
				</fieldset>
			</td>
			<td>
			<fieldset>	  
			  <legend>Opp Lawyer Detail:-</legend>
			      <table width="100%" colspan="1"  > 
				     <tr>
					    <td>Lawyer Name   : </td>
						<td><s:property value="arroppDetailBean[#stat.index].oppPartyLawyerName"/></td>
					 </tr>
					 <tr> 
					    <td>Lawyer Mob No   : </td>
						<td><s:property value="arroppDetailBean[#stat.index].oppPartyLawyerMobNo" /></td> 
					 </tr>
					 <tr>
					    <td>Lawyer Tel No  : </td> 
						<td><s:property value="arroppDetailBean[#stat.index].oppPartyLawyerTelNo"/></td> 
					 </tr>
					 <tr>
					    <td>Lawyer Email  :  </td>
						<td><s:property value="arroppDetailBean[#stat.index].oppPartyLawyerEmailId" /></td>
					 </tr>
					 <tr> 
					    <td>Lawyer Address   : </td>
					    <td><s:property value="arroppDetailBean[#stat.index].oppPartyLawyerAddress"/></td>
					 </tr>
				 </table> 
			 </fieldset>
		 </td>
	  </tr>
	</table>
</fieldset>	 
 </tr>
 </s:iterator>
 
 
 </table>
 
 <div id="grid_control">
<p>Comments</p>
 </div>
  <table cellpadding="0" cellspacing="0" border="0" class="user_max_input">
 
  <tr>
   <td></td>
   <td><s:property value="addCaseBean.comments"/></td>
   <td></td>
   <td></td>
 </tr>
 </table>
 </fieldset>
  <br/>
<div id="btn_wrap">
   <input type="button" name="groovybtn1" class="groovybutton" value="Print" onclick="window.print();" />
   <input type="button" name="groovybtn1" class="groovybutton" value="Close" onclick="window.close();" />
  
 </div>


  

 </div> <!-- End of Content Wrapper -->
 </form>
 </body>
 </html>