<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-43783578-1', 'studbox.ro');
  ga('send', 'pageview');

</script>

<div id="header">
	<div id="logo">
		<a href="/"><img src="/images/menu_logo.png"></a> <!-- logo -->
	</div>
	<div id="menu">
		<div class="menuseparator">&nbsp</div>
		<div id="menuitem">
			<a href="/"><span>Facult&#x103;&#x21B;i</span></a>
		</div>
		<div class="menuseparator">&nbsp</div>	
		<sec:authorize access="hasRole('TODO')">	
			<div id="menuitem">
				<a href="joburi.html"><span>Joburi</span></a>
			</div>
			<div class="menuseparator">&nbsp</div>
			<div id="menuitem">
				<a href="profesori.html"><span>Profesori</span></a>
			</div>
			<div class="menuseparator">&nbsp</div>
			<div id="menuitem">
				<a href="stiri.html"><span>&#x218;tiri</span></a>
			</div>
			<div class="menuseparator">&nbsp</div>
		</sec:authorize>
		
	</div>
	
	<div id="top-right">		
		<sec:authorize access="hasRole('TODO')">	
			<div id="searchbar">
				<input type="text" class="search-bar" data-provide="typeahead" placeholder="Cauta cursuri" />
			</div>
		</sec:authorize>		
		<div id="right-header">
			<sec:authorize access="isAnonymous()">			
				<div id="log-in">				
					<a href="/auth/login">Login</a>
				</div>
				<div id="register">
					<a href="/auth/registration" class="btn btn-success">&#206;nregistrare</span></a>
				</div>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<div id="log-in">				
					<a href="#"><span><sec:authentication property="principal.username"/></span></a>
				</div>												
				<div id="register">				
					<a href="<c:url value='/j_spring_security_logout' />" class="btn btn-danger">Ie&#351;ire</a>
				</div>				
			</sec:authorize>
		</div>
	</div>
</div>