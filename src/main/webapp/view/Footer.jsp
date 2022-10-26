 <script>
	function onclickFeedFrm() {
 
		var url = "openFeedbackForm.action";
		window.open(url, "_blank",
						'resizable=no,width=850,height=500,scrollbars=yes,left=30,top=30,status=yes');

		// window.open('/loms/view/ClientID.jsp','','width=300,height=300'); 
	}
	</script>
<style>
.footer1
{
background:#32486c;
color:#fff;
width:100%;
position:relative;
font-family:Arial, Helvetica, sans-serif;
bottom:0px;
font-size:12px;
overflow:hidden;

}
.footer1 ul { text-align:center; margin:0px auto;}
.footer1 ul li {float:left; padding:10px 25px; }
.footer1 ul li a {color:#FFFFFF; font-size: 14px;}
</style> 

<div class="footer1">
<ul style="list-style:none !important">
<li><a href="/loms/view/aboutUs.html" target="_blank"> About Us </a></li>
<li><a href="/loms/view/Disclaimer.html" target="_blank"> Disclaimer </a></li>
<li><a href="#" onclick="javascript:onclickFeedFrm();"> Feedback </a></li>
<li><a  href="/loms/view/contactus.html" target="_blank"> Contact Us </a></li>
</ul>
</div>
