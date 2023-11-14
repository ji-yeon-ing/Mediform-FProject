package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.nurse.vo.NurseRecordVO;

public interface IRecordService {

	public List<NurseRecordVO> selectRecordList(Map<String, String> map);

	public List<NurseRecordVO> selectTakeOverList(Map<String, String> map);

	public NurseRecordVO insertTakeOver(NurseRecordVO nurseRecordVO);

	public int selectTakeOverCount(NurseRecordVO nrsRcordCn);
	

}
