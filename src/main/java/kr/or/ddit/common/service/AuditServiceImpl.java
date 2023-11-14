package kr.or.ddit.common.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.vo.AuditVO;
import kr.or.ddit.mapper.common.AuditMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AuditServiceImpl implements IAuditService{

	@Inject
	private AuditMapper auditMapper;

	@Override
	public void insertAudit(AuditVO auditVO) {
		auditMapper.insertAudit(auditVO);
	} 
	
	
}
