package kr.or.ddit.doctor.vo;

import lombok.Data;

@Data
public class SickAndWoundedListVO {

	private String sickcd;	// 상병기호
	private String krnm;	// 한글명
	private String sicknm;  // 영문명
	private String wcd;     // 완전코드구분
	private String msick;   // 주상병사용구분
	private String cdd;     // 법정감염병구분
	private String sex;     // 성별구분
	private String maxAge;  // 상한연령
	private String minAge;  // 하한연령
	
	
}
