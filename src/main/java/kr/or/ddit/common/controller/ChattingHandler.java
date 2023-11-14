package kr.or.ddit.common.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChattingHandler extends TextWebSocketHandler{

	List<HashMap<String, Object>> rls = new ArrayList<>(); //웹소켓 세션을 담아둘 리스트 ---roomListSessions
	
	Map<String, List<String>> roomMap = new HashMap<String, List<String>>();
	// String : 방에 대한 키 값
	// List : 방에 입장해있는 멤버 아이디
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static final String FILE_UPLOAD_PATH = "C:/test/websocket";
	static int fileUploadIdx = 0;
	static String fileUploadSession = "";
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		
		log.info(session.getPrincipal().getName() + "님이 입장하셨습니다.");
		
		
		
		super.afterConnectionEstablished(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log.info("#ChattingHandler, handleMessage");
		log.info("12345" + session.getId() + ": " + message);
		
		log.info("!!!메시지!!! >>>>> " + message.getPayload());
		
		String[] chat = (message.getPayload()).split("s:p:l");
		
		log.info("배열 ::: >>>>> ::: " + chat);
		
		String profile = chat[0];
		String userName = chat[1];
		String chatContent = chat[2];
		String date = chat[3];
		
		session.sendMessage(new TextMessage(profile + "s:p:l" + userName + "s:p:l" + chatContent + "s:p:l" + date));
	}
	
	@Override
	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		//바이너리 메시지 발송
		ByteBuffer byteBuffer = message.getPayload();
		String fileName = "temp.jpg";
		File dir = new File(FILE_UPLOAD_PATH);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		File file = new File(FILE_UPLOAD_PATH, fileName);
		FileOutputStream out = null;
		FileChannel outChannel = null;
		try {
			byteBuffer.flip(); //byteBuffer를 읽기 위해 세팅
			out = new FileOutputStream(file, true); //생성을 위해 OutputStream을 연다.
			outChannel = out.getChannel(); //채널을 열고
			byteBuffer.compact(); //파일을 복사한다.
			outChannel.write(byteBuffer); //파일을 쓴다.
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {
					out.close();
				}
				if(outChannel != null) {
					outChannel.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		byteBuffer.position(0); //파일을 저장하면서 position값이 변경되었으므로 0으로 초기화한다.
		//파일쓰기가 끝나면 이미지를 발송한다.
		HashMap<String, Object> temp = rls.get(fileUploadIdx);
		for(String k : temp.keySet()) {
			if(k.equals("roomNumber")) {
				continue;
			}
			WebSocketSession wss = (WebSocketSession) temp.get(k);
			try {
				wss.sendMessage(new BinaryMessage(byteBuffer)); //초기화된 버퍼를 발송한다.
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		log.info("님이 퇴장하셨습니다.");
	}
}