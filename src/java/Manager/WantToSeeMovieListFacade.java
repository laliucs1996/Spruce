/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.WantToSeeMovieList;
import Entity.WantToSeeMovieListPK;
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
public class WantToSeeMovieListFacade extends AbstractFacade<WantToSeeMovieList> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WantToSeeMovieListFacade() {
        super(WantToSeeMovieList.class);
    }
    
    public void addWantToSeeMovieList(WantToSeeMovieList wtsml) {
        em.persist(wtsml);
    }
    
    public WantToSeeMovieList getWantToSeeMovieList(WantToSeeMovieListPK wtsmlPK) {
        return em.find(WantToSeeMovieList.class, wtsmlPK);
    }
    
    public List<WantToSeeMovieList> getList(int id){
        if(em.createQuery("SELECT c FROM WantToSeeMovieList c WHERE c.wantToSeeMovieListPK.userID =  " + id ).getResultList() == null)
            return new ArrayList<WantToSeeMovieList>();
        else
            return em.createQuery("SELECT c FROM WantToSeeMovieList c WHERE c.wantToSeeMovieListPK.userID =  " + id ).getResultList();
    }
    
}
