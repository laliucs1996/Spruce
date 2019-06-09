/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.MovieCrew;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class MovieCrewFacade extends AbstractFacade<MovieCrew> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MovieCrewFacade() {
        super(MovieCrew.class);
    }
    
    public List<MovieCrew> getMovieCrewByMovieId(int mId) {
        return em.createQuery(
                "SELECT m FROM MovieCrew m WHERE m.movieCrewPK.movieID = :mId")
                .setParameter("mId", mId)
                .getResultList();
    }
    
    public List<MovieCrew> getMovieDirectors(int mId) {
        return em.createQuery("SELECT m FROM MovieCrew m WHERE m.movieCrewPK.movieID = :mId AND m.movieCrewPK.job = 'Director'")
                .setParameter("mId", mId)
                .getResultList();
    }
    
    public List<MovieCrew> getMovieWriters(int mId) {
        return em.createQuery("SELECT m FROM MovieCrew m WHERE m.movieCrewPK.movieID = :mId AND m.movieCrewPK.job = 'Writer'")
                .setParameter("mId", mId)
                .getResultList();
    }
    
    public List<Object[]> getMovieCrewByPeopleId(int pId) {
        return em.createQuery("SELECT p, mc, m FROM Person p, MovieCrew mc, Movie m WHERE mc.movieCrewPK.peopleID = :pId AND mc.movieCrewPK.peopleID = p.peopleID AND mc.movieCrewPK.movieID = m.movieID")
                .setParameter("pId", pId)
                .getResultList();
    }
    
}
