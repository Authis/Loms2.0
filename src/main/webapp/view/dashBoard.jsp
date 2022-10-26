<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
 <title>Loms</title>
 <link href="/loms/view/css/styles.css" rel="stylesheet" type="text/css" />
  <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script>
<link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
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
<form name="dashBoardFrm" id="dashBoardFrm"   method="post"  >

 <!----header------>
<table width="100%" cellpadding="0" cellspacing="0">
 <jsp:include page="topHeader.jsp" />
 
</table>
<br clear="all" class="clear" />

<!-------page Content----->
<div id="master_menu">
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','homepage.action');"><div class="dashboard"></div></a>
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','clientManagement.action');"><div class="client_management"></div></a>
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','caseManagement.action');"><div class="case_management"></div></a>

<a href="#" onclick="javascript:onclickaction('dashBoardFrm','employeeManagement.action');"><div class="employee_management"></div></a>
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','incExpManagement.action');"><div class="income_expense_management"></div></a>
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','quickLinksManagement.action');"><div class="quick_link"></div></a>
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','lawStandardManagement.action');"><div class="law_standared_info"></div></a>

<a href="#" onclick="javascript:onclickaction('dashBoardFrm','reminderManagement.action');"><div class="reminders"></div></a>
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','communicationManagement.action');"><div class="communication"></div></a>
 <a href="#" onclick="javascript:onclickaction('dashBoardFrm','judgmentManagement.action');"><div class="case_judgment"></div></a>
<a href="#" onclick="javascript:onclickaction('dashBoardFrm','templateManagement.action');"><div class="template"></div></a>

<a href="#" onclick="javascript:onclickaction('dashBoardFrm','bookManagement.action');"><div class="bookself"></div></a>

</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<!-------Footer---->
  <jsp:include page="Footer.jsp" />
</form>
 


 
</body>

</html>
