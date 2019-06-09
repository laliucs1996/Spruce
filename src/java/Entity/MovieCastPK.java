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
import javax.validation.constraints.Size;

/**
 *
 * @author Stanl
 */
@Embeddable
public class MovieCastPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "cname")
    private String cname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "movieID")
    private int movieID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private int peopleID;

    public MovieCastPK() {
    }

    public MovieCastPK(String cname, int movieID, int peopleID) {
        this.cname = cname;
        this.movieID = movieID;
        this.peopleID = peopleID;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
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
        hash += (cname != null ? cname.hashCode() : 0);
        hash += (int) movieID;
        hash += (int) peopleID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MovieCastPK)) {
            return false;
        }
        MovieCastPK other = (MovieCastPK) object;
        if ((this.cname == null && other.cname != null) || (this.cname != null && !this.cname.equals(other.cname))) {
            return false;
        }
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
        return "Entity.MovieCastPK[ cname=" + cname + ", movieID=" + movieID + ", peopleID=" + peopleID + " ]";
    }
    
}
