package kr.or.ddit.manager.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.common.vo.PatientStatisticsVO;
import kr.or.ddit.manager.service.IManagerStatisticsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ManagerCommonController {

	@Inject
	private IManagerStatisticsService statisticsService;
	
	/**
	 * 공통으로 사용할 환자 통계(현재 환자 수, 누적 환자 수, 대기 환자 수 등)
	 * @return
	 */
	@PostMapping(value="/mediform/manager/patient/statistics/select")
	public ResponseEntity<PatientStatisticsVO> getPatientStatistics(){
		
		PatientStatisticsVO patientStatisticsVO =  statisticsService.getPatientStatistics();
		return new ResponseEntity<PatientStatisticsVO>(patientStatisticsVO, HttpStatus.OK);
	}
}
