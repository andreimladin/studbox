<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>Feedback - Studbox.ro</title>
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
			<div class="titleform">		
				<h2>Feedback trimis!</h2>							
			</div>			
			<div class="form">
				<div class="control-group">
					<div class="alert alert-success" id="loginerror">
						Mul&#x21B;umim pentru feedback-ul acordat.<br>
						V&#x103; promitem c&#x103; vom tine cont de p&#x103;rerea dvs!
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