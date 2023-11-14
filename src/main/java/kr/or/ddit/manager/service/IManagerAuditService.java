package kr.or.ddit.manager.service;

import java.util.List;

import kr.or.ddit.common.vo.AuditVO;
import kr.or.ddit.common.vo.PaginationInfoVO;

public interface IManagerAuditService {

	/**
	 * 페이징을 위한 count
	 * @param pagingVO
	 * @return
	 */
	public int auditCount(PaginationInfoVO<AuditVO> pagingVO);

	/**
	 * 감사 목록 내역 카운트
	 * @param pagingVO
	 * @return
	 */
	public List<AuditVO> auditList(PaginationInfoVO<AuditVO> pagingVO);

}
