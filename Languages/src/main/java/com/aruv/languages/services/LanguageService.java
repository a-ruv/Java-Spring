package com.aruv.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.aruv.languages.models.Language;
import com.aruv.languages.repos.LanguageRepository;

@Service
public class LanguageService {
	
	private final LanguageRepository langRepo;
	
	public LanguageService(LanguageRepository langRepo) {
		this.langRepo = langRepo;
	}
	
	public Language createLang(Language lang) {
		return langRepo.save(lang);
	}
	
	public List<Language> allLang(){
		return langRepo.findAll();
	}
	
	public Language findLang(Long id) {
		Optional <Language> lang = langRepo.findById(id);
		if(lang.isPresent()) {
			return lang.get();
		}else {
			return null;
		}
	}
	
	public Language edit(Language lang) {
		return langRepo.save(lang);
	}
	
	public void delete(Long id) {
		langRepo.deleteById(id);
	}

}
