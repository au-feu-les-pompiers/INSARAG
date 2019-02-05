package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Equipe.
 * @see dao.Equipe
 * @author Hibernate Tools
 */
@Stateless
public class EquipeHome {

	private static final Log log = LogFactory.getLog(EquipeHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Equipe transientInstance) {
		log.debug("persisting Equipe instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Equipe persistentInstance) {
		log.debug("removing Equipe instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Equipe merge(Equipe detachedInstance) {
		log.debug("merging Equipe instance");
		try {
			Equipe result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Equipe findById(Long id) {
		log.debug("getting Equipe instance with id: " + id);
		try {
			Equipe instance = entityManager.find(Equipe.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
