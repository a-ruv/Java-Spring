package com.aruv.book.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.aruv.book.models.Book;
import com.aruv.book.repositories.BookRepository;

@Service
public class BookService {

		private final BookRepository bookRepository;
		
		public BookService(BookRepository bookRepository) {
			this.bookRepository = bookRepository;
		}
		
		public Book findBook(Long id) {
			Optional <Book> book = bookRepository.findById(id);
			if(book.isPresent()) {
				return book.get();
			}else {
				return null;
			}
		}
		public Book createBook(Book book) {
		    return bookRepository.save(book);
		}
		
		public List<Book> allBooks() {
		        return bookRepository.findAll();
		    }
		public Book updateBook(Long id, String title, String desc, String lang, Integer numOfPages) {
			Book book = findBook(id);
			book.setTitle(title);
			book.setDescription(desc);
			book.setLanguage(lang);
			book.setNumberOfPages(numOfPages);
			return bookRepository.save(book);
		}
		
		public void deleteBook(Long id) {
			bookRepository.deleteById(id);
		}
		
}
