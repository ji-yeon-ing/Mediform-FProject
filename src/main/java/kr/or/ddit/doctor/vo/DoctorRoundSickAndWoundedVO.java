package kr.or.ddit.doctor.vo;

import lombok.Data;

/**
 * 회진시 사용할 상병 테이블
 * @author PC-20
 *
 */
@Data
public class DoctorRoundSickAndWoundedVO {
	private String sckwndCd;			// 상병코드
	private String clnicNo;				// 진료번호
	private String rceptNo;				// 접수번호
	private String patntNo;				// 환자번호
	private String sckwndKr;			// 상병한글명
	private String sckwndEn;			// 상병영문명
	private String bodyCd;				// 환부코드
	private String kcd;					// 질병분류기호
	private int sckwndSe;			// 상병구분
}
