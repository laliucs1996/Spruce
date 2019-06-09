/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stanl
 */
@Entity
@Table(name = "MovieReview")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MovieReview.findAll", query = "SELECT m FROM MovieReview m")
    , @NamedQuery(name = "MovieReview.findByMovieID", query = "SELECT m FROM MovieReview m WHERE m.movieReviewPK.movieID = :movieID")
    , @NamedQuery(name = "MovieReview.findByPeopleID", query = "SELECT m FROM MovieReview m WHERE m.movieReviewPK.peopleID = :peopleID")
    , @NamedQuery(name = "MovieReview.findByDate", query = "SELECT m FROM MovieReview m WHERE m.date = :date")})
public class MovieReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MovieReviewPK movieReviewPK;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "review")
    private String review;
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;

    public MovieReview() {
    }

    public MovieReview(MovieReviewPK movieReviewPK) {
        this.movieReviewPK = movieReviewPK;
    }

    public MovieReview(int movieID, int peopleID) {
        this.movieReviewPK = new MovieReviewPK(movieID, peopleID);
    }

    public MovieReviewPK getMovieReviewPK() {
        return movieReviewPK;
    }

    public void setMovieReviewPK(MovieReviewPK movieReviewPK) {
        this.movieReviewPK = movieReviewPK;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (movieReviewPK != null ? movieReviewPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MovieReview)) {
            return false;
        }
        MovieReview other = (MovieReview) object;
        if ((this.movieReviewPK == null && other.movieReviewPK != null) || (this.movieReviewPK != null && !this.movieReviewPK.equals(other.movieReviewPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.MovieReview[ movieReviewPK=" + movieReviewPK + " ]";
    }
    
}
