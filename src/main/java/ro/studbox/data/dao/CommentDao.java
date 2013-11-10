package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.Comment;

public interface CommentDao extends GenericDao<Long, Comment> {
	
	List<Comment> getAllBySubjectId(long subjectId);

}
