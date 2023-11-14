package kr.or.ddit.therapist.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.therapist.vo.MedicalTreatmentRecordVO;
import kr.or.ddit.therapist.vo.OtptRecordVO;
import kr.or.ddit.therapist.vo.SoapClinicVO;
import kr.or.ddit.therapist.vo.TherapistPatientVO;

public interface ITherapistSOAPService {

	int therapistPatientCount(PaginationInfoVO<TherapistPatientVO> pagingVO);

	List<TherapistPatientVO> therapistPatientList(PaginationInfoVO<TherapistPatientVO> pagingVO);

	List<MedicalTreatmentRecordVO> mtrList(Map<String, String> map);

	SoapClinicVO soapClinic(Map<String, String> map);

	int soapUpdate(Map<String, String> map);

	OtptRecordVO soap(Map<String, String> map);

}
