package com.WHamoud.demo.dao;

import com.WHamoud.demo.model.Pays;
import com.WHamoud.demo.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaysDao extends JpaRepository<Pays,Integer> {



}
