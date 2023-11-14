package kr.or.ddit.therapist.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.mapper.therapist.TherapistSOAPMapper;
import kr.or.ddit.therapist.vo.MedicalTreatmentRecordVO;
import kr.or.ddit.therapist.vo.OtptRecordVO;
import kr.or.ddit.therapist.vo.SoapClinicVO;
import kr.or.ddit.therapist.vo.TherapistPatientVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TherapistSOAPServiceImpl implements ITherapistSOAPService {

	@Inject
	private TherapistSOAPMapper therapistSOAPMapper;
	
	@Override
	public int therapistPatientCount(PaginationInfoVO<TherapistPatientVO> pagingVO) {
		
		return therapistSOAPMapper.therapistPatientCount(pagingVO);
	}

	@Override
	public List<TherapistPatientVO> therapistPatientList(PaginationInfoVO<TherapistPatientVO> pagingVO) {
		
		return therapistSOAPMapper.therapistPatientList(pagingVO);
	}

	@Override
	public List<MedicalTreatmentRecordVO> mtrList(Map<String, String> map) {
		return therapistSOAPMapper.mtrList(map);
	}

	@Override
	public SoapClinicVO soapClinic(Map<String, String> map) {
		return therapistSOAPMapper.soapClinic(map);
	}

	@Override
	public int soapUpdate(Map<String, String> map) {
		
		int status1 = therapistSOAPMapper.checkSoap(map);
		
		int status2 = 0;
		
		log.info("@@@@ soap 존재 여부(1이면 존재 >>>> " + status1);
		
		// 기존에 soap가 없을 경우 => insert
		if(status1 == 0) {
			
			status2 = therapistSOAPMapper.soapInsert(map);
		
		// 기존에 soap가 있을 경우 => update
		}else if(status1 > 0) {
			
			status2 = therapistSOAPMapper.soapUpdate(map);
		}
		
		return status2;
	}

	@Override
	public OtptRecordVO soap(Map<String, String> map) {
		return therapistSOAPMapper.soap(map);
	}

}
