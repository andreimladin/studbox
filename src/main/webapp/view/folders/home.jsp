<%@ include file="/view/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<meta property="og:image" content="http://www.studbox.ro${course.profile.faculty.university.logo}"/>
	<c:choose>
		<c:when test="${folder.course}">
			<title>${folder.name} - ${course.profile.name} - ${course.profile.faculty.name} - ${course.profile.faculty.university.name}</title>
		</c:when>
		<c:otherwise>
			<title>${folder.name} - ${course.name} - ${course.profile.name} - ${course.profile.faculty.name} - ${course.profile.faculty.university.name}</title>
		</c:otherwise>
	</c:choose>	
	<meta name="description" content="Aici g&#x103;si&#x21B;i foarte multe resurse specifice acestui curs. Subiect examene scrise &#x219;i practice, cursuri, seminarii s.a.m.d.">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.number.min.js"></script>
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">
		<!-- Content -->
		<div id="content">	
			<%@ include file="/view/folders/content.jsp" %>
		</div>		
	</div>
		
	<!-- Footer -->
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>