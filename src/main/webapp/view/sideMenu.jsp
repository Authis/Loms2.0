<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!-- Below Hidden Field is added for highlight Main Menu -->

<s:hidden name="hidMenuID" id="hidMenuID"></s:hidden>
<s:hidden name="hidSubMenuID1" id="hidSubMenuID1"></s:hidden>
<s:hidden name="hidSubMenuID2" id="hidSubMenuID2"></s:hidden>
<div > <a href="#" onclick="javascript:menu('1');"> <img src="/loms/view/img/small_5638.jpg" width="15" height="15"	alt="CLIENT MANAGEMENT" border="0" /><font color="black">CLIENT MANAGEMENT</font></a>
  <div style="display: none;" id="menu1">
    <ul>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu1" onclick="javascript:menu('1');submenu('1','1');" href="javascript:callaction('newregistration.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Client</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu2" onclick="javascript:menu('1');submenu('1','2');" href="javascript:callaction('addFamInfoViewviaMenu.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Family Information</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
        <li><a id="submenu3" onclick="javascript:menu('1');submenu('1','3');" href="javascript:callaction('manageclient.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Client</a></li>
      </s:if>
    </ul>
  </div>
  <a href="#"  onclick="javascript:menu('2');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="CASE MANAGEMENT" /><font color="black">CASE MANAGEMENT</font></a>
  <div style="display: none;" id="menu2">
    <ul>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu4" onclick="javascript:menu('2');submenu('2','1');" href="javascript:callaction('newcase.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Case</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu5" onclick="javascript:menu('2');submenu('2','2');" href="javascript:callaction('addcaseHearviaMenu.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Case Hearing</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD' }">
        <li><a id="submenu6" onclick="javascript:menu('2');submenu('2','3');" href="javascript:callaction('addcasedocmenu.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Case Document</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu7" onclick="javascript:menu('2');submenu('2','4');" href="javascript:callaction('managecase.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Case</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu8" onclick="javascript:menu('2');submenu('2','5');" href="javascript:callaction('managecasedoc.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Case Document</a></li>
      </s:if>
    </ul>
  </div>
  <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}"> <a href="#" onclick="javascript:menu('3');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="EMPLOYEE MANAGEMENT" /><font color="black">EMPLOYEE MANAGEMENT</font></a>
    <div style="display: none;" id="menu3">
      <ul>
        <li><a id="submenu9" onclick="javascript:menu('3');submenu('3','1');" href="javascript:callaction('addnewemp.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Employee</a></li>
        <li><a id="submenu10" onclick="javascript:menu('3');submenu('3','2');" href="javascript:callaction('manageemp.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Employee</a></li>
      </ul>
    </div>
  </s:if>
  <s:if test="%{retEmpType=='USER'}">
    <div style="display: none;" id="menu3"> </div>
  </s:if>
  <a href="#"  onclick="javascript:menu('4');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0"	alt="INCOME & EXPENSE MANAGEMENT" /><font color="black">INCOME & EXPENSE MANAGEMENT</font></a>
  <div style="display: none;" id="menu4">
    <ul>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu11" onclick="javascript:menu('4');submenu('4','1');" href="javascript:callaction('addIncExpDet.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Income / Expense Information</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
        <li><a id="submenu12" onclick="javascript:menu('4');submenu('4','2');" href="javascript:callaction('mngExpDetail.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Income / Expense Information</a></li>
      </s:if>
    </ul>
  </div>
  <a href="#" onclick="javascript:menu('5');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0"	alt="QUICK LINKS" /><font color="black">QUICK LINKS</font></a>
  <div style="display: none;" id="menu5">
    <ul>
      <!--
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu13" onclick="javascript:menu('5');submenu('5','1');" href="javascript:callaction('viewCaseHearInfo.action');">&nbsp;&nbsp;&nbsp;&nbsp;View Case Hearing Info</a></li>
			</s:if>
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu14" onclick="javascript:menu('5');submenu('5','2');" href="javascript:callaction('viewSuits.action');">&nbsp;&nbsp;&nbsp;&nbsp;View Suit</a></li>
				</s:if>
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu15" onclick="javascript:menu('5');submenu('5','3');" href="javascript:callaction('viewAppeals.action');">&nbsp;&nbsp;&nbsp;&nbsp;View Appeals</a></li>
				</s:if>
		    <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu16" onclick="javascript:menu('5');submenu('5','4');" href="javascript:callaction('viewPetition.action');">&nbsp;&nbsp;&nbsp;&nbsp;View Petition</a></li>
				</s:if> 
			<s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' }">
				<li><a id="submenu17" onclick="javascript:menu('5');submenu('5','5');" href="javascript:callaction('viewCrimCase.action');">&nbsp;&nbsp;&nbsp;&nbsp;View Criminal Cases</a></li>
		    </s:if>
		    
		     -->
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu17" onclick="javascript:menu('5');submenu('5','5');" href="javascript:callaction('viewCase.action');">&nbsp;&nbsp;&nbsp;&nbsp;View Cases</a></li>
      </s:if>
    </ul>
  </div>
  <a href="#"  onclick="javascript:menu('6');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="LAW STANDARD INFO" /><font color="black">LAW STANDARD INFO</font></a>
  <div style="display: none;" id="menu6">
    <ul>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu18" onclick="javascript:menu('6');submenu('6','1');" href="javascript:callaction('addstdcrtinfo.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Court Info</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD'}">
        <li><a id="submenu19" onclick="javascript:menu('6');submenu('6','2');" href="javascript:callaction('viewstdcrtinfo.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Court Info</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}">
        <li><a id="submenu20"  onclick="javascript:menu('6');submenu('6','3');" href="javascript:callaction('viewstdcaseinfo.action');">&nbsp;&nbsp;&nbsp;&nbsp;Standard Case Info</a></li>
      </s:if>
    </ul>
  </div>
  <s:if test="%{retEmpType=='ADMIN' || retEmpType=='GOD'}"> <a href="#"  onclick="javascript:menu('7');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="REMINDERS" /><font color="black">REMINDERS</font></a>
    <div style="display: none;" id="menu7">
      <ul>
        <li><a id="submenu21" onclick="javascript:menu('7');submenu('7','1');" href="javascript:callaction('addreminder.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Reminder</a></li>
        <li><a id="submenu22" onclick="javascript:menu('7');submenu('7','2');" href="javascript:callaction('viewreminder.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Reminder</a></li>
      </ul>
    </div>
  </s:if>
  <s:if test="%{retEmpType=='USER'}">
    <div style="display: none;" id="menu7"> </div>
  </s:if>
  <s:if test="%{retEmpType=='GOD'}"> <a href="#"  onclick="javascript:menu('8');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="COMMUNICATION" /><font color="black">COMMUNICATION</font></a>
    <div style="display: none;" id="menu8">
      <ul>
        <!--  <li><a id="submenu23" onclick="javascript:menu('8');submenu('8','1');" href="javascript:callaction('sendSMSView.action');">&nbsp;&nbsp;&nbsp;&nbsp;Send SMS</a></li> -->
        <li><a id="submenu24" onclick="javascript:menu('8');submenu('8','2');" href="javascript:callaction('SendEmailView.action');">&nbsp;&nbsp;&nbsp;&nbsp;Send Mail</a></li>
      </ul>
    </div>
  </s:if>
  <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER'}">
    <div style="display: none;" id="menu8"> </div>
  </s:if>
  <a href="#"  onclick="javascript:menu('9');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="CASE JUDGMENTS" /><font color="black">CASE JUDGMENTS</font></a>
  <div style="display: none;" id="menu9">
    <ul>
      <li><a id="submenu25" onclick="javascript:menu('9');submenu('9','1');" href="javascript:callaction('searchJudgments.action');">&nbsp;&nbsp;&nbsp;&nbsp;Search Judgments</a></li>
    </ul>
  </div>
  <a href="#"  onclick="javascript:menu('10');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="TEMPLATES" /><font color="black">TEMPLATES</font></a>
  <div style="display: none;" id="menu10">
    <ul>
      <li><a id="submenu26" onclick="javascript:menu('10');submenu('10','1');" href="javascript:callaction('caseFillingTemplateDownload.action');">&nbsp;&nbsp;&nbsp;&nbsp;Download Templates</a></li>
      <!-- <li><a id="submenu27" onclick="javascript:menu('10');submenu('10','2');" href="javascript:callaction('addcasenew.action');">&nbsp;&nbsp;&nbsp;&nbsp;Coding Sheets</a></li> -->
    </ul>
  </div>
  <a href="#"  onclick="javascript:menu('11');"><img src="/loms/view/img/small_5638.jpg" width="15" height="15" border="0" alt="BOOK SELF" /><font color="black">BOOK SHELF</font></a>
  <div style="display: none;" id="menu11">
    <ul>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu28" onclick="javascript:menu('11');submenu('11','1');" href="javascript:callaction('addNewBook.action');">&nbsp;&nbsp;&nbsp;&nbsp;Add Book</a></li>
      </s:if>
      <s:if test="%{retEmpType=='ADMIN' || retEmpType=='USER' || retEmpType=='GOD' }">
        <li><a id="submenu29" onclick="javascript:menu('11');submenu('11','2');" href="javascript:callaction('manageBooks.action');">&nbsp;&nbsp;&nbsp;&nbsp;Manage Book Shelf</a></li>
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
	    		document.getElementById("submenu1").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Client</b></font>";
	    	}	    	
	    	if(arg2 == 2){
	    		document.getElementById("submenu2").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Family Information</b></font>";    		
	    	}	
	    	if(arg2 == 3){
	    		document.getElementById("submenu3").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Client</b></font>";    		
	    	}		
		}
		if(arg1 == 2){
		
			if(arg2 == 1){
	    		document.getElementById("submenu4").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Case</b></font>";
	    	}	    	
			if(arg2 == 2){
	    		document.getElementById("submenu5").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Case Hearing</b></font>";    		
	    	}	
			if(arg2 == 3){
	    		document.getElementById("submenu6").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Case Document</b></font>";    		
	    	}	
	    	if(arg2 == 4){
	    		document.getElementById("submenu7").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Case</b></font>";    		
	    	}	
	    	if(arg2 == 5){
	    		document.getElementById("submenu8").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Case Document</b></font>";    		
	    	}

		}
		if(arg1 == 3){
			
			if(arg2 == 1){
	    		document.getElementById("submenu9").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Employee</b></font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu10").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Employee</b></font>";    		
	    	}	
	    		
		}
		if(arg1 == 4){
			if(arg2 == 1){
	    		document.getElementById("submenu11").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Income / Expense Information</b></font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu12").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Income / Expense Information</b></font>";    		
	    	}	
		 
		}
		if(arg1 == 5){	
			/*if(arg2 == 1){
	    		document.getElementById("submenu13").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;View Case Hearing Info</b></font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu14").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;View Suit</b></font>";    		
	    	}
	    	if(arg2 == 3){
	    		document.getElementById("submenu15").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;View Appeals</b></font>";    		
	    	}	
	    	if(arg2 == 4){
	    		
	    		document.getElementById("submenu16").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;View Petition</b></font>";
	    	}
	    	if(arg2 == 5){
	    		document.getElementById("submenu17").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;View Criminal Cases</b></font>";    		
	    	}	*/
			if(arg2 == 5){
	    		document.getElementById("submenu17").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;View Cases</b></font>";    		
	    	}
	    	
			
		}
		if(arg1 == 6){
			if(arg2 == 1){
	    		document.getElementById("submenu18").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Court Info</b></font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu19").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Court Info</b></font>";    		
	    	}
	    	if(arg2 == 3){
	    		document.getElementById("submenu20").innerHTML = "<font color='#5888C6'><b><i><i>&nbsp;&nbsp;&nbsp;&nbsp;Standard Case Info</b></font>";    		
	    	}
		
		}	  
		if(arg1 == 7){
			if(arg2 == 1){
	    		document.getElementById("submenu21").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Reminder</b></font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu22").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Reminder</b></font>";    		
	    	}
	    	 
		
		}	  
		
		if(arg1 == 8){
			/*if(arg2 == 1){
	    		document.getElementById("submenu23").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Send SMS</b></font>";
	    	}*/	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu24").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Send mail</b></font>";    		
	    	}
	    	 
		
		}	 
		
		if(arg1 == 9){
			if(arg2 == 1){
	    		document.getElementById("submenu25").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Search Judgments</b></font>";
	    	}	
		}	 
		
		
		if(arg1 == 10){
			if(arg2 == 1){
	    		document.getElementById("submenu26").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Download Templates</b></font>";
	    	}	    		
	    	/*if(arg2 == 2){
	    		document.getElementById("submenu27").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Coding Sheets</b></font>";    		
	    	}*/
	    	 
		
		}	
		
		
		if(arg1 == 11){
			 
			if(arg2 == 1){
	    		document.getElementById("submenu28").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Add Book</b></font>";
	    	}	    		
	    	if(arg2 == 2){
	    		document.getElementById("submenu29").innerHTML = "<font color='#5888C6'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;Manage Book Shelf</b></font>";    		
	    	}
	    	 
		
		}	
		
 }

 </script>
