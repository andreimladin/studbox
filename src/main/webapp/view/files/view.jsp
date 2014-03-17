<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>${file.name}</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#iframe").load(function(){
				$("#controlbarOpenInViewerButton").remove();
			});
		});
	</script>
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<%@ include file="/view/header.jsp" %>
	
	<div id="content-wrap">	
		<!-- Content -->
		<div id="content">	
			<div id="leftcontent" style="margin-top:10px; ">
				<div id="top-bar" style="margin-bottom:10px;">
					<div id="backbut">
						<div id="navseparator">&nbsp</div>
						<div id="navbutitem" class="firstnavitem" >
							<a href="${pageContext.request.contextPath}/main/courses/${course.objectId}/folders/${folder.objectId}/home">
								<span>
									<i class="icon-large icon-arrow-left icon-white "></i>
									${file.folder.name}
								</span>
							</a>						
						</div>
						<div id="navseparator">&nbsp</div>
						<div id="navbutitem">
							<span>${file.name}</span>						
						</div>
					</div>								
				</div>				
				<c:choose>		
					<c:when test="${errorMessage != null}">
						<div id="errorMessage" class="alert alert-error , confmes ">
							${errorMessage}			
						</div>						
					</c:when>
					<c:otherwise>
						<div id="iframe">
							<iframe src="${content}" width="100%" height="780" style="border: none;"></iframe>
						</div>
					</c:otherwise>
				</c:choose>			
			</div>			
		</div>
	</div>
	
	<!-- Footer -->	
	<%@ include file="/view/footer.jsp" %>

</div>
</body>
</html>