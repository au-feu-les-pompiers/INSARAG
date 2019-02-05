package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Medical.
 * @see dao.Medical
 * @author Hibernate Tools
 */
@Stateless
public class MedicalHome {

	private static final Log log = LogFactory.getLog(MedicalHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Medical transientInstance) {
		log.debug("persisting Medical instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Medical persistentInstance) {
		log.debug("removing Medical instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Medical merge(Medical detachedInstance) {
		log.debug("merging Medical instance");
		try {
			Medical result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Medical findById(Long id) {
		log.debug("getting Medical instance with id: " + id);
		try {
			Medical instance = entityManager.find(Medical.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
