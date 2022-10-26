 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
 
 <!-- Below Hidden Field is added for highlight Main Menu -->
<s:hidden name="hidMenuID" id="hidMenuID"></s:hidden>
<s:hidden name="hidSubMenuID1" id="hidSubMenuID1"></s:hidden>
<s:hidden name="hidSubMenuID2" id="hidSubMenuID2"></s:hidden>
 
 
<div class="left_menu">
<div class="urbangreymenu">
  <h3 class="headerbar"><a href="#"  >CLIENT MANAGEMENT</a></h3>
  <ul class="submenu" id="menu1">
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu1" onClick="javascript:menu('1');submenu('1','1');" href="javascript:callaction('newregistration.action');">Add Client</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu2" onClick="javascript:menu('1');submenu('1','2');" href="javascript:callaction('addFamInfoViewviaMenu.action');">Add Family Information</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
        <li><a id="submenu3" onClick="javascript:menu('1');submenu('1','3');" href="javascript:callaction('manageclient.action');">Manage Client</a></li>
      </s:if>
  </ul>
  <h3 class="headerbar"><a href="#"   > CASE MANAGEMENT</a></h3>
  <ul class="submenu" id="menu2">
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu4" onClick="javascript:menu('2');submenu('2','1');" href="javascript:callaction('newcase.action');">Add Case</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu5" onClick="javascript:menu('2');submenu('2','2');" href="javascript:callaction('addcaseHearviaMenu.action');">Add Case Hearing</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD' }">
        <li><a id="submenu6" onClick="javascript:menu('2');submenu('2','3');" href="javascript:callaction('addcasedocmenu.action');">Add Case Document</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu7" onClick="javascript:menu('2');submenu('2','4');" href="javascript:callaction('managecase.action');">Manage Case</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu8" onClick="javascript:menu('2');submenu('2','5');" href="javascript:callaction('managecasedoc.action');">Manage Case Document</a></li>
      </s:if>
  </ul>
  <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
  <h3 class="headerbar"><a href="#" onClick="javascript:menu('3');"> EMPLOYEE MANAGEMENT</a>
</h3>
  <ul class="submenu" id="menu3">
        <li><a id="submenu9" onClick="javascript:menu('3');submenu('3','1');" href="javascript:callaction('addnewemp.action');">Add Employee</a></li>
        <li><a id="submenu10" onClick="javascript:menu('3');submenu('3','2');" href="javascript:callaction('manageemp.action');">Manage Employee</a></li>
  </ul>
  </s:if>
  <s:if test="%{retEmpType=='USER'}">
    <div style="display: none;" id="menu3"> </div>
  </s:if>

  <h3 class="headerbar">  <a href="#"  onclick="javascript:menu('4');"> INCOME & EXPENSE MANAGEMENT</a>
</h3>
  <ul class="submenu" id="menu4">
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu11" onClick="javascript:menu('4');submenu('4','1');" href="javascript:callaction('addIncExpDet.action');">Add Income / Expense Information</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
        <li><a id="submenu12" onClick="javascript:menu('4');submenu('4','2');" href="javascript:callaction('mngExpDetail.action');">Manage Income / Expense Information</a></li>
      </s:if>
  </ul>
  
  <h3 class="headerbar">  <a href="#" onClick="javascript:menu('5');"> QUICK LINKS</a></h3>
  <ul class="submenu" id="menu5">
      <!--
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu13" onclick="javascript:menu('5');submenu('5','1');" href="javascript:callaction('viewCaseHearInfo.action');">View Case Hearing Info</a></li>
			</s:if>
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu14" onclick="javascript:menu('5');submenu('5','2');" href="javascript:callaction('viewSuits.action');">View Suit</a></li>
				</s:if>
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu15" onclick="javascript:menu('5');submenu('5','3');" href="javascript:callaction('viewAppeals.action');">View Appeals</a></li>
				</s:if>
		    <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu16" onclick="javascript:menu('5');submenu('5','4');" href="javascript:callaction('viewPetition.action');">View Petition</a></li>
				</s:if> 
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu17" onclick="javascript:menu('5');submenu('5','5');" href="javascript:callaction('viewCrimCase.action');">View Criminal Cases</a></li>
		    </s:if>
		    
		     -->
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu17" onClick="javascript:menu('5');submenu('5','5');" href="javascript:callaction('viewCase.action');">View Cases</a></li>
      </s:if>
  </ul>
  
  <h3 class="headerbar">  <a href="#"  onclick="javascript:menu('6');"> LAW STANDARD INFO</a></h3>
  <ul class="submenu" id="menu6">
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu18" onClick="javascript:menu('6');submenu('6','1');" href="javascript:callaction('addstdcrtinfo.action');">Add Court Info</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
        <li><a id="submenu19" onClick="javascript:menu('6');submenu('6','2');" href="javascript:callaction('viewstdcrtinfo.action');">Manage Court Info</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu20"  onclick="javascript:menu('6');submenu('6','3');" href="javascript:callaction('viewstdcaseinfo.action');">Standard Case Info</a></li>
      </s:if>
  </ul>
  
  <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}"> 
  <h3 class="headerbar"><a href="#"  onclick="javascript:menu('7');"> REMINDERS</a></h3>
  <ul class="submenu" id="menu7">
        <li><a id="submenu21" onClick="javascript:menu('7');submenu('7','1');" href="javascript:callaction('addreminder.action');">Add Reminder</a></li>
        <li><a id="submenu22" onClick="javascript:menu('7');submenu('7','2');" href="javascript:callaction('viewreminder.action');">Manage Reminder</a></li>
  </ul>
 </s:if>

