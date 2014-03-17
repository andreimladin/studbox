<script type="text/javascript">
	$(document).ready(function(){
		hideItems();			
	});
		
	function hideItems(){
		hideUploadForm();
		hideNewFolderForm();
		hideOtherItems();
	}
		
	function hideNewFolderForm(){
		$("#newFolderForm").hide();
	}
		
	function hideUploadForm(){
		$("#uploadForm").hide();		
	}
		
	function hideOtherItems(){
		$("#successMessage").hide();
		$("#errorMessage").hide();
	}
	
	function showAuthMessage() {
		$("#errorMessage").html("V&#x103; rug&#x103;m s&#x103; v&#x103; loga&#x21B;i");
		$("#errorMessage").show();
	}
	
	function showErrorMessage() {
		$("#errorMessage").show();
	}
	
	function openFile() {
		$("#fileData").click();
	}
		
	function showFileName(){						
		var filename =$('#fileData').val().split('\\').pop();
		var filesize =$('#fileData')[0].files[0].size;
		if (filename.length > 30) {
			$("#errorMessage").html("Numele fi&#x219;ierului trebuie s&#x103; aiv&#x103; maxim 30 de caractere!");
			$("#errorMessage").show();
			resetUploadForm();
		} else if (filesize > 10485760) { 
			$("#errorMessage").html("Fi&#x219;ierul nu poate avea mai mult de 10 mb!");
			$("#errorMessage").show();
			resetUploadForm();
		} else {
			$("#upbut").hide();
			$("#updescription").hide();
			$("#filename").html("Nume Fi&#x219;ier :<span style='font-style:italic;font-weight:normal;'>" + filename + "</span>");
			$("#filename").show();
			$("#uploadFileButtons").show();
		}			
	}
		
