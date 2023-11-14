package kr.or.ddit.mapper.common;

import java.util.List;

import kr.or.ddit.common.vo.AuditVO;
import kr.or.ddit.common.vo.PaginationInfoVO;

public interface AuditMapper {

	public void insertAudit(AuditVO auditVO);

	public int auditCount(PaginationInfoVO<AuditVO> pagingVO);

	public List<AuditVO> auditList(PaginationInfoVO<AuditVO> pagingVO);

}
