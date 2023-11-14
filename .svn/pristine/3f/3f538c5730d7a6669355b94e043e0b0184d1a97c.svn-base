package kr.or.ddit.administration.controller;

import java.util.HashMap;

import org.json.simple.JSONObject;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.model.Message;

@Slf4j
public class TestCoolsms {

	
	public static void sendMessage(String number, String sms) {
		
		String api_key = "NCSLXAFAMSWOM4PY";
		
		String api_secret = "FN60PPKWSNZGTXZDRE6SGPZ9X2JBSFIM";
		
		Message coolsms = new Message(null, null, null, null, api_key, api_secret, api_secret, null, null, null, api_secret, null, null, api_secret, api_secret, api_secret, api_secret, api_secret, null, null, api_secret, api_secret, null);
		
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("to", number);
		params.put("from", "01054212684");
		params.put("type", "SMS");
		params.put("text", sms);
		params.put("app_version", "test app 1.2");
		
		
		log.info("sendMessage() 실행!!!!!");
		
	}
	
}
