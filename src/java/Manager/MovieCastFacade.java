/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.Movie;
import Entity.MovieCast;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class MovieCastFacade extends AbstractFacade<MovieCast> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MovieCastFacade() {
        super(MovieCast.class);
    }
    
    public List<MovieCast> getMovieCastByMovieId(int mId) {
        return em.createQuery(
                "SELECT m FROM MovieCast m WHERE m.movieCastPK.movieID = :mId")
                .setParameter("mId", mId)
                .setMaxResults(5)
                .getResultList();
    }
    
    public List<Object[]> getMovieCastByPeopleId(int pId) {
        return em.createQuery("SELECT p, mc, m FROM Person p, MovieCast mc, Movie m WHERE p.peopleID = :pId AND p.peopleID = mc.movieCastPK.peopleID AND mc.movieCastPK.movieID = m.movieID")
                .setParameter("pId", pId)
                .getResultList();
    }
    
}
