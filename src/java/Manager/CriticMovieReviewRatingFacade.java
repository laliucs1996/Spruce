/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.CriticMovieReviewRating;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class CriticMovieReviewRatingFacade extends AbstractFacade<CriticMovieReviewRating> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CriticMovieReviewRatingFacade() {
        super(CriticMovieReviewRating.class);
    }
    
    public List<CriticMovieReviewRating> getCriticReviewsByMovieId(int movieId) {
        return em.createQuery("SELECT r FROM CriticMovieReviewRating r WHERE r.criticMovieReviewRatingPK.movieID = :movieId")
                .setParameter("movieId", movieId)
                .getResultList();
    }
}
