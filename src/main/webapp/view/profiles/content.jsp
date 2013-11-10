<div class="leftside">
	<div id="leftcontent">
		<div id="top-bar">
			<div id="backbut">
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" class="firstnavitem" >
					<a href="/main/universities/${profile.faculty.university.objectId}/home"><span><i class="icon-large icon-arrow-left icon-white " style="margin-right:5px;"></i>${profile.faculty.university.shortName}</span></a>
				</div>
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" >
					<span>${profile.shortName}</span>
				</div>
			</div>
		</div>	
		<div class="accordion" >
			<c:forEach var="year" items="${profile.years}" varStatus="yearStatus">
				<c:forEach var="course" items="${year.courses}" varStatus = "status">				 
					<c:if test="${status.first || (previousCourse != null && course.semester != previousCourse.semester)}">
						<c:if test="${previousCourse != null && course.semester != previousCourse.semester}">
										</ul>
									</div>
								</div>
							</div>
						</c:if>
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${yearStatus.index}${status.index}">
									${year.name} - Semestrul ${course.semester}
								</a>
							</div>
					
							<div id="collapse${yearStatus.index}${status.index}" class="accordion-body collapse">
								<div class="accordion-inner">
									<ul>	
					</c:if>							
									<a href="/main/courses/${course.objectId}/home">							
										<li>								
											<span>${course.name}</span>							
										</li>
									</a>
					<c:if test="${status.last}">
									</ul>
								</div>
							</div>
						</div>
					</c:if>
					
					<c:set var="previousCourse" scope="request" value="${course}"/>	
				</c:forEach>
				<c:remove var="previousCourse"/>	
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>