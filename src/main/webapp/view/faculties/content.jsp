<div class="leftside">
	<div id="univ-selector">
		<div class="accordion">
			<div class="accordion-group">
				<div class="accordion-heading">
					<div class="facultytitle">${faculty.shortName}</div>						
					<sec:authorize access="hasRole('TODO')">	
						<label class="checkbox" id="actbut">
							<input type="checkbox"><span>Urm&#x103;re&#x219;te</span> 	
						</label>	
					</sec:authorize>						
				</div>
				<div class="accordion-inner">
					<ul>						
						<c:forEach var="profile" items="${faculty.profiles}">
						<a href="/main/profiles/${profile.objectId}/home">							
							<li>								
								${profile.name} - ${profile.section}								
							</li>
						</a>
						</c:forEach>
					</ul>
				</div>
			</div>			 
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>