package kr.or.ddit.doctor.vo;

import java.util.Date;

import lombok.Data;

/**
 * 회진 시 사용할 치료기록지
 * @author PC-20
 *
 */
@Data
public class DoctorRoundOtptRecordVO {
	
	private String otptCd;				// 치료기록지 코드
	private String clnicNo;				// 진료번호
	private String rceptNo;				// 접수번호
	private String patntNo;				// 환자번호
	private String patntNm;				// 환자명
	private String patntSexdstn;		// 성별
	private String otptAppeal;			// 주호소
	private String otptHistory;			// 과거력
	private String orientTime;			// 인지지남력시간
	private String orientPlace;			// 인지지남력장소
	private String orientPerson;		// 인지지남력사람
	private String otptStm;				// 인지 단기기억력
	private String otptLtm;				// 인지 장기기억력
	private String otptSt;				// 언어
	private String otptDysp;			// 삼킴
	private String otptPd;				// 이동
	private String mustUbRight;			// 근긴장도 상지 오른쪽
	private String mustUbLeft;			// 근긴장도 상지 왼쪽
	private String mustLbRight;			// 근긴장도 하지 오른쪽
	private String mustLbLeft;			// 근긴장도 하지 왼쪽
	private String mainCntrvs;			// 주요문제점
	private String lngtrCoal;			// 장기목표
	private String srtpdCoal;			// 단기목표
	private String mustPlan;			// 계획
	private String mustEtc;				// 기타사항
	private Date mdlrtDt;				// 치료일시
}
