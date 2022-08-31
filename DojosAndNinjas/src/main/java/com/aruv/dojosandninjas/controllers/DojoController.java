package com.aruv.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aruv.dojosandninjas.models.Dojo;
import com.aruv.dojosandninjas.services.DojoService;
import com.aruv.dojosandninjas.services.NinjaService;

@Controller
public class DojoController {

	@Autowired
	DojoService dojoService;
	
	@Autowired
	NinjaService ninjaService;
	
	@GetMapping("/dojos")
	public String index(@ModelAttribute("dojo") Dojo dojo, Model model) {
		List<Dojo>  dojos = dojoService.allDojos();
		model.addAttribute("dojos",dojos);
		return "index.jsp";
	}
	
	@GetMapping("/dojos/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Dojo dojo = dojoService.findDojo(id);
		model.addAttribute("dojo",dojo);
		return "show.jsp";
	}
	
	@PostMapping("/dojos/create")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Dojo>  dojos = dojoService.allDojos();
			model.addAttribute("dojos",dojos);
			return "index.jsp";
		}else {
			dojoService.createDojo(dojo);
			return "redirect:/dojos";
		}
	}
	
}
