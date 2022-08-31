package com.aruv.hellohuman.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HumanController {
	
	@RequestMapping("/")
	public String index(@RequestParam(value="q", required = false) String searchQuery) {
		if(searchQuery == null) {
			return "Hello Human";
			}
		return "Hello " + searchQuery;
	}

}
