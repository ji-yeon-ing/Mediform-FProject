package kr.or.ddit.mapper.calender;

import java.util.List;

import kr.or.ddit.calender.vo.CalenderVO;

public interface CalenderMapper {
	
	// 일정목록 조회
	public List<CalenderVO> calenderList();
	
	// 일정 등록
	public int calenderInsert(CalenderVO calenderVO);
	
	// 일정 수정
	public int calenderUpdate(CalenderVO calenderVO);
	
	// 일정 삭제
	public int calenderDelete(String schdlCd);


}
