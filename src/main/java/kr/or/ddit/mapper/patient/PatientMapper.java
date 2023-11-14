package kr.or.ddit.mapper.patient;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.administration.vo.POAdminVO;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.patient.vo.PatientVO;

public interface PatientMapper {
	
	// 환자 리스트 조회
	public List<PatientVO> selectPatientList();

	// 환자 리스트 ajax
	public List<PatientVO> patientSearch(Map<String, String> map);
	
	// 입원 환자 리스트 ajax
	public List<PatientVO> patientHsptlzListSearch(Map<String, String> map);
	
	// 입원 환자 리스트 ajax
	public List<PatientVO> selectHsptlzList();

	// 환자 조회 ajax
	public PatientVO selectPatient(Map<String, String> map);

	// 신규 환자 등록
	public int patientInsert(PatientVO patientVO);
	
	// 환자번호로 환자 정보 조회
	public PatientVO selectPatientOne(String patntNo);

	// 환자 정보 수정
	public int patientUpdate(PatientVO patientVO);

	// 페이징 카운트
	public int selectPatientCout(PaginationInfoVO<PatientVO> pagingVO);
	
	// 페이징 환자 list 조회
	public List<PatientVO> selectPatientPagingList(PaginationInfoVO<PatientVO> pagingVO);

	// 페이징 환자 list 조회, 필터링
	public List<PatientVO> selectPatientPagingList(@Param("pagingVO") PaginationInfoVO<PatientVO> pagingVO, @Param("checkFilter") List<String> checkFilter);

	//차트번호에 따른 환자 조회 ajax
	public PatientVO clnicPatientList(String clnicNo);

	//진료번호에 따른 약 리스트 ajax
	public List<POAdminVO> pOPatientList(Map<String, String> map);

}
