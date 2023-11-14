package kr.or.ddit.therapist.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MedicalTreatmentRecordVO {
	private String clnicNo; // 진료번호
	private String rceptNo; // 접수번호
	private String mdlrtCd; // 치료코드
	private String mdlrtCurer; // 치료사
	private String bodyCd; // 환부
	private Date mdlrtDt; // 치료시간
	private String mdlrtrdCd; //치료오더코드
	private String mdlrtrdChk; // 치료여부
	private String mdlrtCl; // 물리, 작업 구분
	
	
	private String mdlrtNm; // 치료명
	private int mdlrtAmount; // 치료금액
	private String mllwncAt; // 급여유무
}
