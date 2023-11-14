package kr.or.ddit.calender.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.calender.vo.SchedulerVO;
import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.PaginationInfoVO;

public interface ISchedulerService {

	// calender 목록 조회
	public List<SchedulerVO> schedulerMapList();
	
	// calender 필터링 조회
	public List<SchedulerVO> schedulerMapFilterList(HashMap<String, String> searchSchMap);

	// calender 일정 등록
	public ServiceResult schedulerInsert(SchedulerVO schedulerVO);
	
	// calender 일정 수정calenderVO
	public ServiceResult schedulerUpdate(SchedulerVO schedulerVO);
	
	// calender 일정 삭제
	public ServiceResult schedulerDelete(String schdlCd);

	// count 조회
	public int selectSchedulerCount(PaginationInfoVO<SchedulerVO> pagingVO);
	
	// 필터된 count
	public int selectSchedulerFilterCount(PaginationInfoVO<SchedulerVO> pagingVO);

	// 필터된 list
	public List<SchedulerVO> selectSchedulerFilterList(PaginationInfoVO<SchedulerVO> pagingVO);
	
	// list 조회
	public List<SchedulerVO> selectSchedulerList(PaginationInfoVO<SchedulerVO> pagingVO);






}
