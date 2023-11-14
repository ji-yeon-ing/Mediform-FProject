package kr.or.ddit.administration.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.administration.vo.NoticeBoardVO;
import kr.or.ddit.common.vo.FileVO;
import kr.or.ddit.common.vo.PaginationInfoVO;

public interface IBoardService {

	int selectBoardCount(PaginationInfoVO<NoticeBoardVO> pagingVO);

	List<NoticeBoardVO> selectBoardList(PaginationInfoVO<NoticeBoardVO> pagingVO);

	ServiceResult insertBoard(HttpServletRequest req, NoticeBoardVO noticeBoardVO);

	NoticeBoardVO selectBoard(String ntbdNo);

	FileVO noticeDownload(String fileNo);

	ServiceResult deleteNotice(HttpServletRequest req, String ntbdNo);

	ServiceResult updateBoard(HttpServletRequest req, NoticeBoardVO noticeBoardVO) throws IllegalStateException, IOException;


}
