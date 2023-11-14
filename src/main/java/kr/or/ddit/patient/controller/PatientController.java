package kr.or.ddit.patient.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.service.IAlarmService;
import kr.or.ddit.common.vo.AlarmVO;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.patient.ServiceResult;
import kr.or.ddit.patient.service.IPatientService;
import kr.or.ddit.patient.vo.PatientVO;
import kr.or.ddit.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mediform/patient")
public class PatientController {
	
	@Inject
	private IPatientService patientService;
	
	@Inject
	private IAlarmService alarmService;
	
	// 환자 list 조회
	@RequestMapping(value = "/list")
	public String patientList(Model model) {
		log.info("patientList() 실행...!");
		
		List<PatientVO> patientList = patientService.selectPatientList();
		
		model.addAttribute("patientList", patientList);
		
		return "patient/patientList";
	}
	
	// 환자 페이징 &검색 list 조회
	@RequestMapping(value = "/paginglist")
	public String patientPagingList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "patntnm") String searchType,
			@RequestParam(required = false) String searchWord,
			PatientVO patientVO,
			Model model) {
		log.info("patientPagingList() 실행...!");
		
		PaginationInfoVO<PatientVO> pagingVO = new PaginationInfoVO<PatientVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		// 검색 필터 적용시
		if(patientVO != null && patientVO.isFilterFlag()) {
			pagingVO.setSearchVO(patientVO);
			model.addAttribute("patientVO", patientVO);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = patientService.selectPatientCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<PatientVO> dataList = patientService.selectPatientPagingList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "patient/patientPagingList";
	}
	
	// 환자 검색(ajax)
	@ResponseBody
	@PostMapping("/search")
	public List<PatientVO> patientSearch(@RequestBody Map<String, String> map) {
		
		List<PatientVO> patientList = patientService.patientSearch(map);
		
		log.info("patientList : "+ patientList);
		return patientList;
	}
	
	// 환자 정보 조회(ajax)
	@ResponseBody
	@PostMapping("/info")
	public PatientVO patientInfo(@RequestBody Map<String, String> map) {
		
		PatientVO patientInfo = patientService.selectPatient(map);
		
		log.info("patientInfo : "+ patientInfo);
		return patientInfo;
	}
	
	// 환자 전체 정보 조회(ajax)
	@ResponseBody
	@PostMapping("/searchList")
	public List<PatientVO> patientSearchList() {
		
		List<PatientVO> patientList = patientService.selectPatientList();
		
		log.info("patientList : "+ patientList);
		return patientList;
	}
	// 입원환자  키워드 검색(ajax)
	@ResponseBody
	@PostMapping("/hsptlzSearch")
	public List<PatientVO> patientHsptlzList(@RequestBody Map<String, String> map) {
		
		List<PatientVO> hsptlzList = patientService.patientHsptlzListSearch(map);
		
		log.info("hsptlzList : "+ hsptlzList);
		return hsptlzList;
	}

	
	// 입원환자만 정보 조회(ajax)
	@ResponseBody
	@PostMapping("/HsptlzInfo")
	public List<PatientVO> selectHsptlzList() {
		
		List<PatientVO> patientHsptlzInfo = patientService.selectHsptlzList();
		
		log.info("patientHsptlzInfo : "+ patientHsptlzInfo);
		return patientHsptlzInfo;
	}
		
	
	// 신규 환자 등록
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String patientInsert(PatientVO patientVO, Model model, RedirectAttributes ra, Authentication authentication) {
		log.info("patientInsert() 실행중...!");
		
		String goPage = "";
		
		ServiceResult result = patientService.patientInsert(patientVO);
		if(result.equals(ServiceResult.OK)) {
			
			// 로그인 정보
			CustomUser customUser = (CustomUser) authentication.getPrincipal();
		    String empNo = customUser.getEmployee().getEmpNo();
					
			// 박유빈 : 환자등록 성공 시, 알람 등록
			// 1) DB예 알람 정보 insert
			// 2) WebSocket 접속한 사용자에게 알림 발송
			AlarmVO alarmVo = new AlarmVO();
			alarmVo.setAlarmWriter(empNo);
			alarmVo.setAlarmCn("NEW_PATIENT|신규 환자가 등록되었습니다. (" + patientVO.getPatntNm() + ")");
			alarmService.insertAlarm(alarmVo);
						
			log.info("환자등록 성공");
			ra.addFlashAttribute("insertPatient", "insertPatient");
			goPage = "redirect:/mediform/patient/paginglist";
		}else {
			log.info("환자등록 실패");
			goPage = "patient/patientPagingList";
			model.addAttribute("patientVO", patientVO);
		}
		
		return goPage;
	}
	
	// 환자 상세 정보
	@ResponseBody
	@RequestMapping("/updateForm")
	public PatientVO patientUpdateForm(@RequestBody String patntNo) {
		log.info("patientUpdateForm() 실행...!");
		
		PatientVO patientList = patientService.selectPatientOne(patntNo);
		
		return patientList;
	}
	
	// 환자 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String patientUpdate(PatientVO patientVO, Model model) {
		log.info("patientUpdate() 실행중...!");
	
		String goPage = null;
		String msg = null;
		
		ServiceResult result = patientService.patientUpdate(patientVO);
		if(result.equals(ServiceResult.OK)) {
			log.info("환자 정보 수정 성공");
			msg = "정상적으로 수정되었습니다.";
			goPage = "redirect:/mediform/patient/paginglist";
		}else {
			log.info("환자 정보 수정 실패");
			msg = "환자 정보 수정에 실패하였습니다.";
			model.addAttribute("patientVO", patientVO);
			goPage = "patient/patientPagingList";
		}
		
//			model.addAttribute("msg", msg);
		return goPage;
	}
	
	
}
