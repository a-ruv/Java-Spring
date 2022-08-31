package com.aruv.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.aruv.bookclub.models.Book;
import com.aruv.bookclub.models.User;
import com.aruv.bookclub.services.BookService;
import com.aruv.bookclub.services.UserService;

@Controller
public class BookController {

	@Autowired
	private BookService bServ;
	
	@Autowired
	private UserService uServ;
	
	@GetMapping("/book")
	public String createPage(@ModelAttribute("book") Book book) {
		return "book.jsp";
	}
	
	@GetMapping("/book/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Book book = bServ.findBook(id);
		model.addAttribute("book",book);
		return "show.jsp";
	}
	
	@GetMapping("/bookmarket/{id}")
	public String bookMarket(@PathVariable("id") Long id, HttpSession session) {
		Book bookByID = bServ.findBook(id);
		Long userId = (Long) session.getAttribute("user_id");
		User oneUser = uServ.getOne(userId);
		
		bookByID.setBorrower(oneUser);
		bServ.update(bookByID);
	
		return "redirect:/dashboard";
		
	}
	
	@GetMapping("/bookmarket/return/{id}")
	public String returnBook(@PathVariable("id") Long id, HttpSession session) {
		Book book = bServ.findBook(id);
		book.setBorrower(null);
		bServ.update(book);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/book/edit/{id}")
	public String editPage(@PathVariable("id") Long id, HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/book";
		}
		Book book = bServ.findBook(id);
		model.addAttribute("book",book);
		return "edit.jsp";
	}
	
	@PutMapping("/book/edit/{id}")
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/dashboard";
		}
		if(result.hasErrors()) {
			return "edit.jsp";
		}else {
			bServ.update(book);
			return "redirect:/dashboard";
		}
		
	}
	
	@GetMapping("/book/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id, HttpSession session) {
		 
//		if(session.getAttribute("userId") == null) {
//			return "redirect:/dashboard";
//		}
    	bServ.delete(id);
    	System.out.println("deleted");
    	return "redirect:/dashboard";
	}
	
	@PostMapping("/book/create")
	public String create(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "book.jsp";
		}else {
			Long id = (Long) session.getAttribute("user_id");
			User user = uServ.getOne(id);
			book.setUser(user);
			bServ.createBook(book);
			return "redirect:/dashboard";
			
		}
	}
}
