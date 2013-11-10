<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="/css/main.css">
	<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
	<style>
	.errorblock {
		color: #ff0000;
		background-color: #ffEEEE;
		border: 3px solid #ff0000;
		padding: 8px;
		margin: 16px;
	}
	</style>
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">		
			
		<!-- Content -->
		<div id="content">
			Sesiunea a expirat v&#x103; rug&#x103;m s&#x103; v&#x103; autentifica&#x21B;i din nou.<p/>
			Mul&#x21B;umim!			
		</div>
	</div>
	
	<!-- Footer -->	
	<%@ include file="/view/footer.jsp" %>

</div>
</body>
</html>