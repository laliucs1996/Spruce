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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stanl
 */
@Entity
@Table(name = "wantToSeeTVList")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WantToSeeTVList.findAll", query = "SELECT w FROM WantToSeeTVList w")
    , @NamedQuery(name = "WantToSeeTVList.findByUserID", query = "SELECT w FROM WantToSeeTVList w WHERE w.wantToSeeTVListPK.userID = :userID")
    , @NamedQuery(name = "WantToSeeTVList.findByTvID", query = "SELECT w FROM WantToSeeTVList w WHERE w.wantToSeeTVListPK.tvID = :tvID")
    , @NamedQuery(name = "WantToSeeTVList.findByPosterPath", query = "SELECT w FROM WantToSeeTVList w WHERE w.posterPath = :posterPath")
    , @NamedQuery(name = "WantToSeeTVList.findByName", query = "SELECT w FROM WantToSeeTVList w WHERE w.name = :name")
    , @NamedQuery(name = "WantToSeeTVList.findByWantToSeeTVListcol", query = "SELECT w FROM WantToSeeTVList w WHERE w.wantToSeeTVListcol = :wantToSeeTVListcol")})
public class WantToSeeTVList implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected WantToSeeTVListPK wantToSeeTVListPK;
    @Size(max = 255)
    @Column(name = "posterPath")
    private String posterPath;
    @Size(max = 255)
    @Column(name = "name")
    private String name;
    @Size(max = 45)
    @Column(name = "wantToSeeTVListcol")
    private String wantToSeeTVListcol;

    public WantToSeeTVList() {
    }

    public WantToSeeTVList(WantToSeeTVListPK wantToSeeTVListPK) {
        this.wantToSeeTVListPK = wantToSeeTVListPK;
    }

    public WantToSeeTVList(int userID, int tvID) {
        this.wantToSeeTVListPK = new WantToSeeTVListPK(userID, tvID);
    }

    public WantToSeeTVListPK getWantToSeeTVListPK() {
        return wantToSeeTVListPK;
    }

    public void setWantToSeeTVListPK(WantToSeeTVListPK wantToSeeTVListPK) {
        this.wantToSeeTVListPK = wantToSeeTVListPK;
    }

    public String getPosterPath() {
        return posterPath;
    }

    public void setPosterPath(String posterPath) {
        this.posterPath = posterPath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWantToSeeTVListcol() {
        return wantToSeeTVListcol;
    }

    public void setWantToSeeTVListcol(String wantToSeeTVListcol) {
        this.wantToSeeTVListcol = wantToSeeTVListcol;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (wantToSeeTVListPK != null ? wantToSeeTVListPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WantToSeeTVList)) {
            return false;
        }
        WantToSeeTVList other = (WantToSeeTVList) object;
        if ((this.wantToSeeTVListPK == null && other.wantToSeeTVListPK != null) || (this.wantToSeeTVListPK != null && !this.wantToSeeTVListPK.equals(other.wantToSeeTVListPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.WantToSeeTVList[ wantToSeeTVListPK=" + wantToSeeTVListPK + " ]";
    }
    
}
