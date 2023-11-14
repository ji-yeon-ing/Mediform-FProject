package kr.or.ddit.administration.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.administration.service.ISmsService;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@RestController
public class SendSmsController {
	
	final DefaultMessageService messageService;

	@Inject
	private ISmsService smsService;
	
    public SendSmsController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSLXAFAMSWOM4PY", "FN60PPKWSNZGTXZDRE6SGPZ9X2JBSFIM", "https://api.coolsms.co.kr");
    }
	
	@ResponseBody
	@RequestMapping(value = "mediform/admin/sms/send", method = RequestMethod.POST)
	public SingleMessageSentResponse  sendMessage(@RequestBody Map<String, String> map) {

		Message message = new Message();
		// 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
		message.setFrom("01054212684");
		
		
		String [] infoArr = (map.get("smsObj")).split("split");
		String smsContent = map.get("sendSmsContent");
		
		smsContent = smsContent.replace("{환자명}", infoArr[1]);
		smsContent = smsContent.replace("{일자}", infoArr[2]);
		smsContent = smsContent.replace("{시간}", infoArr[3]);
		message.setTo(infoArr[0]);
		message.setText(smsContent);
		
		log.info("infoArr[0] >>>>> " + infoArr[0]);
		log.info("smsContent >>>>> " + smsContent);
		
		map.put("name", infoArr[1]);
		map.put("content", smsContent);
		
		int cnt = smsService.saveSms(map);
		
		
		SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);

		return response;

	}
	
}
