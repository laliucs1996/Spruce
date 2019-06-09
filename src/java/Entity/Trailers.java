/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "Trailers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Trailers.findAll", query = "SELECT t FROM Trailers t")
    , @NamedQuery(name = "Trailers.findByMovieID", query = "SELECT t FROM Trailers t WHERE t.movieID = :movieID")
    , @NamedQuery(name = "Trailers.findByPath", query = "SELECT t FROM Trailers t WHERE t.path = :path")})
public class Trailers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "movieID")
    private Integer movieID;
    @Size(max = 45)
    @Column(name = "path")
    private String path;

    public Trailers() {
    }

    public Trailers(Integer movieID) {
        this.movieID = movieID;
    }

    public Integer getMovieID() {
        return movieID;
    }

    public void setMovieID(Integer movieID) {
        this.movieID = movieID;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
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
        if (!(object instanceof Trailers)) {
            return false;
        }
        Trailers other = (Trailers) object;
        if ((this.movieID == null && other.movieID != null) || (this.movieID != null && !this.movieID.equals(other.movieID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Trailers[ movieID=" + movieID + " ]";
    }
    
}
