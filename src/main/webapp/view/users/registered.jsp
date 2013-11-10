<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>	
	<title>Cont inregistrat - Studbox.ro</title>
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
				<h2>User &#238;nregistrat</h2>
			</div>
			
			<div class="form">
				<div class="control-group">
					<div class="alert alert-success" id="loginerror">
						Un mail de confirmare a fost trimis
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