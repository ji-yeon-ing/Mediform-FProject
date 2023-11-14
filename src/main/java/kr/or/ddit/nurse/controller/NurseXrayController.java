package kr.or.ddit.nurse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.VoiceOutputVO;
import kr.or.ddit.nurse.service.IXrayVoiceOutService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_NURSE')")
@RequestMapping(value="/mediform/nurse/xray")
public class NurseXrayController {
	
	@Inject
	private IXrayVoiceOutService xrayVoiceOutService;

	@GetMapping(value="/view")
	public String xrayView(Model model) {
		log.info("xrayView 실행");
		
		model.addAttribute("menuSelected", "xRay");
		return "nurse/xray";
	}
	
	
	/**
	 * 음성 방송 list ajax
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/voiceOutput/list", method=RequestMethod.POST)
	public List<VoiceOutputVO> voiceList(){
		
		log.info("voiceList() 실행!!!");
		
		List<VoiceOutputVO> voiceList = xrayVoiceOutService.voiceList(); 
		
		return voiceList;
		
	}
	
	/**
	 * 음성 방송 insert ajax
	 * @param map
	 * @return insert 성공 상태 리턴
	 */
	@ResponseBody
	@RequestMapping(value="/voiceOutput/insert", method=RequestMethod.POST)
	public String voiceInsert(
								@RequestBody Map<String, String> map
								) {
		
		log.info("voiceInsert() 실행!!!!");
		
		ServiceResult result = xrayVoiceOutService.voiceInsert(map);
		
		String stattus = "";
		
		if(result.equals(ServiceResult.OK)) {
			log.info("인서트 성공!!!!");
			stattus = "success";
		}else {
			log.info("인서트 실패!!!");
			stattus = "fail";
		}
		
		return stattus;
		
	}
	
	/**
	 * 음성방송 선택 ajax
	 * @param map
	 * @return 선택한 음성 방송 내용 리턴
	 */
	@ResponseBody
	@RequestMapping(value="/voiceOutput/select", method=RequestMethod.POST)
	public VoiceOutputVO voiceSelect(
								@RequestBody Map<String, String> map
								) {
		
		
		log.info("voiceSelect() 실행!!!");
		
		VoiceOutputVO voiceOutputVO = xrayVoiceOutService.voiceSelect(map);
		
		log.info("가져온 음성 내용 >>>>> " + voiceOutputVO.getVoiceOtptCn());
		
		return voiceOutputVO;
		
	}
	
	/**
	 * 음성 방송 내용 수정 ajax
	 * @param map
	 * @return 성공 상태 리턴
	 */
	@ResponseBody
	@RequestMapping(value="/voiceOutput/update", method=RequestMethod.POST)
	public String voiceUpdate(
								@RequestBody Map<String, String> map
								) {
		
		
		log.info("voiceUpdate() 실행!!!");
		
		ServiceResult result = xrayVoiceOutService.voiceUpdate(map);
		
		String stattus = "";
		
		if(result.equals(ServiceResult.OK)) {
			log.info("업데이트 성공!!!!");
			stattus = "success";
		}else {
			log.info("업데이트 실패!!!");
			stattus = "fail";
		}
		
		return stattus;
		
	}
	
	
	/**
	 * 음성 방송 내용 삭제 ajax
	 * @param map
	 * @return 성공 상태 리턴
	 */
	@ResponseBody
	@RequestMapping(value="/voiceOutput/delete", method=RequestMethod.POST)
	public String voiceDelete(
								@RequestBody Map<String, String> map
								) {
		
		
		log.info("voiceDelete() 실행!!!");
		
		ServiceResult result = xrayVoiceOutService.voiceDelete(map);
		
		String stattus = "";
		
		if(result.equals(ServiceResult.OK)) {
			log.info("업데이트 성공!!!!");
			stattus = "success";
		}else {
			log.info("업데이트 실패!!!");
			stattus = "fail";
		}
		
		return stattus;
		
	}
	
	
	
	
	
	
	
	
}
