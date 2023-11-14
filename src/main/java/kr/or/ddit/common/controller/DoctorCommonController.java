package kr.or.ddit.common.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.administration.service.IRceptService;
import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.doctor.controller.DoctorClinicController;
import kr.or.ddit.doctor.service.IDoctorClinicService;
import kr.or.ddit.doctor.vo.ClinicVO;
import kr.or.ddit.manager.service.IManagerService;
import kr.or.ddit.patient.service.IPatientService;
import kr.or.ddit.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mediform/doctor/room")
@Controller
public class DoctorCommonController {

	@Inject
	private IDoctorClinicService doctorClinicService;
	
	@Inject
	private IManagerService managerService;
	
	@Inject
	private IRceptService receiptService;
	
	@Inject
	private IPatientService patientService;
	
		// 대기환자 리스트 (전체)
		@ResponseBody
		@RequestMapping("/list/waiting")
		public List<ClinicVO> selectwaitingAllList() {
			log.info("receiptList() 실행중...!");
			
			List<ClinicVO> waitingList = doctorClinicService.selectwaitingAllList();	// 대기환자정보
			
			return waitingList;
		}
		
		// 환자 상태 변경
		@ResponseBody
		@RequestMapping("/update/status")
		public ServiceResult updateStatus(@RequestBody Map<String, Object> map){
			log.info("updateStatus() 실행중...!");
			
			ServiceResult result = doctorClinicService.updateStatus(map);
			
			return result;
		}
	
}
