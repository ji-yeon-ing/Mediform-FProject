package kr.or.ddit.calender.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calender.service.IVacationService;
import kr.or.ddit.calender.service.ISchedulerService;
import kr.or.ddit.calender.vo.SchedulerVO;
import kr.or.ddit.calender.vo.VacationVO;
import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mediform/scheduler")
@Controller
public class SchedulerController {
	
	@Inject
	private ISchedulerService schedulerService;
	
	@Inject
	private IVacationService managerVacationService;
	
	// 필터를 위한 전역변수
	private String department;			// 부서
	private String searchtype;			// 타입
	private String searchword;			// 날짜
	private String startDt;				// 날짜
	private String endDt;				// 날짜
	private String emp;					// 사번
	
	// 일정 main
	@RequestMapping("/main")
	public String schedulerMain(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "searchSchStart") String searchType,
			@RequestParam(required = false) String searchWord,
			SchedulerVO schedulerVO,
			VacationVO vacationVO,
			Authentication authentication,
			Model model) {
		log.info("schedulerMain() 실행중...!");
		
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		String empNo = customUser.getEmployee().getEmpNo();
		schedulerVO.setSchdlEmpNo(empNo);
		emp = empNo;
		
		PaginationInfoVO<SchedulerVO> pagingVO = new PaginationInfoVO<SchedulerVO>(20,5);
		
		log.info("searchWord" + searchWord);
		searchtype = searchType;
		searchword = searchWord;
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);				// 날짜
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		String dep = schedulerVO.getSchdlDep();
		String start = schedulerVO.getSearchFilterSchStart();
		String end = schedulerVO.getSearchFilterSchEnd();
		department = dep;
		startDt = start;
		endDt = end;
		
		// 검색 필터 적용시
		if(schedulerVO.isFilterFlag()) {
			pagingVO.setSearchVO(schedulerVO);
			model.addAttribute("schedulerVO", schedulerVO);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = 0;
		if(pagingVO.getSearchVO() != null || pagingVO.getSearchWord() != null) {
			totalRecord = schedulerService.selectSchedulerFilterCount(pagingVO);
		}else{
			totalRecord = schedulerService.selectSchedulerCount(pagingVO);
		}
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<SchedulerVO> dataList = null;
		if(pagingVO.getSearchVO() != null || pagingVO.getSearchWord() != null) {
			dataList = schedulerService.selectSchedulerFilterList(pagingVO);
		}else {
			dataList = schedulerService.selectSchedulerList(pagingVO);
		}
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		vacationVO.setVcatnSelfEmpno(empNo);
		List<VacationVO> vacationList = managerVacationService.selectVacationList(vacationVO);
		List<VacationVO> signupList = managerVacationService.selectSignupList(vacationVO);
		model.addAttribute("vacationList", vacationList);
		model.addAttribute("signupList", signupList);
		
		
		String goPage = goPage(customUser);
		
		return goPage;
	}
	
	// 로그인별로 페이지 이동 jsp
	public String goPage(CustomUser customUser) {
	      log.info("구분 : " + customUser.getEmployee().getEmpSe());
	      
	      String goPage = "";
	      if(customUser.getEmployee().getEmpSe().equals("a")) {
	         goPage = "admin/scheduler";
	      }else if(customUser.getEmployee().getEmpSe().equals("n")) {
	         goPage = "nurse/scheduler";
	      }else if(customUser.getEmployee().getEmpSe().equals("d")) {
	         goPage = "doctor/scheduler";
	      }else if(customUser.getEmployee().getEmpSe().equals("t")) {
	         goPage = "therapist/scheduler";
	      }else if(customUser.getEmployee().getEmpSe().equals("m")) {
	         goPage = "manager/scheduler";
	      }else if(customUser.getEmployee().getEmpSe().equals("k")) {
	         goPage = "manager/scheduler";
	      }
	      
	      return goPage;
	}
	
	// 캘린더 조회
	@ResponseBody
	@GetMapping("/list")
	public List<Map<String, Object>> schedulerMap(){
		log.info("schedulerMap() 실행중...!");
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<SchedulerVO> calenderList;
		
		if(department != null || searchword != null || endDt != null) {
			HashMap<String, String> searchSchMap = new HashMap<String, String>();
			searchSchMap.put("department", department);
			searchSchMap.put("emp", emp);
			searchSchMap.put("startDt", startDt);
			searchSchMap.put("endDt", endDt);
			searchSchMap.put("searchType", searchtype);
			searchSchMap.put("searchWord", searchword);
			calenderList = schedulerService.schedulerMapFilterList(searchSchMap);
		}else {
			calenderList = schedulerService.schedulerMapList();
		}
		
		for(SchedulerVO calender : calenderList) {
			map.put("id", calender.getSchdlCd()); 								// 코드
			map.put("title", calender.getSchdlNm()); 							// 일정명
			map.put("schdlDep", calender.getSchdlDep()); 						// 부서 구분
			map.put("description", calender.getSchdlCn());						// 일정내용
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			map.put("pstgDt", sdf.format(calender.getPstgDt()));				// 게시일시
			
			if(calender.getSchdlUpdDt() != null) {
				map.put("schdlUpdDt", sdf.format(calender.getSchdlUpdDt()));	// 수정일시
			}
			
			map.put("start", calender.getSchdlBgngDt()); 						// 일정시작
			map.put("end", calender.getSchdlEndDt()); 							// 일정끝
			
			map.put("searchFilterSchStart", startDt); 							// 일정 시작
			map.put("searchFilterSchEnd", endDt); 								// 일정 끝
			
			map.put("className", calender.getSchdlColor());						// 색깔
			map.put("schdlAllDay", calender.getSchdlAllDay());					// 하루종일
			
			jsonObj = new JSONObject(map);
			jsonArr.add(jsonObj);
		}
		log.info("제이슨 배열", jsonArr);
		
		return jsonArr;
	}
	
	// 일정 추가
	@PostMapping(value = "/insert")
	public String schedulerInsert(SchedulerVO schedulerVO, Authentication authentication) {
		log.info("schedulerInsert() 실행중...!");
		
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		String empNo = customUser.getEmployee().getEmpNo();
		
		String goPage = null;
		ServiceResult status = schedulerService.schedulerInsert(schedulerVO);
		if(status.equals(ServiceResult.OK)) {
			log.info("등록 성공!!!");
			goPage = "redirect:/mediform/scheduler/main";
		}else {
			log.info("등록 실패!!!");
			goPage = goPage(customUser);
		}
		
		return goPage;
	}
	
	// 일정 수정 (폼)
	@PostMapping("/update")
	public String calenderUpdate(SchedulerVO schedulerVO, Authentication authentication) {
		log.info("schedulerUpdate() 실행중...!");
		
		String goPage = null;
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		String empNo = customUser.getEmployee().getEmpNo();
		
		ServiceResult result = schedulerService.schedulerUpdate(schedulerVO);
		
		if(result.equals(ServiceResult.OK)) {
			log.info("수정 성공!!!");
			goPage = "redirect:/mediform/scheduler/main";
		}else {
			log.info("수정 실패!!!");
			goPage = goPage(customUser);
		}
		
		return goPage;
	}
	
	// 일정 삭제
	@PostMapping("/delete")
	public String schedulerDelete(String schdlCd, Authentication authentication) {
		log.info("schedulerDelete() 실행중...!");

		String goPage = null;
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		String empNo = customUser.getEmployee().getEmpNo();
		
		ServiceResult result = schedulerService.schedulerDelete(schdlCd);
		
		if(result.equals(ServiceResult.OK)) {
			log.info("삭제 성공!!!");
			goPage = "redirect:/mediform/scheduler/main";
		}else {
			log.info("삭제 실패!!!");
			goPage = goPage(customUser);
		}
		
		return goPage;
	}
		
	
	
}
