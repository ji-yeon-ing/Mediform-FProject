package kr.or.ddit.patient.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mediform/patient")
public class PatientHomeController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String patientHome() {
		log.info("patientHome() 실행");
		return "patient/home";
	}

}
