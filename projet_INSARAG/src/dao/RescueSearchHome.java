package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class RescueSearch.
 * @see dao.RescueSearch
 * @author Hibernate Tools
 */
@Stateless
public class RescueSearchHome {

	private static final Log log = LogFactory.getLog(RescueSearchHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(RescueSearch transientInstance) {
		log.debug("persisting RescueSearch instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(RescueSearch persistentInstance) {
		log.debug("removing RescueSearch instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public RescueSearch merge(RescueSearch detachedInstance) {
		log.debug("merging RescueSearch instance");
		try {
			RescueSearch result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public RescueSearch findById(Long id) {
		log.debug("getting RescueSearch instance with id: " + id);
		try {
			RescueSearch instance = entityManager.find(RescueSearch.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
