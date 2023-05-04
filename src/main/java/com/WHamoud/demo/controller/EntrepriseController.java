package com.WHamoud.demo.controller;

import com.WHamoud.demo.dao.EntrepriseDao;
import com.WHamoud.demo.model.Entreprise;
import com.WHamoud.demo.view.VueEntreprise;
import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EntrepriseController {

    @Autowired
    private EntrepriseDao entrepriseDao;

    @GetMapping("/entreprises")
    @JsonView(VueEntreprise.class)
    public List<Entreprise> getListeEntreprise(){

        return entrepriseDao.findAll();
    }

    @GetMapping("/entreprise/{id}")
    @JsonView(VueEntreprise.class)
    public Entreprise getEntreprise(@PathVariable int id){
        Entreprise entreprise = entrepriseDao
                .findById(id)
                .orElse(null);
        return entreprise;
    }

    @DeleteMapping("/admin/entreprise/{id}")
    public boolean supprimeEntreprise(@PathVariable int id){
        entrepriseDao.deleteById(id);
        return true;
    }

    @PostMapping("/admin/entreprise")
    public Entreprise enregistrerEntreprise(@RequestBody Entreprise entrepriseAenregistrer){
        entrepriseDao.save(entrepriseAenregistrer);
        return entrepriseAenregistrer;
    }
}
