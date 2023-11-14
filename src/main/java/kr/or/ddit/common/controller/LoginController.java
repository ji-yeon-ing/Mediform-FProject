package kr.or.ddit.common.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.service.ILoginService;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.security.CustomUser;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
@RequestMapping("/mediform")
public class LoginController {

	@Inject
	private ILoginService loginService;
	
	@GetMapping(value="/login")
	public String loginForm() {
		return "common/loginForm";
	}
	
	@GetMapping(value="/logout")
	public String logoutForm() {
		return "common/loginForm";
	}
	
	@GetMapping(value="/main")
	public String main() {
		
		return null;
	}
	
	@GetMapping(value="/password/find")
	public String forgotPassword1(Model model) {
		return "common/password";
	}
	
	@PostMapping(value="/password/find")
	@ResponseBody
	public ResponseEntity<Map<String, String>> forgotPassword2(@RequestBody EmployeeVO empVO) throws MessagingException, UnsupportedEncodingException {
//		log.info("empNo : " + empVO.getEmpNo());
		
		Map<String, String> map = new HashMap<>();
		// 사원 정보 체크
		int chkCnt = loginService.findPasswordChk(empVO);
		if(chkCnt > 0) {
			UUID uuid = UUID.randomUUID();
			// 인증번호
			String rndCd = uuid.toString().replace("-", "").substring(0,8);
			
			// 인증시 해당 이메일로 인증번호 발송
			String empEmail = empVO.getEmpEmail();
//			log.info("rndCd : " + rndCd);
//			log.info("empEmail : " + empEmail);
			loginService.sendCode(empEmail, rndCd);
			map.put("rndCd", rndCd);
		}
		
	    return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@PostMapping(value="/password/find/complete")
	@ResponseBody
	public ResponseEntity<String> forgotPasswordComplete(@RequestBody EmployeeVO empVO) throws MessagingException, UnsupportedEncodingException{
//		log.info("empEmail : " + empVO.getEmpEmail());
		
		String empEmail = empVO.getEmpEmail();
		int cnt = loginService.sendPassword(empVO);
		String rst = "";
		if(cnt > 0) {
			rst = "OK";
		}else {
			rst = "FAILED";
		}
		
		return new ResponseEntity<String>(rst, HttpStatus.OK);
	}
	
	
//	@PostMapping(value="/main")
//	public String login(HttpServletRequest req, EmployeeVO employee, Model model) {
//		log.info("login()post 메소드 실행!!!!!!!!!!!");
//		String goPage = "";
//		Map<String, String> errors = new HashMap<String, String>();
//		
//		EmployeeVO employeeVO = loginService.loginCheck(employee);
//		if(employeeVO != null) { // 로그인 성공
//				
//			log.info("%%%%%%%%%%%%%%%%%%로그인 성공!!!!!!!!!!!!!!!!!");
//				
//			HttpSession session =  req.getSession();
//			session.setAttribute("SessionInfo", employeeVO);
//			goPage = "/mediform/admin/employee/insert";
//				
//		}else {
//			model.addAttribute("message", "서버에러, 로그인 정보를 정확하게 입력해주세요");
//			model.addAttribute("member", employee);
//			model.addAttribute("bodyText", "login-page");
//			log.info("%%%%%%%%%%%%%%%%%%SQL오류!!!!!!!!!!!!!!!!!");
//			goPage = "common/loginForm";
//		}
//		
//		
//		return goPage;
//	}
	
	
}
