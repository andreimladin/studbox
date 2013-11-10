<%@ include file="/view/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"    
	  xmlns:og="http://ogp.me/ns#"
      xmlns:fb="https://www.facebook.com/2008/fbml">  
<head>
	<%@ include file="/view/head.jsp" %>
	<meta property="og:type" content="website"/>
	<meta property="og:title" content="${university.name}"/>	
	<meta property="og:image" content="http://www.studbox.ro${university.logo}"/>
	<meta property="og:description" content="Aici g&#x103;si&#x21B;i foarte multe resurse pentru examene scrise sau practice, cursuri, seminarii, laboratoare sau chiar &#x219;i lucr&#x103;ri de licen&#x21B;&#x103; sau dizerta&#x21B;ie, toate acestea pentru fiecare facultate &#238;n parte a acestei universit&#x103;&#x21B;i."/>
	<title>${university.name}</title>
	<meta name="description" content="Aici g&#x103;si&#x21B;i foarte multe resurse pentru examene scrise sau practice, cursuri, seminarii, laboratoare sau chiar &#x219;i lucr&#x103;ri de licen&#x21B;&#x103; sau dizerta&#x21B;ie, toate acestea pentru fiecare facultate &#238;n parte a acestei universit&#x103;&#x21B;i.">
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
			<%@ include file="/view/universities/content.jsp" %>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>