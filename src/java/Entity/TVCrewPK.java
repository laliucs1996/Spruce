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
public class TVCrewPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "job")
    private String job;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tvID")
    private long tvID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private double peopleID;

    public TVCrewPK() {
    }

    public TVCrewPK(String job, long tvID, double peopleID) {
        this.job = job;
        this.tvID = tvID;
        this.peopleID = peopleID;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public long getTvID() {
        return tvID;
    }

    public void setTvID(long tvID) {
        this.tvID = tvID;
    }

    public double getPeopleID() {
        return peopleID;
    }

    public void setPeopleID(double peopleID) {
        this.peopleID = peopleID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (job != null ? job.hashCode() : 0);
        hash += (int) tvID;
        hash += (int) peopleID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVCrewPK)) {
            return false;
        }
        TVCrewPK other = (TVCrewPK) object;
        if ((this.job == null && other.job != null) || (this.job != null && !this.job.equals(other.job))) {
            return false;
        }
        if (this.tvID != other.tvID) {
            return false;
        }
        if (this.peopleID != other.peopleID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVCrewPK[ job=" + job + ", tvID=" + tvID + ", peopleID=" + peopleID + " ]";
    }
    
}
