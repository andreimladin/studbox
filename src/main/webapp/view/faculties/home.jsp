<%@ include file="/view/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>${faculty.university.name} - ${faculty.name}</title>
	<link type="text/css" rel="stylesheet" href="/css/main.css">
	<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>	
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">
		<!-- Content -->
		<div id="content">			
			<%@ include file="/view/faculties/content.jsp" %>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>