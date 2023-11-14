package kr.or.ddit.therapist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mediform/therapist")
public class TherapistMHRLSController {
	
	// MHRLS 메서드
		@RequestMapping(value = "/MHRLS/list", method = RequestMethod.GET)
		public String therapistMHRLS(Model model) {
			log.info("therapistMHRLS() 실행");
			
			return "therapist/MHRLS";
		}
}
