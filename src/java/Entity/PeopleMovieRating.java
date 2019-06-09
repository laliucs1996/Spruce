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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stanl
 */
@Entity
@Table(name = "PeopleMovieRating")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PeopleMovieRating.findAll", query = "SELECT p FROM PeopleMovieRating p")
    , @NamedQuery(name = "PeopleMovieRating.findByPeopleID", query = "SELECT p FROM PeopleMovieRating p WHERE p.peopleMovieRatingPK.peopleID = :peopleID")
    , @NamedQuery(name = "PeopleMovieRating.findByMovieID", query = "SELECT p FROM PeopleMovieRating p WHERE p.peopleMovieRatingPK.movieID = :movieID")
    , @NamedQuery(name = "PeopleMovieRating.findByRating", query = "SELECT p FROM PeopleMovieRating p WHERE p.rating = :rating")})
public class PeopleMovieRating implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PeopleMovieRatingPK peopleMovieRatingPK;
    @Column(name = "rating")
    private Double rating;

    public PeopleMovieRating() {
    }

    public PeopleMovieRating(PeopleMovieRatingPK peopleMovieRatingPK) {
        this.peopleMovieRatingPK = peopleMovieRatingPK;
    }

    public PeopleMovieRating(int peopleID, int movieID) {
        this.peopleMovieRatingPK = new PeopleMovieRatingPK(peopleID, movieID);
    }

    public PeopleMovieRatingPK getPeopleMovieRatingPK() {
        return peopleMovieRatingPK;
    }

    public void setPeopleMovieRatingPK(PeopleMovieRatingPK peopleMovieRatingPK) {
        this.peopleMovieRatingPK = peopleMovieRatingPK;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (peopleMovieRatingPK != null ? peopleMovieRatingPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PeopleMovieRating)) {
            return false;
        }
        PeopleMovieRating other = (PeopleMovieRating) object;
        if ((this.peopleMovieRatingPK == null && other.peopleMovieRatingPK != null) || (this.peopleMovieRatingPK != null && !this.peopleMovieRatingPK.equals(other.peopleMovieRatingPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.PeopleMovieRating[ peopleMovieRatingPK=" + peopleMovieRatingPK + " ]";
    }
    
}
