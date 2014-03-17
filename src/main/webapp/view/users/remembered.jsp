<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>
		<c:choose>
			<c:when test="${what == 'username'}">
				User transmis - Studbox.ro
			</c:when>
			<c:when test="${what == 'password'}">
				Parol&#x103; resetat&#x103; - Studbox.ro
			</c:when>
		</c:choose>
	</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
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
			<div class="titleform">
				<c:choose>
					<c:when test="${what == 'username'}">
						<h2>User transmis</h2>
					</c:when>
					<c:when test="${what == 'password'}">
						<h2>Parol&#x103; resetat&#x103;</h2>
					</c:when>
				</c:choose>
			</div>
			
			<div class="form">
				 <div class="control-group">
				 	<div class="alert alert-success" id="loginerror">
					 	<c:choose>
							<c:when test="${what == 'username'}">
								Un email cu userul a fost trimis
							</c:when>
							<c:when test="${what == 'password'}">
								Un email cu parola resetat&#x103; a fost trimis
							</c:when>
						</c:choose>
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