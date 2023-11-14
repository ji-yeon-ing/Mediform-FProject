package kr.or.ddit.calender.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CalenderVO {
	private String schdlCd;			// 일정코드
	private String schdlNm;			// 일정명
	private String schdlCn;			// 일정내용
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date pstgDt; 			// 작성일시
	private String schdlBgngDt; 	// 일정 시작 일시
	private String schdlEndDt;		// 일정 종료 일시
	private String schdlColor;		// 색깔
	private String schdlAllDay;		// 전체일정
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date schdlUpdDt;		// 수정일시
	
}
