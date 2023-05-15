package com.WHamoud.demo.model;


import com.WHamoud.demo.view.VueUtilisateur;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
public class Contrat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private LocalDate dateDeCreation;
    private LocalDate dateDeRetour;
    @OneToMany(mappedBy = "contrat")
    List<LigneDeContrat> listeLigneDeContrat;



}
