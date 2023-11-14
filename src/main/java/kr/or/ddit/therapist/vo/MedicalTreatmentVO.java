package kr.or.ddit.therapist.vo;

import lombok.Data;

@Data
public class MedicalTreatmentVO {
	private String mdlrtCd; // 치료코드
	private String mdlrtNm; // 치료명
	private int mdlrtAmount; // 치료금액
	private String mllwncAt; // 급여유무
}
