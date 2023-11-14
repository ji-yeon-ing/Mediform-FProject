package kr.or.ddit.common.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.HospitalCertificatesVO;
import kr.or.ddit.doctor.vo.ClinicVO;

// 제증명 서비스 인터페이스
public interface ICertificatesService {
	
	// 진단서 폼 ajax
	public ClinicVO selectCertificatesList(Map<String, String> map);

	public ServiceResult cdInsert(HospitalCertificatesVO hospitalCertificatesVO);

	public List<ClinicVO> selectMtcList(Map<String, String> map);

}
