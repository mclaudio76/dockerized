package com.example.demo;

public class Greeting {
	public String message = "";
	
	public Greeting() {
		
	}
	
	
	private Greeting(String s) {
		this.message = s;
	}
	
	public static Greeting createGreeting(String s) {
		return new Greeting(s);
	}
	
}
