package com.WHamoud.demo.controller;

import com.WHamoud.demo.dao.PaysDao;
import com.WHamoud.demo.model.Pays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin
public class PaysController {

    @Autowired
    private PaysDao paysDao;

    @GetMapping("/liste-pays")
    public List<Pays> getPays() {


        List<Pays> listePays = paysDao.findAll();

        return listePays;
    }

    @GetMapping("/pays/{id}")
    public ResponseEntity<Pays> getPaysWalid(@PathVariable int id) {
        Optional<Pays> optional = paysDao.findById(id);
        // return optional.orElse(null);

        if (optional.isPresent()) {
            return new ResponseEntity<>(optional.get(), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PostMapping("/admin/pays")
    public ResponseEntity<Pays> ajoutPays(@RequestBody Pays nouvelPays) {
        //Si l'pays fournit, possède un id
        if (nouvelPays.getId() != null) {
            Optional<Pays> optional = paysDao.findById(nouvelPays.getId());

            //Si c'est un update
            if (optional.isPresent()) {
                paysDao.save(nouvelPays);
                return new ResponseEntity<>(nouvelPays, HttpStatus.OK);
            }
            //Si il y a eu une tentative d'insertion d'un pays avec un id qui n'existait pas
            return new ResponseEntity<>(nouvelPays, HttpStatus.BAD_REQUEST);
        }

        paysDao.save(nouvelPays);
        return new ResponseEntity<>(nouvelPays,HttpStatus.CREATED);
    }

        @DeleteMapping("/admin/pays/{id}")
        public ResponseEntity<Pays> supprimerPays ( @PathVariable int id){

        Optional<Pays> paysAsupprimer= paysDao.findById(id);

        if(paysAsupprimer.isPresent()){
            paysDao.deleteById(id);
            return new ResponseEntity<>(paysAsupprimer.get(),HttpStatus.OK);
        }


            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
