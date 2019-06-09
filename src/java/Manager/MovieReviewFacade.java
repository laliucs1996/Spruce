/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.MovieReview;
import Entity.MovieReviewPK;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class MovieReviewFacade extends AbstractFacade<MovieReview> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MovieReviewFacade() {
        super(MovieReview.class);
    }
    
    public MovieReview getReview(MovieReviewPK mrpk) {
        return em.find(MovieReview.class, mrpk);
    }
    
    public void editReview(MovieReview r) {
        em.merge(r);
    }
    
    public void addReview(MovieReview r) {
        em.persist(r);
    }
    
}
