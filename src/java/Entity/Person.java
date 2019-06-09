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
@Table(name = "Person")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Person.findAll", query = "SELECT p FROM Person p")
    , @NamedQuery(name = "Person.findByGender", query = "SELECT p FROM Person p WHERE p.gender = :gender")
    , @NamedQuery(name = "Person.findByPeopleID", query = "SELECT p FROM Person p WHERE p.peopleID = :peopleID")})
public class Person implements Serializable {

    private static final long serialVersionUID = 1L;
    @Lob
    @Size(max = 65535)
    @Column(name = "alsoKnownAs")
    private String alsoKnownAs;
    @Lob
    @Size(max = 65535)
    @Column(name = "biography")
    private String biography;
    @Lob
    @Size(max = 65535)
    @Column(name = "birthday")
    private String birthday;
    @Lob
    @Size(max = 65535)
    @Column(name = "deathDay")
    private String deathDay;
    @Column(name = "gender")
    private BigInteger gender;
    @Lob
    @Size(max = 65535)
    @Column(name = "homepage")
    private String homepage;
    @Lob
    @Size(max = 65535)
    @Column(name = "Name")
    private String name;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "peopleID")
    private Long peopleID;
    @Lob
    @Size(max = 65535)
    @Column(name = "placeOfBirth")
    private String placeOfBirth;
    @Lob
    @Size(max = 65535)
    @Column(name = "profilePath")
    private String profilePath;

    public Person() {
    }

    public Person(Long peopleID) {
        this.peopleID = peopleID;
    }

    public String getAlsoKnownAs() {
        return alsoKnownAs;
    }

    public void setAlsoKnownAs(String alsoKnownAs) {
        this.alsoKnownAs = alsoKnownAs;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getDeathDay() {
        return deathDay;
    }

    public void setDeathDay(String deathDay) {
        this.deathDay = deathDay;
    }

    public BigInteger getGender() {
        return gender;
    }

    public void setGender(BigInteger gender) {
        this.gender = gender;
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPeopleID() {
        return peopleID;
    }

    public void setPeopleID(Long peopleID) {
        this.peopleID = peopleID;
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
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
        hash += (peopleID != null ? peopleID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Person)) {
            return false;
        }
        Person other = (Person) object;
        if ((this.peopleID == null && other.peopleID != null) || (this.peopleID != null && !this.peopleID.equals(other.peopleID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Person[ peopleID=" + peopleID + " ]";
    }
    
}
