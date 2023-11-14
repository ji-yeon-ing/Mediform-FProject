package kr.or.ddit.administration.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PdfController {

	@GetMapping("/form")
	public String form() {
		return "form";
	}
	
	@PostMapping("/form")
	public String formresult(@RequestParam Map<String, Object> gian, Model model) {
		for(Object value : gian.values()) {
			log.info(value.toString());
		}
		
		model.addAttribute("gian", gian);
		return "formresult";
	}

}
