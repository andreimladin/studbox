<ul>
<c:forEach var="course" items="${courseList}">
	<li>
		<a href="${pageContext.request.contextPath}/main/folders/${course.defaultFolder.objectId}/home">
			<span>${course.name}</span>
		</a>
	</li>
</c:forEach>
</ul>