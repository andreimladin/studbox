<%@ include file="/view/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>Feedback - Studbox.ro</title>
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
			<div class="leftside">
				<form:form name="feedbackForm" commandName="feedbackForm" action="/feedback/send" method="POST">					
					<div id="story">
						<h3>Feedback</h3>
						<h4>Dore&#x219;ti s&#x103; oferi un feedback acestui site? Te invit&#x103;m s&#x103; o faci!</h5>
						<div id="contactform">						
							<c:set var="emailError"><form:errors path="email"/></c:set>
							<c:if test="${not empty emailError}">	
								<div class="controls">
									${emailError}
								</div>
							</c:if>
							<form:input path="email" cssClass="condetails" cssStyle="width:400px;" placeholder="Email"/>
								
							<c:set var="subjectError"><form:errors path="subject"/></c:set>
							<c:if test="${not empty subjectError}">	
								<div class="controls">
									${subjectError}
								</div>
							</c:if>
							<form:input path="subject" cssClass="condetails" cssStyle="width:400px;" placeholder="Subiect"/>
							
							<c:set var="textError"><form:errors path="text"/></c:set>
							<c:if test="${not empty textError}">	
								<div class="controls">
									${textError}
								</div>
							</c:if>
							<form:textarea path="text" cssStyle="width:400px; height:100px;" placeholder="Feedback"/>
							<input type="submit" class="btn btn-primary" value="Trimite feedback" />						
						</div>
					</div>
				</form:form>
			</div>
			<div class="rightside">
				<div class="socialshare" >
					<div class="socialsharetitle">
					</div>
					<div class="sociallinks">
						<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FStudbox%2Ero&amp;width=245&amp;colorscheme=light&amp;show_faces=true&amp; connections=9&amp;stream=false&amp;header=false&amp;height=270" scrolling="no" frameborder="0" scrolling="no" style="border: medium none; overflow: hidden; height: 270px; width: 245px;background:#fff;"></iframe>			
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