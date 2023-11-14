package kr.or.ddit.administration.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.administration.vo.SmsSndingCnVO;
import kr.or.ddit.administration.vo.SmsWordVO;
import kr.or.ddit.common.ServiceResult;

public interface ISmsService {

	List<SmsWordVO> smsWordList();

	ServiceResult smsWordInsert(Map<String, String> map);

	SmsWordVO smsSelect(Map<String, String> map);

	ServiceResult smsUpdate(Map<String, String> map);

	ServiceResult smsDelete(Map<String, String> map);

	List<SmsSndingCnVO> sendSmsList(Map<String, String> map);

	int saveSms(Map<String, String> map);


}
