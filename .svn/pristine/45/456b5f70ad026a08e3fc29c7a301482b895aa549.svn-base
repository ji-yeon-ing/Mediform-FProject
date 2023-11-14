package kr.or.ddit.manager.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ManagerSanctionVO {
	private String porderCd;									// 발주서 코드
	private String porderCt;									// 구분
	private Date porderDate;									// 주문일
	private String porderEmpno;									// 기안자
	private String empNm;										// 기안자명
	private String porderConfmNo;								// 승인 단계
	private String porderConfm;									// 승인여부
	private int porderTotal;									// 총 금액
	private String porderAuth1;									// 1차 승인/반려자
	private String porderAuth1Nm;								// 1차 승인/반려자명
	private String porderAuth2;									// 2차 승인/반려자
	private String porderAuth2Nm;								// 2차 승인/반려자
	private Date porderConfmDt;									// 최종 승인 일시
	private String rjctResn;									// 2차 승인자 반려사유
	
	private List<ManagerSanctionDetailVO> sanctionDetailList; 	// 상세 발주 목록

	
	
}
