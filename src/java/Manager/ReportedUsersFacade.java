/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.ReportedUsers;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class ReportedUsersFacade extends AbstractFacade<ReportedUsers> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReportedUsersFacade() {
        super(ReportedUsers.class);
    }
    
    public void addReportedUser(ReportedUsers r) {
        em.persist(r);
    }
    
    public ReportedUsers getReportedUser(int userId) {
        return em.find(ReportedUsers.class, userId);
    }
    
    public List<ReportedUsers> getAll() {
        return em.createQuery("SELECT r FROM ReportedUsers r").getResultList();
    }
    
}
