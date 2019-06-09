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
@Table(name = "TVCrew")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TVCrew.findAll", query = "SELECT t FROM TVCrew t")
    , @NamedQuery(name = "TVCrew.findByGender", query = "SELECT t FROM TVCrew t WHERE t.gender = :gender")
    , @NamedQuery(name = "TVCrew.findByJob", query = "SELECT t FROM TVCrew t WHERE t.tVCrewPK.job = :job")
    , @NamedQuery(name = "TVCrew.findByTvID", query = "SELECT t FROM TVCrew t WHERE t.tVCrewPK.tvID = :tvID")
    , @NamedQuery(name = "TVCrew.findByPeopleID", query = "SELECT t FROM TVCrew t WHERE t.tVCrewPK.peopleID = :peopleID")})
public class TVCrew implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TVCrewPK tVCrewPK;
    @Lob
    @Size(max = 65535)
    @Column(name = "department")
    private String department;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "gender")
    private Double gender;
    @Lob
    @Size(max = 65535)
    @Column(name = "name")
    private String name;
    @Lob
    @Size(max = 65535)
    @Column(name = "profilePath")
    private String profilePath;

    public TVCrew() {
    }

    public TVCrew(TVCrewPK tVCrewPK) {
        this.tVCrewPK = tVCrewPK;
    }

    public TVCrew(String job, long tvID, double peopleID) {
        this.tVCrewPK = new TVCrewPK(job, tvID, peopleID);
    }

    public TVCrewPK getTVCrewPK() {
        return tVCrewPK;
    }

    public void setTVCrewPK(TVCrewPK tVCrewPK) {
        this.tVCrewPK = tVCrewPK;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Double getGender() {
        return gender;
    }

    public void setGender(Double gender) {
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
        hash += (tVCrewPK != null ? tVCrewPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVCrew)) {
            return false;
        }
        TVCrew other = (TVCrew) object;
        if ((this.tVCrewPK == null && other.tVCrewPK != null) || (this.tVCrewPK != null && !this.tVCrewPK.equals(other.tVCrewPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVCrew[ tVCrewPK=" + tVCrewPK + " ]";
    }
    
}
