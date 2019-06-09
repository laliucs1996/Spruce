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
@Table(name = "TVEpisode")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TVEpisode.findAll", query = "SELECT t FROM TVEpisode t")
    , @NamedQuery(name = "TVEpisode.findByEpisodeNo", query = "SELECT t FROM TVEpisode t WHERE t.tVEpisodePK.episodeNo = :episodeNo")
    , @NamedQuery(name = "TVEpisode.findBySeasonID", query = "SELECT t FROM TVEpisode t WHERE t.tVEpisodePK.seasonID = :seasonID")
    , @NamedQuery(name = "TVEpisode.findByTelevisionID", query = "SELECT t FROM TVEpisode t WHERE t.tVEpisodePK.televisionID = :televisionID")})
public class TVEpisode implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TVEpisodePK tVEpisodePK;
    @Lob
    @Size(max = 65535)
    @Column(name = "airDate")
    private String airDate;
    @Lob
    @Size(max = 65535)
    @Column(name = "crew")
    private String crew;
    @Lob
    @Size(max = 65535)
    @Column(name = "guest")
    private String guest;
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

    public TVEpisode() {
    }

    public TVEpisode(TVEpisodePK tVEpisodePK) {
        this.tVEpisodePK = tVEpisodePK;
    }

    public TVEpisode(long episodeNo, long seasonID, long televisionID) {
        this.tVEpisodePK = new TVEpisodePK(episodeNo, seasonID, televisionID);
    }

    public TVEpisodePK getTVEpisodePK() {
        return tVEpisodePK;
    }

    public void setTVEpisodePK(TVEpisodePK tVEpisodePK) {
        this.tVEpisodePK = tVEpisodePK;
    }

    public String getAirDate() {
        return airDate;
    }

    public void setAirDate(String airDate) {
        this.airDate = airDate;
    }

    public String getCrew() {
        return crew;
    }

    public void setCrew(String crew) {
        this.crew = crew;
    }

    public String getGuest() {
        return guest;
    }

    public void setGuest(String guest) {
        this.guest = guest;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tVEpisodePK != null ? tVEpisodePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVEpisode)) {
            return false;
        }
        TVEpisode other = (TVEpisode) object;
        if ((this.tVEpisodePK == null && other.tVEpisodePK != null) || (this.tVEpisodePK != null && !this.tVEpisodePK.equals(other.tVEpisodePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVEpisode[ tVEpisodePK=" + tVEpisodePK + " ]";
    }
    
}
