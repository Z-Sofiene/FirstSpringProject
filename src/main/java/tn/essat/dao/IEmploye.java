package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tn.essat.model.Employe;
@Repository
public interface IEmploye extends JpaRepository<Employe, Integer> {
	@Query("select e from Employe e where e.dept.id=:x")
	public List<Employe> getAllEmployesByDept(@Param("x") int id);
	@Query("select e from Employe e where e.projet.id=:x")
	public List<Employe> getAllEmployesByProjet(@Param("x") int id);
}
