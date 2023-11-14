package kr.or.ddit.administration.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.common.vo.ReservationVO;

public interface IReservationService {

	List<ReservationVO> selectList(Map<String, String> map);

	ServiceResult reservationInsert(Map<String, String> map);

	int selectReservationCount(PaginationInfoVO<ReservationVO> pagingVO);

	List<ReservationVO> selectListAll(PaginationInfoVO<ReservationVO> pagingVO);

	ReservationVO reservationSelect(Map<String, String> map);

	ServiceResult reservationDelete(Map<String, String> map);

	ServiceResult reservationUpdate(Map<String, Object> map);

	List<ReservationVO> selectDateList(Map<String, String> map);

	List<ReservationVO> reservationSchedulerList();


}
