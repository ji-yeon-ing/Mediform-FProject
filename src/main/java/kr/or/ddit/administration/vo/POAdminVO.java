package kr.or.ddit.administration.vo;

import lombok.Data;

@Data
public class POAdminVO {

	private String clnicNo; // 진료번호
	private String prscrptnCd; // 처방코드
	private String medcin_cd; // 약품코드
	private String prscrptnNm; // 약품명
	private String mdctnUnit; // 1회 투여 단위
	private String mdctnCpcty; // 1회 복용
	private String mdctnCo; // 투여횟수(1일당)
	private String mdctnPd; // 투여기간
	private int medcinPc; // 약품가격
	private int medcinStandard; // 약품 규격
	private String medcinUnit; // 단위
	
}
