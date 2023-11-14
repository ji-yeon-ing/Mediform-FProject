package kr.or.ddit.manager.service;

import java.util.List;

import kr.or.ddit.common.vo.PatientStatisticsVO;
import kr.or.ddit.manager.vo.StatisticsVO;

/**
 * 행정관리자 통계 관련 서비스
 * @author PC-20
 *
 */
public interface IManagerStatisticsService {

	/**
	 * 감사 일간 통계
	 * @return
	 */
	public List<StatisticsVO> dayAuditList();

	/**
	 * 감사 주간 통계
	 * @return
	 */
	public List<StatisticsVO> weekAuditList();

	/**
	 * 감사 월간 통계
	 * @return
	 */
	public List<StatisticsVO> monthAuditList();

	/**
	 * 감사 연간 통계
	 * @return
	 */
	public List<StatisticsVO> yearAuditList();

	/**
	 * 감사 통계
	 * @return
	 */
	public List<StatisticsVO> accessAuditList();

	/**
	 * 성별 통계
	 * @return
	 */
	public List<StatisticsVO> genderSumList();

	/**
	 * 나이 통계
	 * @return
	 */
	public List<StatisticsVO> ageSumList();

	/**
	 * 주소 통계
	 * @return
	 */
	public List<StatisticsVO> addrList();

	/**
	 * 시간 통계
	 * @return
	 */
	public List<StatisticsVO> timeList();

	/**
	 * 재원 통계
	 * @return
	 */
	public List<StatisticsVO> revisitList();

	/**
	 * 의사별 통계
	 * @return
	 */
	public List<StatisticsVO> doctorStatisticsList();

	/**
	 * 일간 수납 통계
	 * @return
	 */
	public List<StatisticsVO> dayReceiveList();

	/**
	 * 주간 수납 통계
	 * @return
	 */
	public List<StatisticsVO> weekReceiveList();

	/**
	 * 월간 수납 통계
	 * @return
	 */
	public List<StatisticsVO> monthReceiveList();

	/**
	 * 연간 수납 통계
	 * @return
	 */
	public List<StatisticsVO> yearReceiveList();

	/**
	 * 평균 일간 통계
	 * @return
	 */
	public List<StatisticsVO> avgDayList();

	/**
	 * 상병 통계
	 * @return
	 */
	public List<StatisticsVO> sickStatisticsList();

	/**
	 * 환자 통계
	 * @return
	 */
	public PatientStatisticsVO getPatientStatistics();


}
