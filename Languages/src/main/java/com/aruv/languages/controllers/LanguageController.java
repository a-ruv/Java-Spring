package com.aruv.languages.controllers;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aruv.languages.models.Language;
import com.aruv.languages.services.LanguageService;

@Controller
public class LanguageController {
	
	@Autowired
	LanguageService langService;
	
	
	//create
	@PostMapping("/language/create")
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Language> languages = langService.allLang();
			model.addAttribute("languages", languages);
			return "index.jsp";
		}else {
			langService.createLang(language);
			return "redirect:/language";
		}
	}
	
	//read
	@GetMapping("/")
	public String index() {
		return "redirect:/language";
	}
	
	@GetMapping("/language")
	public String dashboard(@ModelAttribute("language") Language language, Model model) {
		List<Language> languages = langService.allLang();
		model.addAttribute("languages",languages);
		return "index.jsp";
	}
	
	@GetMapping("/language/show/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language language = langService.findLang(id);
		model.addAttribute("language",language);
		return"show.jsp";
	}
	
	@GetMapping("/language/{id}")
	public String editPage(@PathVariable("id") Long id, Model model) {
		Language language = langService.findLang(id);
		model.addAttribute("language",language);
		return"edit.jsp";
	}
	
	@RequestMapping(value="/language/{id}/edit", method=RequestMethod.PUT)
	public String edit(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}else {
			langService.edit(language);
			return "redirect:/language";
		}
	}
	
	@RequestMapping("/language/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		langService.delete(id);
		return "redirect:/language";
	}
	

}
