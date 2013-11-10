package ro.studbox.mvc.controllers;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ro.studbox.entities.Comment;
import ro.studbox.entities.User;
import ro.studbox.mvc.forms.CommentForm;
import ro.studbox.service.CommentService;

import com.google.gson.Gson;

@Controller
@RequestMapping(value="/main/comments")
public class CommentsController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private Gson gson;
	
	@Autowired
	private MessageSource messageSource;

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/add", method = RequestMethod.POST)
//public @ResponseBody String addComment(@RequestParam(required=true, value="subjectId") long subjectId, @RequestParam(required=true, value="text") String text) {
	public @ResponseBody String addComment(@Valid CommentForm commentForm, BindingResult result) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		boolean errorOccurred = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Comment comment = null;
		
		if(principal instanceof User) {
            if(result.hasErrors()) {
                errorOccurred = true;
            } else {
            	comment = commentService.createComment(commentForm.getSubjectId(), ((User)principal).getUserId(), commentForm.getText());
                comment.setUser((User)principal);
            }
		} else {
            errorOccurred = true;
            result.rejectValue("text", "error.authNeed");
        }
		
		if(!errorOccurred) {
			resultMap.put("status", "success");
			resultMap.put("comment", comment);
		} else {
			resultMap.put("status", "error");
			resultMap.put("errorMessage", messageSource.getMessage(result.getFieldError().getCode(), null, Locale.ENGLISH));
		}
	
		return gson.toJson(resultMap);
	}
	
	@PreAuthorize("hasRole('ADMIN')")	
	@RequestMapping(value="/delete", method = RequestMethod.GET)	
	public void deleteComment(@RequestParam(required=true, value="objectId") long objectId){
		commentService.deleteComment(objectId);
	}
	
}
