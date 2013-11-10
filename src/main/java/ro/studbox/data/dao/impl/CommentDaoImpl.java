package ro.studbox.data.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.CommentDao;
import ro.studbox.data.dao.ObjectDao;
import ro.studbox.entities.Comment;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;

@Repository
public class CommentDaoImpl extends GenericDaoImpl<Long, Comment> implements CommentDao {

	@Autowired
	private ObjectDao objectDao;
	
	public CommentDaoImpl() {
		super(Comment.class);
	}

	@Override
	@Transactional
	public Comment create(Comment comment) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.COMMENT_TYPE_ID);
		superTypeObj = objectDao.create(superTypeObj);
						
		// Create the commentStack
		comment.setObjectId(superTypeObj.getObjectId());		
		System.out.println("CommentId -  " + comment.getObjectId());
		return super.create(comment);		
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Comment> getAllBySubjectId(long subjectId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where SubjectId = :subjectId");
		query.setParameter("subjectId", subjectId);
		
		return (List<Comment>) query.list();
	}
	
	

}
