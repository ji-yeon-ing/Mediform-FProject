package kr.or.ddit.common.service;

import java.util.List;

import kr.or.ddit.common.vo.AlarmVO;

public interface IAlarmService {

	// 알람 등록
	public void insertAlarm(AlarmVO alarmVo);
	
	// 알람 목록 조회
	public List<AlarmVO> selectAlarmList(String empNo);
	
	// 알람 읽음 처리
	public void updateAlarmRead(String alarmNo);
		
}
