package kr.or.ddit.doctor.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DoctorRoundMedicalExamOrderVO {
	
	private String mecCd;			// 검사 번호(기본키)
	private String clnicNo;			// 진료 번호(식별)
	private String rceptNo;			// 접수 번호(식별)
	private String hlthchkpCd;		// 검사 코드(식별)
	private Date hlthchkpDt;		// 검사 일시(Null)
	private String hlthchkpResult;	// 검사 결과(Null)
	
	// 검사 테이블의 컬럼
	private String hlthchkpNm;  // 검사명(NotNull)
}
