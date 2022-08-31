package com.aruv.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.aruv.savetravels.models.Expense;
import com.aruv.savetravels.repos.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepo;
	
	public ExpenseService(ExpenseRepository expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	
	public Expense createExpense(Expense expense) {
		return expenseRepo.save(expense);
	}
	
	public List<Expense> allExpenses(){
		 return expenseRepo.findAll();
	 }
	
	public Expense findExpense(Long id) {
		Optional <Expense> expense = expenseRepo.findById(id);
		if(expense.isPresent() ) {
			return expense.get();
		}else {
			return null;
		}
	}
	
	public Expense editExpense(Expense expense) {
		return expenseRepo.save(expense);
	}
	
	public void deleteExpense(Long id) {
		expenseRepo.deleteById(id);
	}
}
