<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 

 
<link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>

 <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
 <link rel="stylesheet" href="/loms/view/css/sample/jquery-ui-1.8.14.custom.css" type="text/css" media="all" />
<script src="/loms/view/js/jquery-1.5.1.min.js" type="text/javascript"></script>
 <link rel="stylesheet" type="text/css" href="/loms/view/codebase/dhtmlxcalendar.css"></link>
	<link rel="stylesheet" type="text/css" href="/loms/view/codebase/skins/dhtmlxcalendar_dhx_skyblue.css"></link>
	<script src="/loms/view/codebase/dhtmlxcalendar.js"></script>
	  
	<script type="text/javascript">
	
	
	$( document ).bind( 'mobileinit', function(){
		  $.mobile.loader.prototype.options.text = "loading";
		  $.mobile.loader.prototype.options.textVisible = false;
		  $.mobile.loader.prototype.options.theme = "a";
		  $.mobile.loader.prototype.options.html = "";
		});
		   
	
 		var myCalendar;
		function doOnLoad() {
			//document.getElementById("txtjudgmntDoc").value = "";
			myCalendar = new dhtmlXCalendarObject(["txtjdgmntDate","txtfromDate","txttoDate"]); 
			
			if(document.getElementById("hidsupCourt").value != ""){
				document.getElementById("supCourt").checked = true;
			} 
			if(document.getElementById("hidhighCourt").value != ""){
				document.getElementById("highCourt").checked = true;
				    showStates();  // To Make High court states check automatically when page reloaded after clicking search button
				/* State Validation Starts here*/
				
				 if(document.getElementById("hidcheckState1").value != ""){
					 document.getElementById("checkState1").checked = true;
				 }
				  if(document.getElementById("hidcheckState2").value != ""){
						 document.getElementById("checkState2").checked = true;
					 }
					  if(document.getElementById("hidcheckState3").value != ""){
						 document.getElementById("checkState3").checked = true;
					 }
					  if(document.getElementById("hidcheckState4").value != ""){
						 document.getElementById("checkState4").checked = true;
					 }
					  if(document.getElementById("hidcheckState5").value != ""){
						 document.getElementById("checkState5").checked = true;
					 }
					  if(document.getElementById("hidcheckState6").value != ""){
						 document.getElementById("checkState6").checked = true;
					 }
					  if(document.getElementById("hidcheckState7").value != ""){
						 document.getElementById("checkState7").checked = true;
					 }
					  if(document.getElementById("hidcheckState8").value != ""){
						 document.getElementById("checkState8").checked = true;
					 }
					  if(document.getElementById("hidcheckState9").value != ""){
						 document.getElementById("checkState9").checked = true;
					 }
					  if(document.getElementById("hidcheckState10").value != ""){
							 document.getElementById("checkState10").checked = true;
						 }
					  if(document.getElementById("hidcheckState11").value != ""){
						 document.getElementById("checkState11").checked = true;
					 }
					  if(document.getElementById("hidcheckState12").value != ""){
						 document.getElementById("checkState12").checked = true;
					 }
					  if(document.getElementById("hidcheckState13").value != ""){
						 document.getElementById("checkState13").checked = true;
					 }
					  if(document.getElementById("hidcheckState14").value != ""){
						 document.getElementById("checkState14").checked = true;
					 }
					  if(document.getElementById("hidcheckState15").value != ""){
						 document.getElementById("checkState15").checked = true;
					 }
					  if(document.getElementById("hidcheckState16").value != ""){
						 document.getElementById("checkState16").checked = true;
					 }
					  if(document.getElementById("hidcheckState17").value != ""){
						 document.getElementById("checkState17").checked = true;
					 }
					  if(document.getElementById("hidcheckState18").value != ""){
						 document.getElementById("checkState18").checked = true;
					 }
					  if(document.getElementById("hidcheckState19").value != ""){
						 document.getElementById("checkState19").checked = true;
					 }
					 /* if(document.getElementById("hidcheckState20").value != ""){
						 document.getElementById("checkState20").checked = true;
					 }*/
				
				
				/* State Validation Ends here*/
				 
				
			} 
			
			if(document.getElementById("hidotherCourt").value != ""){
				document.getElementById("otherCourt").checked = true;
				
			    showBenches();  // To Make Tribunal court states check automatically when page reloaded after clicking search button
				/* Bench Validation Starts here*/
				
				     if(document.getElementById("hidcheckTribunal1").value != ""){
					    document.getElementById("checkTribunal1").checked = true;
				      }
				     if(document.getElementById("hidcheckTribunal2").value != ""){
						 document.getElementById("checkTribunal2").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal3").value != ""){
						 document.getElementById("checkTribunal3").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal4").value != ""){
						 document.getElementById("checkTribunal4").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal5").value != ""){
						 document.getElementById("checkTribunal5").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal6").value != ""){
						 document.getElementById("checkTribunal6").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal7").value != ""){
						 document.getElementById("checkTribunal7").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal8").value != ""){
						 document.getElementById("checkTribunal8").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal9").value != ""){
						 document.getElementById("checkTribunal9").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal10").value != ""){
							 document.getElementById("checkTribunal10").checked = true;
						 }
					  if(document.getElementById("hidcheckTribunal11").value != ""){
						 document.getElementById("checkTribunal11").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal12").value != ""){
						 document.getElementById("checkTribunal12").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal13").value != ""){
						 document.getElementById("checkTribunal13").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal14").value != ""){
						 document.getElementById("checkTribunal14").checked = true;
					 }
					  if(document.getElementById("hidcheckTribunal15").value != ""){
						 document.getElementById("checkTribunal15").checked = true;
					 }
					  /* Bench Validation Ends here*/
				
			} 
			
			
			
			
			
			 
		}
	</script>
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
 

