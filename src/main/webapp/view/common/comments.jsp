<script type="text/javascript">
	
	$(document).ready(function() {	
		$("#addcom").hide();
		$("#confMessage").hide();	
		$("#errorCommMessage").hide();
	});	
	
	function cancelCom(){
		$("#addcom").hide();									
	}

	function showAddComment() {
		<sec:authorize access="isAuthenticated()">
			$("#addcom").show();
			$("#confMessage").hide();
		</sec:authorize>
		<sec:authorize access="isAnonymous()">			
			$("#errorCommMessage").html("V&#x103; rug&#x103;m s&#x103; v&#x103; autentifica&#x21B;i");
			$("#errorCommMessage").show();
		</sec:authorize>				
	}
	
	<sec:authorize access="isAuthenticated()">

	function addComment(){
		var text = $("#text").val();			
		
		$.post(
			'${pageContext.request.contextPath}/main/comments/add',
			{
				'subjectId' : '${objectId}',
				'text' : text
			}, 
			function(data) {
				var resultMap = $.parseJSON(data);								
				if (resultMap.status == "success") {				
					$("#confMessage").show();
					$("#addcom").hide();
					$("#text").val("");
					
					var comment = data.comment;
					$("#comments").append(
						'<div id="readcomments">'+
							'<div id="comname">'+
								'<a>' + resultMap.comment.user.username + '</a>' + 
							'</div>' +
							'<div id="comdata">' +
								resultMap.comment.creationDateString +
							'</div><br/>' +			
							'<div id="commsg">' +
								resultMap.comment.text +
							'</div>'+
						'</div>'
					);					
				} else {	    			
	    			$('#errorCommMessage').html(resultMap.errorMessage);
	    			$('#errorCommMessage').show();
				}
			}
		);		
	}
	</sec:authorize>
</script>

<!-- Add comment -->
<div id="postcomment">		
	<a onclick="showAddComment();">
 		Adaug&#x103; un comentariu
	</a>	 
</div>

<div id="errorCommMessage" class="alert alert-error" style="margin:10px;">	 
</div>

<div id="confMessage" class='alert alert-success' style="margin:10px;">Comentariul a fost ad&#x103;ugat cu succes</div>

<div id="addcom">
	<textarea id="text" style="width:286px; height:50px;"></textarea>
	<input type="submit" onclick="addComment();" class="btn btn-primary" value="Adaug&#x103;"/>
	<a onclick="cancelCom()">Anuleaz&#x103;</a>	
</div>

<!-- Comments -->
<div id="comments">
	<c:forEach var="comment" items="${comments}">
	<div id="readcomments">
		<div id="comname">
			<a>${comment.user.username}</a>
		</div>
		<div id="comdata">
			${comment.creationDateString}
		</div>	
		<br/>		
		<div id="commsg">
			${comment.text}
		</div>
	</div>		
	</c:forEach>
</div>