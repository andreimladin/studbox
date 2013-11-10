package ro.studbox.data.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.GenericDao;

/**
 * @author andreim
 **/

public class GenericDaoImpl<K extends Serializable, T extends Serializable> implements GenericDao<K, T> {
	
	private final Class<T> clazz;
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public GenericDaoImpl(Class<T> clazz) {	
		this.clazz = clazz;
	}

	@Transactional
	public T create(T t) {
		sessionFactory.getCurrentSession().persist(t);
		
		return t;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public T find(K key) {
		return (T) sessionFactory.getCurrentSession().get(clazz, key);
	}	
	
	@SuppressWarnings("unchecked")
	@Transactional
	public T update(T t) {
		return (T) sessionFactory.getCurrentSession().merge(t);
	}

	@Transactional
	public void delete(T t) {
		sessionFactory.getCurrentSession().delete(t);		
	}	

	@Transactional
	public void deleteByKey(K key) {
		T t = this.find(key);
		this.delete(t);		
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<T> getAll() {
		return (List<T>) sessionFactory.getCurrentSession().createQuery("from " + clazz.getName()).list();		
	}

	protected SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
}


