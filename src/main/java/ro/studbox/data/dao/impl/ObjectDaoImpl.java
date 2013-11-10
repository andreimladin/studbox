package ro.studbox.data.dao.impl;

import org.springframework.stereotype.Repository;

import ro.studbox.data.dao.ObjectDao;
import ro.studbox.entities.Object;

@Repository
public class ObjectDaoImpl extends GenericDaoImpl<Long, Object> implements ObjectDao{
	
	public ObjectDaoImpl() {
		super(Object.class);
	}

}
