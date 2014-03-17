<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<link rel="image_src" href="http://www.studbox.ro/images/small_logo.png"/>
	<meta property="og:image" content="http://www.studbox.ro/images/small_logo.png"/>
	<title>Ghidul studentului - Facult&#x103;&#x21B;i, subiecte examene, prob&#x103; practic&#x103; &#x219;i oral&#x103;, teme licen&#x21B;&#x103; &#x219;i dizerta&#x21B;ie</title>
	<meta name="description" content="Aici ve&#x21B;i putea g&#x103;si foarte multe resurse pentru examene scrise sau practice, cursuri, seminarii, laboratoare sau chiar &#x219;i lucr&#x103;ri de licen&#x21B;&#x103; sau dizerta&#x21B;ie.">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>	
	<script type="text/javascript">
		$(document).ready(function() {$(".w2bslikebox").hover(function() {$(this).stop().animate({right: "0"}, "medium");}, function() {$(this).stop().animate({right: "-250"}, "medium");}, 500);});	
	</script>
	<style type="text/css">
		.w2bslikebox{background: url("http://1.bp.blogspot.com/--tscpVzcBjo/TdUarKtcAlI/AAAAAAAAA3I/qVkypiYO9rc/s150/w2b_facebookbadge.pn") no-repeat scroll left center transparent !important;display: block;float: right;height: 270px;padding: 0 5px 0 46px;width: 245px;z-index: 99999;position:fixed;right:-250px;top:20%;}
		.w2bslikebox div{border:none;position:relative;display:block;}
		.w2bslikebox span{bottom: 12px;font: 8px "lucida grande",tahoma,verdana,arial,sans-serif;position: absolute;right: 6px;text-align: right;z-index: 99999;}
		.w2bslikebox span a{color: #808080;text-decoration:none;}
		.w2bslikebox span a:hover{text-decoration:underline;}
	</style>
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">
		<div class="social">
			<div class="w2bslikebox" style="">
				<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FStudbox%2Ero&amp;width=245&amp;colorscheme=light&amp;show_faces=true&amp; connections=9&amp;stream=false&amp;header=false&amp;height=270" scrolling="no" frameborder="0" scrolling="no" style="border: medium none; overflow: hidden; height: 270px; width: 245px;background:#fff;"></iframe>
			</div>	
		</div>
		
		<!-- Content -->
		<div id="content">			
			<div id="univs">
				<c:forEach var="university" items="${universityList}">
					<div id="univ">
						<a href="${pageContext.request.contextPath}/main/universities/${university.objectId}/home">
							<div id="univ-logo">
				 				<img src="${pageContext.request.contextPath}${university.logo}">
							</div>
							<div id="univ-name">${university.name}</div>
						</a>			
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>