/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.NotInterestedTVList;
import Entity.NotInterestedTVListPK;
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
public class NotInterestedTVListFacade extends AbstractFacade<NotInterestedTVList> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NotInterestedTVListFacade() {
        super(NotInterestedTVList.class);
    }
    
    public NotInterestedTVList getNotInterestedTV(NotInterestedTVListPK pk) {
        return em.find(NotInterestedTVList.class, pk);
    }
    
    public void addNotInterestedTV(NotInterestedTVList tv) {
        em.persist(tv);
    }
    
    public void removeNotInterestedTV(NotInterestedTVList tv) {
        em.remove(tv);
    }
    
    public List<NotInterestedTVList> getList(int id){
        if(em.createQuery("SELECT n FROM NotInterestedTVList n WHERE n.notInterestedTVListPK.userID =  " + id ).getResultList() == null)
            return new ArrayList<NotInterestedTVList>();
        else 
            return em.createQuery("SELECT n FROM NotInterestedTVList n WHERE n.notInterestedTVListPK.userID =  " + id ).getResultList();
    }
    
}
