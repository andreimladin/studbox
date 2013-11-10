<%@ include file="/view/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<meta property="og:image" content="http://www.studbox.ro${profile.faculty.university.logo}"/>
	<title>${profile.name} - ${profile.section} - ${profile.faculty.name} - ${profile.faculty.university.name}</title>
	<meta name="description" content="Aici g&#x103;si&#x21B;i foarte multe resurse ce v&#x103; pot fi de folos &#238;n ceea ce prive&#x219;te preg&#x103;tirea unor examene scrise, practice, orale sau chiar predarea unor lucr&#x103;ri de licen&#x21B;&#x103; sau dizerta&#x21B;ie">
	<link type="text/css" rel="stylesheet" href="/css/main.css">
	<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>	
	<script type="text/javascript" src="/js/bootstrap.js"></script>
	<script type="text/javascript" src="/js/bootstrap-tooltip.js"></script>  
	<script type="text/javascript" src="/js/bootstrap-popover.js"></script>	
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">
		<!-- Content -->
		<div id="content">			
			<%@ include file="/view/profiles/content.jsp" %>
		</div>
	</div>	
	
	<!-- Footer -->
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>