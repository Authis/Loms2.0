<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Loms</title>
<link rel="stylesheet" type="text/css"
	href="/loms/view/css/stylesheet.css"></link>
<script language="javascript" type="text/javascript"
	src="/loms/view/js/rakshaval.js"></script>
 
<script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<script>
	function popOnload() {
		 
		if (document.getElementById("retBookId").value) {
			 
			document.getElementById("retBookId").value = "";
		}
	}
	function statusMsg(){
		 
		if(document.getElementById("statusMsg1")){
			 document.getElementById("statusMsg1").style.display = "none";
		  }else{
			 document.getElementById("statusMsg2").style.display = "none";
		  }
	}
</script>
</head>
<body
	onload="javascript:popOnload();">
<form id="addBook" name="addBook"
	action="addBookSave.action" method="post">
 
 
<jsp:include page="topHeader.jsp" />
<div id="left" style="height: 100%;"> 

<div id="content">
<!--<h3>Add Book</h3>-->
<!-- <table width="90%" >-->
<!--    <tr>      -->
<!--       <td align="right" >-->
<!--       <a href="/loms/view/PDF/Add Book Information.pdf" target="_blank">-->
<!--       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  -->
<!--       </a>-->
<!--        -->
<!--       -->
<!--          <a href="#" onclick="javascript:onclickaction('addBook','bookManagement.action')">-->
<!--       <img src="/loms/view/images/BackButton1.jpg"  width="50"  style="vertical-align: middle;border: 0px" />  -->
<!--       </a>-->
<!--       </td>-->
<!--    </tr>-->
<!--</table>-->

<div id="content-header">
 <div class="icon"><img src="/loms/view/images/Bookshelf.png"  width="40" height="40"  /></div>
<p class="title">Add Book</p> 
 <a href="#"  onclick="javascript:onclickaction('addBook','bookManagement.action')"><div class="back"></div></a>
</div>
<div style="float: right;"><a href="/loms/view/PDF/Add Book Information.pdf" target="_blank">
       <img src="/loms/view/images/Help-icon.png" width="20" height="20" border="0" alt="Help?" />  
       </a></div> 



 <div class="mandatory" align="right">Marked fields are Mandatory</div>
 <br/>
<!-- <table><tr><td><div id="errMsg" name="errMsg" style="visibility: visible;"></div></td></tr></table> -->
<table border="0" width="100%" style="border-color: gray" cellpadding="10" cellspacing="10">
	<s:if test="%{retBookId != '' && retBookId != 'E9999'}">
		<tr>
			<td colspan="4"><div id="statusMsg1" style="display: inline;" ><div class="succ">Book has been added Successfully. <s:hidden name="retBookId" id="retBookId" /></div></div></td>
		</tr>
	</s:if>
	<s:if test="%{retBookId == 'E9999'}">
		<tr>
			<td colspan="4"><div id="statusMsg2" style="display: inline;" ><div class="err">Book has not been added Successfully. <s:hidden name="retBookId" id="retBookId" /></div></div></td>
		</tr>
	</s:if>


	<tr>
		<td colspan="2">
		<div id="addBook_errorloc" class="error_strings"></div>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<td>Book Rack No:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="bookBean.bookRackNoIN"
			id="txtbookRackNoIN" maxlength="50" cssStyle="width: 200px;">
		</s:textfield>  </td>
	</tr> 
 
	<tr>
		<td>Book Row No:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple" name="bookBean.bookRowNoIN" cssStyle="width: 200px;" 
			id="txtbookRowNoIN"  maxlength="50"></s:textfield></td>
	</tr>

	<tr>
		<td>Book Position:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple"	name="bookBean.bookNoIN" id="txtbookNoIN" cssStyle="width: 200px;" maxlength="50"></s:textfield>
		 </td>
	</tr>
	
	
	<tr>
		<td>Book Status:<span class="mandi">*</span></td>
		<td><s:select theme="simple" name="bookBean.bookStatusIN" id="txtbookStatusIN" cssStyle="width: 200px;"  
		list="#{'':'Select Book Status','On Shelf':'On Shelf', 'With Drawn':'With Drawn'}"></s:select>
		 </td>
	</tr>
	<tr>
		<td>Book Title:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple"	name="bookBean.bookTitleIN" id="txtbookTitleIN" cssStyle="width: 200px;" maxlength="1000">
		   </s:textfield></td>
	</tr>

	<tr>
		<td>Book Author:<span class="mandi">*</span></td>
		<td><s:textfield theme="simple"   name="bookBean.bookAuthorIN"
			id="txtbookAuthorIN" cssStyle="width: 200px;" maxlength="200"></s:textfield></td>
	</tr>
	<tr>
		<td>Book Co-Author:</td>
		<td><s:textfield theme="simple" name="bookBean.bookCoAuthorIN"
			id="txtbookCoAuthorIN" maxlength="200" cssStyle="width: 200px;">
		</s:textfield>  </td>
	</tr>
	<tr>
		<td>Book Subject:</td>
		<td><s:textfield theme="simple" name="bookBean.bookSubjectIN"
			id="txtbookSubjectIN" maxlength="500" cssStyle="width: 200px;">
		</s:textfield>  </td>
	</tr>
	<tr>
		<td>Book Type:</td>
		<td><s:textfield theme="simple" name="bookBean.bookTypeIN"
			id="txtbookTypeIN" maxlength="500" cssStyle="width: 200px;">
		</s:textfield>  </td>
	</tr>
	<tr>
		<td>Book Year:</td>
		<td><s:textfield theme="simple" name="bookBean.bookYearIN"
			id="txtbookYearIN" maxlength="4" cssStyle="width: 200px;">
		</s:textfield>  </td>
	</tr>
    <tr>
		<td>Book Publisher:</td>
		<td><s:textfield theme="simple" name="bookBean.bookPublisherIN"
			id="txtbookPublisherIN" maxlength="500" cssStyle="width: 200px;">
		</s:textfield>  </td>
	</tr>
	


	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="groovybtn1" class="groovybutton"
			value="Add"  onclick="javascript:statusMsg();"  /> <input
			type="reset" name="groovybtn1" class="groovybutton"
			value="   Reset   " onclick="" /></td>
	</tr>

