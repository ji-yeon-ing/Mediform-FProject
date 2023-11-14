package kr.or.ddit.manager.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.vo.AuditVO;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.service.IManagerAuditService;
import kr.or.ddit.mapper.common.AuditMapper;

@Service
public class ManagerAuditServiceImpl implements IManagerAuditService{

	@Inject
	private AuditMapper auditMapper;

	@Override
	public int auditCount(PaginationInfoVO<AuditVO> pagingVO) {
		return auditMapper.auditCount(pagingVO);
	}

	@Override
	public List<AuditVO> auditList(PaginationInfoVO<AuditVO> pagingVO) {
		return auditMapper.auditList(pagingVO);
	}
	
	
	
}
