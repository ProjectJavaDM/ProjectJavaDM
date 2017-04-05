package com.ckeckingdocuments.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class CkeckingDocumentsApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(CkeckingDocumentsApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(CkeckingDocumentsApplication.class);
	}
}
