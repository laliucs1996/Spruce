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
@Table(name = "tv")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tv.findAll", query = "SELECT t FROM Tv t")
    , @NamedQuery(name = "Tv.findByNumberOfEpisodes", query = "SELECT t FROM Tv t WHERE t.numberOfEpisodes = :numberOfEpisodes")
    , @NamedQuery(name = "Tv.findByNumberOfSeasons", query = "SELECT t FROM Tv t WHERE t.numberOfSeasons = :numberOfSeasons")
    , @NamedQuery(name = "Tv.findByTelevisionID", query = "SELECT t FROM Tv t WHERE t.televisionID = :televisionID")})
public class Tv implements Serializable {

    private static final long serialVersionUID = 1L;
    @Lob
    @Size(max = 65535)
    @Column(name = "BackDropPoster")
    private String backDropPoster;
    @Lob
    @Size(max = 65535)
    @Column(name = "CreatedBy")
    private String createdBy;
    @Lob
    @Size(max = 65535)
    @Column(name = "EpisodeRunTime")
    private String episodeRunTime;
    @Lob
    @Size(max = 65535)
    @Column(name = "FirstAirDate")
    private String firstAirDate;
    @Lob
    @Size(max = 65535)
    @Column(name = "Genre")
    private String genre;
    @Lob
    @Size(max = 65535)
    @Column(name = "Language")
    private String language;
    @Lob
    @Size(max = 65535)
    @Column(name = "LastAirDate")
    private String lastAirDate;
    @Lob
    @Size(max = 65535)
    @Column(name = "Name")
    private String name;
    @Lob
    @Size(max = 65535)
    @Column(name = "Networks")
    private String networks;
    @Column(name = "NumberOfEpisodes")
    private Integer numberOfEpisodes;
    @Column(name = "NumberOfSeasons")
    private Integer numberOfSeasons;
    @Lob
    @Size(max = 65535)
    @Column(name = "Overview")
    private String overview;
    @Lob
    @Size(max = 65535)
    @Column(name = "Poster")
    private String poster;
    @Lob
    @Size(max = 65535)
    @Column(name = "ProductionCompanies")
    private String productionCompanies;
    @Lob
    @Size(max = 65535)
    @Column(name = "Seasons")
    private String seasons;
    @Lob
    @Size(max = 65535)
    @Column(name = "Status")
    private String status;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "TelevisionID")
    private Integer televisionID;
    @Lob
    @Size(max = 65535)
    @Column(name = "Type")
    private String type;
    @Column(name = "totalCount")
    private BigInteger totalCount;
    @Column(name = "totalVote")
    private BigInteger totalVote;

    public Tv() {
    }

    public Tv(Integer televisionID) {
        this.televisionID = televisionID;
    }

    public String getBackDropPoster() {
        return backDropPoster;
    }

    public void setBackDropPoster(String backDropPoster) {
        this.backDropPoster = backDropPoster;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getEpisodeRunTime() {
        return episodeRunTime;
    }

    public void setEpisodeRunTime(String episodeRunTime) {
        this.episodeRunTime = episodeRunTime;
    }

    public String getFirstAirDate() {
        return firstAirDate;
    }

    public void setFirstAirDate(String firstAirDate) {
        this.firstAirDate = firstAirDate;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLastAirDate() {
        return lastAirDate;
    }

    public void setLastAirDate(String lastAirDate) {
        this.lastAirDate = lastAirDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNetworks() {
        return networks;
    }

    public void setNetworks(String networks) {
        this.networks = networks;
    }

    public Integer getNumberOfEpisodes() {
        return numberOfEpisodes;
    }

    public void setNumberOfEpisodes(Integer numberOfEpisodes) {
        this.numberOfEpisodes = numberOfEpisodes;
    }

    public Integer getNumberOfSeasons() {
        return numberOfSeasons;
    }

    public void setNumberOfSeasons(Integer numberOfSeasons) {
        this.numberOfSeasons = numberOfSeasons;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getProductionCompanies() {
        return productionCompanies;
    }

    public void setProductionCompanies(String productionCompanies) {
        this.productionCompanies = productionCompanies;
    }

    public String getSeasons() {
        return seasons;
    }

    public void setSeasons(String seasons) {
        this.seasons = seasons;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getTelevisionID() {
        return televisionID;
    }

    public void setTelevisionID(Integer televisionID) {
        this.televisionID = televisionID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public BigInteger getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(BigInteger totalCount) {
        this.totalCount = totalCount;
    }

    public BigInteger getTotalVote() {
        return totalVote;
    }

    public void setTotalVote(BigInteger totalVote) {
        this.totalVote = totalVote;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (televisionID != null ? televisionID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tv)) {
            return false;
        }
        Tv other = (Tv) object;
        if ((this.televisionID == null && other.televisionID != null) || (this.televisionID != null && !this.televisionID.equals(other.televisionID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Tv[ televisionID=" + televisionID + " ]";
    }
    
}
