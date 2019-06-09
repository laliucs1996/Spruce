/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.TVCrew;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class TVCrewFacade extends AbstractFacade<TVCrew> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TVCrewFacade() {
        super(TVCrew.class);
    }
    
    public List<Object[]> getTVCrewByPeopleId(int pId) {
        return em.createQuery("SELECT p, tc, t FROM Person p, TVCrew tc, Tv t WHERE p.peopleID = :pId AND tc.tVCrewPK.peopleID = p.peopleID AND tc.tVCrewPK.tvID = t.televisionID")
                .setParameter("pId", pId)
                .getResultList();
    }
    
}
