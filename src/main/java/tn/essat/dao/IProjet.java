package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tn.essat.model.Projet;

@Repository
public interface IProjet extends JpaRepository<Projet, Integer>{
	
	public List<Projet> findByEtat(String etat);
	
	@Query("select p from Projet p where p.dept.id=:x")
	public List<Projet> getAllProjetsByDept(@Param("x") int id);

}
