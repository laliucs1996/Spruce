/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Stanl
 */
@Embeddable
public class PeopleTVRatingPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private int peopleID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "televisionID")
    private int televisionID;

    public PeopleTVRatingPK() {
    }

    public PeopleTVRatingPK(int peopleID, int televisionID) {
        this.peopleID = peopleID;
        this.televisionID = televisionID;
    }

    public int getPeopleID() {
        return peopleID;
    }

    public void setPeopleID(int peopleID) {
        this.peopleID = peopleID;
    }

    public int getTelevisionID() {
        return televisionID;
    }

    public void setTelevisionID(int televisionID) {
        this.televisionID = televisionID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) peopleID;
        hash += (int) televisionID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PeopleTVRatingPK)) {
            return false;
        }
        PeopleTVRatingPK other = (PeopleTVRatingPK) object;
        if (this.peopleID != other.peopleID) {
            return false;
        }
        if (this.televisionID != other.televisionID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.PeopleTVRatingPK[ peopleID=" + peopleID + ", televisionID=" + televisionID + " ]";
    }
    
}
