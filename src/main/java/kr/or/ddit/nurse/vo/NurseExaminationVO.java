package kr.or.ddit.nurse.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NurseExaminationVO {

	    private String clnicNo;
	    private Date clnicTime;
        private String hc001;
        private String hc002;
        private String hc003;
	    private String patntNo;
	
}
