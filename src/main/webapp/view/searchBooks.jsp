<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
 <link rel="stylesheet" type="text/css" href="/loms/view/css/stylesheet.css" ></link>
  <script language="javascript" type="text/javascript" src="/loms/view/js/rakshaval.js"></script> 
  	<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
	 
 <script>
 function onclickaction(formname,actionname){
		if(document.getElementById(formname)){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();		
	 		document.getElementById(formname).action="";
	 	}	
 }
 function downloadFile(){
	 onclickaction('searchBookFrm','downloadBookDetailsFile.action');
	 
 }
 function getBookId(){
	 var i = document.getElementsByName("cltChkVal").length;
	 for (var x=0;x<i;x++){
		 
		 if(document.getElementById("cltCheckVal"+x).checked == true){
			 document.getElementById("hidbookid").value = document.getElementById("hidbookid"+x).value;
			 
			 
		 }

	   } 
	 
	 }
 
function selOneDelBok(){
	 var i = document.getElementsByName("cltChkVal").length;
	 for (var x=0;x<i;x++){		 
		 if(document.getElementById("cltCheckVal"+x).checked == true){
			 chk = 2;	
			 break;			 
		 }else{			 
			 chk = 1;			  
		 }
	 }
	 
	 if(chk == 2){
		 if(confirm("Are you sure you want to delete the record?")){
		 onclickaction('searchBookFrm','delBook.action');
		 document.getElementById("selectOne").style.display="none";
		 }
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
}
function selOneModBok(){
	var i = document.getElementsByName("cltChkVal").length;
	 for (var x=0;x<i;x++){		 
		 if(document.getElementById("cltCheckVal"+x).checked == true){
			 chk = 2;	
			 break;			 
		 }else{			 
			 chk = 1;			  
		 }
	 }
	 
	 if(chk == 2){
		 onclickaction('searchBookFrm','modBookDetail.action');
		 document.getElementById("selectOne").style.display="none";
	 }else{
		 document.getElementById("selectOne").style.display="inline";			
	 }
	
}
function getlinkclientId(val){
	 
	 document.getElementById("hidbookid").value = val; 
	 
}
function viewClientInfo(val){
	 var url = "viewBookInfo.action?hidbookid="+val;
		window
				.open(url, "_blank",
						'resizable=yes,width=800,height=650,scrollbars=yes,left=30,top=30,status=yes');
}
function remAll(par){
	 
	 if(par == '1'){		 
 		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
		 
 	 }
	 if(par == '2'){		 
		 document.getElementById("txtbookNoIN").value = "";
 		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '3'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
 		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '4'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
 		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '5'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
 		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '6'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
 		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '7'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
 		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '8'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
 		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '9'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
 		 document.getElementById("txtbookPublisherIN").value = "";
 		document.getElementById("txtbookStatusIN").value = "";
 	 }
	 if(par == '10'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookStatusIN").value = "";
  	 }
	 
	 if(par == '11'){		 
		 document.getElementById("txtbookNoIN").value = "";
		 document.getElementById("txtbookTitleIN").value = "";
		 document.getElementById("txtAuthorIN").value = "";
		 document.getElementById("txtbookCoAuthorIN").value = "";
		 document.getElementById("txtbookSubjectIN").value = "";
		 document.getElementById("txtbookTypeIN").value = "";
		 document.getElementById("txtbookYearIN").value = "";
		 document.getElementById("txtbookRackNoIN").value = "";
		 document.getElementById("txtbookRowNoIN").value = "";
		 document.getElementById("txtbookPublisherIN").value = "";
  	 }
}
 </script>
<style type="text/css">
.row0 { background-color:#FFFFFF; }
.row1 { background-color:#f2f2f2; }
</style>
</head>

<body onload="javascript:">
 <form id="searchBookFrm" id="searchBookFrm" action="searchBooks.action" method="post">
  <s:hidden name="hidbookid" id="hidbookid" />
<jsp:include page="topHeader.jsp" />


<div id="left" style="height: 100%;">


</div>

<div id="content">
<!--<h3>Manage Books</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Search Book Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--       -->
<!--         <a href="#" onclick="javascript:onclickaction('searchBookFrm','bookManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       -->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Bookshelf.png"  width="40" height="40"  /></div>
<p class="title">Manage Book</p> 
 <a href="#"  onclick="javascript:onclickaction('searchBookFrm','bookManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Search Book Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 


<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" align="center" width="100%" height="100%" cellspacing="5" cellpadding="5" class="user_max_input">
 
	<tr>
		<td colspan="6">
		<div id="searchBookFrm_errorloc" class="error_strings"></div>
		</td>
		 
	</tr>
<tr>
 <td colspan="2">
	<div style="display: none;" id="selectOne">
		 <table><tr><td>		 
			<ul class="TickList"><li><font color="blue">Please Select atleast one record</font></li></ul>
		 </td></tr></table>
	</div>
</td>
</tr>
<tr>
	<td>Book Position:</td><td><s:textfield theme="simple" name="searchbookBean.bookNoIN" id="txtbookNoIN" onclick="javascript:remAll('1');" maxlength="50"></s:textfield> </td>
	<td>Book Rack No: </td><td><s:textfield theme="simple"  name="searchbookBean.bookRackNoIN" id="txtbookRackNoIN" onclick="javascript:remAll('8');" maxlength="50"></s:textfield> </td>
 <td>Book Row No: </td><td><s:textfield theme="simple"  name="searchbookBean.bookRowNoIN" id="txtbookRowNoIN" onclick="javascript:remAll('9');" maxlength="50"></s:textfield> </td>
   
</tr> 
 
<tr>
 <td>Book Co-Author: </td><td><s:textfield theme="simple"  name="searchbookBean.bookCoAuthorIN" id="txtbookCoAuthorIN"  onclick="javascript:remAll('4');" maxlength="200"></s:textfield> </td>
 <td>Book Subject: </td><td><s:textfield theme="simple"  name="searchbookBean.bookSubjectIN" id="txtbookSubjectIN" onclick="javascript:remAll('5');" maxlength="500"></s:textfield> </td>
 <td>Book Type: </td><td><s:textfield theme="simple"  name="searchbookBean.bookTypeIN" id="txtbookTypeIN" onclick="javascript:remAll('6');" maxlength="500"></s:textfield> </td>
</tr>

<tr>
 <td>Book Title: </td><td><s:textfield theme="simple"  name="searchbookBean.bookTitleIN" id="txtbookTitleIN" onclick="javascript:remAll('2');" maxlength="1000"></s:textfield></td>
    <td>Book Author: </td><td><s:textfield theme="simple"  name="searchbookBean.bookAuthorIN" id="txtAuthorIN" onclick="javascript:remAll('3');" maxlength="200"></s:textfield> </td>
 <td>Book Year: </td><td><s:textfield theme="simple"  name="searchbookBean.bookYearIN" id="txtbookYearIN" onclick="javascript:remAll('7');" maxlength="4"></s:textfield> </td> 
 
</tr>
<tr>
<td>Book Publisher: </td><td><s:textfield theme="simple"  name="searchbookBean.bookPublisherIN" id="txtbookPublisherIN"  maxlength="500" onclick="javascript:remAll('10');"></s:textfield> </td>
<td>Book Status: </td><td><s:select theme="simple" name="searchbookBean.bookStatusIN" id="txtbookStatusIN" cssStyle="width: 200px;"  
		list="#{'':'Select Book Status','On Shelf':'On Shelf', 'With Drawn':'With Drawn'}" onclick="javascript:remAll('11');"></s:select></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
  
<tr>
<td >&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="groovybtn1" class="groovybutton" value="Search" /></td>
 </tr>
<tr><td >&nbsp;</td><td >&nbsp;</td><td >&nbsp;</td></tr>
</table>
<s:if test="%{searchPageVar=='value'}">
<div id="search_result">
<table width="100%" >
   <tr> 
      <td align="left"><p>Search Result</p> </td>
      <s:if test="%{retBookBean.size >= 1}">
      <td align="center"> Download as XLS
					<a href="#"  onclick="javascript:downloadFile();"><img src="/loms/view/img/Download-icon.png" width="24px" height="24px" border="0" alt="Download as XLS" /> </a>
					
	  </td>
	  </s:if>
  </tr>
</table>
 </div>
 <div id="fake-scroll-container" align="center">  
	 <div id="header-container">
		   <table border="0" width="120%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-header" >
		    <tr>
				<th style="width : 20px;"  align="center"></th>
				<th width="15%"  align="center">Book Title</th>							
				<th width="5%"  align="center" nowrap>Rack No</th> 
				<th width="5%"  align="center">Row No</th>
				<th width="5%"  align="center" nowrap>Book Position</th>	
				<th width="5%"  align="center" nowrap>Book Status</th>
				<th width="15%"  align="center">Author</th>
				<th width="15%"  align="center">Co-Author</th>
				<th width="15%"  align="center">Subject</th>
				<th width="15%"  align="center">Type</th> 
				<th width="5%"  align="center">Year</th>  
           </tr>
        </table>
    </div>
 <div id="scroll">
<s:if test="%{retBookBean.size >= 1}">
 <!-- <div style="width:100%;height:250px;overflow:auto;" class="data_grid"> -->
	<table border="0" width="100%" class="grid" cellpadding="1"	cellspacing="1" border="0" id="table-body">
		<s:iterator id="listval" value="retBookBean" status="stat">
		
		<tr class="row<s:property value="#stat.index % 2"/>">
		<td style="width : 12px;"  align="center" >
		  <input type="radio" name="cltChkVal" id="cltCheckVal<s:property value="#stat.index"/>" onclick="javascript:getBookId();"/></td> 
		 <td width="5%" ><s:hidden id="hidbookid%{#stat.index}"  value="%{retBookBean[#stat.index].bookId}"></s:hidden>
		 <a href="#" name="cltLnkVal" id="<s:property value="retBookBean[#stat.index].bookId"  />" onclick="javascript:getlinkclientId(this.id);viewClientInfo(this.id);" >
		 <u><s:property value="retBookBean[#stat.index].BookTitleIN"  /> </u>
		  </a></td>				
		 
		
		<td width="5%"  > <s:property value="retBookBean[#stat.index].bookRackNoIN"  /></td>
		<td width="5%"  ><s:property value="retBookBean[#stat.index].bookRowNoIN"  /></td>
		<td width="15%"  ><s:property value="retBookBean[#stat.index].bookNoIN"  /></td>
		<td width="15%"  ><s:property value="retBookBean[#stat.index].bookStatusIN"  /></td>
		<td width="15%"  ><s:property value="retBookBean[#stat.index].bookAuthorIN"  /></td>
		<td width="15%"  ><s:property value="retBookBean[#stat.index].bookCoAuthorIN"  /></td>
		<td width="15%"  ><s:property value="retBookBean[#stat.index].bookSubjectIN"  /></td>
		<td width="15%"  ><s:property value="retBookBean[#stat.index].bookTypeIN"  /></td>
		<td width="5%"  ><s:property value="retBookBean[#stat.index].bookYearIN"  /></td>
		 
		</tr>
		
		</s:iterator>
 </table>
  </s:if> 
 <s:if test="%{retBookBean.size==0}">
      <table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td align="center" colspan="3" class="success">No Record has been
				returned for the above search criteria.</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</table>
		</s:if> 
</div>

        <div id="y-fake-scroll">
		<div id="y-table-emulator" style="width:40px;">
		&nbsp;
		</div>
		</div>
		
		<div id="x-fake-scroll">
		<div id="x-table-emulator">
		&nbsp;
		</div>
		</div> 
	 </div>
 <s:if test="%{retBookBean.size >= 1}">
		 <table border="0"  width="100%" class="grid" cellpadding="0" cellspacing="0" border="0" >
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td colspan="2"><input type="button" name="groovybtn1" class="groovybutton" value="Edit"   onclick="javascript:selOneModBok();" />
				<input type="button" name="groovybtn1" class="groovybutton" value="Delete"  onclick="javascript:selOneDelBok();"  /></td>
				 
				<td>&nbsp;</td>
			</tr>
		</table>
</s:if>
</s:if>
 </div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


  <jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("searchBookFrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	 frmvalidator.addValidation("txtbookNoIN","num_s","Book position can contain only numbers");
	 frmvalidator.addValidation("txtbookRowNoIN","num_s","Row No can contain only numbers");
	 frmvalidator.addValidation("txtbookRackNoIN","num_s","Rack No can contain only numbers");
 	  
	  frmvalidator.addValidation("txtbookYearIN","numeric","Book year can contain only numbers");  
     
     
     frmvalidator.addValidation("txtbookTitleIN", "alpha_book","Book Title can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
 	frmvalidator.addValidation("txtAuthorIN", "alpha_book","Book Author can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
 	frmvalidator.addValidation("txtbookCoAuthorIN", "alpha_book","Book Co-Author can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
 	frmvalidator.addValidation("txtbookSubjectIN", "alpha_book","Book Subject can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
 	frmvalidator.addValidation("txtbookTypeIN", "alpha_book","Book Type can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
 	frmvalidator.addValidation("txtbookPublisherIN", "alpha_book","Book Publisher can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
  	
	//
</script>
</body>
 <script language="javascript" type="text/javascript" src="/loms/view/js/script.js"></script>
</html>
