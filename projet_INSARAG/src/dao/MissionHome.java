package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Mission.
 * @see dao.Mission
 * @author Hibernate Tools
 */
@Stateless
public class MissionHome {

	private static final Log log = LogFactory.getLog(MissionHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Mission transientInstance) {
		log.debug("persisting Mission instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Mission persistentInstance) {
		log.debug("removing Mission instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Mission merge(Mission detachedInstance) {
		log.debug("merging Mission instance");
		try {
			Mission result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Mission findById(Long id) {
		log.debug("getting Mission instance with id: " + id);
		try {
			Mission instance = entityManager.find(Mission.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
