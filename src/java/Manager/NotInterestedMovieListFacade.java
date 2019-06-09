/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.NotInterestedMovieList;
import Entity.NotInterestedMovieListPK;
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
public class NotInterestedMovieListFacade extends AbstractFacade<NotInterestedMovieList> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NotInterestedMovieListFacade() {
        super(NotInterestedMovieList.class);
    }
    
    public void addNotInterestedMovie(NotInterestedMovieList movie) {
        em.persist(movie);
    }
    
    public NotInterestedMovieList getNotInterestedMovie(NotInterestedMovieListPK pk) {
        return em.find(NotInterestedMovieList.class, pk);
    }
    
    public List<NotInterestedMovieList> getList(int id){
        if(em.createQuery("SELECT n FROM NotInterestedMovieList n WHERE n.notInterestedMovieListPK.userID =  " + id ).getResultList() == null)
            return new ArrayList<NotInterestedMovieList>();
        else
            return em.createQuery("SELECT n FROM NotInterestedMovieList n WHERE n.notInterestedMovieListPK.userID =  " + id ).getResultList();
    }
    
}
