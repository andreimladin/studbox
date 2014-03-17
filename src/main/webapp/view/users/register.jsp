<%@ include file="/view/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>&#206;nregistrare - Studbox.ro</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#terms").click(function() {
        		if ($(this).is(":checked")) {
            		$("#submit").removeAttr("disabled");
        		} else {
            		$("#submit").attr("disabled", "disabled");
        		}
    		});
    		
			if ($("#terms").is(":checked")){
				$("#submit").removeAttr("disabled");
			}			
			
			$('#registrationForm')[0].reset();
		}); 
	</script>
</head>
<body onload='document.registrationForm.username.focus();'>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">		
			
		<!-- Content -->
		<div id="content">
		
			<!-- Registration content -->
			<div id="registerpage">

				<div class="titleform">
					<h2>Creare cont</h2>
				</div>

				<div class="form">
					<form:form name="registrationForm" commandName="registrationForm" action="${pageContext.request.contextPath}/auth/register" class="form-horizontal" method="POST">
						<!-- Username -->
						<div class="control-group">
					 	   	<label class="control-label" for="username">
					 	   		User :
					 	   	</label>
					 	   	<div class="controls">
					   			<form:input path="username"/>	
					    	</div>
					    	<c:set var="usernameErrors"><form:errors path="username" cssStyle="font-size:10px; color:red;"/></c:set>
    						<c:if test="${not empty usernameErrors}">			
					    		<div class="controls">
					    			${usernameErrors}
						    	</div>
						    </c:if>						    		    	
					    </div>
					    
					    <!-- Password -->
					    <div class="control-group">
					 	   	<label class="control-label" for="password">
					 	   		Parola :
					 	   	</label>
					 	   	<div class="controls">
					 	   		<form:password path="password"/>
					    	</div>
					    	<c:set var="passwordErrors"><form:errors path="password" cssStyle="font-size:10px; color:red;"/></c:set>
    						<c:if test="${not empty passwordErrors}">			
					    		<div class="controls">
					    			${passwordErrors}
						    	</div>
						    </c:if>						    	
					    </div>
					    
					    <!-- Retype Password -->
					    <div class="control-group">
					 	   	<label class="control-label" for="confirmPassword">
					 	   		Rescrie Parola :
					 	   	</label>
					 	   	<div class="controls">
					 	   		<form:password path="confirmPassword"/>
					    	</div>
					    	<c:set var="confirmPasswordErrors"><form:errors path="confirmPassword" cssStyle="font-size:10px; color:red;"/></c:set>
    						<c:if test="${not empty confirmPasswordErrors}">			
					    		<div class="controls">
					    			${confirmPasswordErrors}
						    	</div>
						    </c:if>	
					    </div>
					    
					    <!-- Prenume -->
					    <div class="control-group">
					 	   	<label class="control-label" for="firstName">
					 	   		Prenume :
					 	   	</label>
					 	   	<div class="controls">
					   			<form:input path="firstName"/>	
					    	</div>
					    	<c:set var="firstNameErrors"><form:errors path="firstName" cssStyle="font-size:10px; color:red;"/></c:set>
    						<c:if test="${not empty firstNameErrors}">			
					    		<div class="controls">
					    			${firstNameErrors}
						    	</div>
						    </c:if>	
					    </div>
					    
					    <!-- Nume -->
					    <div class="control-group">
					 	   	<label class="control-label" for="lastName">
					 	   		Nume :
					 	   	</label>
					 	   	<div class="controls">
					 	   		<form:input path="lastName"/>					 	   		
					    	</div>
							<c:set var="lastNameErrors"><form:errors path="lastName" cssStyle="font-size:10px; color:red;"/></c:set>
    						<c:if test="${not empty lastNameErrors}">			
					    		<div class="controls">
					    			${lastNameErrors}
						    	</div>
						    </c:if>		
					    </div>
					    
					    <!-- Email -->
					    <div class="control-group">
					 	   	<label class="control-label" for="email">
					 	   		Email :
					 	   	</label>
					 	   	<div class="controls">
					 	   		<form:input path="email"/>		
					    	</div>
					    	<c:set var="emailErrors"><form:errors path="email" cssStyle="font-size:10px; color:red;"/></c:set>
    						<c:if test="${not empty emailErrors}">			
					    		<div class="controls">
					    			${emailErrors}
						    	</div>
						    </c:if>		
					    </div>
					    
					    <!-- Sex -->
					    <div class="control-group">
					    	<label class="control-label" for="sex">
					 	   		Sex :
					 	   	</label>
					 	   	<div class="controls">
					  	 		<label class="radio inline">
					  	 			<form:radiobutton path="sex" value="M"/>
									Masculin
 								</label>
 								<label class="radio inline">
					  	 			<form:radiobutton path="sex" value="F"/>
 										Feminin
 								</label>
 							</div>
						</div>
						
						<!-- Data Nasterii -->
						<div class="control-group">
					    	<label class="control-label" for="bDay">
					 	   		Data na&#x219;terii :
					 	   	</label>
					 	   	
					 	   	<!-- Ziua -->
					 	   	<div class="controls">
						 	   	<form:select path="bDay" style="width:auto;float:left">
	    							<form:options items="${bDays}" />
								</form:select>
								
								<form:select path="bMonth" style="width:auto;float:left">
	    							<form:options items="${bMonths}" />
								</form:select>
							</div>
							
							<form:select path="bYear" style="width:auto;float:left">
	    						<form:options items="${bYears}" />
							</form:select> 							
						</div>
						
						<div class="alert alert-info">
							<div class="control-group">
						    	<div id="registerend">
					    			<div id="registercond">								    	
							    		<label class="checkbox">
						   		 			<form:checkbox path="useNotifications"/>
						    				 Vreau s&#x103; primesc mailuri de la studbox.ro
						    			</label>
						    			<label class="checkbox">
							    			<form:checkbox id="terms" path="agreedTerms"/>
											Sunt de acord cu <a href="${pageContext.request.contextPath}/shortTerms" onclick="window.open('/shortTerms','Termeni &#x219;i condi&#x21B;ii','width=1000,height=700,left=50,top=0');return false;"><b><i>Termenii &#x219;i condi&#x21B;iile</b></i></a>
							    		</label>
						    		</div>
						    		<div id="registerbtn">
						    			<input type="submit" class="btn btn-primary" 
						    				id="submit" disabled="disabled" value="&#206;nregistrare">						 			 	
						 			</div>
					    		</div>
					   		</div>
					   	</div>
					   	
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/view/footer.jsp" %>

</div>
</body>
</html>