<div class="leftside">
	<div id="leftcontent">
		<div id="top-bar">
			<div id="backbut">
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" class="firstnavitem">
					<a href="/"><span><i class="icon-large icon-arrow-left icon-white " style="margin-right:5px;"></i>Home</span></a>
				</div>
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" >
					<span>${university.shortName}</span>
				</div>
			</div>
		</div>
		
		<div class="accordion" >
			<c:forEach var="faculty" items="${university.faculties}" varStatus = "status">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${status.index}">
							${faculty.name}
						</a>
					</div>
					
					<div id="collapse${status.index}" class="accordion-body collapse">
						<div class="accordion-inner">
							<ul>
								<c:forEach var="profile" items="${faculty.profiles}">
									<a href="/main/profiles/${profile.objectId}/home">							
										<li>								
											<span>${profile.name}</span><br/>${profile.section}								
										</li>
									</a>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>