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
						<a class="accordion-toggle" href="/main/faculties/${faculty.objectId}/home">
							${faculty.name}
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>