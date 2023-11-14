package kr.or.ddit.calender.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.common.vo.EmployeeVO;
import lombok.Data;

@Data
public class VacationVO {
	
	// 일반사원
	private String vcatnCd;				// 휴가 코드
	private String vcatnCl;				// 휴가 분류(반차, 연가, 공가)
	private String vcatnSelfEmpno;		// 휴가 신청자 사번
	private String vcatnSelfEmpnm;		// 휴가 신청자 이름
	private String vcatnSelfEmpse;		// 휴가 신청자 부서
	private String vcatnSelfEmpclsf;	// 휴가 신청자 직위
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date vcatnRqstdt;			// 휴가 신청일
	
	private String vcatnBgndt;			// 휴가 시작일
	private String vcatnEnddt;			// 휴가 종료일
	private String vcatnYrycCo;			// 연차 사용 수
	private String vcatnResn;			// 휴가 사유
	private int vcatnConfmStep;			// 승인 단계(0,1,2)
	
	// 1차 부서 대표
	private String vcatnReprsntEmpno;	// 1차 승인자
	private Date vcatnConfmDt1;			// 1차 승인일시
	
	// 2차 관리자
	private String vcatnConfirmerEmpno;	// 2차 승인자
	private Date vcatnConfmDt2;			// 2차 승인일시
	private String vcatnConfmAt;		// 승인 여부(Y,N)
	private String vcatnColor;			// 휴가 색깔
	
	// 반려(1,2차)                                             
	private String vcatnRjctEmpno;		// 반려자 사번
	private String vcatnRjctResn;		// 반려이유
	private Date vcatnRjctDt;			// 반려자 일시
	
    private String representativeName;	// 1차 대표자 이름
    private String confirmerName;		// 2차 승인자 이름
    private String rejectorName;		// 반려자 이름
	
	private boolean filterFlag;			// 검색 플래그
	private String searchType;			// 검색 타입
	private String searchWord;			// 검색어
	private String searchDep;			// 부서 검색
	private String searchVacStart;		// 필터를 위한 시작 날짜
	private String searchVacEnd;		// 필터를 위한 끝 날짜
	
	private EmployeeVO employeeVO;
	private List<EmployeeVO> employeeList;
	
}
