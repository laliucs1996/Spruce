/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.TVReview;
import Entity.TVReviewPK;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class TVReviewFacade extends AbstractFacade<TVReview> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TVReviewFacade() {
        super(TVReview.class);
    }
    
    public TVReview getTVReview(TVReviewPK tvrPK) {
        return em.find(TVReview.class, tvrPK);
    }
    
    public void addTVReview(TVReview tvr) {
        em.persist(tvr);
    }
    
    public void editTVReview(TVReview tvr) {
        em.merge(tvr);
    }
    
}
