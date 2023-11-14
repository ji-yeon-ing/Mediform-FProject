package kr.or.ddit.doctor.vo;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.common.vo.AuthorityVO;
import lombok.Data;

@Data
public class SelectAllClinicVO {
	
	// 진료
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
	
	// 직원
	private String empNm;
	private String empPw;
	private int empRrno1;
	private int empRrno2;
	private String empTelno;
	private String empZip;
	private String empAdres1;
	private String empAdres2;
	private String empEmail;
	private String empEmail2;
	private String empSexdstn;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private Date empBrthdy;
	private String empDep;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empEncpn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empRetire;
	private String empExp;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empRgsde;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empUpdde;
	private String empHffcAt;
	
	private MultipartFile imgFile;
	private String empProfile;
	
	private String empSign;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empLcns;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empDoctrLcns;
	private String empSe;
	private String empAuthor;
	private String empClsf;
	private String empYrycUse;
	private String empYrycRemndr;
	private String empOffhodUse;
	private String empOffhodRemndr;
	private String empConfm;
	private String RjctResn;
	private String empRqstr;
	private int empLcnsNo;
	private int empDoctrLcnsNo;
	
	private List<AuthorityVO> authList;
	
	// manager/employee/select를 조회할 당시 Tab에서 사용되는 조건 flag에 따라
	// 목록 조회를 달리하기 위해 사용되는 조건 값
	private String etcType;
	
	// 프로필 사진 구분을 위한 변수
	private String imgSrc;
	private String profileFlag;		// 촬영 : 1 , 컴퓨터 파일 : 2
	
	// 환자
	private String patntNm;			// 환자명
	
	@Size(max = 6)
	private int patntRrno1;			// 주민등록번호 앞자리
	@Size(max = 7)
	private int patntRrno2;			// 주민등록번호 뒷자리
	
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "정확한 핸드폰 번호를 입력하세요.")
	private String patntTelno;		// 환자 핸드폰 번호
	
	@Size(max = 5)
	private int patntZip;			// 우편번호
	private String patntAdres1;		// 주소1
	private String patntAdres2;		// 주소2
	private int patntAge;			// 환자 만 나이
	private String patntSexdstn;	// 환자 성별
	
	@Size(max = 3)
	private int patntHeight;		// 환자 키
	
	@Size(max = 3)
	private int patntBdwgh;			// 환자 몸무게
	private String patntBdp;		// 환자 혈액형
	private String patntHlthinsAt;	// 건강보험 유무
	private String patntHsptlzAt;	// 입원여부
	
	private String prtctorNm;		// 보호자 이름
	
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "정확한 핸드폰 번호를 입력하세요.")
	private String prtctorTelno;	// 보호자 핸드폰 번호
	private String patntAgre;		// 개인정보 동의
	
	private String patntMemo;		// 메모사항
	
	// 접수
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date rceptDt; // 접수일시
	private String rceptReason; // 내원사유
	private int rceptSttus; // 접수상태
	private String rceptPriort; // 우선순위 여부
	private String rceptClnc; // 진료실
	
	// 상병
	private List<SickAndWoundedVO> sickAndWoundedVOList;
	// 치료 오더(+치료)
	private List<SelectAllMedicalTreatmentRecordVO> selectAllMedicalTreatmentRecordVO;
	// 검사 오더(+검사)
	private List<MedicalExaminationOrderVO> medicalExaminationOrderVOList;
	// 처방 오더
	private List<PrescriptionOrderVO> prescriptionOrderVOList;
}
