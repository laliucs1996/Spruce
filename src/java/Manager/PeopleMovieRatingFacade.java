/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.PeopleMovieRating;
import Entity.PeopleMovieRatingPK;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class PeopleMovieRatingFacade extends AbstractFacade<PeopleMovieRating> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PeopleMovieRatingFacade() {
        super(PeopleMovieRating.class);
    }
    
    public void addMovieRating(PeopleMovieRating pmr) {
        em.persist(pmr);
    }
    
    public PeopleMovieRating getMovieRating(PeopleMovieRatingPK pmrPK) {
        return em.find(PeopleMovieRating.class, pmrPK);
    }
    
    public void setMovieRating(PeopleMovieRating pmr) {
        em.merge(pmr);
    }
    
    public double getAverageRating(int movieId) {
        if(em.createQuery("SELECT AVG(r.rating) FROM PeopleMovieRating r WHERE r.peopleMovieRatingPK.movieID = :movieId")
                .setParameter("movieId", movieId)
                .getSingleResult() != null)
            return (double)em.createQuery("SELECT AVG(r.rating) FROM PeopleMovieRating r WHERE r.peopleMovieRatingPK.movieID = :movieId")
                .setParameter("movieId", movieId)
                .getSingleResult();
        else
            return 0;
    }
    
}
