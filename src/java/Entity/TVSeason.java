/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stanl
 */
@Entity
@Table(name = "TVSeason")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TVSeason.findAll", query = "SELECT t FROM TVSeason t")
    , @NamedQuery(name = "TVSeason.findBySeasonNo", query = "SELECT t FROM TVSeason t WHERE t.seasonNo = :seasonNo")
    , @NamedQuery(name = "TVSeason.findByTvID", query = "SELECT t FROM TVSeason t WHERE t.tvID = :tvID")
    , @NamedQuery(name = "TVSeason.findByTvSeasonID", query = "SELECT t FROM TVSeason t WHERE t.tvSeasonID = :tvSeasonID")})
public class TVSeason implements Serializable {

    private static final long serialVersionUID = 1L;
    @Lob
    @Size(max = 65535)
    @Column(name = "airDate")
    private String airDate;
    @Lob
    @Size(max = 65535)
    @Column(name = "name")
    private String name;
    @Lob
    @Size(max = 65535)
    @Column(name = "overview")
    private String overview;
    @Lob
    @Size(max = 65535)
    @Column(name = "posterPath")
    private String posterPath;
    @Column(name = "seasonNo")
    private BigInteger seasonNo;
    @Column(name = "tvID")
    private BigInteger tvID;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "tvSeasonID")
    private Long tvSeasonID;

    public TVSeason() {
    }

    public TVSeason(Long tvSeasonID) {
        this.tvSeasonID = tvSeasonID;
    }

    public String getAirDate() {
        return airDate;
    }

    public void setAirDate(String airDate) {
        this.airDate = airDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getPosterPath() {
        return posterPath;
    }

    public void setPosterPath(String posterPath) {
        this.posterPath = posterPath;
    }

    public BigInteger getSeasonNo() {
        return seasonNo;
    }

    public void setSeasonNo(BigInteger seasonNo) {
        this.seasonNo = seasonNo;
    }

    public BigInteger getTvID() {
        return tvID;
    }

    public void setTvID(BigInteger tvID) {
        this.tvID = tvID;
    }

    public Long getTvSeasonID() {
        return tvSeasonID;
    }

    public void setTvSeasonID(Long tvSeasonID) {
        this.tvSeasonID = tvSeasonID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tvSeasonID != null ? tvSeasonID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVSeason)) {
            return false;
        }
        TVSeason other = (TVSeason) object;
        if ((this.tvSeasonID == null && other.tvSeasonID != null) || (this.tvSeasonID != null && !this.tvSeasonID.equals(other.tvSeasonID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVSeason[ tvSeasonID=" + tvSeasonID + " ]";
    }
    
}
