<%@ include file="/view/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/view/head.jsp" %>
	<title>${file.name}</title>
	<link type="text/css" rel="stylesheet" href="/css/main.css">
	<link type="text/css" rel="stylesheet" href="/css/bootstrap.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#iframe").load(function(){
				$("#controlbarOpenInViewerButton").remove();
			});
		});
		function showAuthMessage(){
			$("#authMessage").html(
				"<div class='alert alert-error' id='confmes'>"+
					"V&#x103; rug&#x103;m s&#x103; v&#x103; autentifica&#x21B;i"+
				"</div>"
			);
		}
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
							<a href="/main/folders/${file.folder.objectId}/home">
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
					<sec:authorize access="isAuthenticated()">
						<a href="/main/files/${file.objectId}/download" class="btn btn-small" id="downbut">Descarca</a>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<a onclick="showAuthMessage();" class="btn btn-small" id="downbut">Descarc&#x103;</a>
					</sec:authorize>					
				</div>
				<div id="authMessage">
				</div>		
				<div id="iframe">
					<iframe src="${content}" width="100%" height="780" style="border: none;"></iframe>
				</div>
			</div>			
		</div>
	</div>
	
	<!-- Footer -->	
	<%@ include file="/view/footer.jsp" %>

</div>
</body>
</html>