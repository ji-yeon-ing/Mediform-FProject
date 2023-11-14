package kr.or.ddit.nurse.vo;


import java.util.Date;

import lombok.Data;

@Data
public class MedicineVO {

	//약품 재고
	private String medcinCd;
	private String medcinNm;
	private int medcinInvntry;
	private String medcinMfbiz;
	private String mdctnCours;
	private int medcinPc;
	private int medcinStandard;
	private String medcinUnit;
	

	
}
