package com.xm.autho.dao;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class EntityManagerMini {

	@Autowired
//	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Object entity) {
		entityManager.persist(entity);
	}
	
	public void refresh(Object entity){
		entityManager.refresh(entity);
	}

	public <T> T find(Class<T> entityClass, Object primaryKey) {
		return entityManager.find(entityClass, primaryKey);
	}

	public void detach(Object entity) {
		entityManager.detach(entity);
	}

	public void remove(Object entity) {
		entityManager.remove(entity);
	}

	public <T> T remove(Class<T> entityClass, Object primaryKey) {
		T entity = entityManager.find(entityClass, primaryKey);
		if (entity != null)
			entityManager.remove(entity);
		return entity;
	}

	public void flush() {
		entityManager.flush();
	}

	public void clear() {
		entityManager.clear();
	}
}
