package com.WHamoud.demo.security;

import com.WHamoud.demo.model.Role;
import io.jsonwebtoken.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
public class JwtUtils {
    @Value("${jwt.secret}")
    String jwtSecret;
    public String generateJwt(MonUserDetails userDetails) {

        Map<String, Object> donnees = new HashMap<>();
        donnees.put("nom",userDetails.getUtilisateur().getNom());
        donnees.put("prenom",userDetails.getUtilisateur().getPrenom());

        String roles = "";

        for (Role role : userDetails.getUtilisateur().getRoles()){
            roles += role.getNom()+ ",";
        }
        donnees.put("roles",  roles);

        return Jwts.builder()
                .setClaims(donnees)
                .setSubject(userDetails.getUsername())
                .signWith(SignatureAlgorithm.HS256, jwtSecret)
                .compact();

    }

    public Claims getData(String jwt) {

        return Jwts.parser()
                .setSigningKey(jwtSecret)
                .parseClaimsJws(jwt)
                .getBody();
    }

    public boolean isTokenValide(String jwt) {

        try {
            Claims donnees = getData(jwt);
        } catch (SignatureException e) {

            return false;
        }

        return true;
    }

}
