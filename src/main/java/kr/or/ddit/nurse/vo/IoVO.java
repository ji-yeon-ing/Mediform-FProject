package kr.or.ddit.nurse.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class IoVO {
	
	private String ioCd;     //io코드
	private String empNo;    //작성자 사번
	private String ioOut;    // 배출종류
	private String ioNtk;    //섭취 종류
	private String hsptlzCd; // 입원 코드
	private String patntNo;  // 환자번호
	private int ioOutMl;     // 배출량 
	private int ioNtkMl;     // 섭취량
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm" )
	private Date ioDate;     // 시행일자
	
	
}
