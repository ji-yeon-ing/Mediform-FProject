package kr.or.ddit.administration.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.ddit.administration.service.IBoardService;
import kr.or.ddit.common.service.IChattingService;
import kr.or.ddit.common.vo.ChattingVO;
import kr.or.ddit.common.vo.FileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DownloadController {

	@Inject
	private IBoardService boardService;
	
	@Inject
	private IChattingService chattingService;
	
	
	@RequestMapping(value="/notice/download.do")
	public View noticeProcess(String fileNo, ModelMap model) {
		
		//선택한 파일을 다운로드 하기 위한 정보를 파일번호에 해당하는 파일 정보로 얻어온다
		FileVO fileVO = boardService.noticeDownload(fileNo);
		
		Map<String, Object> noticeFileMap = new HashMap<String, Object>();
		
		noticeFileMap.put("fileNm", fileVO.getFileNm());
		noticeFileMap.put("fileFlpth", fileVO.getFileFlpth());
		
		model.addAttribute("noticeFileMap", noticeFileMap);
		
		// 리턴되는 noticeDownloadView는 jsp 페이지로 존재하는 페이지 name을 요청하는게 아니라,
		// 클래스를 요청하는 것인데 해당 클래스가 스프링에서 제공하는 AbstractView 클래스를 상속받은 클래스인데
		// 그 클래스는 AbstractView를 상속받아 renderMergedOutputModel 함수를 재정의할 떄 View로 취급될 수 있게 해준다
		return new DownloadView();
	}
	
	
	@RequestMapping(value="/chatting/download.do")
	public View chattingProcess(String chttIndx, ModelMap model) {
		
		log.info("chttIndx >>> " + chttIndx);
		
		//선택한 파일을 다운로드 하기 위한 정보를 파일번호에 해당하는 파일 정보로 얻어온다
		ChattingVO chattingVO = chattingService.chattingDownload(chttIndx);
		
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		fileMap.put("fileFlpth", chattingVO.getChttAtchmnfl());
		fileMap.put("fileNm", chattingVO.getChttFileNm());
		
		model.addAttribute("fileMap", fileMap);
		
		// 리턴되는 noticeDownloadView는 jsp 페이지로 존재하는 페이지 name을 요청하는게 아니라,
		// 클래스를 요청하는 것인데 해당 클래스가 스프링에서 제공하는 AbstractView 클래스를 상속받은 클래스인데
		// 그 클래스는 AbstractView를 상속받아 renderMergedOutputModel 함수를 재정의할 떄 View로 취급될 수 있게 해준다
		return new ChattingDownloadView();
	}
	
	
	
	
}
