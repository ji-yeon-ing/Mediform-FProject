package kr.or.ddit.administration.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.administration.service.IBoardService;
import kr.or.ddit.administration.vo.NoticeBoardVO;
import kr.or.ddit.common.service.IAlarmService;
import kr.or.ddit.common.vo.AlarmVO;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.security.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mediform/admin")
public class BoardController {

	@Inject
	private IBoardService boardService;
	
	@Inject
	private IAlarmService alarmService;
	
	@RequestMapping(value="/board/list")
	public String boardList(
			Authentication authentication,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		log.info("boardList() 실행!!!");

		PaginationInfoVO<NoticeBoardVO> pagingVO = new PaginationInfoVO<NoticeBoardVO>();

		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = boardService.selectBoardCount(pagingVO); // 총게시글 수
		
		pagingVO.setTotalRecord(totalRecord); // totalpage 결정
		List<NoticeBoardVO> dataList = boardService.selectBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		log.info("구분 : " + customUser.getEmployee().getEmpSe());
		
		String goPage = "";
		
		if(customUser.getEmployee().getEmpSe().equals("a")) {
			goPage = "admin/boardList";
		}else if(customUser.getEmployee().getEmpSe().equals("n")) {
			goPage = "nurse/boardList";
		}else if(customUser.getEmployee().getEmpSe().equals("d")) {
			goPage = "doctor/boardList";
		}else if(customUser.getEmployee().getEmpSe().equals("t")) {
			goPage = "therapist/boardList";
		}else if(customUser.getEmployee().getEmpSe().equals("m")) {
			goPage = "manager/boardList";
		}else if(customUser.getEmployee().getEmpSe().equals("k")) {
			goPage = "manager/boardList";
		}
		
		return goPage; 
		
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public String updateForm(String ntbdNo, Model model) {
		
		log.info("updateForm() 실행!!!");
	
		NoticeBoardVO noticeBoardVO = boardService.selectBoard(ntbdNo);
		model.addAttribute("notice", noticeBoardVO);
		model.addAttribute("status", "u");
	
		return "admin/boardInsert";
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String update(
					HttpServletRequest req,
					RedirectAttributes ra,
					NoticeBoardVO noticeBoardVO, Model model
						) throws IllegalStateException, IOException {
		
		log.info("updateForm() 실행!!!");
		
	
		ServiceResult result = boardService.updateBoard(req, noticeBoardVO);
	
		return "redirect:/mediform/admin/board/detail?ntbdNo=" + noticeBoardVO.getNtbdNo();
	}
	
	
	@RequestMapping(value="/board/insert", method=RequestMethod.GET)
	public String insertForm() {
		
		return "admin/boardInsert";
	}
	
	@RequestMapping(value="/board/insert", method=RequestMethod.POST)
	public String noticeInsert(
			HttpServletRequest req,
			HttpSession session,
			RedirectAttributes ra,
			NoticeBoardVO noticeBoardVO, Model model,
			Authentication authentication) {
		
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(noticeBoardVO.getNtbdSj())) {
			errors.put("boTitle", "제목을 입력해주세요");
		}
		if(StringUtils.isBlank(noticeBoardVO.getNtbdCn())) {
			errors.put("boContent", "내용을 입력해주세요");
		}
		
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("noticeBoardVO", noticeBoardVO);
			goPage = "admin/boardInsert";
		}else {
			
			// 방법 2 - 스프링 시큐리티를 이용한 사용자명 처리
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			
//			if(memberVO != null) {
				// 로그인 후 등록된 세션 정보(로그인한 회원 정보가 들어있음)
				// 회원 정보 중 id를 작성자로 셋팅
//				noticeVO.setBoWriter(memberVO.getMemId());
				noticeBoardVO.setNtbdWriter(user.getUsername());
				
				ServiceResult result = boardService.insertBoard(req, noticeBoardVO);
				if(result.equals(ServiceResult.OK)) {
					
					CustomUser customUser = (CustomUser) authentication.getPrincipal();
				    String empNo = customUser.getEmployee().getEmpNo();
					
					AlarmVO alarmVo = new AlarmVO();
					alarmVo.setAlarmWriter(empNo);
					alarmVo.setAlarmCn("NEW_BOARD|새로운 게시글이 등록되었습니다. [" + noticeBoardVO.getNtbdSj()+ "]");
					alarmService.insertAlarm(alarmVo);
					
					goPage = "redirect:/mediform/admin/board/list";
				}else {
					model.addAttribute("message", "서버에러, 다시시도해주세요");
					goPage = "admin/boardInsert";
				}
			
		}
		
		return goPage;
	}
	
	
	@RequestMapping(value="/board/detail")
	public String boardDetail(Authentication authentication, String ntbdNo, Model model) {
		log.info("boardDetail() 실행!!!");
		NoticeBoardVO noticeBoardVO = boardService.selectBoard(ntbdNo);
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		log.info("구분 : " + customUser.getEmployee().getEmpSe());
		
		String goPage = "";
		
		if(customUser.getEmployee().getEmpSe().equals("a")) {
			goPage = "admin/boardDetail";
		}else if(customUser.getEmployee().getEmpSe().equals("n")) {
			goPage = "nurse/boardDetail";
		}else if(customUser.getEmployee().getEmpSe().equals("d")) {
			goPage = "doctor/boardDetail";
		}else if(customUser.getEmployee().getEmpSe().equals("t")) {
			goPage = "therapist/boardDetail";
		}else if(customUser.getEmployee().getEmpSe().equals("m")) {
			goPage = "manager/boardDetail";
		}else if(customUser.getEmployee().getEmpSe().equals("k")) {
			goPage = "manager/boardDetail";
		}
		
		return goPage; 
	}
	
	@RequestMapping(value="board/delete", method=RequestMethod.POST)
	public String boardDelete(
						HttpServletRequest req,
						RedirectAttributes ra, String ntbdNo, Model model
							) {
		
		log.info("boardDelete() 실행!!!");
		
		log.info("게시글 번호 >>>>> " + ntbdNo);
		
		ServiceResult result = boardService.deleteNotice(req, ntbdNo);
		
		
		return "redirect:/mediform/admin/board/list";
	}
	
	
//	@RequestMapping(value="/update")
	
	
	
	
}
