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
 <style>
 

 </style>
 </head>

<body  >
 <form id="clientlinksfrm"   method="post">
<jsp:include page="topHeader.jsp" /> 

<div id="contentlink" align="center">

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Client Management.png"  width="40" height="40"  /></div>
<p class="title">CLIENT MANAGEMENT</p> 
 <a href="#" onclick="javascript:onclickaction('clientlinksfrm','login.action')"><div class="back"></div></a>
</div>





<!--<div id="content-header">-->
<!--  <table width="75%" >-->
<!--  <tr>-->
<!--     <td align="right" width="1%">-->
<!--       <img src="/loms/view/images/Client Management.png"  width="75" height="77"  style="vertical-align: middle;border: 0px" />   -->
<!--     </td>-->
<!--     <td align="left" width="24%"> -->
<!--        <h3 ><strong>CLIENT MANAGEMENT</strong></h3> -->
<!--     </td>-->
<!--    <td align="right" width="4%"> -->
<!---->
<!---->
<!--       <a href="#" onclick="javascript:onclickaction('clientlinksfrm','login.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--</tr>-->
<!--</table>-->
<!---->
<!--</div>-->


<!--<table width="90%" >-->
<!--    <tr>      -->
<!--    -->
<!--       <td align="right" >-->
<!---->
<!---->
<!--       <a href="#" onclick="javascript:onclickaction('clientlinksfrm','login.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

 <p>&nbsp;</p>
  <p>&nbsp;</p>
   <p>&nbsp;</p>
 <table width="70%" cellpadding="0" cellspacing="0">
 
 <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
 <tr align="left"> 
   <td>
      <div class="link-box">
        <div class="link-heading" align="left"><a href="#" onclick="javascript:onclickaction('clientlinksfrm','newregistration.action');"><u>Add Client Information</u></a></div>
        <div class="link-descr">Add your Client's Personal and Contact Information here</div>
      </div>
    </td>
 </tr>
 </s:if>
 <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
 <tr align="left"> 
     <td>
       <div class="link-box">
          <div class="link-heading" align="left"><a href="#" onclick="javascript:onclickaction('clientlinksfrm','addFamInfoViewviaMenu.action');"><u>Add Client's Family Information</u> </a></div>
          <div class="link-descr">Add your Client's Family and Relatives Contact Information here</div>
      </div>
    </td>
    </tr>
    </s:if>
  	<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
	 <tr align="left">    
	     <td>
	       <div class="link-box">
	          <div class="link-heading" align="left"><a href="#" onclick="javascript:onclickaction('clientlinksfrm','manageclient.action');"><u>Manage Client Information</u></a></div>
	          <div class="link-descr">Search and Modify your Client's Personal and Family Information here</div>
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
