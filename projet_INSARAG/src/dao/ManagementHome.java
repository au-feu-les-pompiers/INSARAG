package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Management.
 * @see dao.Management
 * @author Hibernate Tools
 */
@Stateless
public class ManagementHome {

	private static final Log log = LogFactory.getLog(ManagementHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Management transientInstance) {
		log.debug("persisting Management instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Management persistentInstance) {
		log.debug("removing Management instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Management merge(Management detachedInstance) {
		log.debug("merging Management instance");
		try {
			Management result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Management findById(Long id) {
		log.debug("getting Management instance with id: " + id);
		try {
			Management instance = entityManager.find(Management.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
