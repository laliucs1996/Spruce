/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.TVSeason;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class TVSeasonFacade extends AbstractFacade<TVSeason> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TVSeasonFacade() {
        super(TVSeason.class);
    }
    
    public List<TVSeason> getTVSeasons(int tvID) {
        return em.createQuery("SELECT t FROM TVSeason t WHERE t.tvID = :tvID")
                .setParameter("tvID", tvID)
                .getResultList();
    }
    
}
