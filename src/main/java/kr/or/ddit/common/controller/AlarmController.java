package kr.or.ddit.common.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.service.IAlarmService;
import kr.or.ddit.common.vo.AlarmVO;
import kr.or.ddit.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mediform/alarm")
public class AlarmController {

	@Inject
	private IAlarmService alarmService;
 
	@ResponseBody
	@RequestMapping(value = "/selectAlarmList.do", method = RequestMethod.POST)
	public List<AlarmVO> selectAlarmList(Authentication authentication) {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();
	    String empNo = customUser.getEmployee().getEmpNo();

		List<AlarmVO> alarm = alarmService.selectAlarmList(empNo);
		
		return alarm;
	}

	@ResponseBody
	@RequestMapping(value = "/updateAlarmRead.do", method = RequestMethod.POST)
	public void updateAlarmRead(Authentication authentication) {
		
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
	    String empNo = customUser.getEmployee().getEmpNo();
	    
	    alarmService.updateAlarmRead(empNo);
	}
}