<s:if test="%{retEmpType=='GOD'}"> 
  <h3 class="headerbar"> <a href="#"  onclick="javascript:menu('8');"> COMMUNICATION</a></h3>
  <ul class="submenu" id="menu8">
       <!--  <li><a id="submenu23" onclick="javascript:menu('8');submenu('8','1');" href="javascript:callaction('sendSMSView.action');">Send SMS</a></li> -->
        <li><a id="submenu24" onClick="javascript:menu('8');submenu('8','2');" href="javascript:callaction('SendEmailView.action');">Send Mail</a></li>
  </ul>
 </s:if>
   <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER'}">
    <div style="display: none;" id="menu8"> </div>
  </s:if>

  <h3 class="headerbar"> <a href="#"  onclick="javascript:menu('9');"> CASE JUDGMENTS</a></h3>
  <ul class="submenu" id="menu9">
     <li><a id="submenu25" onClick="javascript:menu('9');submenu('9','1');" href="javascript:callaction('searchJudgments.action');">Search Judgments</a></li>
  </ul>

  <h3 class="headerbar"> <a href="#"  onclick="javascript:menu('10');"> TEMPLATES</a>
</h3>
  <ul class="submenu" id="menu10">
     <li><a id="submenu26" onClick="javascript:menu('10');submenu('10','1');" href="javascript:callaction('caseFillingTemplateDownload.action');">Download Templates</a></li>
      <!-- <li><a id="submenu27" onclick="javascript:menu('10');submenu('10','2');" href="javascript:callaction('addcasenew.action');">Coding Sheets</a></li> -->
  </ul>  

  <h3 class="headerbar"> <a href="#"  onclick="javascript:menu('11');"> BOOK SHELF</a></h3>
  <ul class="submenu" id="menu11">
     <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu28" onClick="javascript:menu('11');submenu('11','1');" href="javascript:callaction('addNewBook.action');">Add Book</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu29" onClick="javascript:menu('11');submenu('11','2');" href="javascript:callaction('manageBooks.action');">Manage Book Shelf</a></li>
      </s:if>
  </ul>
</div>


</div>

