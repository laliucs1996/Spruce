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
public class TVEpisodePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "episodeNo")
    private long episodeNo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "seasonID")
    private long seasonID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "televisionID")
    private long televisionID;

    public TVEpisodePK() {
    }

    public TVEpisodePK(long episodeNo, long seasonID, long televisionID) {
        this.episodeNo = episodeNo;
        this.seasonID = seasonID;
        this.televisionID = televisionID;
    }

    public long getEpisodeNo() {
        return episodeNo;
    }

    public void setEpisodeNo(long episodeNo) {
        this.episodeNo = episodeNo;
    }

    public long getSeasonID() {
        return seasonID;
    }

    public void setSeasonID(long seasonID) {
        this.seasonID = seasonID;
    }

    public long getTelevisionID() {
        return televisionID;
    }

    public void setTelevisionID(long televisionID) {
        this.televisionID = televisionID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) episodeNo;
        hash += (int) seasonID;
        hash += (int) televisionID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVEpisodePK)) {
            return false;
        }
        TVEpisodePK other = (TVEpisodePK) object;
        if (this.episodeNo != other.episodeNo) {
            return false;
        }
        if (this.seasonID != other.seasonID) {
            return false;
        }
        if (this.televisionID != other.televisionID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVEpisodePK[ episodeNo=" + episodeNo + ", seasonID=" + seasonID + ", televisionID=" + televisionID + " ]";
    }
    
}
