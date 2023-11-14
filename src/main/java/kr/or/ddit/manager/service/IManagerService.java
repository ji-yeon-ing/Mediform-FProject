package kr.or.ddit.manager.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.apache.poi.ss.usermodel.Workbook;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.vo.ScheduleDataVO;
import kr.or.ddit.manager.vo.WorkScheduleVO;

public interface IManagerService {

	/**
	 * 사원 상세 조회
	 * @param empNo
	 * @return
	 */
	public EmployeeVO getEmployee(String empNo);

	/**
	 * 반려 처리
	 * @param empVO
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public ServiceResult rejectUpdate(EmployeeVO empVO) throws MessagingException, UnsupportedEncodingException;

	/**
	 * 승인 처리
	 * @param empVO
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public ServiceResult agreeEmployee(EmployeeVO empVO) throws MessagingException, UnsupportedEncodingException;

	/**
	 * 권한 삭제
	 * @param empVO
	 * @return
	 */
	public int deleteAuth(EmployeeVO empVO);

	/**
	 * 직원 수정
	 * @param empVO
	 * @return
	 */
	public int updateEmp(EmployeeVO empVO);

	/**
	 * 퇴사 처리
	 * @param empVO
	 * @return
	 */
	public int retireEmp(EmployeeVO empVO);

	/**
	 * 멤버 조회를 위한 count
	 * @param empPagingVO
	 * @return
	 */
	public int selectEmpCount(PaginationInfoVO<EmployeeVO> empPagingVO);

	/**
	 * 멤버 목록 조회
	 * @param empPagingVO
	 * @return
	 */
	public List<EmployeeVO> selectEmpList(PaginationInfoVO<EmployeeVO> empPagingVO);

	/**
	 * 직원조직도(orgChart)를 위한 List
	 * @return
	 */
	public List<EmployeeVO> ogzChart();

	/**
	 * 직급 체크
	 * @param empVO
	 * @return
	 */
	public int clsfCheck(EmployeeVO empVO);

	/**
	 * 전체 숫자
	 * @return
	 */
	public Map<String, Integer> allCnt();

	/**
	 * 양식 다운로드를 위한 메서드
	 * @param reqYm
	 * @return
	 */
	public Workbook excelNurseScheduleDownload(String reqYm);

	/**
	 * 일정표 등록
	 * @param wsList
	 * @return
	 */
	public int insertWorkSchedule(List<WorkScheduleVO> wsList);

	/**
	 * 스케줄 체크
	 * @param thisYm
	 * @return
	 */
	public int scheduleInsertCheck(String thisYm);

	/**
	 * 일정 삭제
	 * @param thisYm
	 */
	public void deleteSchedule(String thisYm);

	/**
	 * 일자 계산
	 * @param tempDate
	 * @return
	 */
	public Map<String, Object> daysCalculator(String tempDate);

	/**
	 * 직원 수 계산
	 * @param tempDate
	 * @return
	 */
	public List<ScheduleDataVO> empScheduleCnt(String tempDate);

	/**
	 * 근무 종류 분류
	 * @param tempDate
	 * @return
	 */
	public List<ScheduleDataVO> dateScheduleCnt(String tempDate);

	/**
	 * 근무 리스트 출력
	 * @param tempDate
	 * @return
	 */
	public List<WorkScheduleVO> workScheduleList(String tempDate);

	/**
	 * 신청 처리 완료 내역을 위한 카운트
	 * @param pagingVO
	 * @return
	 */
	public int completeCount(PaginationInfoVO<EmployeeVO> pagingVO);

	/**
	 * 신청 처리 완료 내역 리스트
	 * @param pagingVO
	 * @return
	 */
	public List<EmployeeVO> completeList(PaginationInfoVO<EmployeeVO> pagingVO);

	/**
	 * 신청 목록
	 * @return
	 */
	public List<EmployeeVO> confirmList();




}
