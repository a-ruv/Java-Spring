package com.aruv.dojosandninjas.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.aruv.dojosandninjas.models.Ninja;

public interface NinjaRepository extends CrudRepository<Ninja, Long>{
	
	List<Ninja> findAll();

}
