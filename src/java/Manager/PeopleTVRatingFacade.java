/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.PeopleTVRating;
import Entity.PeopleTVRatingPK;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class PeopleTVRatingFacade extends AbstractFacade<PeopleTVRating> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PeopleTVRatingFacade() {
        super(PeopleTVRating.class);
    }
    
    public PeopleTVRating getTVRating(PeopleTVRatingPK ptvrPK) {
        return em.find(PeopleTVRating.class, ptvrPK);
    }
    
    public void addTVRating(PeopleTVRating ptvr) {
        em.persist(ptvr);
    }
    
    public void setTVRating(PeopleTVRating ptvr) {
        em.merge(ptvr);
    }
    
    public double getAverageRating(int tvId) {
        if(em.createQuery("SELECT AVG(r.rating) FROM PeopleTVRating r WHERE r.peopleTVRatingPK.televisionID = :tvId")
                .setParameter("tvId", tvId)
                .getSingleResult() != null) {
            return (double)em.createQuery("SELECT AVG(r.rating) FROM PeopleTVRating r WHERE r.peopleTVRatingPK.televisionID = :tvId")
                .setParameter("tvId", tvId)
                .getSingleResult();
        }
        else
            return 0;
            
    }
    
}
