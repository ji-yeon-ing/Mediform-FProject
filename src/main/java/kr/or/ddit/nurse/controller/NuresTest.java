package kr.or.ddit.nurse.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_NURSE')")
@RequestMapping("/mediform/nurse")
public class NuresTest {
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String Nursechat() {
		log.info("Nursechat() 실행");
		return "nurse/chat";
	}

	
	@RequestMapping(value = "/roomorder", method = RequestMethod.GET)
	public String Nurseorder() {
		log.info("Nurseorder() 실행");
		return "nurse/roomorder";
	}
	
	@RequestMapping(value = "/timeline", method = RequestMethod.GET)
	public String Nursetimeline() {
		log.info("Nursetimeline() 실행");
		return "nurse/timeLine";
	}
}
