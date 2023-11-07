package com.QRgenerator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.QRgenerator")
public class QRgeneratorApplication {

	public static void main(String[] args) {
		SpringApplication.run(QRgeneratorApplication.class, args);
		System.out.println("started......................................................");
	}

}
