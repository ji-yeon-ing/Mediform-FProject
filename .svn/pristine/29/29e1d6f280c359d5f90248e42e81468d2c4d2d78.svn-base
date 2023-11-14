package kr.or.ddit.nurse.controller;

import java.util.Locale;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_NURSE')")
@RequestMapping("/mediform/nurse")
public class NurseHomeController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String Nursehome() {
		log.info("nurseHome() 실행");
		return "nurse/home";
	}
	
	@GetMapping("/patient")
	public String clinicForm(Model model) {
		return "nurse/patient";
	}
	
	@GetMapping("/order")
	public String recordForm() {
		return "nurse/order";
	}
	
	@GetMapping("/medicine")
	public String medicineForm() {
		return "nurse/medicine";
	}
	
	@GetMapping("/room")
	public String roomForm(Model model) {
		
		model.addAttribute("menuSelected", "room");
		return "nurse/room";
	}

}
