package kr.or.ddit.common.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.controller.AlarmHandler;
import kr.or.ddit.common.vo.AlarmVO;
import kr.or.ddit.mapper.common.AlarmMapper;

@Service
public class AlarmServiceImpl implements IAlarmService{

	@Inject
	private AlarmMapper alarmMapper;
	
	@Inject
	private AlarmHandler alarmHandler;

	@Override
	public void insertAlarm(AlarmVO alarmVo) {
			
		// 1) DB예 알람 정보 insert
		alarmMapper.insertAlarm(alarmVo);
		
		// 2) WebSocket 접속한 사용자에게 알림 발송
		alarmHandler.sendMessageToAll(alarmVo);
	}

	@Override
	public List<AlarmVO> selectAlarmList(String empNo) {
		return alarmMapper.selectAlarmList(empNo);
	}

	@Override
	public void updateAlarmRead(String empNo) {
		alarmMapper.updateAlarmRead(empNo);
		
	}
	
	

}
