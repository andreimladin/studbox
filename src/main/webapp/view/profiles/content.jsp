<script type="text/javascript">
	function createNewCourse() {
		var courseName = $("#courseName").val();
		var shortCourseName = $("#shortCourseName").val();
		
		$.post(
			'/main/courses/add',
			{
				'profileId' : '${objectId}',
				'name' : courseName,
				'shortName' : shortCourseName
			}, 
			function(data) {		
				var resultMap = $.parseJSON(data);						
				
				if (resultMap.status == "success") {
					$('#myModal').modal('hide');
					alert("Cursul a fost adaugat cu success");
				} else {
					alert(resultMap.errorMessage);
				}
			}
		);
	}
</script>
<div class="leftside">
	<div id="leftcontent">
		<div id="top-bar">
			<div id="backbut">
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" class="firstnavitem" >
					<a href="/main/faculties/${profile.faculty.objectId}/home"><span><i class="icon-large icon-arrow-left icon-white " style="margin-right:5px;"></i>${profile.faculty.shortName}</span></a>
				</div>				
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" >
					<span>${profile.shortName}</span>
				</div>
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem">
					<!-- Button trigger modal -->
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  						Adauga Curs
					</button>
				</div>
			</div>
		</div>	
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
      				</div>
      				<div class="modal-body">
      					Numele cursului<br/>
      					<input id="courseName" type="text" style="width:150px;float:left;" placeholder="Numele cursului"><br/>
      					Prescurtare curs<br/>
      					<input id="shortCourseName" type="text" style="width:150px;float:left;" placeholder="Prescurtarea cursului"><br/>      					
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Iesire</button>
        				<button type="button" class="btn btn-primary" onclick="createNewCourse();">Salvare</button>
      				</div>
    			</div>
  			</div>
		</div>
		
		<div class="accordion" >
			<c:forEach var="course" items="${profile.courses}">		
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" href="/main/courses/${course.objectId}/home">
							${course.name}
						</a>
					</div>
				</div> 							
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>