
window.history.forward(1);
function checkShortcut()
{
 
      if(event.keyCode==8 || event.keyCode==13)
         {
    	      alert("Backspace won't work in Date field");
    	      window.history.forward(0);
               return false;
         }
}

/*if (typeof window.event != 'undefined')
	document.onkeydown = function()
	{
		if (event.srcElement.tagName.toUpperCase() != 'INPUT')
			return (event.keyCode != 8);
	}
else
	document.onkeypress = function(e)
	{
		if (e.target.nodeName.toUpperCase() != 'INPUT')
			return (e.keyCode != 8);
	}
 */
 
function onclickaction(formname,actionname){
	if(document.getElementById(formname)){		 
 		document.getElementById(formname).action=actionname;		
 		document.getElementById(formname).submit();			 
 	}	
}

 function callaction(actionname){	 
	var formname = document.getElementsByTagName("form")[0].id;	 
 	 	if(document.getElementsByTagName("form")[0]){		 
	 		document.getElementById(formname).action=actionname;		
	 		document.getElementById(formname).submit();			 
	 	}	
	 }
 
function regval(){    	 
	if(document.getElementById("txtFirstName").value == '' ){			
		document.getElementById("firstname").style.display="inline";			
	}else{
		document.getElementById("firstname").style.display="none";	
	}
	
	if(document.getElementById("txtLastName").value == '' ){			
		document.getElementById("lastname").style.display="inline";			
	}else{
		document.getElementById("lastname").style.display="none";	
	}
	
	if(document.getElementById("txtEmailId").value == '' ){			
		document.getElementById("emailid").style.display="inline";			
	}else{
		document.getElementById("emailid").style.display="none";	
	}
	
	if(document.getElementById("flgGender").value == '--' ){			
		document.getElementById("gender").style.display="inline";			
	}else{
		document.getElementById("gender").style.display="none";	
	}
	
	if(document.getElementById("txtPermAdd").value == '' ){			
		document.getElementById("peraddr").style.display="inline";			
	}else{
		document.getElementById("peraddr").style.display="none";	
	}
	
	if(document.getElementById("txtTelephoneNo").value == '' ){			
		document.getElementById("telephoneno").style.display="inline";			
	}else{
		document.getElementById("telephoneno").style.display="none";	
	}
 
	if(document.getElementById("nmrmobileno").value == '' ){			
		document.getElementById("mobileno").style.display="inline";			
	}else{
		document.getElementById("mobileno").style.display="none";	
	}
	
	
}


 
 





 
























