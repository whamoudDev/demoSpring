package com.WHamoud.demo.controller;

import com.WHamoud.demo.dao.UtilisateurDao;
import com.WHamoud.demo.model.ImageDto;
import com.WHamoud.demo.model.Role;
import com.WHamoud.demo.model.Utilisateur;
import com.WHamoud.demo.security.JwtUtils;
import com.WHamoud.demo.services.FichierService;
import com.WHamoud.demo.view.VueUtilisateur;
import com.fasterxml.jackson.annotation.JsonView;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@CrossOrigin
public class UtilisateurController {
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    private UtilisateurDao utilisateurDao;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    FichierService fichierService;


    @GetMapping("/utilisateurs")
    @JsonView(VueUtilisateur.class)
    public List<Utilisateur> getUtilisateurs() {

        List<Utilisateur> listeUtilisateur = utilisateurDao.findAll();

        return listeUtilisateur;
    }

    @GetMapping("/utilisateur/{id}")
    @JsonView(VueUtilisateur.class)
    public ResponseEntity<Utilisateur> getUtilisateur(@PathVariable int id) {

        //   return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

        Optional<Utilisateur> optional = utilisateurDao.findById(id);
        // return optional.orElse(null);

        if (optional.isPresent()) {
            return new ResponseEntity<>(optional.get(), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @GetMapping("/profil")
    @JsonView(VueUtilisateur.class)
    public ResponseEntity<Utilisateur> getProfil(@RequestHeader("Authorization") String bearer) {

        String jwt = bearer.substring(7);
        Claims donnees = jwtUtils.getData(jwt);
        //System.out.println(donnees.getSubject());ici on recupere l'email sur la console, on teste avec postman avec "get"
        Optional<Utilisateur> utilisateur = utilisateurDao.findByEmail(donnees.getSubject());
        if (utilisateur.isPresent()) {
            return new ResponseEntity(utilisateur.get(), HttpStatus.OK);

        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    @GetMapping("/image-profil/{idUtilisateur}")
    public ResponseEntity<byte[]> getImageProfil(@PathVariable int idUtilisateur) {
        Optional<Utilisateur> optional = utilisateurDao.findById(idUtilisateur);

        if(optional.isPresent()){
            String nomImage = optional.get().getNomImageProfil();

            try {
                byte[] image = fichierService.getImageByName(nomImage);
                HttpHeaders enTete = new HttpHeaders();
                String mimeType= Files.probeContentType(new File(nomImage).toPath());
                enTete.setContentType(MediaType.valueOf(mimeType));

                return new ResponseEntity<>(image,enTete,HttpStatus.OK);

            } catch (FileNotFoundException e) {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            } catch (IOException e) {
                System.out.println("Le test du mimetype");
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PostMapping("/admin/utilisateur")
    public ResponseEntity<Utilisateur> ajoutUtilisateur(
            @RequestPart("utilisateur") Utilisateur nouvelUtilisateur,
            @Nullable @RequestParam("fichier") MultipartFile fichier
    ) {
        //Si l'utilisateur fournit, possède un id
        if (nouvelUtilisateur.getId() != null) {
            Optional<Utilisateur> optional = utilisateurDao.findById(nouvelUtilisateur.getId());

            //Si c'est un update
            if (optional.isPresent()) {
                Utilisateur userToUpdate = optional.get();
                userToUpdate.setNom(nouvelUtilisateur.getNom());
                userToUpdate.setPrenom(nouvelUtilisateur.getPrenom());
                userToUpdate.setEmail(nouvelUtilisateur.getEmail());
                userToUpdate.setPays(nouvelUtilisateur.getPays());

                utilisateurDao.save(userToUpdate);
                if (fichier != null) {
                    try {
                        fichierService.transfertVersDossierUpload(fichier, "imageTest");
                    } catch (IOException e) {
                        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
                    }
                }
                return new ResponseEntity<>(nouvelUtilisateur, HttpStatus.OK);
            }
            //Si il y a eu une tentative d'insertion d'un utilisateur avec un id qui n'existait pas
            return new ResponseEntity<>(nouvelUtilisateur, HttpStatus.BAD_REQUEST);
        }
        Role role = new Role();
        role.setId(1);
        nouvelUtilisateur.setRole(role);

        String passwordHache = passwordEncoder.encode("root");
        nouvelUtilisateur.setPassword(passwordHache);

        if (fichier != null) {
            try {
                String monImage = UUID.randomUUID() + "_" + fichier.getOriginalFilename();
                nouvelUtilisateur.setNomImageProfil(monImage);

                fichierService.transfertVersDossierUpload(fichier, monImage);


            } catch (IOException e) {
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
        utilisateurDao.save(nouvelUtilisateur);
        return new ResponseEntity<>(nouvelUtilisateur, HttpStatus.CREATED);
    }

    @DeleteMapping("/admin/utilisateur/{id}")
    @JsonView(VueUtilisateur.class)
    public ResponseEntity<Utilisateur> supprimerUtilisateur(@PathVariable int id) {

        Optional<Utilisateur> utilisateurAsupprimer = utilisateurDao.findById(id);

        if (utilisateurAsupprimer.isPresent()) {
            utilisateurDao.deleteById(id);
            return new ResponseEntity<>(null, HttpStatus.OK);
        }


        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }


    @GetMapping("/utilisateur-par-pays/{nomPays}")
    @JsonView(VueUtilisateur.class)
    public List<Utilisateur> getUtilisateur(@PathVariable String nomPays){


        return utilisateurDao.trouveUtilisateurSelonPays(nomPays);
    }

}
