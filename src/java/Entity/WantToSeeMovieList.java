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
@Table(name = "wantToSeeMovieList")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WantToSeeMovieList.findAll", query = "SELECT w FROM WantToSeeMovieList w")
    , @NamedQuery(name = "WantToSeeMovieList.findByUserID", query = "SELECT w FROM WantToSeeMovieList w WHERE w.wantToSeeMovieListPK.userID = :userID")
    , @NamedQuery(name = "WantToSeeMovieList.findByMovieID", query = "SELECT w FROM WantToSeeMovieList w WHERE w.wantToSeeMovieListPK.movieID = :movieID")
    , @NamedQuery(name = "WantToSeeMovieList.findByPosterURL", query = "SELECT w FROM WantToSeeMovieList w WHERE w.posterURL = :posterURL")
    , @NamedQuery(name = "WantToSeeMovieList.findByTitle", query = "SELECT w FROM WantToSeeMovieList w WHERE w.title = :title")})
public class WantToSeeMovieList implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected WantToSeeMovieListPK wantToSeeMovieListPK;
    @Size(max = 255)
    @Column(name = "posterURL")
    private String posterURL;
    @Size(max = 255)
    @Column(name = "title")
    private String title;

    public WantToSeeMovieList() {
    }

    public WantToSeeMovieList(WantToSeeMovieListPK wantToSeeMovieListPK) {
        this.wantToSeeMovieListPK = wantToSeeMovieListPK;
    }

    public WantToSeeMovieList(int userID, int movieID) {
        this.wantToSeeMovieListPK = new WantToSeeMovieListPK(userID, movieID);
    }

    public WantToSeeMovieListPK getWantToSeeMovieListPK() {
        return wantToSeeMovieListPK;
    }

    public void setWantToSeeMovieListPK(WantToSeeMovieListPK wantToSeeMovieListPK) {
        this.wantToSeeMovieListPK = wantToSeeMovieListPK;
    }

    public String getPosterURL() {
        return posterURL;
    }

    public void setPosterURL(String posterURL) {
        this.posterURL = posterURL;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (wantToSeeMovieListPK != null ? wantToSeeMovieListPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WantToSeeMovieList)) {
            return false;
        }
        WantToSeeMovieList other = (WantToSeeMovieList) object;
        if ((this.wantToSeeMovieListPK == null && other.wantToSeeMovieListPK != null) || (this.wantToSeeMovieListPK != null && !this.wantToSeeMovieListPK.equals(other.wantToSeeMovieListPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.WantToSeeMovieList[ wantToSeeMovieListPK=" + wantToSeeMovieListPK + " ]";
    }
    
}
