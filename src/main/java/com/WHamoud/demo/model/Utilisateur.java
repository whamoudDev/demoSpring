package com.WHamoud.demo.model;

import com.WHamoud.demo.view.VueEntreprise;
import com.WHamoud.demo.view.VueUtilisateur;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;


@Entity
@Getter
@Setter
//@Table(name= "utilisateur") Si on veut un nom de class différent du nom de table
public class Utilisateur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonView({VueUtilisateur.class, VueEntreprise.class})
    private Integer id;

    //@Column(name= "nom") // Si on souhaite faire correspondre un nom de table avec un nom d'attribut différent.
    @Column(length=50, nullable = false)// On définit la taille max de cette colonne et on précise si on peut mettre null ou pas.
    @JsonView({VueUtilisateur.class, VueEntreprise.class})
    private String nom;

    @Column(length=80, nullable = true)// On définit la taille max de cette colonne et on précise si on peut mettre null ou pas.
    @JsonView({VueUtilisateur.class, VueEntreprise.class})
    private String prenom;

    @JsonView({VueUtilisateur.class, VueEntreprise.class})
    private String email;
    private String password;

    @JsonView({VueUtilisateur.class,  VueEntreprise.class})
    private  String nomImageProfil;
    @CreationTimestamp
    @JsonView({VueUtilisateur.class, VueEntreprise.class})
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @JsonView({VueUtilisateur.class, VueEntreprise.class})
    private LocalDateTime updateAt;



    @JsonView({VueUtilisateur.class, VueEntreprise.class})
    @ManyToMany
    @JoinTable(name= "roles" , inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles = new ArrayList< >();

    @ManyToOne
    @JsonView(VueUtilisateur.class)
    private Pays pays;

    @ManyToOne
    @JsonView(VueUtilisateur.class)
    private Entreprise entreprise;

    @ManyToMany
    @JoinTable(
            name= "recherche_emploi_utilisateur",
            inverseJoinColumns = @JoinColumn(name= "emploi_id")
    )

    @JsonView(VueUtilisateur.class)
    private Set<Emploi> emploisRecherche = new HashSet<>();


}
