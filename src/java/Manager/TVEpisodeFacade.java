/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.TVEpisode;
import Entity.TVEpisodePK;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class TVEpisodeFacade extends AbstractFacade<TVEpisode> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TVEpisodeFacade() {
        super(TVEpisode.class);
    }
    
    public List<TVEpisode> getTVEpisodes(int tvId, int seasonNo) {
        return em.createQuery("SELECT t FROM TVEpisode t WHERE t.tVEpisodePK.televisionID = :tvId AND t.tVEpisodePK.seasonID = :seasonNo")
                .setParameter("tvId", tvId)
                .setParameter("seasonNo", seasonNo)
                .getResultList();
    }
    
    public TVEpisode getTVEpisode(TVEpisodePK tvePK) {
        return em.find(TVEpisode.class, tvePK);
    }
    
}