</table>
</div>
</div>
<jsp:include page="Footer.jsp" />
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("addBook");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether();
	 
	frmvalidator.addValidation("txtbookTitleIN", "req",	"Book Title cannot be blank");	
	frmvalidator.addValidation("txtbookAuthorIN", "req",	"Book Author cannot be blank");		
 	frmvalidator.addValidation("txtbookYearIN", "numeric",	"Book Year Should be numeric (For E.g. 1957)");
	frmvalidator.addValidation("txtbookRackNoIN", "req",	"Book Rack No cannot be blank");
	frmvalidator.addValidation("txtbookRackNoIN", "alpha_num",	"Rack No can contain only letters and numbers");	
	frmvalidator.addValidation("txtbookRowNoIN", "req",	"Book Row No cannot be blank");
	frmvalidator.addValidation("txtbookRowNoIN", "alpha_num",	"Book Row can contain only letters and numbers");	
	
	frmvalidator.addValidation("txtbookStatusIN", "req",	"Book Status cannot be blank");	
	frmvalidator.addValidation("txtbookNoIN", "amountZero",	"Book Position cannot be zero");
	
	frmvalidator.addValidation("txtbookNoIN", "req",	"Book Position cannot be blank");
	frmvalidator.addValidation("txtbookNoIN", "alpha_num",	"Book Position can contain only letters and numbers");
	
	
	
	//frmvalidator.addValidation("txtbookNoIN", "alpha_book","Book No(/ - _) can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
	frmvalidator.addValidation("txtbookTitleIN", "alpha_book","Book Title can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
	frmvalidator.addValidation("txtbookAuthorIN", "alpha_book","Book Author can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
	frmvalidator.addValidation("txtbookCoAuthorIN", "alpha_book","Book Co-Author can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
	frmvalidator.addValidation("txtbookSubjectIN", "alpha_book","Book Subject can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
	frmvalidator.addValidation("txtbookTypeIN", "alpha_book","Book Type can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
	frmvalidator.addValidation("txtbookPublisherIN", "alpha_book","Book Publisher can contain only letters, numbers, slash(/), hyphen(-), underscore(_)");
 	
	
	frmvalidator.addValidation("txtbookYearIN", "amountZero",	"Book year cannot be zero");	
	frmvalidator.addValidation("txtbookYearIN","numeric","Book year can contain only numbers"); 
	frmvalidator.addValidation("txtbookRackNoIN", "amountZero",	"Book Rack No cannot be zero");	
	frmvalidator.addValidation("txtbookRowNoIN", "amountZero",	"Book Row No cannot be zero");	
	
 
	


	//
</script>
</body>

</html>
