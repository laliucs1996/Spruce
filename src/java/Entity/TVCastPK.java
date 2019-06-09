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
public class TVCastPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "cname")
    private String cname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tvID")
    private long tvID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private double peopleID;

    public TVCastPK() {
    }

    public TVCastPK(String cname, long tvID, double peopleID) {
        this.cname = cname;
        this.tvID = tvID;
        this.peopleID = peopleID;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
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
        hash += (cname != null ? cname.hashCode() : 0);
        hash += (int) tvID;
        hash += (int) peopleID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVCastPK)) {
            return false;
        }
        TVCastPK other = (TVCastPK) object;
        if ((this.cname == null && other.cname != null) || (this.cname != null && !this.cname.equals(other.cname))) {
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
        return "Entity.TVCastPK[ character=" + cname + ", tvID=" + tvID + ", peopleID=" + peopleID + " ]";
    }
    
}
