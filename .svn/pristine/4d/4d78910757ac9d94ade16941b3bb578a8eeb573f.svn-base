package kr.or.ddit.doctor.service.Impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.RceptVO;
import kr.or.ddit.doctor.service.IDoctorClinicService;
import kr.or.ddit.doctor.vo.ClinicAssignmentVO;
import kr.or.ddit.doctor.vo.ClinicVO;
import kr.or.ddit.doctor.vo.DoctorGroupOrderContentVO;
import kr.or.ddit.doctor.vo.DoctorGroupOrderVO;
import kr.or.ddit.mapper.doctor.DoctorClinicMapper;
import kr.or.ddit.nurse.vo.MedicineVO;
import kr.or.ddit.patient.vo.PatientVO;

@Service
public class DoctorClinicServiceImpl implements IDoctorClinicService{

	@Inject
	private DoctorClinicMapper doctorClinicMapper;
	
	// 진료실 배정 정보(의사 사번)
	@Override
	public ClinicAssignmentVO selectclinicAssigment(String doctorNo) {
		return doctorClinicMapper.selectclinicAssigment(doctorNo);
	}

	// 대기환자 리스트(의사 사번)
	@Override
	public List<ClinicVO> selectwaitingList(String doctorNo) {
		return doctorClinicMapper.selectwaitingList(doctorNo);
	}
	
	// 환자 상태 업데이트
	@Override
	public ServiceResult updateStatus(Map<String, Object> map) {
		ServiceResult result = null;
		
		int status = doctorClinicMapper.updateStatus(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// 진료 환자 정보 조회
	@Override
	public PatientVO selectclinicPatient(String patntNo) {
		return doctorClinicMapper.selectclinicPatient(patntNo);
	}

	// 대기환자 리스트(전체)
	@Override
	public List<ClinicVO> selectwaitingAllList() {
		return doctorClinicMapper.selectwaitingAllList();
	}

	// 그룹 오더 리스트
	@Override
	public List<DoctorGroupOrderVO> getgroupOrder(String doctorNo) {
		return doctorClinicMapper.getgroupOrder(doctorNo);
	}
	
	// 그룹 오더 내용 리스트
	@Override
	public List<DoctorGroupOrderContentVO> getgroupOrderContent(String groCd) {
		return doctorClinicMapper.getgroupOrderContent(groCd);
	}

	@Override
	public ServiceResult insertGroupOrder(DoctorGroupOrderVO doctorGroupOrderVO) {
		ServiceResult result = null;
		
		int status = doctorClinicMapper.insertGroupOrder(doctorGroupOrderVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 그룹오더 등록
	@Override
	public ServiceResult insertGroupOrderContent(DoctorGroupOrderContentVO doctorGroupOrderContentVO) {
		ServiceResult result = null;
		
		int status = doctorClinicMapper.insertGroupOrderContent(doctorGroupOrderContentVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 그룹오더 약품 리스트
	@Override
	public List<MedicineVO> selectGroupOrderMedicineList(Map<String, String> map) {
		return doctorClinicMapper.selectGroupOrderMedicineList(map);
	}

	// 그룹오더 삭제
	@Override
	public ServiceResult deleteGroupOrder(DoctorGroupOrderVO doctorGroupOrderVO) {
		ServiceResult result = null;
		
		int status = doctorClinicMapper.deleteGroupOrder(doctorGroupOrderVO);
		int status1 = doctorClinicMapper.deleteGroupOrderContent(doctorGroupOrderVO);
		
		if(status > 0 && status1 > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 그룹오더 내용 삭제
	@Override
	public ServiceResult deleteGroupOrderContent(DoctorGroupOrderVO doctorGroupOrderVO) {
		ServiceResult result = null;
		
		int status = doctorClinicMapper.deleteGroupOrderContent(doctorGroupOrderVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 그룹오더 업데이트
	@Override
	public ServiceResult updateGroupOrder(DoctorGroupOrderVO doctorGroupOrderVO) {
		ServiceResult result = null;
		
		int status = doctorClinicMapper.updateGroupOrder(doctorGroupOrderVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 그룹오더 내용 등록
	@Override
	public ServiceResult insertGroupOrderContent(DoctorGroupOrderVO doctorGroupOrderVO) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
