package kr.or.ddit.doctor.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.doctor.vo.ClinicAssignmentVO;
import kr.or.ddit.doctor.vo.ClinicVO;
import kr.or.ddit.doctor.vo.DoctorGroupOrderContentVO;
import kr.or.ddit.doctor.vo.DoctorGroupOrderVO;
import kr.or.ddit.nurse.vo.MedicineVO;
import kr.or.ddit.patient.vo.PatientVO;

public interface IDoctorClinicService {
	
	// 진료실 정보(의사 사번)
	public ClinicAssignmentVO selectclinicAssigment(String doctorNo);
	
	// 대기환자 리스트(접수환자)
	public List<ClinicVO> selectwaitingList(String doctorNo);
	
	// 환자 상태 업데이트
	public ServiceResult updateStatus(Map<String, Object> map);
	
	// 진료 환자 정보 조회
	public PatientVO selectclinicPatient(String patntNo);

	// 대기환자 리스트 (전체)
	public List<ClinicVO> selectwaitingAllList();
	
	// 그룹오더 리스트
	public List<DoctorGroupOrderVO> getgroupOrder(String doctorNo);

	// 그룹오더 내용 리스트
	public List<DoctorGroupOrderContentVO> getgroupOrderContent(String groCd);

	// 그룹오더 등록
	public ServiceResult insertGroupOrder(DoctorGroupOrderVO doctorGroupOrderVO);

	// 그룹오더 내용 등록
	public ServiceResult insertGroupOrderContent(DoctorGroupOrderContentVO doctorGroupOrderContentVO);

	// 그룹오더 코드
	public List<MedicineVO> selectGroupOrderMedicineList(Map<String, String> map);

	// 그룹오더 삭제
	public ServiceResult deleteGroupOrder(DoctorGroupOrderVO doctorGroupOrderVO);

	// 그룹오더 내용 삭제
	public ServiceResult deleteGroupOrderContent(DoctorGroupOrderVO doctorGroupOrderVO);

	// 그룹오더 내용 업데이트
	public ServiceResult updateGroupOrder(DoctorGroupOrderVO doctorGroupOrderVO);

	// 그룹오더 내용 등록
	public ServiceResult insertGroupOrderContent(DoctorGroupOrderVO doctorGroupOrderVO);


	

}
