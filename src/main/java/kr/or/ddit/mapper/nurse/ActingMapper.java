package kr.or.ddit.mapper.nurse;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.vo.FileVO;
import kr.or.ddit.doctor.vo.MedicalExaminationOrderVO;
import kr.or.ddit.nurse.vo.VitalVO;

public interface ActingMapper {

	public List<VitalVO> selectVitalList(Map<String, String> map);

	public int examResultInsert(Map<String, String> map);

	public int vitalResultInsert(Map<String, String> map);

	public List<MedicalExaminationOrderVO> vitalResultselect(Map<String, String> map);

	public void insertXrayFile(FileVO fileVO);

}