function onclickaction(formname,actionname){
	if(document.getElementById(formname)){		 
 		document.getElementById(formname).action=actionname;		
 		document.getElementById(formname).submit();		
 		document.getElementById(formname).action= "";
 	}	
}
	function showStates(){
		
		if(document.getElementById("highCourt").checked == true){
			document.getElementById("checkState1").disabled = false;	
			document.getElementById("checkState2").disabled = false;	
			document.getElementById("checkState3").disabled = false;	
			document.getElementById("checkState4").disabled = false;	
			document.getElementById("checkState5").disabled = false;	
			document.getElementById("checkState6").disabled = false;	
			document.getElementById("checkState7").disabled = false;	
			document.getElementById("checkState8").disabled = false;	
			document.getElementById("checkState9").disabled = false;	
			document.getElementById("checkState10").disabled = false;	
			document.getElementById("checkState11").disabled = false;	
			document.getElementById("checkState12").disabled = false;	
			document.getElementById("checkState13").disabled = false;	
			document.getElementById("checkState14").disabled = false;	
			document.getElementById("checkState15").disabled = false;	
			document.getElementById("checkState16").disabled = false;	
			document.getElementById("checkState17").disabled = false;	
			document.getElementById("checkState18").disabled = false;	
			document.getElementById("checkState19").disabled = false;	
			//document.getElementById("checkState20").disabled = false;
		 
			
		}else{
			document.getElementById("checkState1").disabled = true;	
			document.getElementById("checkState2").disabled = true;	
			document.getElementById("checkState3").disabled = true;	
			document.getElementById("checkState4").disabled = true;	
			document.getElementById("checkState5").disabled = true;	
			document.getElementById("checkState6").disabled = true;	
			document.getElementById("checkState7").disabled = true;	
			document.getElementById("checkState8").disabled = true;	
			document.getElementById("checkState9").disabled = true;	
			document.getElementById("checkState10").disabled = true;	
			document.getElementById("checkState11").disabled = true;	
			document.getElementById("checkState12").disabled = true;	
			document.getElementById("checkState13").disabled = true;	
			document.getElementById("checkState14").disabled = true;	
			document.getElementById("checkState15").disabled = true;	
			document.getElementById("checkState16").disabled = true;	
			document.getElementById("checkState17").disabled = true;	
			document.getElementById("checkState18").disabled = true;	
			document.getElementById("checkState19").disabled = true;	
			//document.getElementById("checkState20").disabled = true;
		}
	} 
 
	
	function showBenches(){
		
		if(document.getElementById("otherCourt").checked == true){
			document.getElementById("checkTribunal1").disabled = false;	
			document.getElementById("checkTribunal2").disabled = false;	
			document.getElementById("checkTribunal3").disabled = false;	
			document.getElementById("checkTribunal4").disabled = false;	
			document.getElementById("checkTribunal5").disabled = false;	
			document.getElementById("checkTribunal6").disabled = false;	
			document.getElementById("checkTribunal7").disabled = false;	
			document.getElementById("checkTribunal8").disabled = false;	
			document.getElementById("checkTribunal9").disabled = false;	
			document.getElementById("checkTribunal10").disabled = false;	
			document.getElementById("checkTribunal11").disabled = false;	
			document.getElementById("checkTribunal12").disabled = false;	
			document.getElementById("checkTribunal13").disabled = false;	
			document.getElementById("checkTribunal14").disabled = false;	
			document.getElementById("checkTribunal15").disabled = false;	
 
			
		}else{
			document.getElementById("checkTribunal1").disabled = true;	
			document.getElementById("checkTribunal2").disabled = true;	
			document.getElementById("checkTribunal3").disabled = true;	
			document.getElementById("checkTribunal4").disabled = true;	
			document.getElementById("checkTribunal5").disabled = true;	
			document.getElementById("checkTribunal6").disabled = true;	
			document.getElementById("checkTribunal7").disabled = true;	
			document.getElementById("checkTribunal8").disabled = true;	
			document.getElementById("checkTribunal9").disabled = true;	
			document.getElementById("checkTribunal10").disabled = true;	
			document.getElementById("checkTribunal11").disabled = true;	
			document.getElementById("checkTribunal12").disabled = true;	
			document.getElementById("checkTribunal13").disabled = true;	
			document.getElementById("checkTribunal14").disabled = true;	
			document.getElementById("checkTribunal15").disabled = true;	
 
		}
	}
	
	
	
	function searchJudgment(){
		
		if(document.getElementById("supCourt").checked ==true){			
			document.getElementById("hidsupCourt").value = document.getElementById("supCourt").value;
		}else{
			document.getElementById("hidsupCourt").value = "";
		}
		if(document.getElementById("highCourt").checked ==true){			
			document.getElementById("hidhighCourt").value = document.getElementById("highCourt").value;
		}else{
			document.getElementById("hidhighCourt").value = "";
		}
		if(document.getElementById("otherCourt").checked ==true){			
			document.getElementById("hidotherCourt").value = document.getElementById("otherCourt").value;
		}else{
			document.getElementById("hidotherCourt").value = "";
		}
		
	 
		/*State Validation Starts here*/
		
		if(document.getElementById("checkState1").checked ==true){			
			document.getElementById("hidcheckState1").value = document.getElementById("checkState1").value;
		}else{
			document.getElementById("hidcheckState1").value = "";
		}

		if(document.getElementById("checkState2").checked ==true){			
			document.getElementById("hidcheckState2").value = document.getElementById("checkState2").value;
		}else{
			document.getElementById("hidcheckState2").value = "";
		}

		if(document.getElementById("checkState3").checked ==true){			
			document.getElementById("hidcheckState3").value = document.getElementById("checkState3").value;
		}else{
			document.getElementById("hidcheckState3").value = "";
		}

		if(document.getElementById("checkState4").checked ==true){			
			document.getElementById("hidcheckState4").value = document.getElementById("checkState4").value;
		}else{
			document.getElementById("hidcheckState4").value = "";
		}

		if(document.getElementById("checkState5").checked ==true){			
			document.getElementById("hidcheckState5").value = document.getElementById("checkState5").value;
		}else{
			document.getElementById("hidcheckState5").value = "";
		}

		if(document.getElementById("checkState6").checked ==true){			
			document.getElementById("hidcheckState6").value = document.getElementById("checkState6").value;
		}else{
			document.getElementById("hidcheckState6").value = "";
		}

		if(document.getElementById("checkState7").checked ==true){			
			document.getElementById("hidcheckState7").value = document.getElementById("checkState7").value;
		}else{
			document.getElementById("hidcheckState7").value = "";
		}

		if(document.getElementById("checkState8").checked ==true){			
			document.getElementById("hidcheckState8").value = document.getElementById("checkState8").value;
		}else{
			document.getElementById("hidcheckState8").value = "";
		}


		if(document.getElementById("checkState9").checked ==true){			
			document.getElementById("hidcheckState9").value = document.getElementById("checkState9").value;
		}else{
			document.getElementById("hidcheckState9").value = "";
		}

		if(document.getElementById("checkState10").checked ==true){			
			document.getElementById("hidcheckState10").value = document.getElementById("checkState10").value;
		}else{
			document.getElementById("hidcheckState10").value = "";
		}

		if(document.getElementById("checkState11").checked ==true){			
			document.getElementById("hidcheckState11").value = document.getElementById("checkState11").value;
		}else{
			document.getElementById("hidcheckState11").value = "";
		}

		if(document.getElementById("checkState12").checked ==true){			
			document.getElementById("hidcheckState12").value = document.getElementById("checkState12").value;
		}else{
			document.getElementById("hidcheckState12").value = "";
		}

		if(document.getElementById("checkState13").checked ==true){			
			document.getElementById("hidcheckState13").value = document.getElementById("checkState13").value;
		}else{
			document.getElementById("hidcheckState13").value = "";
		}

		if(document.getElementById("checkState14").checked ==true){			
			document.getElementById("hidcheckState14").value = document.getElementById("checkState14").value;
		}else{
			document.getElementById("hidcheckState14").value = "";
		}

		if(document.getElementById("checkState15").checked ==true){			
			document.getElementById("hidcheckState15").value = document.getElementById("checkState15").value;
		}else{
			document.getElementById("hidcheckState15").value = "";
		}

		if(document.getElementById("checkState16").checked ==true){			
			document.getElementById("hidcheckState16").value = document.getElementById("checkState16").value;
		}else{
			document.getElementById("hidcheckState16").value = "";
		}

		if(document.getElementById("checkState17").checked ==true){			
			document.getElementById("hidcheckState17").value = document.getElementById("checkState17").value;
		}else{
			document.getElementById("hidcheckState17").value = "";
		}

		if(document.getElementById("checkState18").checked ==true){			
			document.getElementById("hidcheckState18").value = document.getElementById("checkState18").value;
		}else{
			document.getElementById("hidcheckState18").value = "";
		}

		if(document.getElementById("checkState19").checked ==true){			
			document.getElementById("hidcheckState19").value = document.getElementById("checkState19").value;
		}else{
			document.getElementById("hidcheckState19").value = "";
		}

		
		
		
		
		
		
		
		/*if(document.getElementById("checkState20").checked ==true){			
			document.getElementById("hidcheckState20").value = document.getElementById("checkState20").value;
		}else{
			document.getElementById("hidcheckState20").value = "";
		}*/
		 /* State Validation Ends here */
		 
		 /* Bench Validation Starts here*/
		 
		if(document.getElementById("checkTribunal1").checked ==true){			
			document.getElementById("hidcheckTribunal1").value = document.getElementById("checkTribunal1").value;
		}else{
			document.getElementById("hidcheckTribunal1").value = "";
		}

		if(document.getElementById("checkTribunal2").checked ==true){			
			document.getElementById("hidcheckTribunal2").value = document.getElementById("checkTribunal2").value;
		}else{
			document.getElementById("hidcheckTribunal2").value = "";
		}

		if(document.getElementById("checkTribunal3").checked ==true){			
			document.getElementById("hidcheckTribunal3").value = document.getElementById("checkTribunal3").value;
		}else{
			document.getElementById("hidcheckTribunal3").value = "";
		}

		if(document.getElementById("checkTribunal4").checked ==true){			
			document.getElementById("hidcheckTribunal4").value = document.getElementById("checkTribunal4").value;
		}else{
			document.getElementById("hidcheckTribunal4").value = "";
		}

		if(document.getElementById("checkTribunal5").checked ==true){			
			document.getElementById("hidcheckTribunal5").value = document.getElementById("checkTribunal5").value;
		}else{
			document.getElementById("hidcheckTribunal5").value = "";
		}

		if(document.getElementById("checkTribunal6").checked ==true){			
			document.getElementById("hidcheckTribunal6").value = document.getElementById("checkTribunal6").value;
		}else{
			document.getElementById("hidcheckTribunal6").value = "";
		}

		if(document.getElementById("checkTribunal7").checked ==true){			
			document.getElementById("hidcheckTribunal7").value = document.getElementById("checkTribunal7").value;
		}else{
			document.getElementById("hidcheckTribunal7").value = "";
		}

		if(document.getElementById("checkTribunal8").checked ==true){			
			document.getElementById("hidcheckTribunal8").value = document.getElementById("checkTribunal8").value;
		}else{
			document.getElementById("hidcheckTribunal8").value = "";
		}


		if(document.getElementById("checkTribunal9").checked ==true){			
			document.getElementById("hidcheckTribunal9").value = document.getElementById("checkTribunal9").value;
		}else{
			document.getElementById("hidcheckTribunal9").value = "";
		}

		if(document.getElementById("checkTribunal10").checked ==true){			
			document.getElementById("hidcheckTribunal10").value = document.getElementById("checkTribunal10").value;
		}else{
			document.getElementById("hidcheckTribunal10").value = "";
		}

		if(document.getElementById("checkTribunal11").checked ==true){			
			document.getElementById("hidcheckTribunal11").value = document.getElementById("checkTribunal11").value;
		}else{
			document.getElementById("hidcheckTribunal11").value = "";
		}

		if(document.getElementById("checkTribunal12").checked ==true){			
			document.getElementById("hidcheckTribunal12").value = document.getElementById("checkTribunal12").value;
		}else{
			document.getElementById("hidcheckTribunal12").value = "";
		}

		if(document.getElementById("checkTribunal13").checked ==true){			
			document.getElementById("hidcheckTribunal13").value = document.getElementById("checkTribunal13").value;
		}else{
			document.getElementById("hidcheckTribunal13").value = "";
		}

		if(document.getElementById("checkTribunal14").checked ==true){			
			document.getElementById("hidcheckTribunal14").value = document.getElementById("checkTribunal14").value;
		}else{
			document.getElementById("hidcheckTribunal14").value = "";
		}

		if(document.getElementById("checkTribunal15").checked ==true){			
			document.getElementById("hidcheckTribunal15").value = document.getElementById("checkTribunal15").value;
		}else{
			document.getElementById("hidcheckTribunal15").value = "";
		}
		 
		 
		 
		 
		  /* Bench Validation Ends here*/
		
		 
		var stateCheckboxesChecked = [];
		  for (var i=1; i<=19; i++) {
			 var checkState = "checkState"+i;
			 
			  var checkboxes = document.getElementById(checkState);
			   
		     // And stick the checked ones onto an array...
		     
		     if (checkboxes.checked == true && checkboxes.disabled == false) {
		    	 
		    	 stateCheckboxesChecked.push(checkboxes.value);
		     } 
		   
		  }
		  
		  document.getElementById("statesNames").value = stateCheckboxesChecked;
		  
		 
			var benchCheckboxesChecked = [];
			  for (var i=1; i<=15; i++) {
				 var checkTribunal = "checkTribunal"+i;
				 
				  var checkboxes = document.getElementById(checkTribunal);
				   
			     // And stick the checked ones onto an array...
			     if (checkboxes.checked == true && checkboxes.disabled == false) {
			    	 
			    	 benchCheckboxesChecked.push(checkboxes.value);
			     } 
			  }
		  
		  document.getElementById("beanchNames").value = benchCheckboxesChecked;
		  
		//  onclickaction('searchJudgments','searchJudgmentResults.action');
	}
	
	
	function downloadJudgmentDoc(id){
	 
		document.getElementById("hidjdgmntId").value = id;
		onclickaction('searchJudgments', 'downloadJudgDoc.action');
	}
