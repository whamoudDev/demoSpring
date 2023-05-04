package com.WHamoud.demo.security;

import com.WHamoud.demo.dao.UtilisateurDao;
import com.WHamoud.demo.model.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MonUserDetailsService implements UserDetailsService {
@Autowired
private UtilisateurDao utilisateurDao;
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<Utilisateur> optional = utilisateurDao.findByEmail(email);
       if(optional.isEmpty()){
           throw new UsernameNotFoundException("l'utilisateur n'existe pas");
       }
        return new MonUserDetails(optional.get());
    }
}
