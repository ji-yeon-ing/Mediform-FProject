package kr.or.ddit.doctor.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.common.vo.HealthCheckupVO;
import kr.or.ddit.common.vo.HospitalCertificatesVO;
import kr.or.ddit.common.vo.HospitalizationVO;
import kr.or.ddit.common.vo.MedicalTreatmentVO;
import kr.or.ddit.common.vo.RceptVO;
import kr.or.ddit.patient.vo.PatientVO;
import kr.or.ddit.therapist.vo.OtptRecordVO;
import lombok.Data;

// 진료차트 컬럼
@Data
public class ClinicVO {
	
	private String clnicNo;			// 진료 번호(기본키)
	private String rceptNo;         // 접수 번호(식별)
	private String patntNo;         // 환자번호(식별)
	private String empNo;           // 담당 의사 사번(Null)
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date clnicTime;         // 진료 시간(Null)
	private String clnicCn;         // 진단 내역(Null)
	private String clnicAt;         // 진료 여부(Null)('Y')
	private String beforeClnicNo;	// 이전 진료 번호(Null)
	private String hsptlzAt;        // 입원 여부(Null)('N')
	private String clnicMemo;       // 메모 사항(Null)
	@DateTimeFormat(pattern = "yyyy년 MM월 dd일")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date atfssDt;       // 발병일(Null)
	private int clnicFe;       // 진료비(Null)
	
	private String rceptClnicAt; // 진료여부
	
	// 처방 오더 VO
	private PrescriptionOrderVO prescriptionOrderVO;
	private List<PrescriptionOrderVO> prescriptionOrderVOList;
	// 상병 VO 
	private SickAndWoundedVO sickAndWoundedVO;
	private List<SickAndWoundedVO> sickAndWoundedVOList;
	// 치료 VO
	private MedicalTreatmentVO medicalTreatmentVO;
	private List<MedicalTreatmentVO> medicalTreatmentVOList;
	// 치료 오더 VO
	private MedicalTreatmentRecordVO medicalTreatmentRecordVO;
	private List<MedicalTreatmentRecordVO> medicalTreatmentRecordVOList;
	private SelectAllMedicalTreatmentRecordVO selectMedicalTreatmentRecordVO;
	private List<SelectAllMedicalTreatmentRecordVO> selectMedicalTreatmentRecordVOList;
	// 검사 VO
	private HealthCheckupVO healthCheckupVO;
	private List<HealthCheckupVO> healthCheckupVOList;
	// 검사 오더 VO
	private MedicalExaminationOrderVO medicalExaminationOrderVO;
	private List<MedicalExaminationOrderVO> medicalExaminationOrderVOList;
	// 접수 VO
	private RceptVO rceptVO;
	private List<RceptVO> rceptVOList;
	// 입퇴원 VO
	private HospitalizationVO hospitalizationVO;
	private List<HospitalizationVO> hospitalizationVOList;
	// 물리/작업치료 기록지 VO
	private OtptRecordVO otptRecordVO;
	private List<OtptRecordVO> otptRecordVOList;
	// 직원 VO
	private EmployeeVO employeeVO;
	private List<EmployeeVO> employeeVOList;
	// 환자 VO
	private PatientVO patientVO;
	private List<PatientVO> patientVOList;
	// 제증명 VO
	private HospitalCertificatesVO hospitalCertificatesVO;
	private List<HospitalCertificatesVO> hospitalCertificatesVOList;
	
	private String empNm;
	private String patntNm;
	private String patntHlthinsAt;
	
	private int empDoctrLcnsNo; 
	
	private int patntRrno1;
	private int patntRrno2;
	private int patntZip;
	private String patntAdres1;
	private String patntAdres2;
	private String patntTelno;
	
	private String hcrtfNo;			// 서류 번호(기본키)	
	private String hcrtfDocNote;	// 의사 소견(Null)
	private String hcrtfPrpos;		// 용도(Null)
	private String hcrtfRm;		// 비고(Null)
	private String prsmpAt;		// 추정여부(Null)
	
	private String hsptlzCd;	// 입원 코드(기본키)
	private Date hsptlzDe;      // 입원 날짜(NotNull)
	private Date realLhstl;     // 실제 퇴원일(Null)
	
}
