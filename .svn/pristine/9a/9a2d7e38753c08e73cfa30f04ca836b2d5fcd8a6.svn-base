package kr.or.ddit.nurse.service.Impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.VoiceOutputVO;
import kr.or.ddit.mapper.administration.VoiceMapper;
import kr.or.ddit.mapper.nurse.XrayVoiceMapper;
import kr.or.ddit.nurse.service.IXrayVoiceOutService;

@Service
public class XrayVoiceOutServiceImpl implements IXrayVoiceOutService {

	@Inject
	private XrayVoiceMapper xrayVoiceMapper;
	
	@Override
	public List<VoiceOutputVO> voiceList() {
		
		return xrayVoiceMapper.voiceList();
	}

	@Override
	public ServiceResult voiceInsert(Map<String, String> map) {
		
		
		ServiceResult result = null;
		
		int status = xrayVoiceMapper.voiceInsert(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public VoiceOutputVO voiceSelect(Map<String, String> map) {
		
		
		return xrayVoiceMapper.voiceSelect(map);
	}

	@Override
	public ServiceResult voiceUpdate(Map<String, String> map) {
		
		ServiceResult result = null;
		
		int status = xrayVoiceMapper.voiceUpdate(map);
		
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
		
		int status = xrayVoiceMapper.voiceDelete(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
