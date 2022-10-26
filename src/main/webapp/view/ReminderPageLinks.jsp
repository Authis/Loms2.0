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
 function onclickaction(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
	}
  
 </script>
 
 </head>

<body  >
 <form id="reminderlinksfrm" method="post">
<jsp:include page="topHeader.jsp" /> 


<div id="contentlink" align="center">
 
   <div id="content-header">
 <div class="icon"><img src="/loms/view/images/Reminder Management.png"  width="40" height="40"  /></div>
<p class="title">REMINDERS</p> 
 <a href="#" onclick="javascript:onclickaction('reminderlinksfrm','login.action')"><div class="back"></div></a>
 </div>
<!-- <div id="content-header">-->
<!--  <table width="75%" >-->
<!--  <tr>-->
<!--     <td align="right" width="1%">-->
<!--       <img src="/loms/view/images/Reminder Management.png"  width="75" height="77"  style="vertical-align: middle;border: 0px" />   -->
<!--     </td>-->
<!--     <td align="left" width="24%"> -->
<!--        <h3 ><strong>REMINDERS</strong></h3> -->
<!--     </td>-->
<!--    <td align="right" width="4%"> -->
<!---->
<!---->
<!--          <a href="#" onclick="javascript:onclickaction('reminderlinksfrm','login.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--</tr>-->
<!--</table>-->
<!---->
<!--</div>-->
<!---->
<!-- -->

<p>&nbsp;</p>
  <p>&nbsp;</p>
   <p>&nbsp;</p>

 
 
 <table width="70%" cellpadding="0" cellspacing="0">
    <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
 <tr align="left"> 
   <td>
      <div class="link-box">
        <div class="link-heading" align="left"><a href="#" onclick="javascript:onclickaction('reminderlinksfrm','addreminder.action');"><u> Add Reminder Information</u>   </a></div>
        <div class="link-descr">Add Personal, Official and Individual Reminder(s) here</div>
      </div>
    </td> 
 </tr>
 <tr align="left"> 
   <td>
      <div class="link-box">
        <div class="link-heading" align="left"><a href="#" onclick="javascript:onclickaction('reminderlinksfrm','viewreminder.action');"><u>Manage Reminder Information</u></a></div>
        <div class="link-descr">Search and Delete Personal, Official and Individual Reminder(s) here</div>
      </div>
    </td> 
 </tr>
 </s:if>
 
  
   
 </table>

</div>
 
  <jsp:include page="Footer.jsp" />
</form>
</body>

</html>
