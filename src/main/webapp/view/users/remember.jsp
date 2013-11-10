<%@ include file="/view/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>
		<c:choose>
			<c:when test="${what == 'username'}">
				Amintire user - Studbox.ro
			</c:when>
			<c:when test="${what == 'password'}">
				Resetare parol&#x103; - Studbox.ro
			</c:when>
		</c:choose>	
	</title>
	<link type="text/css" rel="stylesheet" href="/css/main.css">
	<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">	
</head>
<body onload='document.rememberForm.email.focus();'>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">				
		<!-- Content -->
		<div id="content">	
			<div class="titleform">
				<c:choose>
					<c:when test="${what == 'username'}">
						<h2>Reamintire user</h2>
					</c:when>
					<c:when test="${what == 'password'}">
						<h2>Resetare parol&#x103;</h2>
					</c:when>
				</c:choose>								
			</div>			
			<div class="form">
			
				<form:form name="rememberForm" commandName="rememberForm" class="form-horizontal" action="/auth/processRemember/${what}" method="POST">
					<c:set var="domainNameErrors"><form:errors path="*"/></c:set>
    				<c:if test="${not empty domainNameErrors}">
    					<div class="control-group">
							<div class="alert alert-danger" id="loginerror">
								<form:errors path="*"/>								
							</div>
						</div>
					</c:if>
						
				    <div class="control-group">				    
				    	<label class="control-label" for="email">Email :</label>
				    	<div class="controls">
				    		<form:input path="email"/>							
						</div>			
				    </div>
				    
				    <div class="control-group">
				    	<div class="controls">
				   			<input type="submit" class="btn btn-primary" value="Trimite mail"/>
				    	</div>
					</div>
				</form:form>
			</div>			
		</div>
	</div>
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>	