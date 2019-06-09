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
@Table(name = "notInterestedTVList")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NotInterestedTVList.findAll", query = "SELECT n FROM NotInterestedTVList n")
    , @NamedQuery(name = "NotInterestedTVList.findByUserID", query = "SELECT n FROM NotInterestedTVList n WHERE n.notInterestedTVListPK.userID = :userID")
    , @NamedQuery(name = "NotInterestedTVList.findByTvID", query = "SELECT n FROM NotInterestedTVList n WHERE n.notInterestedTVListPK.tvID = :tvID")
    , @NamedQuery(name = "NotInterestedTVList.findByPosterPath", query = "SELECT n FROM NotInterestedTVList n WHERE n.posterPath = :posterPath")
    , @NamedQuery(name = "NotInterestedTVList.findByName", query = "SELECT n FROM NotInterestedTVList n WHERE n.name = :name")})
public class NotInterestedTVList implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected NotInterestedTVListPK notInterestedTVListPK;
    @Size(max = 255)
    @Column(name = "posterPath")
    private String posterPath;
    @Size(max = 255)
    @Column(name = "name")
    private String name;

    public NotInterestedTVList() {
    }

    public NotInterestedTVList(NotInterestedTVListPK notInterestedTVListPK) {
        this.notInterestedTVListPK = notInterestedTVListPK;
    }

    public NotInterestedTVList(int userID, int tvID) {
        this.notInterestedTVListPK = new NotInterestedTVListPK(userID, tvID);
    }

    public NotInterestedTVListPK getNotInterestedTVListPK() {
        return notInterestedTVListPK;
    }

    public void setNotInterestedTVListPK(NotInterestedTVListPK notInterestedTVListPK) {
        this.notInterestedTVListPK = notInterestedTVListPK;
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
        hash += (notInterestedTVListPK != null ? notInterestedTVListPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotInterestedTVList)) {
            return false;
        }
        NotInterestedTVList other = (NotInterestedTVList) object;
        if ((this.notInterestedTVListPK == null && other.notInterestedTVListPK != null) || (this.notInterestedTVListPK != null && !this.notInterestedTVListPK.equals(other.notInterestedTVListPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.NotInterestedTVList[ notInterestedTVListPK=" + notInterestedTVListPK + " ]";
    }
    
}
