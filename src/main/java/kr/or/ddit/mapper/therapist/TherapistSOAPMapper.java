package kr.or.ddit.mapper.therapist;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.therapist.vo.MedicalTreatmentRecordVO;
import kr.or.ddit.therapist.vo.OtptRecordVO;
import kr.or.ddit.therapist.vo.SoapClinicVO;
import kr.or.ddit.therapist.vo.TherapistPatientVO;

public interface TherapistSOAPMapper {

	int therapistPatientCount(PaginationInfoVO<TherapistPatientVO> pagingVO);

	List<TherapistPatientVO> therapistPatientList(PaginationInfoVO<TherapistPatientVO> pagingVO);

	List<MedicalTreatmentRecordVO> mtrList(Map<String, String> map);

	SoapClinicVO soapClinic(Map<String, String> map);

	int soapUpdate(Map<String, String> map);

	int checkSoap(Map<String, String> map);

	int soapInsert(Map<String, String> map);

	OtptRecordVO soap(Map<String, String> map);

}
