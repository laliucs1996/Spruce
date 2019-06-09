/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.Movie;
import java.text.DateFormat;
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
public class MovieFacade extends AbstractFacade<Movie> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MovieFacade() {
        super(Movie.class);
    }
    
    public Movie getMovie(long movieID) {
        return em.find(Movie.class, movieID);
    }
    
    public List<Movie> searchMovies(String s) {
        String arr[] = s.split(" ");
        String query = "SELECT m FROM Movie m WHERE m.title LIKE '%" + arr[0] + "%'";
        for(int i = 1; i < arr.length; i++) {
            query += " AND m.title LIKE '%" + arr[i] + "%'";
        }
        return em.createQuery(query).getResultList();
    }
    
    public List<Movie> newestMovies() {
        Calendar c1 = Calendar.getInstance();
        c1.setFirstDayOfWeek(Calendar.MONDAY);
        Calendar c2 = Calendar.getInstance();
        c2.setFirstDayOfWeek(Calendar.MONDAY);
        c1.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        c2.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        Date start = c1.getTime();
        Date end = c2.getTime();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(df.format(start));
        System.out.println(df.format(end));
        return em.createQuery("SELECT m FROM Movie m WHERE m.releaseDate BETWEEN '" + df.format(start) + "' AND '" + df.format(end) + "'").getResultList();
    }
    
    public List<Movie> moviesComingSoon() {
        return em.createQuery("SELECT m FROM Movie m WHERE m.releaseDate > CURRENT_TIMESTAMP").getResultList();
    }
    
    public List<Movie> topBoxOfficeMovies() {
        return em.createQuery("SELECT m FROM Movie m ORDER BY m.revenue DESC")
                .setMaxResults(20)
                .getResultList();
    }
    
    public List<Movie> highestRated() {
        return em.createQuery("SELECT m FROM Movie m WHERE m.totalCount > 0 ORDER BY m.totalVote/m.totalCount DESC")
                .setMaxResults(20)
                .getResultList();
    }
    
    public List<Movie> newestMoviesHP() {
        return em.createQuery("SELECT m FROM Movie m WHERE m.releaseDate < CURRENT_TIMESTAMP ORDER BY m.releaseDate DESC").setMaxResults(5).getResultList();
    }
    
    public List<Movie> latestMovies() {
        return em.createQuery("SELECT m FROM Movie m WHERE m.releaseDate > CURRENT_TIMESTAMP ORDER BY m.releaseDate DESC").setMaxResults(5).getResultList();
    }
    
    public List<Movie> popularMovies() {
        return em.createQuery("SELECT m FROM Movie m ORDER BY m.totalVote DESC").setMaxResults(5).getResultList();
    }
    
    public List<Object[]> getUserReviewsByMovieId(int movieId) {
        return em.createQuery("SELECT ra, re, u FROM PeopleMovieRating ra, MovieReview re, User u WHERE ra.peopleMovieRatingPK.movieID = :movieId AND re.movieReviewPK.movieID = ra.peopleMovieRatingPK.movieID AND u.userId = ra.peopleMovieRatingPK.peopleID")
                .setParameter("movieId", movieId)
                .getResultList();
    }
    
    public List<Object[]> getAverageMovieRatings() {
        return em.createQuery("SELECT m.movieID, m.title, m.tagLine, m.poster, m.releaseDate, AVG(r.rating) FROM PeopleMovieRating r, Movie m WHERE r.peopleMovieRatingPK.movieID = m.movieID GROUP BY m.movieID ORDER BY AVG(r.rating) DESC").getResultList();
    }
    
}
