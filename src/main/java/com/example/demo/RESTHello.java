package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RESTHello {

	@GetMapping(path = "/hello")
	public Greeting helloMe() {
		return  Greeting.createGreeting("This is another test");
	}
}  

