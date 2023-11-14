package kr.or.ddit.calender.service.Impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calender.service.IVacationService;
import kr.or.ddit.calender.vo.VacationVO;
import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.mapper.calender.VacationMapper;

@Service
public class VacationServiceImpl implements IVacationService{
	
	@Inject
	private VacationMapper vacationMapper;
	
	// 캘린더 리스트 조회
	@Override
	public List<VacationVO> vacationMapList() {
		return vacationMapper.vacationMapList();
	}
	
	// 휴가 신청
	@Override
	public ServiceResult vacationInsert(VacationVO vacationVO) {
		ServiceResult result = null;
		
		int status = vacationMapper.vacationInsert(vacationVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	// 직원 상세
	@Override
	public List<VacationVO> vacationDetailEmp(String searchEmpWord) {
		return vacationMapper.vacationDetailEmp(searchEmpWord);
	}
	
	// 휴가 상세
	@Override
	public List<VacationVO> vacationDetail(VacationVO vacationVO) {
		return vacationMapper.vacationDetail(vacationVO);
	}

	// 1차 승인
	@Override
	public ServiceResult vacationUpdate(Map<String, String> map) {
		ServiceResult result = null;
		
		int status = vacationMapper.vacationUpdate(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	// 2차 승인
	@Override
	public ServiceResult vacationUpdateLast(Map<String, String> map) {
		ServiceResult result = null;
		
		int status = vacationMapper.vacationUpdateLast(map);
		String cl = map.get("vcatnCl");
		if(cl.equals("1") || cl.equals("2") || cl.equals("3") || cl.equals("4")) {
			vacationMapper.updateYrycCount(map);
		}else if(cl.equals("5")) {
			vacationMapper.updateOffCount(map);
		}else if(cl.equals("6")) {
			vacationMapper.updateSickCount(map);
		}
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
	// 휴가 반려
	@Override
	public ServiceResult vacationUpdateReject(Map<String, String> map) {
		ServiceResult result = null;
		
		int status = vacationMapper.vacationUpdateReject(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
	// 휴가 리스트 조회
	@Override
	public List<VacationVO> selectVacationList(VacationVO vacationVO) {
		return vacationMapper.selectVacationList(vacationVO);
	}

	// 휴가 신청 리스트
	@Override
	public List<VacationVO> selectSignupList(VacationVO vacationVO) {
		return vacationMapper.selectSignupList(vacationVO);
	}

	// 휴가 승인 리스트
	@Override
	public List<VacationVO> selectApprovalList(VacationVO vacationVO) {
		return vacationMapper.selectApprovalList(vacationVO);
	}

	// 휴가 반려 리스트
	@Override
	public List<VacationVO> selectRejectList(VacationVO vacationVO) {
		return vacationMapper.selectRejectList(vacationVO);
	}


}
