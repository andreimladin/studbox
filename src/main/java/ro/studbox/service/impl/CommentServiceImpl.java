package ro.studbox.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.studbox.data.dao.CommentDao;
import ro.studbox.entities.Comment;
import ro.studbox.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDao commentDao;

	public Comment createComment(long subjectId, long userId,
			String text) {
		Comment comment = new Comment(subjectId, userId, text, new Date());

		// AIM - persists the comment		
		comment = commentDao.create(comment);
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy hh:mm");
		String creationDateString = format.format(comment.getCreationDate());	
		comment.setCreationDateString(creationDateString);

		return comment;
	}

	public void deleteComment(long objectId) {
		commentDao.deleteByKey(objectId);
	}

	public List<Comment> getCommentsBySubjectId(long subjectId) {
		return commentDao.getAllBySubjectId(subjectId);
	}
	
	

}
