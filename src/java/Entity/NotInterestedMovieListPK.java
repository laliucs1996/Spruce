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
public class NotInterestedMovieListPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "userID")
    private int userID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "movieID")
    private int movieID;

    public NotInterestedMovieListPK() {
    }

    public NotInterestedMovieListPK(int userID, int movieID) {
        this.userID = userID;
        this.movieID = movieID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userID;
        hash += (int) movieID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotInterestedMovieListPK)) {
            return false;
        }
        NotInterestedMovieListPK other = (NotInterestedMovieListPK) object;
        if (this.userID != other.userID) {
            return false;
        }
        if (this.movieID != other.movieID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.NotInterestedMovieListPK[ userID=" + userID + ", movieID=" + movieID + " ]";
    }
    
}
