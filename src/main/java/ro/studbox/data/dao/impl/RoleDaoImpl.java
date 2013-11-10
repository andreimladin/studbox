package ro.studbox.data.dao.impl;

import org.springframework.stereotype.Repository;

import ro.studbox.data.dao.RoleDao;
import ro.studbox.entities.Role;

@Repository
public class RoleDaoImpl extends GenericDaoImpl<String, Role> implements RoleDao {

	public RoleDaoImpl() {
		super(Role.class);		
	}
	
}