</script>
 
 	<link rel="stylesheet" type="text/css" href="/loms/view/pagination/pagination.css" ></link>
	<script type="text/javascript" src="/loms/view/pagination/DOMhelp.js"></script>
 	<script type="text/javascript" src="/loms/view/pagination/pagination.js"></script>
 
</head>
<body
	onload="javascript:doOnLoad();">
<form id="searchJudgments" action="searchJudgmentResults.action" method="post">
  <s:hidden name="statesNames" id="statesNames"></s:hidden>
  <s:hidden name="beanchNames" id="beanchNames"></s:hidden>
   <s:hidden name="hidjdgmntId" id="hidjdgmntId" />
 <jsp:include page="topHeader.jsp" />
<div style="padding:0px 10px; width:100%;">
 
<div id="content">
<!--<h3>Search Judgments</h3> -->
<!---->
<!--<table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="#" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('searchJudgments','judgmentManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Judgments.png"  width="40" height="40"  /></div>
<p class="title">Search Judgments</p> 
 <a href="#" onclick="javascript:onclickaction('searchJudgments','judgmentManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Send Email.pdf" target="_blank" >
       <img src="/loms/view/images/Help-icon.png"  width="20" height="20" border="0" alt="Help?" />  
       
       </a></div> 



 <table border="0"  width="100%"  cellspacing="5" cellpadding="5" class="user_max_input"> 
 <tr>
	<td colspan="4">		 
	<div id="searchJudgments_errorloc" class="error_strings"></div>		 
	</td>
</tr>
	 <tr> 
	     <td  colspan="4">Enter any Keyword:<span class="mandi">*</span> 
	          &nbsp;&nbsp;&nbsp; <s:textfield  theme="simple" cssStyle="width:500px" name="searchJudgmentFieldBean.judgmntKeyWord" id="judgmntKeyWord" 
	                      maxlength="128" ></s:textfield>
	      </td>				     
	 </tr>
 
	 <tr>
		<td >
				<fieldset><legend><b>Select the Court Type:</b></legend>
			 <table width="100%" cellpadding="0" cellspacing="0" >
				<tr>
				   <td>
						<s:checkbox name="supCourt" id="supCourt" fieldValue="Supreme Court"/>Supreme Court
				  		 <s:hidden name="searchJudgmentFieldBean.supCourt" id="hidsupCourt"/>
				   </td>
				   <td>
				     <s:checkbox name="highCourt" id="highCourt" fieldValue="High Courts" onclick="javascript:showStates();" disabled="true"/>High Court
				       <s:hidden name="searchJudgmentFieldBean.highCourt" id="hidhighCourt"/>
				    </td>
				    <td>
				      <s:checkbox name="otherCourt" id="otherCourt" fieldValue="Other Courts" onclick="javascript:showBenches();" disabled="true"/>Tribunal Court
				        <s:hidden name="searchJudgmentFieldBean.otherCourt" id="hidotherCourt"/>
				    </td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    
				 </tr>
			 </table>
				</fieldset>
		</td>
	 </tr>
 
     <tr>
		<td colspan="4">	 
			<fieldset><legend><b>Select the States :</b></legend>
			<table width="100%" cellpadding="0" cellspacing="0" >
				<tr>
					<td><s:checkbox name="checkState1"  id="checkState1"   fieldValue="HC_JUDGMNT_INFO_AP"  disabled="true"/> Andhra Pradesh
					  <s:hidden name="searchJudgmentFieldBean.checkState1" id="hidcheckState1"/>     
				    </td>  
				    <td><s:checkbox name="checkState2"  id="checkState2"   fieldValue="HC_JUDGMNT_INFO_ARP" disabled="true"/> Arunachal Pradesh
					   <s:hidden name="searchJudgmentFieldBean.checkState2" id="hidcheckState2"/>  
			        </td>     
			        <td><s:checkbox name="checkState3"  id="checkState3"   fieldValue="HC_JUDGMNT_INFO_BIHAR" disabled="true"/> Bihar
					   <s:hidden name="searchJudgmentFieldBean.checkState3" id="hidcheckState3"/>     
					</td>   
					<td><s:checkbox name="checkState4"  id="checkState4"   fieldValue="HC_JUDGMNT_INFO_CHHATTISGARH" disabled="true"/> Chattisgarh
					   <s:hidden name="searchJudgmentFieldBean.checkState4" id="hidcheckState4"/> 
				   </td>  
				   <td><s:checkbox name="checkState5"  id="checkState5"   fieldValue="HC_JUDGMNT_INFO_GAUHATI" disabled="true"/> Gauhati
					   <s:hidden name="searchJudgmentFieldBean.checkState5" id="hidcheckState5"/>
				    </td>	 
			   </tr> 
			   <tr> 
				    <td><s:checkbox name="checkState6"  id="checkState6"   fieldValue="HC_JUDGMNT_INFO_GOA" disabled="true" /> Goa  
						  <s:hidden name="searchJudgmentFieldBean.checkState6" id="hidcheckState6"/>  
					</td>
					 <td><s:checkbox name="checkState7"  id="checkState7"   fieldValue="HC_JUDGMNT_INFO_GUJARAT" disabled="true"/> Gujarat  
					  <s:hidden name="searchJudgmentFieldBean.checkState7" id="hidcheckState7"/>				  
					 </td> 
					 <td><s:checkbox name="checkState8"  id="checkState8"   fieldValue="HC_JUDGMNT_INFO_HARYANA" disabled="true"/> Haryana    
					   <s:hidden name="searchJudgmentFieldBean.checkState8" id="hidcheckState8"/>
					</td>  
					<td><s:checkbox name="checkState9"  id="checkState9"   fieldValue="HC_JUDGMNT_INFO_HP" disabled="true"/> Himachal Pradesh  
				       <s:hidden name="searchJudgmentFieldBean.checkState9" id="hidcheckState9"/>           </td>
				       
					<td><s:checkbox name="checkState10" id="checkState10"   fieldValue="HC_JUDGMNT_INFO_JK" disabled="true"/> Jammu & Kashmir
				       <s:hidden name="searchJudgmentFieldBean.checkState10" id="hidcheckState10"/>   </td>
					
				</tr>    
				<tr>
					<td><s:checkbox name="checkState11" id="checkState11"   fieldValue="HC_JUDGMNT_INFO_JHARKHAND" disabled="true"/> Jharkand
				       <s:hidden name="searchJudgmentFieldBean.checkState11" id="hidcheckState11"/>       </td> 
					<td><s:checkbox name="checkState12" id="checkState12"   fieldValue="HC_JUDGMNT_INFO_KERALA" disabled="true"/> Kerala    
				    <s:hidden name="searchJudgmentFieldBean.checkState12" id="hidcheckState12"/>    </td>
				    <td><s:checkbox name="checkState13" id="checkState13"   fieldValue="HC_JUDGMNT_INFO_MP" disabled="true"/> Madhya Pradesh
				    <s:hidden name="searchJudgmentFieldBean.checkState13" id="hidcheckState13"/></td>
				    <td><s:checkbox name="checkState14" id="checkState14"   fieldValue="HC_JUDGMNT_INFO_MAHARASHTRA" disabled="true"/> Maharashtra
				    <s:hidden name="searchJudgmentFieldBean.checkState14" id="hidcheckState14"/>	</td>
				    <td><s:checkbox name="checkState15" id="checkState15"   fieldValue="HC_JUDGMNT_INFO_ORISSA" disabled="true"/> Orissa
				    <s:hidden name="searchJudgmentFieldBean.checkState15" id="hidcheckState15"/>  </td>
				</tr>                      
				       
				            
				<tr>
				  <td><s:checkbox name="checkState16" id="checkState16"   fieldValue="HC_JUDGMNT_INFO_RAJASTHAN" disabled="true"/> Rajasthan
				   <s:hidden name="searchJudgmentFieldBean.checkState16" id="hidcheckState16"/>  </td>
				  <td><s:checkbox name="checkState17" id="checkState17"   fieldValue="HC_JUDGMNT_INFO_TN" disabled="true"/> Tamilnadu
				   <s:hidden name="searchJudgmentFieldBean.checkState17" id="hidcheckState17"/>  </td>
				  <td><s:checkbox name="checkState18" id="checkState18"   fieldValue="HC_JUDGMNT_INFO_UP" disabled="true"/> Uttar Pradesh  
				    <s:hidden name="searchJudgmentFieldBean.checkState18" id="hidcheckState18"/> </td>
<!--				  <td><s:checkbox name="checkState19" id="checkState19"   fieldValue="UP_Lucknow" disabled="true"/> Uttar Pradesh (Lucknow)-->
<!--				    <s:hidden name="searchJudgmentFieldBean.checkState19" id="hidcheckState19"/></td>-->
				  <td><s:checkbox name="checkState19" id="checkState19"   fieldValue="HC_JUDGMNT_INFO_UTTARAKHAND" disabled="true"/> Uttarakhand 
                   <s:hidden name="searchJudgmentFieldBean.checkState19" id="hidcheckState19"/></td>
				</tr>   
                   
                 </table>
			</fieldset>	 
	    </td>
    </tr>
    
    
     <tr>
		<td colspan="4">	 
			<fieldset><legend><b>Select Tribunal Beanch :</b></legend>
			<table width="100%" cellpadding="0" cellspacing="0" >
				<tr>
					<td><s:checkbox name="checkTribunal1"  id="checkTribunal1"   fieldValue="NEW DELHI"  disabled="true"/> New Delhi
					  <s:hidden name="searchJudgmentFieldBean.checkTribunal1" id="hidcheckTribunal1"/>     
				    </td>  
				    <td><s:checkbox name="checkTribunal2"  id="checkTribunal2"   fieldValue="HYDERABAD" disabled="true"/> Hyderabad
					   <s:hidden name="searchJudgmentFieldBean.checkTribunal2" id="hidcheckTribunal2"/>  
			        </td>     
			        <td><s:checkbox name="checkTribunal3"  id="checkTribunal3"   fieldValue="AHMEDABAD" disabled="true"/> Ahmedabad
					   <s:hidden name="searchJudgmentFieldBean.checkTribunal3" id="hidcheckTribunal3"/>     
					</td>   
					<td><s:checkbox name="checkTribunal4"  id="checkTribunal4"   fieldValue="ALLAHABAD" disabled="true"/> Allahabad
					   <s:hidden name="searchJudgmentFieldBean.checkTribunal4" id="hidcheckTribunal4"/> 
				   </td>  
				   <td><s:checkbox name="checkTribunal5"  id="checkTribunal5"   fieldValue="BANGALORE" disabled="true"/> Bangalore
					   <s:hidden name="searchJudgmentFieldBean.checkTribunal5" id="hidcheckTribunal5"/>
				    </td>	 
			   </tr> 
			   <tr> 
				    <td><s:checkbox name="checkTribunal6"  id="checkTribunal6"   fieldValue="CHANDIGARH" disabled="true" /> Chandigarh  
						  <s:hidden name="searchJudgmentFieldBean.checkTribunal6" id="hidcheckTribunal6"/>  
					</td>
					 <td><s:checkbox name="checkTribunal7"  id="checkTribunal7"   fieldValue="CHENNAI" disabled="true"/> Chennai  
					  <s:hidden name="searchJudgmentFieldBean.checkTribunal7" id="hidcheckTribunal7"/>				  
					 </td> 
					 <td><s:checkbox name="checkTribunal8"  id="checkTribunal8"   fieldValue="CUTTACK" disabled="true"/> Cuttack    
					   <s:hidden name="searchJudgmentFieldBean.checkTribunal8" id="hidcheckTribunal8"/>
					</td>  
					<td><s:checkbox name="checkTribunal9"  id="checkTribunal9"   fieldValue="ERNAKULAM" disabled="true"/> Ernakulam
				       <s:hidden name="searchJudgmentFieldBean.checkTribunal9" id="hidcheckTribunal9"/>           </td>
				       
					<td><s:checkbox name="checkTribunal10" id="checkTribunal10"   fieldValue="GUWAHATI" disabled="true"/> Guwahati
				       <s:hidden name="searchJudgmentFieldBean.checkTribunal10" id="hidcheckTribunal10"/>   </td>
					
				</tr> 
				   
				<tr>
					<td><s:checkbox name="checkTribunal11" id="checkTribunal11"   fieldValue="JABALPUR" disabled="true"/> Jabalpur
				       <s:hidden name="searchJudgmentFieldBean.checkTribunal11" id="hidcheckTribunal11"/>       </td> 
				       
					<td><s:checkbox name="checkTribunal12" id="checkTribunal12"   fieldValue="JAIPUR" disabled="true"/> Jaipur    
				    <s:hidden name="searchJudgmentFieldBean.checkTribunal12" id="hidcheckTribunal12"/>    </td>
				    
				    <td><s:checkbox name="checkTribunal13" id="checkTribunal13"   fieldValue="LUCKNOW" disabled="true"/> Lucknow
				    <s:hidden name="searchJudgmentFieldBean.checkTribunal13" id="hidcheckTribunal13"/></td>
				    
				    <td><s:checkbox name="checkTribunal14" id="checkTribunal14"   fieldValue="MUMBAI" disabled="true"/> Mumbai
				    <s:hidden name="searchJudgmentFieldBean.checkTribunal14" id="hidcheckTribunal14"/>	</td>
				    
				    <td><s:checkbox name="checkTribunal15" id="checkTribunal15"   fieldValue="PATNA" disabled="true"/> Patna
				    <s:hidden name="searchJudgmentFieldBean.checkTribunal15" id="hidcheckTribunal15"/>  </td>
				</tr>  
                   
                 </table>
			</fieldset>	 
	    </td>
    </tr>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <tr>
       <td align="left" >
       <fieldset><legend><b>Select Date:</b></legend>
       <table width="100%" cellpadding="0" cellspacing="0" >
				<tr><td>
             From Date: <s:textfield theme="simple" name="searchJudgmentFieldBean.fromDate"
							id="txtfromDate" readonly="false" onclick="javascript:remAll('2');"></s:textfield>
							<script type="text/javascript">
				            $(document).ready(function() {
				                $('#txtfromDate\\.\\[1\\]').timepicker();
				            });
			             </script> &nbsp;&nbsp;&nbsp;
			             To Date: <s:textfield theme="simple" name="searchJudgmentFieldBean.toDate"
							id="txttoDate" readonly="false" onclick="javascript:remAll('2');"></s:textfield>
							<script type="text/javascript">
					            $(document).ready(function() {
					                $('#txttoDate\\.\\[1\\]').timepicker();
					            });
			        		</script>
			        		</td>
			        		</tr>
			        		</table>
		 </fieldset>
       </td>	
       <td>&nbsp;</td>
	   <td>&nbsp;</td>

     </tr> 
     
     <tr>
	    <td align="center" colspan="4">
	      <input type="submit" name="groovybtn1" class="groovybutton" value="Search" onclick="javascript:searchJudgment();"/>
	      <input type="button" name="groovybtn1" class="groovybutton" value="Reset" onclick = "javascript:clearAllSearchVal();"/>
	    </td>
	</tr>
 </table>
 
  
 <s:if test="%{searchPageVar=='value'}">
<div id="search_result">
	<p>Search Result</p>
</div>
 <s:if test="%{retSearchJudgmentBean.size >= 1 && retSearchJudgmentBean[0].jdgmntID != 'Expired'}">
	 <table width="500%" class="paginated" border="0"  cellpadding="5" cellspacing="5"> 
	    
	 
	  <s:iterator id="listval" value="retSearchJudgmentBean" status="stat">
	    <tr >
	       <td style="font-size: 14px"> 
	           <a href="#" id="<s:property value="retSearchJudgmentBean[#stat.index].courtType"  />" 
	               onclick="javascript:downloadJudgmentDoc(this.id);"><b><u><s:property value="retSearchJudgmentBean[#stat.index].jdgmntTitle"  /></u> </b></a>
	       </td>    
	    </tr>
	    <tr>
	    <td>
	      <div id="jugjmnt">
	    <ul>
	      <li>
	        <strong>Judgment Court :</strong>  <s:property value="retSearchJudgmentBean[#stat.index].courtName"  />	 
	      </li> 
	      <li>
	        <strong>Judgment Citation :</strong>   <s:property value="retSearchJudgmentBean[#stat.index].jdgmntCitation"  />	 
	     </li>    
	      <li>
	       <strong>Judgment Citation Info :</strong>  <s:property value="retSearchJudgmentBean[#stat.index].jdgmntCitatorInfo"  />
	     </li>
	      <li>
	       <strong>Judgment Bench :</strong>   <s:property value="retSearchJudgmentBean[#stat.index].jdgmntBench"  />
	     </li>
	     <li>
	       <strong>Judgment Date :</strong>   <s:property value="retSearchJudgmentBean[#stat.index].jdgmntDate"  />
	     </li>
	      <li>
	       <strong>Judgment Act :</strong>   <s:property value="retSearchJudgmentBean[#stat.index].jdgmntAct"  />
	     </li>
	     </ul>
	     </div>
	     </td>
	   </tr>
	      
	    </s:iterator>
	 </table>
</s:if>
  <s:if test="%{retSearchJudgmentBean.size == 0}">
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
     <s:if test="%{retSearchJudgmentBean[0].jdgmntID == 'Expired'}">
		<table border="0" width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
					<tr>
						<td colspan="3">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
						<td align="center" colspan="2" class="success">Your Licence has been Expired.</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
				       <td>&nbsp;</td>
			        </tr>
		 </table>	
   </s:if>
</s:if>
 
  <s:if test="%{searchPageInternetMsg=='NETINACTIVE'}">
  <table border="0" width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
  <tr>
		 <td colspan="2">&nbsp;</td>
		 <td align="center" colspan="2" class="success">No Internet connection found.</td>
	 </tr>
  </table>
  
  </s:if>
</div>
 </div>

<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("searchJudgments");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	//frmvalidator.addValidation("judgmntKeyWord", "req",	"Search field cannot be blank");	
	
	frmvalidator.setAddnlValidationFunction(yearValidationJudgment);
	
	//frmvalidator.setAddnlValidationFunction(searchJudgment);
 
	//
</script>
</body>
 </html>
