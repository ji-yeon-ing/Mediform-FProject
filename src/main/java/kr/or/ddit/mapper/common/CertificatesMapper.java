package kr.or.ddit.mapper.common;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.vo.HospitalCertificatesVO;
import kr.or.ddit.doctor.vo.ClinicVO;
import kr.or.ddit.doctor.vo.MedicalExaminationOrderVO;
import kr.or.ddit.doctor.vo.MedicalTreatmentRecordVO;
import kr.or.ddit.doctor.vo.SelectAllMedicalTreatmentRecordVO;
import kr.or.ddit.doctor.vo.SickAndWoundedVO;

public interface CertificatesMapper {
	
	// 진단서 폼 ajax
//	public ClinicVO selectCertificatesList(Map<String, String> map);

	public int cdInsert(HospitalCertificatesVO hospitalCertificatesVO);

	public List<ClinicVO> selectMtcList(Map<String, String> map);
	
	// 진단서 상병 조회
	public List<SickAndWoundedVO> selectCertificatesSAW(Map<String, String> map);
	// 진단서 검사 조회
	public List<MedicalExaminationOrderVO> selectCertificatesMEO(Map<String, String> map);
	// 진단서 처방 조회
	public List<SelectAllMedicalTreatmentRecordVO> selectCertificatesMTR(Map<String, String> map);
	// 진단서 1대1 관계 전체 조회
	public ClinicVO selectCertificatesClinic(Map<String, String> map);
	// 진단서 엑스레이 파일 조회
	public int selectFileExist(String mecCd);

}
