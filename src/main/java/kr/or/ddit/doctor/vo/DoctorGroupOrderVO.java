package kr.or.ddit.doctor.vo;

import java.util.List;

import lombok.Data;

@Data
public class DoctorGroupOrderVO {
	private String groCd;
	private String groNm;
	private String empNo;
	private List<String> contentCdList;
	
	// 그룹오더 내역
	private List<DoctorGroupOrderContentVO> doctorGroupOrderContentVO;
	
}
