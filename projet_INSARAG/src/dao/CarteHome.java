package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Carte.
 * @see dao.Carte
 * @author Hibernate Tools
 */
@Stateless
public class CarteHome {

	private static final Log log = LogFactory.getLog(CarteHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Carte transientInstance) {
		log.debug("persisting Carte instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Carte persistentInstance) {
		log.debug("removing Carte instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Carte merge(Carte detachedInstance) {
		log.debug("merging Carte instance");
		try {
			Carte result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Carte findById(Long id) {
		log.debug("getting Carte instance with id: " + id);
		try {
			Carte instance = entityManager.find(Carte.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
