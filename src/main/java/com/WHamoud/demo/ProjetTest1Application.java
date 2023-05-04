package com.WHamoud.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import javax.annotation.PostConstruct;

@SpringBootApplication
@EnableJpaAuditing
public class ProjetTest1Application extends SpringBootServletInitializer {

    public static void main(String[] args) {

        SpringApplication.run(ProjetTest1Application.class, args);
    }


}
