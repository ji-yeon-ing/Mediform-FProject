package kr.or.ddit.calender.service.Impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calender.service.ISchedulerService;
import kr.or.ddit.calender.vo.SchedulerVO;
import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.mapper.calender.SchedulerMapper;

@Service
public class SchedulerServiceImpl implements ISchedulerService{
	
	@Inject
	private SchedulerMapper schedulerMapper;
	
	// calender 일정 목록 조회
	@Override
	public List<SchedulerVO> schedulerMapList() {
		return schedulerMapper.schedulerMapList();
	}

	// calender 필터링 조회
	@Override
	public List<SchedulerVO> schedulerMapFilterList(HashMap<String, String> searchSchMap) {
		return schedulerMapper.schedulerMapFilterList(searchSchMap);
	}
	
	// 일정 등록
	@Override
	public ServiceResult schedulerInsert(SchedulerVO schedulerVO) {
		ServiceResult result = null;
		
		int status = schedulerMapper.schedulerInsert(schedulerVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
	// 일정 수정
	@Override
	public ServiceResult schedulerUpdate(SchedulerVO schedulerVO) {
		ServiceResult result = null;
		
		int status = schedulerMapper.schedulerUpdate(schedulerVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// 일정 삭제
	@Override
	public ServiceResult schedulerDelete(String schdlCd) {
		ServiceResult result = null;
		
		int status = schedulerMapper.schedulerDelete(schdlCd);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// cout 조회
	@Override
	public int selectSchedulerCount(PaginationInfoVO<SchedulerVO> pagingVO) {
		return schedulerMapper.selectSchedulerCount(pagingVO);
	}

	// list 조회
	@Override
	public List<SchedulerVO> selectSchedulerList(PaginationInfoVO<SchedulerVO> pagingVO) {
		return schedulerMapper.selectSchedulerList(pagingVO);
	}
	
	// 필터된 count
	@Override
	public int selectSchedulerFilterCount(PaginationInfoVO<SchedulerVO> pagingVO) {
		return schedulerMapper.selectSchedulerFilterCount(pagingVO);
	}

	// 필터된 list
	@Override
	public List<SchedulerVO> selectSchedulerFilterList(PaginationInfoVO<SchedulerVO> pagingVO) {
		return schedulerMapper.selectSchedulerFilterList(pagingVO);
	}



}
