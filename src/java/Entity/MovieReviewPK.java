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
public class MovieReviewPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "movieID")
    private int movieID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private int peopleID;

    public MovieReviewPK() {
    }

    public MovieReviewPK(int movieID, int peopleID) {
        this.movieID = movieID;
        this.peopleID = peopleID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
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
        hash += (int) movieID;
        hash += (int) peopleID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MovieReviewPK)) {
            return false;
        }
        MovieReviewPK other = (MovieReviewPK) object;
        if (this.movieID != other.movieID) {
            return false;
        }
        if (this.peopleID != other.peopleID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.MovieReviewPK[ movieID=" + movieID + ", peopleID=" + peopleID + " ]";
    }
    
}
