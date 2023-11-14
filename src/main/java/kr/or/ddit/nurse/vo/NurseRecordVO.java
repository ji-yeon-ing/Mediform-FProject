package kr.or.ddit.nurse.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NurseRecordVO {

	private String nrsRcordCd;    //간호 기록 코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date nrsRcordDe;      //간호 기록 작성일
	private Date year;      //간호 기록 작성일
//	private Date monthtime;      //간호 기록 작성일
	private String empNm;
	private String nrsRcordWrter; //간호 기록 작성자
	private String nrsRcordCn;    //인수인계 내용
	private String nrsRcordMemo;  //간호기록 내역
	private String clinicNo;      //진료번호
	private String rceptNo;       //접수 번호
	private String patntNo;       //환자번호
}
