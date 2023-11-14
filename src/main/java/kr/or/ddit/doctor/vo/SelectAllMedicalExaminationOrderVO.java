package kr.or.ddit.doctor.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SelectAllMedicalExaminationOrderVO {
	
	private String mecCd;			// 검사 번호(기본키)
	private String clnicNo;			// 진료 번호(식별)
	private String rceptNo;			// 접수 번호(식별)
	private String hlthchkpCd;		// 검사 코드(식별)
	private Date hlthchkpDt;		// 검사 일시(Null)
	private String hlthchkpResult;	// 검사 결과(Null)
	private String bodyCd;			// 환부 코드(비식별)(NotNull)
	
	private List<String> hlthchkpCdList;		// 검사 코드 List

	// 일반 검사 총합 금액
	private int hcTotalPrice;
	// 엑스레이 총합 금액
	private int xcTotalPrice;
	
	private String hlthchkpNm;  // 검사명(NotNull)
	private int hlthchkpAmount; // 가격(NotNull)
	private String mllwncAt;    // 급여/비급여여부(NotNull)('N')
	
}
