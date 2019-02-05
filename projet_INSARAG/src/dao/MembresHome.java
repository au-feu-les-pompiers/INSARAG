package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Membres.
 * @see dao.Membres
 * @author Hibernate Tools
 */
@Stateless
public class MembresHome {

	private static final Log log = LogFactory.getLog(MembresHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Membres transientInstance) {
		log.debug("persisting Membres instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Membres persistentInstance) {
		log.debug("removing Membres instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Membres merge(Membres detachedInstance) {
		log.debug("merging Membres instance");
		try {
			Membres result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Membres findById(Long id) {
		log.debug("getting Membres instance with id: " + id);
		try {
			Membres instance = entityManager.find(Membres.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
