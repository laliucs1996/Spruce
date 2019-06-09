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
@Table(name = "MovieCast")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MovieCast.findAll", query = "SELECT m FROM MovieCast m")
    , @NamedQuery(name = "MovieCast.findByCname", query = "SELECT m FROM MovieCast m WHERE m.movieCastPK.cname = :cname")
    , @NamedQuery(name = "MovieCast.findByMovieID", query = "SELECT m FROM MovieCast m WHERE m.movieCastPK.movieID = :movieID")
    , @NamedQuery(name = "MovieCast.findByRank", query = "SELECT m FROM MovieCast m WHERE m.rank = :rank")
    , @NamedQuery(name = "MovieCast.findByPeopleID", query = "SELECT m FROM MovieCast m WHERE m.movieCastPK.peopleID = :peopleID")})
public class MovieCast implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MovieCastPK movieCastPK;
    @Lob
    @Size(max = 65535)
    @Column(name = "name")
    private String name;
    @Column(name = "rank")
    private Integer rank;
    @Lob
    @Size(max = 65535)
    @Column(name = "profilePath")
    private String profilePath;

    public MovieCast() {
    }

    public MovieCast(MovieCastPK movieCastPK) {
        this.movieCastPK = movieCastPK;
    }

    public MovieCast(String cname, int movieID, int peopleID) {
        this.movieCastPK = new MovieCastPK(cname, movieID, peopleID);
    }

    public MovieCastPK getMovieCastPK() {
        return movieCastPK;
    }

    public void setMovieCastPK(MovieCastPK movieCastPK) {
        this.movieCastPK = movieCastPK;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
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
        hash += (movieCastPK != null ? movieCastPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MovieCast)) {
            return false;
        }
        MovieCast other = (MovieCast) object;
        if ((this.movieCastPK == null && other.movieCastPK != null) || (this.movieCastPK != null && !this.movieCastPK.equals(other.movieCastPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.MovieCast[ movieCastPK=" + movieCastPK + " ]";
    }
    
}
