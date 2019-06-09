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
@Table(name = "MovieCrew")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MovieCrew.findAll", query = "SELECT m FROM MovieCrew m")
    , @NamedQuery(name = "MovieCrew.findByGender", query = "SELECT m FROM MovieCrew m WHERE m.gender = :gender")
    , @NamedQuery(name = "MovieCrew.findByJob", query = "SELECT m FROM MovieCrew m WHERE m.movieCrewPK.job = :job")
    , @NamedQuery(name = "MovieCrew.findByMovieID", query = "SELECT m FROM MovieCrew m WHERE m.movieCrewPK.movieID = :movieID")
    , @NamedQuery(name = "MovieCrew.findByPeopleID", query = "SELECT m FROM MovieCrew m WHERE m.movieCrewPK.peopleID = :peopleID")})
public class MovieCrew implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MovieCrewPK movieCrewPK;
    @Lob
    @Size(max = 65535)
    @Column(name = "department")
    private String department;
    @Column(name = "gender")
    private Integer gender;
    @Lob
    @Size(max = 65535)
    @Column(name = "name")
    private String name;
    @Lob
    @Size(max = 65535)
    @Column(name = "profilePath")
    private String profilePath;

    public MovieCrew() {
    }

    public MovieCrew(MovieCrewPK movieCrewPK) {
        this.movieCrewPK = movieCrewPK;
    }

    public MovieCrew(String job, int movieID, int peopleID) {
        this.movieCrewPK = new MovieCrewPK(job, movieID, peopleID);
    }

    public MovieCrewPK getMovieCrewPK() {
        return movieCrewPK;
    }

    public void setMovieCrewPK(MovieCrewPK movieCrewPK) {
        this.movieCrewPK = movieCrewPK;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        hash += (movieCrewPK != null ? movieCrewPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MovieCrew)) {
            return false;
        }
        MovieCrew other = (MovieCrew) object;
        if ((this.movieCrewPK == null && other.movieCrewPK != null) || (this.movieCrewPK != null && !this.movieCrewPK.equals(other.movieCrewPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.MovieCrew[ movieCrewPK=" + movieCrewPK + " ]";
    }
    
}
