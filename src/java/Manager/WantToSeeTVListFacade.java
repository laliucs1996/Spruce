/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.WantToSeeTVList;
import Entity.WantToSeeTVListPK;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class WantToSeeTVListFacade extends AbstractFacade<WantToSeeTVList> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WantToSeeTVListFacade() {
        super(WantToSeeTVList.class);
    }
    
    public WantToSeeTVList getWantToSeeTV(WantToSeeTVListPK pk) {
        return em.find(WantToSeeTVList.class, pk);
    }
    
    public void addWantToSeeTV(WantToSeeTVList tv) {
        em.persist(tv);
    }
    
    public void removeWantToSeeTV(WantToSeeTVList tv) {
        em.remove(tv);
    }
    
    public List<WantToSeeTVList> getList(int id){
        if(em.createQuery("SELECT c FROM WantToSeeTVList c WHERE c.wantToSeeTVListPK.userID =  " + id ).getResultList() == null)
            return new ArrayList<WantToSeeTVList>();
        else
            return em.createQuery("SELECT c FROM WantToSeeTVList c WHERE c.wantToSeeTVListPK.userID =  " + id ).getResultList();
    }
    
}
