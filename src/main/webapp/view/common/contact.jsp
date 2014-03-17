<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>Contact - Studbox.ro</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
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
					</div>
					<div class="sociallinks">
						<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FStudbox%2Ero&amp;width=245&amp;colorscheme=light&amp;show_faces=true&amp; connections=9&amp;stream=false&amp;header=false&amp;height=270" scrolling="no" frameborder="0" scrolling="no" style="border: medium none; overflow: hidden; height: 270px; width: 245px;background:#fff;"></iframe>			
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