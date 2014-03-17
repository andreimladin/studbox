<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Cont confirmat</title>
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
			<div class="titleform">
				<h2>User confirmat</h2>
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