package com.WHamoud.demo.model;

import com.WHamoud.demo.view.VueUtilisateur;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Getter
@Setter
//@Table(name= "utilisateur") Si on veut un nom de class différent du nom de table
public class Emploi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonView(VueUtilisateur.class)
    private Integer id;
    @JsonView(VueUtilisateur.class)
    private String nom;





}
