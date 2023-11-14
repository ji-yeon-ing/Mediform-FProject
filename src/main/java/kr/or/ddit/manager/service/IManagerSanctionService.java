package kr.or.ddit.manager.service;

import java.util.List;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.vo.ManagerSanctionDetailVO;
import kr.or.ddit.manager.vo.ManagerSanctionVO;

public interface IManagerSanctionService {

	/**
	 * 페이징 처리를 위한 count
	 * @param pagingVO
	 * @return
	 */
	public int sanctionCount(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	/**
	 * 결재 신청 내역 조회
	 * @param pagingVO
	 * @return
	 */
	public List<ManagerSanctionVO> sanctionList(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	/**
	 * 결재 처리 내역 count 
	 * @param pagingVO
	 * @return
	 */
	public int sanctionCompletionCount(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	/**
	 * 결재 처리 내역 조회
	 * @param pagingVO
	 * @return
	 */
	public List<ManagerSanctionVO> sanctionCompletionList(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	/**
	 * 신청 내역 상세 조회를 위한 메서드
	 * @param porderCd
	 * @return
	 */
	public ManagerSanctionVO sanctionDetail(String porderCd);

	/**
	 * 약품 리스트 조회를 위한 메서드
	 * @param porderCd
	 * @return
	 */
	public List<ManagerSanctionDetailVO> sanctionDetailList(String porderCd);

	/**
	 * 결재 승인 처리
	 * @param sanctionVO
	 * @return
	 */
	public int sanctionAgree(ManagerSanctionVO sanctionVO);

	/**
	 * 결재 반려 처리
	 * @param sanctionVO
	 * @return
	 */
	public int sanctionReject(ManagerSanctionVO sanctionVO);


}
