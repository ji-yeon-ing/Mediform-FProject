package kr.or.ddit.administration.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.administration.service.IEmployeeService;
import kr.or.ddit.common.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mediform/admin")
public class AdminEmployeeSanctionController {

	@Inject
	//@Resource()
//	@Autowired
//	@Qualifier()
	private IEmployeeService employeeService;
	
	
	// 직원 계정 승인 요청 화면 출력 메소드
	@RequestMapping(value = "/employee/insert", method = RequestMethod.GET)
	public String employeeInsertForm(Model model) {
		
		log.info("employeeInsertForm() 실행!!!");	
		
		model.addAttribute("menuSelected", "sanction");
		
		return "admin/employeeInsertForm";
	}
	
	// 직원 계정 승인 요청 메소드
	@RequestMapping(value = "/employee/insert", method = RequestMethod.POST)
	public String employeeInsert(
			HttpServletRequest req,
			EmployeeVO employeeVO, Model model) {
		
		log.info("employeeInsert() 실행!!!");
		
		String goPage = "";
		
		model.addAttribute("menuSelected", "sanction");
		
//		Map<String, String> errors = new HashMap<String, String>();
//		if(StringUtils.isBlank(employeeVO.getMemId())) {
//			errors.put("memId", "아이디를 입력해주세요");
//		}
//		if(StringUtils.isBlank(employeeVO.getMemPw())) {
//			errors.put("memPw", "비밀번호를 입력해주세요");
//		}
//		if(StringUtils.isBlank(employeeVO.getMemName())) {
//			errors.put("memName", "이름를 입력해주세요");
//		}
		
		
		ServiceResult result = employeeService.employeeInsert(req, employeeVO);
		if(result.equals(ServiceResult.OK)) {
			log.info("#####################성공##################");
			model.addAttribute("employee", "success");
			goPage = "redirect:/mediform/admin/employee/insert";
		}else {
			log.info("#####################실패##################");
			model.addAttribute("employee", employeeVO);
				
		}
		
			return goPage;
	}
	
	@RequestMapping(value="/mediform/admin/employee/profile/image/upload")
    public ModelAndView createImage (HttpServletRequest request) throws Exception{
        
        String binaryData = request.getParameter("imgSrc");
        FileOutputStream stream = null;
        ModelAndView mav = new ModelAndView();
        mav.setViewName("jsonView");        
        try{
            System.out.println("binary file   "  + binaryData);
            if(binaryData == null || binaryData=="") {
                throw new Exception();    
            }
            
         
            binaryData = binaryData.replaceAll("data:image/png;base64,", "");
            byte[] file = Base64.decodeBase64(binaryData);
            System.out.println("file  :::::::: " + file + " || " + file.length);
            String fileName=  UUID.randomUUID().toString();
            
            stream = new FileOutputStream("d:\\test2\\"+fileName+".png");
            stream.write(file);
            stream.close();
            System.out.println("파일 작성 완료");
            mav.addObject("msg","ok");
            
        }catch(Exception e){
            System.out.println("파일이 정상적으로 넘어오지 않았습니다");
            mav.addObject("msg","no");
            return mav;
        }finally{
            stream.close();
        }
        return mav;
        
    }
	
}
