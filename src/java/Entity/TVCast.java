/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Lob;
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
@Table(name = "TVCast")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TVCast.findAll", query = "SELECT t FROM TVCast t")
    , @NamedQuery(name = "TVCast.findByCname", query = "SELECT t FROM TVCast t WHERE t.tVCastPK.cname = :cname")
    , @NamedQuery(name = "TVCast.findByGender", query = "SELECT t FROM TVCast t WHERE t.gender = :gender")
    , @NamedQuery(name = "TVCast.findByTvID", query = "SELECT t FROM TVCast t WHERE t.tVCastPK.tvID = :tvID")
    , @NamedQuery(name = "TVCast.findByRank", query = "SELECT t FROM TVCast t WHERE t.rank = :rank")
    , @NamedQuery(name = "TVCast.findByPeopleID", query = "SELECT t FROM TVCast t WHERE t.tVCastPK.peopleID = :peopleID")})
public class TVCast implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TVCastPK tVCastPK;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "gender")
    private Double gender;
    @Lob
    @Size(max = 65535)
    @Column(name = "name")
    private String name;
    @Column(name = "rank")
    private BigInteger rank;
    @Lob
    @Size(max = 65535)
    @Column(name = "profilePath")
    private String profilePath;

    public TVCast() {
    }

    public TVCast(TVCastPK tVCastPK) {
        this.tVCastPK = tVCastPK;
    }

    public TVCast(String cname, long tvID, double peopleID) {
        this.tVCastPK = new TVCastPK(cname, tvID, peopleID);
    }

    public TVCastPK getTVCastPK() {
        return tVCastPK;
    }

    public void setTVCastPK(TVCastPK tVCastPK) {
        this.tVCastPK = tVCastPK;
    }

    public Double getGender() {
        return gender;
    }

    public void setGender(Double gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigInteger getRank() {
        return rank;
    }

    public void setRank(BigInteger rank) {
        this.rank = rank;
    }

    public String getProfilePath() {
        return profilePath;
    }

    public void setProfilePath(String profilePath) {
        this.profilePath = profilePath;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tVCastPK != null ? tVCastPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVCast)) {
            return false;
        }
        TVCast other = (TVCast) object;
        if ((this.tVCastPK == null && other.tVCastPK != null) || (this.tVCastPK != null && !this.tVCastPK.equals(other.tVCastPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVCast[ tVCastPK=" + tVCastPK + " ]";
    }
    
}
