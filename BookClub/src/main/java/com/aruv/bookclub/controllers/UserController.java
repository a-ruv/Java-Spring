package com.aruv.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.aruv.bookclub.models.Book;
import com.aruv.bookclub.models.LoginUser;
import com.aruv.bookclub.models.User;
import com.aruv.bookclub.services.BookService;
import com.aruv.bookclub.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService uServ;
	
	@Autowired
	private BookService bServ;
	
	@GetMapping("/")
	public String index(@ModelAttribute("user") User user, @ModelAttribute("loginUser") LoginUser loginUser, HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/dashboard";
		}
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		Long id = (Long) session.getAttribute("user_id");
		User user = uServ.getOne(id);
		List<Book> books = bServ.allBooks();
		model.addAttribute("user",user);
		model.addAttribute("books",books);
		return "dashboard.jsp";
	}
		
	
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user")User user, BindingResult result, Model model, HttpSession session) {
		User newUser = uServ.register(user, result);
		
		if(result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		}
		
		session.setAttribute("user_id", newUser.getId());
		
		return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser")LoginUser loginUser, BindingResult result, Model model, HttpSession session) {
		User newUser = uServ.login(loginUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("user", new User());
			return "index.jsp";
		}
		
		session.setAttribute("user_id", newUser.getId());
		
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		return "redirect:/";
	}
	
}
