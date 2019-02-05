package dao;
// Generated 11-Dec-2018 14:28:36 by Hibernate Tools 5.2.10.Final

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class Connection.
 * @see dao.Connection
 * @author Hibernate Tools
 */
@Stateless
public class ConnectionHome {

	private static final Log log = LogFactory.getLog(ConnectionHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(Connection transientInstance) {
		log.debug("persisting Connection instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(Connection persistentInstance) {
		log.debug("removing Connection instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public Connection merge(Connection detachedInstance) {
		log.debug("merging Connection instance");
		try {
			Connection result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Connection findById(Long id) {
		log.debug("getting Connection instance with id: " + id);
		try {
			Connection instance = entityManager.find(Connection.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
