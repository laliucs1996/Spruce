/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stanl
 */
@Entity
@Table(name = "CriticMovieReviewRating")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CriticMovieReviewRating.findAll", query = "SELECT c FROM CriticMovieReviewRating c")
    , @NamedQuery(name = "CriticMovieReviewRating.findByUserID", query = "SELECT c FROM CriticMovieReviewRating c WHERE c.criticMovieReviewRatingPK.userID = :userID")
    , @NamedQuery(name = "CriticMovieReviewRating.findByUserName", query = "SELECT c FROM CriticMovieReviewRating c WHERE c.userName = :userName")
    , @NamedQuery(name = "CriticMovieReviewRating.findByMovieID", query = "SELECT c FROM CriticMovieReviewRating c WHERE c.criticMovieReviewRatingPK.movieID = :movieID")
    , @NamedQuery(name = "CriticMovieReviewRating.findByReview", query = "SELECT c FROM CriticMovieReviewRating c WHERE c.review = :review")
    , @NamedQuery(name = "CriticMovieReviewRating.findByRating", query = "SELECT c FROM CriticMovieReviewRating c WHERE c.rating = :rating")
    , @NamedQuery(name = "CriticMovieReviewRating.findByLink", query = "SELECT c FROM CriticMovieReviewRating c WHERE c.link = :link")})
public class CriticMovieReviewRating implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CriticMovieReviewRatingPK criticMovieReviewRatingPK;
    @Size(max = 45)
    @Column(name = "userName")
    private String userName;
    @Size(max = 512)
    @Column(name = "review")
    private String review;
    @Column(name = "rating")
    private Integer rating;
    @Size(max = 250)
    @Column(name = "link")
    private String link;

    public CriticMovieReviewRating() {
    }

    public CriticMovieReviewRating(CriticMovieReviewRatingPK criticMovieReviewRatingPK) {
        this.criticMovieReviewRatingPK = criticMovieReviewRatingPK;
    }

    public CriticMovieReviewRating(int userID, int movieID) {
        this.criticMovieReviewRatingPK = new CriticMovieReviewRatingPK(userID, movieID);
    }

    public CriticMovieReviewRatingPK getCriticMovieReviewRatingPK() {
        return criticMovieReviewRatingPK;
    }

    public void setCriticMovieReviewRatingPK(CriticMovieReviewRatingPK criticMovieReviewRatingPK) {
        this.criticMovieReviewRatingPK = criticMovieReviewRatingPK;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (criticMovieReviewRatingPK != null ? criticMovieReviewRatingPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CriticMovieReviewRating)) {
            return false;
        }
        CriticMovieReviewRating other = (CriticMovieReviewRating) object;
        if ((this.criticMovieReviewRatingPK == null && other.criticMovieReviewRatingPK != null) || (this.criticMovieReviewRatingPK != null && !this.criticMovieReviewRatingPK.equals(other.criticMovieReviewRatingPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.CriticMovieReviewRating[ criticMovieReviewRatingPK=" + criticMovieReviewRatingPK + " ]";
    }
    
}
