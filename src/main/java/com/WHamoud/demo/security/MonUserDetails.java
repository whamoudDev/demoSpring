package com.WHamoud.demo.security;

import com.WHamoud.demo.model.Utilisateur;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

public class MonUserDetails implements UserDetails {
    private Utilisateur utilisateur;

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public MonUserDetails(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        //utilisateur.isAdmin()
        // ? List.of(new SimpleGrantedAuthority("ADMINISTRATEUR"))
        // : List.of(new SimpleGrantedAuthority("UTILISATEUR"));

        //return List.of(new SimpleGrantedAuthority(utilisateur.isAdmin() ? "ROLE_ADMINISTRATEUR" : "ROLE_UTILISATEUR"));

        return List.of(new SimpleGrantedAuthority(utilisateur.getRole().getNom()));


    }

    @Override
    public String getPassword() {
        return utilisateur.getPassword();
    }

    @Override
    public String getUsername() {

        return utilisateur.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
