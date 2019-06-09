/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.TVCast;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class TVCastFacade extends AbstractFacade<TVCast> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TVCastFacade() {
        super(TVCast.class);
    }
    
    public List<TVCast> getTVCastByTVId(int tvId) {
        return em.createQuery("SELECT t FROM TVCast t WHERE t.tVCastPK.tvID = :tvId")
                .setParameter("tvId", tvId)
                .setMaxResults(5)
                .getResultList();
    }
    
    public List<Object[]> getTVCastByPeopleId(int pId) {
        return em.createQuery("SELECT p, tc, t FROM Person p, TVCast tc, Tv t WHERE p.peopleID = :pId AND tc.tVCastPK.peopleID = p.peopleID AND tc.tVCastPK.tvID = t.televisionID")
                .setParameter("pId", pId)
                .getResultList();
    }
    
}
