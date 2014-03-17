<%@ include file="/view/include.jsp" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>Autentificare - Studbox.ro</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">	
</head>
<body onload='document.loginForm.j_username.focus();'>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">				
		<!-- Content -->
		<div id="content">			
			<div class="titleform">
				<h2>Autentificare</h2>
			</div>			
			<div class="form">
				<form name="loginForm" class="form-horizontal" action="<c:url value='j_spring_security_check'/>" method="POST">
					<c:if test="${not empty error}">
					 	<div class="control-group">				    	
					    	<div class="alert alert-danger" id="loginerror">
					    		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
					    	</div>									    	
					    </div>
					</c:if>
				    <div class="control-group">
				    	<label class="control-label" for="j_username">User :</label>
				    	<div class="controls">
							<input name="j_username" type="text" tabindex="1"/>
						</div>			
						<div class="controls" id="forgotq">
							<a href="${pageContext.request.contextPath}/auth/remember/username" style="font-size:10px;" tabindex="3">&#x21A;i-ai uitat userul?</a>
						</div>	    	
				    </div>
				    <div class="control-group">
				    	<label class="control-label" for="j_password">Parola :</label>
				    	<div class="controls">
							<input name="j_password" type="password" tabindex="2"/>
						</div>
						<div class="controls" id="forgotq">
							<a href="${pageContext.request.contextPath}/auth/remember/password" style="font-size:10px;" tabindex="4">&#x21A;i-ai uitat parola?</a>
						</div>
				    </div>
				    <div class="control-group">
				    	<div class="controls">
				    		<label class="checkbox">
				    			<input type="checkbox" name="_spring_security_remember_me" tabindex="5"/>				    			
				    			 Re&#355;ine user
				    		</label>
				   			<input type="submit" class="btn btn-primary" value="Autentificare"/>
				    	</div>
					</div>
					<div  class="alert alert-info" id="regnew">
						<div id="newacc">
				    		<b>&#206;nc&#x103; nu ai cont?</b>
				    		<a href="${pageContext.request.contextPath}/auth/registration" id="inregistrare" tabindex="7" class="btn btn-success">&#206;nregistreaz&#x103;-te!</a>							
						</div>
					</div>						
				</form>
			</div>			
		</div>
	</div>
	<%@ include file="/view/footer.jsp" %>
</div>
</body>
</html>	