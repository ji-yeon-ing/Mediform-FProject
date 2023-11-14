package kr.or.ddit.common.vo;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class SickbedVO {

	private String sckbdNo; // 병상번호 - 기본키
	private String sckrmNo; // 병실호수 - 외래키 - 복합키
	private String patntNo; // 환자번호 
	private String patntNm; // 환자이름
	private int patntRrno1;
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "정확한 핸드폰 번호를 입력하세요.")
	private String patntTelno;		// 환자 핸드폰 번호
	@Size(max = 5)
	private int patntZip;			// 우편번호
	private String patntAdres1;		// 주소1
	private String patntAdres2;		// 주소2
	private int patntAge;			// 환자 만 나이
	private String patntSexdstn;	// 환자 성별
	@Size(max = 3)
	private int patntHeight;		// 환자 키
	@Size(max = 3)
	private int patntBdwgh;			// 환자 몸무게
	private String patntBdp;		// 환자 혈액형
	private String patntHlthinsAt;	// 건강보험 유무
	private String patntHsptlzAt;	// 입원여부
	private String prtctorNm;		// 보호자 이름
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "정확한 핸드폰 번호를 입력하세요.")
	private String prtctorTelno;	// 보호자 핸드폰 번호
	private String patntAgre;		// 개인정보 동의
	
	private String patntMemo;		// 메모사항
	
	
	private String sckbdSttus; // 병상 상태, 기본 값 N / 입원 중이면 Y
	private String empNo; // 담당 간호사
	private String empNm; // 담당 간호사 이름
	private String sckrmCnt; // 인실
	private String sckrmPrice; // 병실 가격
	private String hsptlzCd; // 입원 코드
	private String hsptlzSckrm;
	private String hsptlzSckbd;
	
	private Date hsptlzDe;
	private Date prarndeLhstl;
}
