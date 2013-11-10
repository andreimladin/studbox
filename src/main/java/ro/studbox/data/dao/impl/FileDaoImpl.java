package ro.studbox.data.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.FileDao;
import ro.studbox.data.dao.ObjectDao;
import ro.studbox.entities.File;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;

@Repository
public class FileDaoImpl extends GenericDaoImpl<Long,File> implements FileDao {
	
	@Autowired
	private ObjectDao objectDao;

	public FileDaoImpl() {
		super(File.class);
	}
	
	@Override
	@Transactional
	public File create(File file) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.FILE_TYPE_ID);
		objectDao.create(superTypeObj);
		
		// Create the file
		file.setObjectId(superTypeObj.getObjectId());
		return super.create(file);
	}
	
	@Override
	@Transactional
    public File find(Long key){
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(File.class)
        		.add(Restrictions.idEq(key))
        		.setFetchMode("folder", FetchMode.JOIN)
        		.setFetchMode("comments", FetchMode.JOIN);
        
        return (File)criteria.uniqueResult();
    }

	@Override
	@Transactional
	public void delete(File file) {
		// Delete the file
		super.delete(file);
		
		// Delete the object
		objectDao.deleteByKey(file.getObjectId());
	}

	@Override
	@Transactional
	public void deleteByKey(Long key) {
		// Delete the file
		super.deleteByKey(key);
		
		// Delete the object
		objectDao.deleteByKey(key);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<File> getAllByFolderId(long folderId) {
		Session session = sessionFactory.getCurrentSession();
		
		return (List<File>) session.createQuery("from File where FolderId = " + folderId).list();
	}

	@Transactional
	public boolean existsFile(long folderId, String name) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from File where FolderId=:folderId and Name=:name");
		query.setParameter("folderId", folderId);
		query.setParameter("name", name);
		
		return query.list().size() == 1;
	}
	
	public void increaseViewNo(long fileId) {
		Query updateQuery = sessionFactory.getCurrentSession().createQuery("Update File Set ViewNo = ViewNo + 1 where ObjectId=:fileId");
		updateQuery.setParameter("fileId", fileId);
		updateQuery.executeUpdate();
	}

}
