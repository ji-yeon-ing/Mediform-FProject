package kr.or.ddit.doctor.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

// 처방 오더 컬럼
@Data
public class PrescriptionOrderVO {
	
	private String clnicNo;			// 진료 번호(식별)
	private String rceptNo;         // 접수 번호(식별)        
	private String medcinCd;        // 약물 코드 (식별)
	private String prscrptnCd;		// 처방 코드(기본키)
	private String prscrptnNm;      // 약품명(NotNull)
	private double mdctnCpcty;        // 1회 투여 용량(NotNull)
	private String mdctnUnit;       // 1회 투여 단위(NotNull)  
	private int mdctnCo;            // 투여 횟수(NotNull)
	private String mdctnPd;         // 투여 기간(NotNull)   
	private String mdctnCoursUsage;	// 투여 경로 및 용법(NotNull)
	
	
	private List<String> medcinCdList;
	private List<String> prscrptnNmList;
	private List<String> mdctnCpctyList;
	private List<String> mdctnUnitList;
	private List<String> mdctnCoList;
	private List<String> mdctnPdList;
	private List<String> mdctnCoursUsageList;
	
	// 주사 총합 가격
	private int injectionTotalPrice;
	// 링거 총합 가격
	private int poTotalPrice;

	private String medcinMfbiz; // 업체명
	private String medcinPc; // 약품가격
	private String medcinStandard; // 규격
}
