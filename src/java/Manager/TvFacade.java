/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.Tv;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class TvFacade extends AbstractFacade<Tv> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TvFacade() {
        super(Tv.class);
    }
    
    public Tv getTv(int televisionID) {
        return em.find(Tv.class, televisionID);
    }
    
    public List<Tv> searchTv(String s) {
        String arr[] = s.split(" ");
        String query = "SELECT t FROM Tv t WHERE t.name LIKE '%" + arr[0] + "%'";
        for(int i = 1; i < arr.length; i++) {
            query += " AND t.name LIKE '%" + arr[i] + "%'";
        }
        return em.createQuery(query).getResultList();
    }
    
    public List<Tv> topRatedTv() {
        return em.createQuery("SELECT t FROM Tv t WHERE t.totalCount > 0 ORDER BY t.totalVote/t.totalCount DESC")
            .setMaxResults(20)
            .getResultList();
    }
    
    public List<Tv> certifiedFreshTv() {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH, 1);
        Date start = c.getTime();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return em.createQuery("SELECT t FROM Tv t WHERE t.lastAirDate BETWEEN '" + df.format(start) + "' AND CURRENT_TIMESTAMP")
                .setMaxResults(20)
                .getResultList();
    }
    
    public List<Tv> newestTV() {
        return em.createQuery("SELECT m FROM Tv m WHERE m.lastAirDate < CURRENT_TIMESTAMP ORDER BY m.lastAirDate DESC").setMaxResults(5).getResultList();
    }
    
    public List<Tv> latestTV() {
        return em.createQuery("SELECT m FROM Tv m WHERE m.lastAirDate > CURRENT_TIMESTAMP ORDER BY m.lastAirDate DESC").setMaxResults(5).getResultList();
    }
    
    public List<Tv> popularTV() {
        return em.createQuery("SELECT m FROM Tv m ORDER BY m.totalVote DESC").setMaxResults(5).getResultList();
    }
    
    public List<Object[]> getUserReviews(int tvId) {
        return em.createQuery("SELECT ra, re, u FROM PeopleTVRating ra, TVReview re, User u WHERE ra.peopleTVRatingPK.televisionID = :tvId AND re.tVReviewPK.televisionID = ra.peopleTVRatingPK.televisionID AND u.userId = ra.peopleTVRatingPK.peopleID")
                .setParameter("tvId", tvId)
                .getResultList();
    }
}
