<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>Contact - Studbox.ro</title>
	<link type="text/css" rel="stylesheet" href="/css/main.css">
	<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">
		<!-- Content -->
		<div id="content">
			<div class="leftside">
				<div id="story" >
					<h3>Contact</h3>
					<h4>Facebook</h4>
					<p><a href="http://www.facebook.com/Studbox.ro">Studbox</a></p>
					<h4>Admin Studbox</h4>
					<p>admin@studbox.ro</p>
					<h4>Support Studbox</h4>
					<p>support@studbox.ro</p>
				</div>
			</div>	
			
			<div class="rightside">
				<div class="socialshare" >
					<div class="socialsharetitle">
						Arat&#x103;-le &#x219;i prieteniilor
					</div>
					<div class="sociallinks">
						<a href="#" 
			  				onclick=
			  					"window.open(
			    					'https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href), 
			      					'facebook-share-dialog', 
			      					'width=626,height=436'); 
			      				return false;">
							<img src="/images/social_facebook_box_blue.png" style="width:35px;height:35px;">
						</a>			
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!-- Footer -->
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>