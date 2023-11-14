package kr.or.ddit.doctor.vo;

import java.util.Date;

import lombok.Data;

/**
 * 의사 회진 내역 VO
 * @author PC-20
 *
 */
@Data
public class DoctorRoundInpatientRecordVO {
	private String inptntNo;			// 기록 번호
	private String hsptlzCd;			// 입원 코드
	private Date inptntDe;				// 작성 일시
	private String doctrEmpno;			// 회진 의사 사번
	private String empNm;				// 회진 의사명
	private String inptntRcord;			// 회진 기록
	private String patntNo;				// 환자번호
	private String patntNm;				// 환자명
	private String inptntEmpno;			// 작성자 사번(사용 안함)
}