<sec:authorize access="isAuthenticated()">
	function showUploadForm(){
		hideItems();
		
		$("#uploadForm").show();
		$("#updescription").show();
		$("#upbut").show();
		$("#fileData").hide();
		$("#filename").html("");
		$("#filename").hide();
		$("#uploadFileButtons").hide();
		$("#progressSection").hide();
		$("#successUpload").hide();				
	}
		
	function showNewFolderForm() {
		hideItems();
				
		$("#newFolderForm").show();			
	}

	function cancelUploadForm(){
		hideUploadForm();
		resetUploadForm();
	}
		
	function cancelNewFolderForm() {
		hideNewFolderForm();
		resetNewFolderForm();
	}		
		
	function resetUploadForm(){
		$("#fileData").replaceWith($("#fileData").clone(true));
	}
		
	function resetNewFolderForm() {	
		$("#customFolderName").val("");
	}
	
	function changeFolderNameOption(){
		var folderNameOption = $('input[name=folderNameOption]:checked').val();
		if (folderNameOption == "predefinedNameOption"){
			$("#customFolderName").attr('disabled','disabled');
			$("#predefinedFolderName").removeAttr('disabled');			
		} else if (folderNameOption == "customNameOption") {
			$("#customFolderName").removeAttr('disabled');
			$("#predefinedFolderName").attr('disabled','disabled');
		}
	}

	function createNewFolder() {
		var folderNameOption = $('input[name=folderNameOption]:checked').val();
		var folderName = '';
		if (folderNameOption == "predefinedNameOption"){
			folderName = $("#predefinedFolderName").val();
		} else if (folderNameOption == "customNameOption") {
			folderName = $("#customFolderName").val();
		}
		
		$.post(
			'${pageContext.request.contextPath}/main/folders/add',
			{
				'parentFolderId' : '${objectId}',
				'name' : folderName
			}, 
			function(data) {		
				var resultMap = $.parseJSON(data);						
				
				if (resultMap.status == "success") {		
					hideItems();								
					$("#successMessage").html('Folderul a fost ad&#x103;ugat cu success');
	    			$("#successMessage").show();
	    			
	    			
					$('#folders').append(
						'<div id="filescontainer">' +
							'<div id="filetype">' +
								'<p><img src="/images/folder.png" id="foldericon"></p>' +
							'</div>' +
							'<div id="filename">' +
								'<p>' + 
									'<a href="${pageContext.request.contextPath}/main/courses/${course.objectId}/folders/' + resultMap.folder.objectId + '/home">' +
										resultMap.folder.name +
									'</a>' +
								'</p>' + 
							'</div>' +				
							'<div id="filedate">' +
								'<p>' + resultMap.folder.lastModifiedDateString + '</p>' +	
							'</div>'+	
							'<div id="fileauthor">' +
								'<p><a>' + resultMap.folder.owner.username + '</a></p>' + 
							'</div>' +	
							'<div id="filemeasure">' + 
								'<p></p>' + 			
							'</div>' +		
						'</div>'
					);				
				} else {
					$("#errorMessage").html(resultMap.errorMessage);
					$("#errorMessage").show();
				}
			}
		);
	}

	function uploadFile(){		
		var fileUploadForm = new FormData();
	  	fileUploadForm.append("fileData", fileData.files[0]);
	  	fileUploadForm.append("folderId", ${folder.objectId});
	  	$("#filename").hide();
		$("#uploadFileButtons").hide();
		$("#progressSection").show();
	 
	  	$.ajax({
	    	url: '${pageContext.request.contextPath}/main/files/upload',
	    	data: fileUploadForm,
	    	dataType: 'text',
	    	processData: false,
	    	contentType: false,
	    	type: 'POST',
	    	success: function(data){
	    		var resultMap = $.parseJSON(data);
	    			    		    		
	    		$('#progressSection').hide();
	    		
	    		if (resultMap.status == "success") {
	    			hideItems();
	    			$("#successMessage").html('Fi&#x219;ierul a fost ad&#x103;ugat cu success');
	    			$("#successMessage").show();
	    			    			
	    			// AIM - reincarca lista fisiere
	    			var file = resultMap.file;    			
	      			var filemeasure = 0;
	      			
	      			if (file.contentLength > 1048575) {
	      				filemeasure = $.number(file.contentLength / 1048576, 2) + " Mb";
	      			} else {
	      				filemeasure = $.number(file.contentLength / 1024, 2) + " kB";
	      			}
	      			
	      			$('#files').append(
		      			'<div id="filescontainer">' +
		      				'<div id="filetype">'+
		      					'<p><img src="${pageContext.request.contextPath}/images/file.png" id="fileicon"></p>'+
		      				'</div>' +
							'<div id="filename">' +
								'<p>' +
									'<a href="${pageContext.request.contextPath}/main/courses/${course.objectId}/folders/${folder.objectId}/files/' + file.objectId + '/view">' + 
										file.name +
									'</a>' + 
								'</p>' +
							'</div>'+							
							'<div id="filedate">' +
								'<p>'+ file.lastModifiedDateString + '</p>'+ 								
							'</div>'+							
							'<div id="fileauthor">' +
								'<p><a>' + file.owner.username + '</a></p>'+
							'</div>' +
							'<div id="filemeasure">' +															
								'<p>' + filemeasure + '</p>'+
							'</div>' + 							
						'</div>'
					);      			
	    		} else {
	    			$('#upbut').show();
	    			$('#errorMessage').html(resultMap.errorMessage);
	    			$('#errorMessage').show();
	    		}
	    	}
	  	});		
	}
</sec:authorize>	
</script>

