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

import ro.studbox.data.dao.FolderDao;
import ro.studbox.data.dao.ObjectDao;
import ro.studbox.entities.Folder;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;

@Repository
public class FolderDaoImpl extends GenericDaoImpl<Long, Folder> implements FolderDao {
	
	@Autowired
	private ObjectDao objectDao;

	public FolderDaoImpl() {
		super(Folder.class);
	}
	
	@Override
	@Transactional
	public Folder create(Folder folder) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.FOLDER_TYPE_ID);
		objectDao.create(superTypeObj);
		
		// Create the folder
		folder.setObjectId(superTypeObj.getObjectId());
		return super.create(folder);
	}
	
	@Override
	@Transactional
	public Folder find(Long key){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Folder.class)
				.add(Restrictions.idEq(key))
				.setFetchMode("parentFolder", FetchMode.JOIN)
				.setFetchMode("folders", FetchMode.JOIN)
				.setFetchMode("files", FetchMode.JOIN)
				.setFetchMode("comments", FetchMode.JOIN);
		return (Folder)criteria.uniqueResult();
	}
	
	@Transactional
	public boolean existsFolder(long folderId){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select 1 from Folder where ObjectId=:folderId");
        query.setParameter("folderId", Long.valueOf(folderId));
        
        return query.uniqueResult() != null;
    }
	
	@Transactional
	public boolean existsFolder(long parentFolderId, String folderName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select 1 from Folder where ParentFolderId=:parentFolderId and Name=:name");
		query.setParameter("parentFolderId", Long.valueOf(parentFolderId));
		query.setParameter("name", folderName);
		return query.uniqueResult() != null;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
    public List<String> getDistinctFolderNames() {
        Session session = sessionFactory.getCurrentSession();
        return (List<String>) session.createSQLQuery("select Distinct Name from Folder where IsCourse = false").list();
    }

	@Override
	@Transactional
	public void delete(Folder folder) {
		// Delete the folder
		super.delete(folder);
		
		// Delete the object
		objectDao.deleteByKey(folder.getObjectId());
	}

	@Override
	@Transactional
	public void deleteByKey(Long key) {
		// Delete the folder
		super.deleteByKey(key);
		
		// Delete the object
		objectDao.deleteByKey(key);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Folder> getAllByFolderId(long folderId) {
		Session session = sessionFactory.getCurrentSession();
		
		return (List<Folder>) session.createQuery("from Folder where ParentFolderId = " + folderId).list();
	}	
	
	public void increaseViewNo(long folderId) {
		Query updateQuery = sessionFactory.getCurrentSession().createQuery("Update Folder Set ViewNo = ViewNo + 1 where ObjectId=:folderId");
		updateQuery.setParameter("folderId", folderId);
		updateQuery.executeUpdate();
	}

}
