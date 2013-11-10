package ro.studbox.data.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDao<K extends Serializable, T extends Serializable> {
	
	T create(T t);
	T find(K key);
	T update(T t);
    void delete(T t);
    void deleteByKey(K key);
    List<T> getAll();

}
