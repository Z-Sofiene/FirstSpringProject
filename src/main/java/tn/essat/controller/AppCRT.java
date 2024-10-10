package tn.essat.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import tn.essat.dao.IDepartement;
import tn.essat.dao.IEmploye;
import tn.essat.dao.IProjet;
import tn.essat.model.Departement;
import tn.essat.model.Employe;
import tn.essat.model.Projet;


@Controller
public class AppCRT {
	
	@Autowired
	private IEmploye daoEmp;
	@Autowired
	private IProjet daoProj;
	@Autowired
	private IDepartement daoDep;
	
	@GetMapping("/home") //OK
	public String getAllDepartements(Model model) {
		List<Departement> liste = daoDep.findAll(); 
	    model.addAttribute("depts", liste);
	    return "departements";
	}
	
	@GetMapping("/addDepartmentForm") //OK
	public String PreAjoutDepartement(Model m) {
		Departement dpt = new Departement();
		m.addAttribute("dpt", dpt);
		return "addDepartement";
	}
	
	
	@PostMapping("/saveDepartement") //OK
	public String saveDepartement(Model m, @ModelAttribute Departement dpt) {
	    daoDep.save(dpt);
	    return "redirect:/home";
	}

	@GetMapping("/deleteDepartement/{id}") //OK
	public String deleteDepartement(Model m, @PathVariable("id") int id) {
	    daoDep.deleteById(id);
	    return "redirect:/home";
	}
	// employe
	@GetMapping("/employes/dept/{id}") //OK
	public String getAllEmployesByDept(Model m, @PathVariable("id") int id) {
		List<Employe> liste = daoEmp.getAllEmployesByDept(id);
		Optional<Departement> dpt = daoDep.findById(id);
	    m.addAttribute("emps", liste);
	    m.addAttribute("dpt", dpt);
	    return "employes_dep";
	}
	
	@GetMapping("/addEmployeForm") //OK
	public String PreAjoutEmploye(Model m) {

	    Employe emp = new Employe();
	    
	    m.addAttribute("emp", emp);
	    
	    List<Departement> departements = daoDep.findAll(); 
	    List<Projet> projets = daoProj.findAll(); 
	    
	    m.addAttribute("departements", departements);
	    m.addAttribute("projets", projets);
	    
	    return "addEmploye";
	}
	
	
	@PostMapping("/saveEmploye") //OK
	public String saveEmploye(Model m, @ModelAttribute Employe emp) {
	    daoEmp.save(emp);
	    return "redirect:/home";
	}

	@GetMapping("/employes/dept/deleteEmploye/{id}") //OK
	public String deleteEmploye(Model m, @PathVariable("id") int id) {
		
		Optional<Employe> emp = daoEmp.findById(id);
	    if (emp.isPresent()) {

	        int id_dpt = emp.get().getDept().getId();
	        daoEmp.deleteById(id);
	        return "redirect:/employes/dept/" + id_dpt;
	    }
	    return "redirect:/home";
	}
	// Projet
	@GetMapping("/projets/dept/{id}") //OK
	public String getAllProjetsByDept(Model m, @PathVariable("id") int id) {
		List<Projet> liste = daoProj.getAllProjetsByDept(id);
		Optional<Departement> dpt = daoDep.findById(id);
	    m.addAttribute("proj", liste);
	    m.addAttribute("dpt", dpt);
	    return "projets";
	}
	
	@GetMapping("/addProjetForm") //OK
	public String PreAjoutProjet(Model m) {
		
		Projet proj = new Projet();
		m.addAttribute("proj", proj);
  
	    List<Departement> departements = daoDep.findAll(); 
	    
	    m.addAttribute("dpt", departements);

		return "addProjet";
	}
	
	
	@PostMapping("/saveProjet") //OK
	public String saveProjet(Model m, @ModelAttribute Projet proj) {
	    daoProj.save(proj);
	    return "redirect:/home";
	}

	@GetMapping("/projets/dept/deleteProjet/{id}") //OK
	public String deleteProjet(Model m, @PathVariable("id") int id) {
	    
	    Optional<Projet> proj = daoProj.findById(id);
	    
	    if (proj.isPresent()) {

	        int id_dpt = proj.get().getDept().getId();
	        daoProj.deleteById(id);
	        return "redirect:/projets/dept/" + id_dpt;
	    }
	    return "redirect:/home";

	}
	
	
	// employe ft projet
	

	@GetMapping("/employes/projet/{id}") //OK
	public String getAllEmployesByProjet(Model m, @PathVariable("id") int id) {
		List<Employe> liste = daoEmp.getAllEmployesByProjet(id);
		Optional<Projet> proj = daoProj.findById(id);
	    m.addAttribute("emps", liste);
	    m.addAttribute("proj", proj);
	    return "employes_projet";
	}



}


