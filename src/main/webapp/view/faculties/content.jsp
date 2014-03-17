<script type="text/javascript">
	function createNewProfile() {
		var profileName = $("#profileName").val();
		var shortProfileName = $("#shortProfileName").val();
		var profileSection = $("#profileSection").val();
		var profileType = $("#profileType").val();
		
		$.post(
			'/main/profiles/add',
			{
				'facultyId' : '${objectId}',
				'name' : profileName,
				'shortName' : shortProfileName,
				'section' : profileSection,
				'type' : profileType
			}, 
			function(data) {		
				var resultMap = $.parseJSON(data);						
				
				if (resultMap.status == "success") {
					$('#myModal').modal('hide');
					alert("Profilul a fost adaugat cu success");
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
				<div id="navbutitem" class="firstnavitem">
					<a href="${pageContext.request.contextPath}/main/universities/${faculty.university.objectId}/home"><span><i class="icon-large icon-arrow-left icon-white " style="margin-right:5px;"></i>${faculty.university.shortName}</span></a>					
				</div>
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" >
					<span>${faculty.shortName}</span>
				</div>
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem">
					<!-- Button trigger modal -->
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  						Adauga Profil
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
        				<h4 class="modal-title" id="myModalLabel">Adauga Profil</h4>
      				</div>
      				<div class="modal-body">
      					Numele profilului:<br/>
      					<input id="profileName" type="text" style="width:210px;float:left;" placeholder="Numele profilului"><br/>
      					<br/>
      					Prescurtare nume profil:<br/>
      					<input id="shortProfileName" type="text" style="width:210px;float:left;" placeholder="Prescurtare nume profil"><br/>      					
      					<br/>
      					Sectie profil:<br/>
      					<select id="profileSection">
      						<option value="Engleza">Engleza</option>
      						<option value="Franceza">Franceza</option>
      						<option value="Germana">Germana</option>
      						<option value="Maghiara">Maghiara</option>
      						<option value="Romana">Romana</option>   						
      					</select> 
      					<br/>
      					Tipul profilului:<br/>
      					<select id="profileType">
      						<option value="Licenta">Licenta</option>
      						<option value="Master">Master</option>
      					</select> 
      					<br/>     											
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Iesire</button>
        				<button type="button" class="btn btn-primary" onclick="createNewProfile();">Salvare</button>
      				</div>
    			</div>
  			</div>
		</div>
		
		<div class="accordion" >
			<c:forEach var="profile" items="${faculty.profiles}" varStatus = "status">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" href="${pageContext.request.contextPath}/main/profiles/${profile.objectId}/home">
							${profile.name} - ${profile.section}
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>