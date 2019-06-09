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
@Table(name = "PeopleTVRating")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PeopleTVRating.findAll", query = "SELECT p FROM PeopleTVRating p")
    , @NamedQuery(name = "PeopleTVRating.findByPeopleID", query = "SELECT p FROM PeopleTVRating p WHERE p.peopleTVRatingPK.peopleID = :peopleID")
    , @NamedQuery(name = "PeopleTVRating.findByTelevisionID", query = "SELECT p FROM PeopleTVRating p WHERE p.peopleTVRatingPK.televisionID = :televisionID")
    , @NamedQuery(name = "PeopleTVRating.findByRating", query = "SELECT p FROM PeopleTVRating p WHERE p.rating = :rating")})
public class PeopleTVRating implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PeopleTVRatingPK peopleTVRatingPK;
    @Column(name = "rating")
    private Double rating;

    public PeopleTVRating() {
    }

    public PeopleTVRating(PeopleTVRatingPK peopleTVRatingPK) {
        this.peopleTVRatingPK = peopleTVRatingPK;
    }

    public PeopleTVRating(int peopleID, int televisionID) {
        this.peopleTVRatingPK = new PeopleTVRatingPK(peopleID, televisionID);
    }

    public PeopleTVRatingPK getPeopleTVRatingPK() {
        return peopleTVRatingPK;
    }

    public void setPeopleTVRatingPK(PeopleTVRatingPK peopleTVRatingPK) {
        this.peopleTVRatingPK = peopleTVRatingPK;
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
        hash += (peopleTVRatingPK != null ? peopleTVRatingPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PeopleTVRating)) {
            return false;
        }
        PeopleTVRating other = (PeopleTVRating) object;
        if ((this.peopleTVRatingPK == null && other.peopleTVRatingPK != null) || (this.peopleTVRatingPK != null && !this.peopleTVRatingPK.equals(other.peopleTVRatingPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.PeopleTVRating[ peopleTVRatingPK=" + peopleTVRatingPK + " ]";
    }
    
}
