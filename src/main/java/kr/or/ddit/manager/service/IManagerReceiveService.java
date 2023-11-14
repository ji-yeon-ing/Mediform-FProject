package kr.or.ddit.manager.service;

import java.util.List;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.vo.ManagerReceiveVO;

public interface IManagerReceiveService {

	/**
	 * 수납 내역 조회를 위한 count
	 * @param pagingVO
	 * @return
	 */
	public int receiveCount(PaginationInfoVO<ManagerReceiveVO> pagingVO);

	/**
	 * 수납 목록 출력을 위한 count
	 * @param pagingVO
	 * @return
	 */
	public List<ManagerReceiveVO> receiveList(PaginationInfoVO<ManagerReceiveVO> pagingVO);

	/**
	 * 수납 상세 조회
	 * @param rciptNo
	 * @return
	 */
	public ManagerReceiveVO getReceive(String rciptNo);

	/**
	 * 미수납 내역 페이징을 위한 count
	 * @param pagingVO
	 * @return
	 */
	public int unpaidCount(PaginationInfoVO<ManagerReceiveVO> pagingVO);

	/**
	 * 미수납 내역 조회
	 * @param pagingVO
	 * @return
	 */
	public List<ManagerReceiveVO> unpaidList(PaginationInfoVO<ManagerReceiveVO> pagingVO);

	/**
	 * 미수납 상세조회
	 * @param rcivNo
	 * @return
	 */
	public ManagerReceiveVO getUnpaid(String rcivNo);

}
