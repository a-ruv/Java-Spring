package com.aruv.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.aruv.dojosandninjas.models.Dojo;
import com.aruv.dojosandninjas.models.Ninja;
import com.aruv.dojosandninjas.services.DojoService;
import com.aruv.dojosandninjas.services.NinjaService;

@Controller
public class NinjaController {

	@Autowired
	NinjaService ninjaService;
	
	@Autowired
	DojoService dojoService;
	
	@GetMapping("/ninja")
	public String createPage(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> dojos =  dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "ninja.jsp";
	}
	
	@PostMapping("/ninja/create")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Dojo> dojos =  dojoService.allDojos();
			model.addAttribute("dojos", dojos);
			return "ninja.jsp";
		}else {
			ninjaService.createNinja(ninja);
			return "redirect:/dojos";
		}
	}
}
