<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
<title>LOMS Feedback Form</title>
<link rel="stylesheet" type="text/css"	href="/loms/view/css/stylesheet.css"></link>
 <script src="/loms/view/js/gen_validatorv4.js" type="text/javascript"
	xml:space="preserve"></script>
<style>
.newsize
{
height:150px;
width:350px;

}

#footLinks
{
 
 font-family: calibri;
 text-align: justify;
} 
</style>

 

</head>
<body >
<form name="feedbackFrm" id="feedbackFrm" action="submitFeedFrm.action" method="post">
<div id="footLinks" >
<div align="center"><h1>Feedback Form</h1></div>
 
  <table  width="100%" >
  
    <tr > 
	       <td colspan="2" >
			<div id="feedbackFrm_errorloc" class="error_strings"></div>
			</td>
			<td align="right"></td>
		</tr>
   
    <tr valign="top">
      <td  >
         Name:<span class="mandi">*</span> </td>
    </tr>
    <tr>
      <td  >
        <s:textfield id="userName" name="feedBackBean.userName" ></s:textfield> 
     </td>
    </tr>
    <tr >
      <td  >
        Email ID:<span class="mandi">*</span> </td>
    </tr>
    <tr>
      <td >
        <s:textfield id="emailId" name="feedBackBean.emailId" ></s:textfield>     </td>
    </tr>
    <tr >
      <td >
        Please help us to improve our product:      </td>
    </tr>
    <tr>
      <td ><s:textarea   id="comments" name="feedBackBean.comments" cssStyle="width: 200px;" ></s:textarea>
       </td>
    </tr>
    <tr >
      <td >
        Rate this Product:<span class="mandi">*</span> </td>
    </tr>
    <tr>
      <td >
        <div style="float:left;padding-bottom:5px;">
          <input id="element_3_0" name="feedBackBean.productRating" value="1"  type="radio" />&nbsp;1&nbsp; </div>
        <div style="float:left;padding-bottom:5px;">
          <input id="element_3_1" name="feedBackBean.productRating" value="2"  type="radio" />&nbsp;2&nbsp; </div>
        <div style="float:left;padding-bottom:5px;">
          <input id="element_3_2" name="feedBackBean.productRating" value="3"  type="radio" />&nbsp;3&nbsp; </div>
        <div style="float:left;padding-bottom:5px;">
          <input id="element_3_3" name="feedBackBean.productRating" value="4"  type="radio" />&nbsp;4&nbsp; </div>
        <div style="float:left;padding-bottom:5px;">
          <input id="element_3_4" name="feedBackBean.productRating" value="5"   type="radio" />&nbsp;5&nbsp; </div>
        <div style="clear:both;"></div>
        <div style="padding-bottom:8px;color:#000000;"></div>      </td>
    </tr>
    <tr>
      <td colspan="2" align="left">
        <input type="submit" name="groovybtn1" class="groovybutton" value="Send"  />      </td>
    </tr>
  </table>
  </div>
</form>
<script language="JavaScript" type="text/javascript"
	xml:space="preserve">
	//         
	//You should create the validator only after the definition of the HTML form
	var frmvalidator = new Validator("feedbackFrm");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
	frmvalidator.EnableMsgsTogether(); 
	 
  
	
	frmvalidator.addValidation("userName", "req","Please enter Name");
 	frmvalidator.addValidation("userName", "alpha_space","Name can contain alphabetic chars only");
	 
	frmvalidator.addValidation("emailId", "req",	"Please enter the Email ID");
	frmvalidator.addValidation("emailId", "email", "Please enter Valid Email ID");
 
	frmvalidator.addValidation("productRating", "selone_radio",	"Please rate our Product",true);	

 	
	
	
	//
</script>
</body>
 </html>
 