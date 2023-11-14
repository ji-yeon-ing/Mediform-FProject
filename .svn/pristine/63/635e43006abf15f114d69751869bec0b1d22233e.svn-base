package kr.or.ddit.doctor.vo;

import java.util.Date;
import java.util.List;

import kr.or.ddit.nurse.vo.VitalVO;
import kr.or.ddit.patient.vo.PatientVO;
import lombok.Data;

/**
 * 의사 회진 관련 VO
 * @author PC-20
 *
 */
@Data
public class DoctorRoundVO {
	
	private String hsptlzCd;				// 입원코드
	private String clnicNo;					// 진료번호
	private String rceptNo;					// 접수번호
	private String patntNo;					// 환자번호
	private String hsptlzSckrm;				// 배정병실
	private String hsptlzSckbd;				// 배정병상
	
	private Date hsptlzDe;					// 입원날짜
	private Date prarndeLhstl;				// 퇴원 예정일
	private Date realLhstl;					// 실제 퇴원일
	
	// 진료 내역 관련 List
	private List<DoctorRoundClinicVO> clinicList;
	
	// 회진 내역 List
	private List<DoctorRoundInpatientRecordVO> inpatientRecordList;
	
	// 치료기록지 List
	private List<DoctorRoundOtptRecordVO> otptRecordList;
	
	// NurseRecord List
	private List<DoctorRoundNurseRecordVO> nurseRecordList;
	
	// 환자정보
	private PatientVO patientVO;
	
	// 바이탈
	private VitalVO vitalVO;
	
}
