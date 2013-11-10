package ro.studbox.service;

import java.util.List;

import ro.studbox.entities.Comment;

public interface CommentService {
	
	Comment createComment(long subjectId, long userId, String text);
	void deleteComment(long objectId);
	List<Comment> getCommentsBySubjectId(long subjectId);
	
}
