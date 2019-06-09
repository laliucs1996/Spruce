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
public class NotInterestedTVListPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "userID")
    private int userID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tvID")
    private int tvID;

    public NotInterestedTVListPK() {
    }

    public NotInterestedTVListPK(int userID, int tvID) {
        this.userID = userID;
        this.tvID = tvID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getTvID() {
        return tvID;
    }

    public void setTvID(int tvID) {
        this.tvID = tvID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userID;
        hash += (int) tvID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotInterestedTVListPK)) {
            return false;
        }
        NotInterestedTVListPK other = (NotInterestedTVListPK) object;
        if (this.userID != other.userID) {
            return false;
        }
        if (this.tvID != other.tvID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.NotInterestedTVListPK[ userID=" + userID + ", tvID=" + tvID + " ]";
    }
    
}
