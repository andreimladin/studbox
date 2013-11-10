<div class="leftside">
	<div id="univ-selector">
		<div class="accordion">
			<c:forEach var="year" items="${yearList}">
				<div class="accordion-group">
					<div class="accordion-heading">
						<div class="facultytitle">${year.name}</div>
						<sec:authorize access="hasRole('TODO')">	
							<label class="checkbox" id="actbut">
								<input type="checkbox"><span>Urm&#x103;re&#x219;te</span> 	
							</label>	
						</sec:authorize>
					</div>
					<div class="accordion-inner">
						<ul>											
							<c:forEach var="course" items="${year.courses}" varStatus = "status">
								<c:if test="${course.semester == 1 && status.first}">
									<li class="semdivider">
										Semestrul 1
									</li>
								</c:if>
								<c:if test="${course.semester == 2 && previousCourse != null && previousCourse.semester == 1}">
									<li class="semdivider">
										Semestrul 2
									</li>							
								</c:if>
								<a href="/main/folders/${course.defaultFolder.objectId}/home">
									<li>		
										${course.name}									
									</li>
								</a>	
								<c:set var="previousCourse" scope="request" value="${course}"/>							
							</c:forEach>
						</ul>
					</div>
				</div>				
			</c:forEach> 
		</div>
	</div>
</div>

<div class="rightside">
	<div id="ads">
		<img src="/images/ad.jpg">
	</div>

	<%@ include file="/view/common/comments.jsp" %>
</div>