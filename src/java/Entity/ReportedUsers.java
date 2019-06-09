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
@Table(name = "ReportedUsers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReportedUsers.findAll", query = "SELECT r FROM ReportedUsers r")
    , @NamedQuery(name = "ReportedUsers.findByUsername", query = "SELECT r FROM ReportedUsers r WHERE r.username = :username")
    , @NamedQuery(name = "ReportedUsers.findByEmail", query = "SELECT r FROM ReportedUsers r WHERE r.email = :email")
    , @NamedQuery(name = "ReportedUsers.findByUserid", query = "SELECT r FROM ReportedUsers r WHERE r.userid = :userid")})
public class ReportedUsers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 45)
    @Column(name = "Username")
    private String username;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 45)
    @Column(name = "Email")
    private String email;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "userid")
    private Integer userid;

    public ReportedUsers() {
    }

    public ReportedUsers(Integer userid) {
        this.userid = userid;
    }

    public ReportedUsers(String username, String email, Integer userid) {
        this.username = username;
        this.email = email;
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userid != null ? userid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReportedUsers)) {
            return false;
        }
        ReportedUsers other = (ReportedUsers) object;
        if ((this.userid == null && other.userid != null) || (this.userid != null && !this.userid.equals(other.userid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.ReportedUsers[ userid=" + userid + " ]";
    }
    
}
