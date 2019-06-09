/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.User;
import java.util.List;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class UserFacade extends AbstractFacade<User> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    
    public int getNextMaxId() {
        return ((Long)em.createQuery("SELECT COUNT(u) FROM User u").getSingleResult()).intValue() + 1;
    }
    
    public User getUser(String name) {
        User user = new User();
        try {
            user = (User)em.createQuery("SELECT u FROM User u WHERE u.userName = :name")
                    .setParameter("name", name)
                    .getSingleResult();
        }catch(Exception e) {
            System.out.println(e);
        }
        return user;
    }
    
    public void addUser(User user) {
        em.persist(user);
    }
    
    public void updateUser(User user) {
        em.merge(user);
    }
    
    public List<Object[]> getUserReviews(int userId) {
        return em.createQuery("SELECT m, mr, p FROM Movie m, MovieReview mr, PeopleMovieRating p WHERE mr.movieReviewPK.peopleID = :userId AND mr.movieReviewPK.peopleID = p.peopleMovieRatingPK.peopleID AND m.movieID = mr.movieReviewPK.movieID")
                .setParameter("userId", userId)
                .getResultList();
    }
    
    public List<Object[]> getUserTVReviews(int userId) {
        return em.createQuery("SELECT t, tr, p FROM Tv t, TVReview tr, PeopleTVRating p WHERE tr.tVReviewPK.peopleID = :userId AND tr.tVReviewPK.peopleID = p.peopleTVRatingPK.peopleID AND t.televisionID = tr.tVReviewPK.televisionID")
                .setParameter("userId", userId)
                .getResultList();
    }
    
    public void removeUser(User user) {
        em.remove(user);
    }
    
}
