package com.aruv.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aruv.bookclub.models.Book;
import com.aruv.bookclub.repos.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bRepo;
	
	public Book createBook(Book book) {
		return bRepo.save(book);
	}
	
	public List<Book> allBooks() {
		return bRepo.findAll();
	}
	
	public Book findBook(Long id) {
		Optional<Book> book = bRepo.findById(id);
		if(book.isPresent()) {
			return book.get();
		}else {
			return null;
		}
	}
	
	public Book update(Book book) {
		return bRepo.save(book);
	}
	
	public void delete(Long id) {
		bRepo.deleteById(id);
	}

}
