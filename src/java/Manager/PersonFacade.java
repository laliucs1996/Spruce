/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.Person;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Stanl
 */
@Stateless
public class PersonFacade extends AbstractFacade<Person> {

    @PersistenceContext(unitName = "sprucePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PersonFacade() {
        super(Person.class);
    }
    
    public Person getPerson(long peopleID) {
        return em.find(Person.class, peopleID);
    }
    
    public List<Person> searchPeople(String s) {
        String arr[] = s.split(" ");
        String query = "SELECT p FROM Person p WHERE p.name LIKE '%" + arr[0] + "%'";
        for(int i = 1; i < arr.length; i++) {
            query += " AND p.name LIKE '%" + arr[i] + "%'";
        }
        return em.createQuery(query).getResultList();
    }
    
}
