/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stanl
 */
@Entity
@Table(name = "Movie")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Movie.findAll", query = "SELECT m FROM Movie m")
    , @NamedQuery(name = "Movie.findByBudget", query = "SELECT m FROM Movie m WHERE m.budget = :budget")
    , @NamedQuery(name = "Movie.findByMovieID", query = "SELECT m FROM Movie m WHERE m.movieID = :movieID")
    , @NamedQuery(name = "Movie.findByRevenue", query = "SELECT m FROM Movie m WHERE m.revenue = :revenue")
    , @NamedQuery(name = "Movie.findByRuntime", query = "SELECT m FROM Movie m WHERE m.runtime = :runtime")})
public class Movie implements Serializable {

    private static final long serialVersionUID = 1L;
    @Lob
    @Size(max = 65535)
    @Column(name = "BelongsToCollection")
    private String belongsToCollection;
    @Column(name = "Budget")
    private BigInteger budget;
    @Lob
    @Size(max = 65535)
    @Column(name = "Genres")
    private String genres;
    @Lob
    @Size(max = 65535)
    @Column(name = "Language")
    private String language;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "MovieID")
    private Long movieID;
    @Lob
    @Size(max = 65535)
    @Column(name = "OriginalTitle")
    private String originalTitle;
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
    @Column(name = "ReleaseDate")
    private String releaseDate;
    @Column(name = "Revenue")
    private BigInteger revenue;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Runtime")
    private Double runtime;
    @Lob
    @Size(max = 65535)
    @Column(name = "Status")
    private String status;
    @Lob
    @Size(max = 65535)
    @Column(name = "TagLine")
    private String tagLine;
    @Lob
    @Size(max = 65535)
    @Column(name = "Title")
    private String title;
    @Column(name = "totalCount")
    private BigInteger totalCount;
    @Column(name = "totalVote")
    private BigInteger totalVote;

    public Movie() {
    }

    public Movie(Long movieID) {
        this.movieID = movieID;
    }

    public String getBelongsToCollection() {
        return belongsToCollection;
    }

    public void setBelongsToCollection(String belongsToCollection) {
        this.belongsToCollection = belongsToCollection;
    }

    public BigInteger getBudget() {
        return budget;
    }

    public void setBudget(BigInteger budget) {
        this.budget = budget;
    }

    public String getGenres() {
        return genres;
    }

    public void setGenres(String genres) {
        this.genres = genres;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Long getMovieID() {
        return movieID;
    }

    public void setMovieID(Long movieID) {
        this.movieID = movieID;
    }

    public String getOriginalTitle() {
        return originalTitle;
    }

    public void setOriginalTitle(String originalTitle) {
        this.originalTitle = originalTitle;
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

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public BigInteger getRevenue() {
        return revenue;
    }

    public void setRevenue(BigInteger revenue) {
        this.revenue = revenue;
    }

    public Double getRuntime() {
        return runtime;
    }

    public void setRuntime(Double runtime) {
        this.runtime = runtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTagLine() {
        return tagLine;
    }

    public void setTagLine(String tagLine) {
        this.tagLine = tagLine;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
        hash += (movieID != null ? movieID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Movie)) {
            return false;
        }
        Movie other = (Movie) object;
        if ((this.movieID == null && other.movieID != null) || (this.movieID != null && !this.movieID.equals(other.movieID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Movie[ movieID=" + movieID + " ]";
    }
}
