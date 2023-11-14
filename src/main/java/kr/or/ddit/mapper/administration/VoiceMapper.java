package kr.or.ddit.mapper.administration;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.vo.VoiceOutputVO;

public interface VoiceMapper {

	List<VoiceOutputVO> voiceList();

	int voiceInsert(Map<String, String> map);

	VoiceOutputVO voiceSelect(Map<String, String> map);

	int voiceUpdate(Map<String, String> map);

	int voiceDelete(Map<String, String> map);

}
