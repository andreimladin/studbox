<div class="leftside">
	<div id="leftcontent">
		<div id="top-bar">
			<div id="backbut">
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" class="firstnavitem">
					<a href="/main/universities/${faculty.university.objectId}/home"><span><i class="icon-large icon-arrow-left icon-white " style="margin-right:5px;"></i>${faculty.university.shortName}</span></a>					
				</div>
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" >
					<span>${faculty.shortName}</span>
				</div>
			</div>
		</div>
		
		<div class="accordion" >
			<c:forEach var="profile" items="${faculty.profiles}" varStatus = "status">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" href="/main/profiles/${profile.objectId}/home">
							${profile.name} - ${profile.section}
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>