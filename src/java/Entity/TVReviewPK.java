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
public class TVReviewPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "televisionID")
    private int televisionID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private int peopleID;

    public TVReviewPK() {
    }

    public TVReviewPK(int televisionID, int peopleID) {
        this.televisionID = televisionID;
        this.peopleID = peopleID;
    }

    public int getTelevisionID() {
        return televisionID;
    }

    public void setTelevisionID(int televisionID) {
        this.televisionID = televisionID;
    }

    public int getPeopleID() {
        return peopleID;
    }

    public void setPeopleID(int peopleID) {
        this.peopleID = peopleID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) televisionID;
        hash += (int) peopleID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVReviewPK)) {
            return false;
        }
        TVReviewPK other = (TVReviewPK) object;
        if (this.televisionID != other.televisionID) {
            return false;
        }
        if (this.peopleID != other.peopleID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVReviewPK[ televisionID=" + televisionID + ", peopleID=" + peopleID + " ]";
    }
    
}
