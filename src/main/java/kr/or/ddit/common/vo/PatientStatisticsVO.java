package kr.or.ddit.common.vo;

import lombok.Data;

@Data
public class PatientStatisticsVO {
	private int todayPatientCount;			// 금일 환자 수
	private int yesterdayPatientCount;		// 어제 환자 수
	private int todayAdmissionCount;		// 금일 입원 수
	private int yesterdayAdmissionCount;	// 어제 입원 수
	private int dischargeCount;				// 퇴원 수
	private int clinicWaitCount;			// 진료 대기 수
	private int clinicCount;				// 금일 진료 완료 환자 수
	private int treatmentCount;				// 금일 치료 중인 환자 수
}