<script>
 function menu(arg){
	  
 document.getElementById("hidMenuID").value = arg;
  
		if(arg == 1){
		 
			 
			document.getElementById("menu1").style.display="inline"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";	
			document.getElementById("menu7").style.display="none";	
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		 
		
		}
		if(arg == 2){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="inline";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 3){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="inline";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 4){
			 
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="inline";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none"; 
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 5){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="inline";
			document.getElementById("menu6").style.display="none";  
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 6){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="inline";
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 7){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";
			document.getElementById("menu7").style.display="inline";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 8){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="inline";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 9){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="inline";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 10){
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="inline";
			document.getElementById("menu11").style.display="none";
		}
		if(arg == 11){
			 
			document.getElementById("menu1").style.display="none"; 
			document.getElementById("menu2").style.display="none";
			document.getElementById("menu3").style.display="none";
			document.getElementById("menu4").style.display="none";
			document.getElementById("menu5").style.display="none";
			document.getElementById("menu6").style.display="none";
			document.getElementById("menu7").style.display="none";
			document.getElementById("menu8").style.display="none";
			document.getElementById("menu9").style.display="none";
			document.getElementById("menu10").style.display="none";
			document.getElementById("menu11").style.display="inline";
		}
		
		
 }
 
 function submenu(arg1,arg2){
	 document.getElementById("hidSubMenuID1").value = arg1;
	 document.getElementById("hidSubMenuID2").value = arg2;
	    if(arg1 == 1){
	    	if(arg2 == 1){
	    		document.getElementById("submenu1").innerHTML = "<font color='#5888C6'>Add Client</font>";
	    	}	    	
	    	if(arg2 == 2){
	    		document.getElementById("submenu2").innerHTML = "<font color='#5888C6'>Add Family Information</font>";    		
	    	}	
	    	if(arg2 == 3){
	    		document.getElementById("submenu3").innerHTML = "<font color='#5888C6'>Manage Client</font>";    		
	    	}		
		}
		if(arg1 == 2){
		
			if(arg2 == 1){
	    		document.getElementById("submenu4").innerHTML = "<font color='#5888C6'>Add Case</font>";
	    	}	    	
			if(arg2 == 2){
	    		document.getElementById("submenu5").innerHTML = "<font color='#5888C6'>Add Case Hearing</font>";    		
	    	}	
			if(arg2 == 3){
	    		document.getElementById("submenu6").innerHTML = "<font color='#5888C6'>Add Case Document</font>";    		
	    	}	
	    	if(arg2 == 4){
	    		document.getElementById("submenu7").innerHTML = "<font color='#5888C6'>Manage Case</font>";    		
	    	}	
	    	if(arg2 == 5){
	    		document.getElementById("submenu8").innerHTML = "<font color='#5888C6'>Manage Case Document</font>";    		
	    	}

		}
		if(arg1 == 3){
			
			if(arg2 == 1){
	    		document.getElementById("submenu9").innerHTML = "<font color='#5888C6'>Add Employee</font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu10").innerHTML = "<font color='#5888C6'>Manage Employee</font>";    		
	    	}	
	    		
		}
		if(arg1 == 4){
			if(arg2 == 1){
	    		document.getElementById("submenu11").innerHTML = "<font color='#5888C6'>Add Income / Expense Information</font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu12").innerHTML = "<font color='#5888C6'>Manage Income / Expense Information</font>";    		
	    	}	
		 
		}
		if(arg1 == 5){	
			/*if(arg2 == 1){
	    		document.getElementById("submenu13").innerHTML = "<font color='#5888C6'>View Case Hearing Info</font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu14").innerHTML = "<font color='#5888C6'>View Suit</font>";    		
	    	}
	    	if(arg2 == 3){
	    		document.getElementById("submenu15").innerHTML = "<font color='#5888C6'>View Appeals</font>";    		
	    	}	
	    	if(arg2 == 4){
	    		
	    		document.getElementById("submenu16").innerHTML = "<font color='#5888C6'>View Petition</font>";
	    	}
	    	if(arg2 == 5){
	    		document.getElementById("submenu17").innerHTML = "<font color='#5888C6'>View Criminal Cases</font>";    		
	    	}	*/
			if(arg2 == 5){
	    		document.getElementById("submenu17").innerHTML = "<font color='#5888C6'>View Cases</font>";    		
	    	}
	    	
			
		}
		if(arg1 == 6){
			if(arg2 == 1){
	    		document.getElementById("submenu18").innerHTML = "<font color='#5888C6'>Add Court Info</font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu19").innerHTML = "<font color='#5888C6'>Manage Court Info</font>";    		
	    	}
	    	if(arg2 == 3){
	    		document.getElementById("submenu20").innerHTML = "<font color='#5888C6'>Standard Case Info</font>";    		
	    	}
		
		}	  
		if(arg1 == 7){
			if(arg2 == 1){
	    		document.getElementById("submenu21").innerHTML = "<font color='#5888C6'>Add Reminder</font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu22").innerHTML = "<font color='#5888C6'>Manage Reminder</font>";    		
	    	}
	    	 
		
		}	  
		
		if(arg1 == 8){
			/*if(arg2 == 1){
	    		document.getElementById("submenu23").innerHTML = "<font color='#5888C6'>Send SMS</font>";
	    	}*/	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu24").innerHTML = "<font color='#5888C6'>Send mail</font>";    		
	    	}
	    	 
		
		}	 
		
		if(arg1 == 9){
			if(arg2 == 1){
	    		document.getElementById("submenu25").innerHTML = "<font color='#5888C6'>Search Judgments</font>";
	    	}	
		}	 
		
		
		if(arg1 == 10){
			if(arg2 == 1){
	    		document.getElementById("submenu26").innerHTML = "<font color='#5888C6'>Download Templates</font>";
	    	}	    		
	    	/*if(arg2 == 2){
	    		document.getElementById("submenu27").innerHTML = "<font color='#5888C6'>Coding Sheets</font>";    		
	    	}*/
	    	 
		
		}	
		
		
		if(arg1 == 11){
			 
			if(arg2 == 1){
	    		document.getElementById("submenu28").innerHTML = "<font color='#5888C6'>Add Book</font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu29").innerHTML = "<font color='#5888C6'>Manage Book Shelf</font>";    		
	    	}
	    	 
		
		}	
		
 }

 </script>


