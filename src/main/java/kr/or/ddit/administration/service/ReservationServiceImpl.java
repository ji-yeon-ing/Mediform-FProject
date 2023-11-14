package kr.or.ddit.administration.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.common.vo.ReservationVO;
import kr.or.ddit.mapper.common.ReservationMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReservationServiceImpl implements IReservationService {

	@Inject
	private ReservationMapper reservationMapper;
	
	@Override
	public List<ReservationVO> selectList(Map<String, String> map) {
		return reservationMapper.selectList(map);
	}

	@Override
	public ServiceResult reservationInsert(Map<String, String> map) {
		
		ServiceResult result = null;
		
		int status = reservationMapper.reservationInsert(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int selectReservationCount(PaginationInfoVO<ReservationVO> pagingVO) {
		return reservationMapper.selectReservationCount(pagingVO);
	}

	@Override
	public List<ReservationVO> selectListAll(PaginationInfoVO<ReservationVO> pagingVO) {
		return reservationMapper.selectListAll(pagingVO);
	}

	@Override
	public ReservationVO reservationSelect(Map<String, String> map) {
		return reservationMapper.reservationSelect(map);
	}

	@Override
	public ServiceResult reservationDelete(Map<String, String> map) {
		
		ServiceResult result = null;
		
		int status = reservationMapper.reservationDelete(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
			log.info("삭제 성공!!!!!!");
		}else {
			result = ServiceResult.FAILED;
			log.info("삭제 실패!!!!!!");
		}
		
		return result;
	}

	@Override
	public ServiceResult reservationUpdate(Map<String, Object> map) {
		ServiceResult result = null;
		
		log.info("서비스 시간 : " + map.get("rpatntDttm"));
		
		int status = reservationMapper.reservationUpdate(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
			log.info("수정 성공!!!!!!");
		}else {
			result = ServiceResult.FAILED;
			log.info("수정 실패!!!!!!");
		}
		
		return result;
	}

	@Override
	public List<ReservationVO> selectDateList(Map<String, String> map) {
		
		
		
		return reservationMapper.selectDateList(map);
	}

	@Override
	public List<ReservationVO> reservationSchedulerList() {
		return reservationMapper.reservationSchedulerList();
	}

	

}
