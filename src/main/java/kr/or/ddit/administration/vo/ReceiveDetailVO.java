package kr.or.ddit.administration.vo;

import lombok.Data;

@Data
public class ReceiveDetailVO {

	private String rcivNo;		// 수납 코드(식별)
	private String clnicNo;     // 진료 번호(식별)
	private String patntNo;     // 환자 번호(식별)
	private int rcivdMdcxm;     // 진찰료(Null)
	private int rcivdHsptlz;    // 입원료(Null)
	private int rcivdCgffd;     // 식대(Null)
	private int rcivdMdct;      // 투약료(Null)
	private int rcivdInjctn;    // 주사료(Null)
	private int rcivdTrt;       // 처치료(Null)
	private int rcivdHlthchkp;  // 검사료(Null)
	private int rcivdDgnss;     // 영상진단료(Null)
	private int rcivdEqp;       // 치료재료대(Null)
	private int rcivdReh;       // 재활 및 물리 치료료(Null)
	private int rcivdTh;        // 도수치료(Null)
	private int rcivdTotamt;    // 총액(Null)
	
}
