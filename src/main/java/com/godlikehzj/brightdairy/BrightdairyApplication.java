package com.godlikehzj.brightdairy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class BrightdairyApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(BrightdairyApplication.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(BrightdairyApplication.class, args);
    }
}
