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
public class MovieCrewPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "job")
    private String job;
    @Basic(optional = false)
    @NotNull
    @Column(name = "movieID")
    private int movieID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private int peopleID;

    public MovieCrewPK() {
    }

    public MovieCrewPK(String job, int movieID, int peopleID) {
        this.job = job;
        this.movieID = movieID;
        this.peopleID = peopleID;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
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
        hash += (job != null ? job.hashCode() : 0);
        hash += (int) movieID;
        hash += (int) peopleID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MovieCrewPK)) {
            return false;
        }
        MovieCrewPK other = (MovieCrewPK) object;
        if ((this.job == null && other.job != null) || (this.job != null && !this.job.equals(other.job))) {
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
        return "Entity.MovieCrewPK[ job=" + job + ", movieID=" + movieID + ", peopleID=" + peopleID + " ]";
    }
    
}
