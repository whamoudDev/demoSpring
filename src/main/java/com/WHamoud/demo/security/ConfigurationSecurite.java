package com.WHamoud.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.sql.DataSource;

@EnableWebSecurity
public class ConfigurationSecurite extends WebSecurityConfigurerAdapter {
    @Autowired
    private DataSource dataSource;

    @Autowired
    private MonUserDetailsService monUserDetailsService;
    @Autowired
    JwtFilter filtre;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        //1ère méthode avec les données dans le code
        //        auth
//                .inMemoryAuthentication()
//                .withUser("walid")
//                .password("root")
//                .roles("UTILISATEUR")
//                .and()
//                .withUser("admin")
//                .password("azerty")
//                .roles("ADMINISTRATEUR");

        //2ème méthode avec une connexion bdd pour vérifier l'user
//        auth
//                .jdbcAuthentication()
//                .dataSource(dataSource)
//                .usersByUsernameQuery("SELECT email, password,1 FROM utilisateur WHERE email = ?")
//                .authoritiesByUsernameQuery(
//                                " SELECT email, IF(admin,'ROLE_ADMINISTRATEUR','ROLE_UTILISATEUR') " +
//                                " FROM utilisateur " +
//                                " WHERE email=?"
//                );

        auth.userDetailsService(monUserDetailsService);
    }

    @Bean
    public PasswordEncoder creationPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and()
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/connexion", "/inscription", "/utilisateur-par-pays/**").permitAll()
                .antMatchers("/**").hasAnyRole("ADMIN", "USER");

        http.addFilterBefore(filtre, UsernamePasswordAuthenticationFilter.class);
    }
}

