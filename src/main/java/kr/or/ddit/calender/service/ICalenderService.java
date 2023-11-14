package kr.or.ddit.calender.service;

import java.util.List;

import kr.or.ddit.calender.vo.CalenderVO;
import kr.or.ddit.common.ServiceResult;

public interface ICalenderService {

	// calender 목록 조회
	public List<CalenderVO> calenderList();
	
	// calender 일정 등록
	public ServiceResult calenderInsert(CalenderVO calenderVO);
	
	// calender 일정 수정calenderVO
	public ServiceResult calenderUpdate(CalenderVO calenderVO);
	
	// calender 일정 삭제
	public ServiceResult calenderDelete(String schdlCd);

}
