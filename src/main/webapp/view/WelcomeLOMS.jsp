<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<table border="0" width="100%" style="border-color: gray">
    <tr>
		<td WIDTH="70%" nowrap>
			<table border="0" width="100%" style="border-color: gray">
				<s:if test="%{retClientMsg != '' && retClientMsg != 'E9999'}">
					<tr>
						<td colspan="4"><div id="statusMsg1" style="display: inline;" >	<div class="succ">		
						<table width = "100%">
						<tr><td>Employee Info has been added Successfully. User ID is: <s:property value="retEmpID" id="retEmpID" /></td></tr>
						<tr><td><b>User Name:</b> <s:property value="retUserName" id="retUserName" /></td></tr>
						<tr><td><b>Password:</b> <s:property value="retPassword" id="retPassword" /></td></tr>	 
						<tr><td>Your Credentials has been sent to Your Email ID.</td></tr>
						<tr><td>Click here to login <a href="http://localhost:8090/loms"><u>LOMS</u></a></td></tr>
						</table>
						</div></div></td>
						<td><s:hidden name="retEmpID" id="retEmpID" />
						<s:hidden name="retUserName" id="retUserName" />
						<s:hidden name="retPassword" id="retPassword" /></td>
					</tr>
				</s:if>
				 
				<s:if test="%{retClientMsg != '' && retClientMsg == 'E9999'}">
					<tr>
						<td colspan="4"><div id="statusMsg1" style="display: inline;" >	<div class="err">		
						<table width = "100%">
						<tr><td>Employee Info has not been added Successfully. User ID is: <s:property value="retEmpID" id="retEmpID" /></td></tr>			 
						</table>
						</div></div></td>
						<td><s:hidden name="retEmpID" id="retEmpID" />
						<s:hidden name="retUserName" id="retUserName" />
						<s:hidden name="retPassword" id="retPassword" /></td>
					</tr>
				</s:if>
				</table>
			</td>
			<td WIDTH="30%">
               <IMG SRC="/loms/view/images/sucess.png" WIDTH="30%" HEIGHT="30%" BORDER="0" ALT="">
			</td>

		</tr>

	 </table>