<div class="leftside">
	<div id="leftcontent">
		<div id="top-bar">
			<div id="backbut">
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem" class="firstnavitem" >
					<c:choose>
						<c:when test="${folder.course}">
							<a href="${pageContext.request.contextPath}/main/profiles/${course.profile.objectId}/home"><span><i class="icon-large icon-arrow-left icon-white " style="margin-right:5px;"></i>${course.profile.shortName}</span></a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/main/courses/${course.objectId}/folders/${folder.parentFolder.objectId}/home"><span><i class="icon-large icon-arrow-left icon-white " style="margin-right:5px;"></i>Pagin&#x103; Curs</span></a>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="navseparator">&nbsp</div>
				<div id="navbutitem">
					<c:choose>
						<c:when test="${folder.course}">
							<span>${course.shortName}</span>
						</c:when>
						<c:otherwise>
							<span>${folder.name}</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>		
			<c:choose>
				<c:when test="${folder.course}">
					<sec:authorize access="isAuthenticated()">
						<div id="actionbut">
							<a class="btn btn-small" onclick="showNewFolderForm()"><i class="icon icon-plus"> </i> Creeaz&#x103; folder</a>
						</div>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<div id="actionbut">
							<a class="btn btn-small" onclick="showAuthMessage()"><i class="icon icon-plus"> </i> Creeaz&#x103; folder</a>
						</div>	
					</sec:authorize>
				</c:when>
				<c:otherwise>
					<sec:authorize access="isAuthenticated()">
						<div id="actionbut">
							<a class="btn btn-small" onclick="showNewFolderForm()"><i class="icon icon-plus"> </i> Creeaz&#x103; folder</a>
						</div>					
						<div id="actionbut">			
							<a class="btn btn-small" onclick="showUploadForm()"><i class="icon icon-upload"> </i> &#206;ncarc&#x103; fi&#x219;ier</a>				
						</div>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<div id="actionbut">
							<a class="btn btn-small" onclick="showAuthMessage()"><i class="icon icon-plus"> </i> Creeaz&#x103; folder</a>
						</div>
						<div id="actionbut">			
							<a class="btn btn-small" onclick="showAuthMessage()"><i class="icon icon-upload"> </i> &#206;ncarc&#x103; fi&#x219;ier</a>				
						</div>
					</sec:authorize>	
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id="errorMessage" class="alert alert-error , confmes " style="display:none">
			${errorMessage}			
		</div>
		
		<div id='successMessage' class='alert alert-success , confmes' style="text-align:center;  margin-bottom:10px; display:none">			
		</div>
		
		<div id="newFolderForm" class="box" style="display:none">
			<div class="titleform" style="width:300px; padding-top:10px;">	
				<label  style="font-size:19px; font-weight:bold; width:200px; margin:auto;margin-bottom:10px;">Creare Folder</label>
			</div>
			<div style="margin-bottom:0px; text-align:center;overflow:hidden; margin-top:20px;">
				<div style="text-align:center; overflow:hidden;width:200px; margin:0 auto; vertical-align:middle;">
					<label class="radio" style="float:left; padding-top:5px; ">
						<input id="optionsRadios1" type="radio"  name="folderNameOption" value="predefinedNameOption" onchange="changeFolderNameOption();" checked>
					</label>
					
					<select id="predefinedFolderName" style="width:163px;float:left;">	
						<c:forEach items="${existingFolderNames}" var="folderName" varStatus="status">
        					<option value="${folderName}" ${status.first ? 'selected' : ''}>${folderName}</option>
    					</c:forEach>												 
					</select>
				</div>
			</div>
			<div style="text-align:center; margin:10px 0px;">
			    <label class="control-label" style="font-size:16px; font-family: Arial,Helvetica,sans-serif; font-weight: bold; text-align:center; padding-top:0px;margin-bottom:0px;">
			       			sau
				</label>
			</div>
			    	
			<div  style="margin-bottom:0px; text-align:center;overflow:hidden;width:200px; margin: auto; margin-top:10px;vertical-align:middle;">
				<label class="radio" style="float:left;padding-top:5px;">
					<input id="optionsRadios2" type="radio"  name="folderNameOption" value="customNameOption" onchange="changeFolderNameOption();">			      			
				</label>
				<input id="customFolderName" type="text" style="width:150px;float:left;" placeholder="Numele Folderului" disabled>
			</div>
					
			<div id="newFolderButtons" style="width:200px; margin:10px auto;  float:none; padding-left:36px;">
				<input onclick='createNewFolder();' type='submit' class='btn btn-primary' value='Creaz&#x103;'>
				<a onclick='cancelNewFolderForm();'>Anuleaz&#x103;</a>	
			</div>			
		</div>
		
		<div id="uploadForm" class="box" style="display:none">
			<div class="titleform" style="width:300px; padding-top:10px;">	
				<label style="font-size:19px; font-weight:bold; width:200px; margin:auto;margin-bottom:10px;">&#206;nc&#x103;rcare fi&#x219;ier</label>
			</div>
			
			<div style="margin-bottom:10px; text-align:center;overflow:hidden; margin-top:20px;">		
				<div  id="updescription">
			  		*V&#259; rug&#259;m selecta&#x21B;i un fi&#x219;ier*
			  	</div>	  	
				<div id="filename" style="text-align:center;width:auto; float:none;margin-bottom:20px;">					
				</div>
				<div id='upbut'>
					<div style='position:relative;'>
						<div id='file2'>								
							<input onclick='openFile();' type='submit' class='btn btn-primary' value="Caut&#x103;"/>
							<a onclick='cancelUploadForm();'>Anuleaz&#x103;</a>
							<input id='fileData' type='file' name='fileData' onchange='showFileName();' accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,image/tiff,application/x-iwork-pages-sffpages,application/illustrator,image/vnd.adobe.photoshop,application/dxf,image/svg+xml,application/postscript,font/opentype,application/opentype,application/x-font-ttf,application/vnd.ms-xpsdocument,application/x-rar-compressed,application/zip,text/rtf,text/plain,text/html,image/jpeg,image/png,image/gif,image/bmp,application/octet-stream,application/zip,application/x-gzip,application/x-gtar,multipart/x-gzip,multipart/x-zip,application/x-rar-compressed"/>
						</div>
					</div>
				</div>
				<div id="progressSection" style="margin-top:0px">
					<p align="center">Procesare fisier...</p>
					<div id='progbar' class='progress  progress-striped active'>
						<div class='bar' style='width: 100%;'></div>
					</div>
				</div>	
				<div id='uploadFileButtons' style=";width:200px; margin:10px auto;  float:none; padding-left:36px;">					
					<input onclick='uploadFile();' type='submit' class='btn btn-primary' value='&#206;ncarc&#x103;'>
					<a onclick='cancelUploadForm();'>Anuleaz&#x103;</a>												
				</div>	
			</div>			
		</div>
		
		<div id="filestitles">
			<div id="filetype">
				<p></p>
			</div>
			<div id="filename">
				<p>Nume</p>
			</div>				
			<div id="filedate" style="font-size:15px">
				<p>Actualizare</p>	
			</div>	
			<div id="fileauthor" style="font-size:15px">
				<p>Autor</p>
			</div>
			<div id="filemeasure" style="font-size:15px">
				<p>M&#x103;rime</p>
			</div>
		</div>
				
		<div id="folders">				
			<c:forEach var="folder" items="${folder.folders}">
			<div id="filescontainer">
				<div id="filetype">
					<p><img src="${pageContext.request.contextPath}/images/folder.png" id="foldericon"></p>
				</div>
				<div id="filename">
					<p>								
						<a href="${pageContext.request.contextPath}/main/courses/${course.objectId}/folders/${folder.objectId}/home">
							${folder.name}
						</a>
					</p>
				</div>				
				<div id="filedate">
					<p>${folder.lastModifiedDateString}</p>	
				</div>	
				<div id="fileauthor">
					<p><a>${folder.owner.username}</a></p>
				</div>	
				<div id="filemeasure">
					<p></p>			
				</div>			
			</div>
			</c:forEach>
		</div>
			
		<div id="files">
			<c:forEach var="file" items="${folder.files}">
			<div id="filescontainer">
				<div id="filetype">
					<p><img src="${pageContext.request.contextPath}/images/file.png" id="fileicon"></p>
				</div>
				<div id="filename">
					<p>
						<sec:authorize access="isAuthenticated()">
							<a href="${pageContext.request.contextPath}/main/courses/${course.objectId}/folders/${folder.objectId}/files/${file.objectId}/view">
								${file.name}
							</a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a onclick="showAuthMessage()">
								${file.name}
							</a>								
						</sec:authorize>					
					</p>
				</div>				
				<div id="filedate">
					<p>${file.lastModifiedDateString}</p>	
				</div>	
				<div id="fileauthor">
					<p><a>${file.owner.username}</a></p>
				</div>
				<div id="filemeasure">
					<c:choose>
						<c:when test="${file.contentLength > 1048575}">
							<p>
								<fmt:formatNumber type="number" 
	            					maxFractionDigits="2" value="${file.contentLength / 1048576}"/> Mb
	            			</p>
						</c:when>
						<c:otherwise>
							<p>
								<fmt:formatNumber type="number" 
	            					maxFractionDigits="2" value="${file.contentLength / 1024}"/> kB
	            			</p>
						</c:otherwise>
					</c:choose>					
				</div>				
			</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="/view/common/right.jsp" %>