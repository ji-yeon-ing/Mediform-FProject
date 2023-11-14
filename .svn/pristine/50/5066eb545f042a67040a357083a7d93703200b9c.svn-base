package kr.or.ddit.administration.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.VoiceOutputVO;
import kr.or.ddit.mapper.administration.VoiceMapper;

@Service
public class VoiceOutServiceImpl implements IVoiceOutService {

	@Inject
	private VoiceMapper voiceMapper;
	
	@Override
	public List<VoiceOutputVO> voiceList() {
		
		return voiceMapper.voiceList();
	}

	@Override
	public ServiceResult voiceInsert(Map<String, String> map) {
		
		
		ServiceResult result = null;
		
		int status = voiceMapper.voiceInsert(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public VoiceOutputVO voiceSelect(Map<String, String> map) {
		
		
		return voiceMapper.voiceSelect(map);
	}

	@Override
	public ServiceResult voiceUpdate(Map<String, String> map) {
		
		ServiceResult result = null;
		
		int status = voiceMapper.voiceUpdate(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult voiceDelete(Map<String, String> map) {
		
		ServiceResult result = null;
		
		int status = voiceMapper.voiceDelete(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
