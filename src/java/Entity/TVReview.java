/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stanl
 */
@Entity
@Table(name = "TVReview")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TVReview.findAll", query = "SELECT t FROM TVReview t")
    , @NamedQuery(name = "TVReview.findByTelevisionID", query = "SELECT t FROM TVReview t WHERE t.tVReviewPK.televisionID = :televisionID")
    , @NamedQuery(name = "TVReview.findByPeopleID", query = "SELECT t FROM TVReview t WHERE t.tVReviewPK.peopleID = :peopleID")
    , @NamedQuery(name = "TVReview.findByDate", query = "SELECT t FROM TVReview t WHERE t.date = :date")})
public class TVReview implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TVReviewPK tVReviewPK;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "review")
    private String review;
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;

    public TVReview() {
    }

    public TVReview(TVReviewPK tVReviewPK) {
        this.tVReviewPK = tVReviewPK;
    }

    public TVReview(int televisionID, int peopleID) {
        this.tVReviewPK = new TVReviewPK(televisionID, peopleID);
    }

    public TVReviewPK getTVReviewPK() {
        return tVReviewPK;
    }

    public void setTVReviewPK(TVReviewPK tVReviewPK) {
        this.tVReviewPK = tVReviewPK;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tVReviewPK != null ? tVReviewPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TVReview)) {
            return false;
        }
        TVReview other = (TVReview) object;
        if ((this.tVReviewPK == null && other.tVReviewPK != null) || (this.tVReviewPK != null && !this.tVReviewPK.equals(other.tVReviewPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.TVReview[ tVReviewPK=" + tVReviewPK + " ]";
    }
    
}
