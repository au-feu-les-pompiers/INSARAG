package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Parametre.
 * @see dao.Parametre
 * @author Hibernate Tools
 */
@Stateless
public class ParametreHome {

	private static final Log log = LogFactory.getLog(ParametreHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Parametre transientInstance) {
		log.debug("persisting Parametre instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Parametre persistentInstance) {
		log.debug("removing Parametre instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Parametre merge(Parametre detachedInstance) {
		log.debug("merging Parametre instance");
		try {
			Parametre result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Parametre findById(Long id) {
		log.debug("getting Parametre instance with id: " + id);
		try {
			Parametre instance = entityManager.find(Parametre.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
