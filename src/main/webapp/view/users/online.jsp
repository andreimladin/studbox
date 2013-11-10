<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
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
			<div id="principals">
				<c:forEach var="principal" items="${principalList}">
					<div id="univ">
						<a href="#">${principal.username}</a>			
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- end content -->
		
	</div>
	
	<!-- Footer -->	
	<%@ include file="/view/footer.jsp" %>

</div>
</body>
</html>