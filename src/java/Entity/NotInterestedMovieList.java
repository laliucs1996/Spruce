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
@Table(name = "notInterestedMovieList")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NotInterestedMovieList.findAll", query = "SELECT n FROM NotInterestedMovieList n")
    , @NamedQuery(name = "NotInterestedMovieList.findByUserID", query = "SELECT n FROM NotInterestedMovieList n WHERE n.notInterestedMovieListPK.userID = :userID")
    , @NamedQuery(name = "NotInterestedMovieList.findByMovieID", query = "SELECT n FROM NotInterestedMovieList n WHERE n.notInterestedMovieListPK.movieID = :movieID")
    , @NamedQuery(name = "NotInterestedMovieList.findByPosterPath", query = "SELECT n FROM NotInterestedMovieList n WHERE n.posterPath = :posterPath")
    , @NamedQuery(name = "NotInterestedMovieList.findByName", query = "SELECT n FROM NotInterestedMovieList n WHERE n.name = :name")})
public class NotInterestedMovieList implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected NotInterestedMovieListPK notInterestedMovieListPK;
    @Size(max = 255)
    @Column(name = "posterPath")
    private String posterPath;
    @Size(max = 255)
    @Column(name = "name")
    private String name;

    public NotInterestedMovieList() {
    }

    public NotInterestedMovieList(NotInterestedMovieListPK notInterestedMovieListPK) {
        this.notInterestedMovieListPK = notInterestedMovieListPK;
    }

    public NotInterestedMovieList(int userID, int movieID) {
        this.notInterestedMovieListPK = new NotInterestedMovieListPK(userID, movieID);
    }

    public NotInterestedMovieListPK getNotInterestedMovieListPK() {
        return notInterestedMovieListPK;
    }

    public void setNotInterestedMovieListPK(NotInterestedMovieListPK notInterestedMovieListPK) {
        this.notInterestedMovieListPK = notInterestedMovieListPK;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (notInterestedMovieListPK != null ? notInterestedMovieListPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotInterestedMovieList)) {
            return false;
        }
        NotInterestedMovieList other = (NotInterestedMovieList) object;
        if ((this.notInterestedMovieListPK == null && other.notInterestedMovieListPK != null) || (this.notInterestedMovieListPK != null && !this.notInterestedMovieListPK.equals(other.notInterestedMovieListPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.NotInterestedMovieList[ notInterestedMovieListPK=" + notInterestedMovieListPK + " ]";
    }
    
}
