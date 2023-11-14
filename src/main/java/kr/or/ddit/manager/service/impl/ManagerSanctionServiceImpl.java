package kr.or.ddit.manager.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.service.IManagerSanctionService;
import kr.or.ddit.manager.vo.ManagerSanctionDetailVO;
import kr.or.ddit.manager.vo.ManagerSanctionVO;
import kr.or.ddit.mapper.manager.ManagerSanctionMapper;

@Service
public class ManagerSanctionServiceImpl implements IManagerSanctionService{

	@Inject
	private ManagerSanctionMapper sanctionMapper;

	@Override
	public int sanctionCount(PaginationInfoVO<ManagerSanctionVO> pagingVO) {
		return sanctionMapper.sanctionCount(pagingVO);
	}

	@Override
	public List<ManagerSanctionVO> sanctionList(PaginationInfoVO<ManagerSanctionVO> pagingVO) {
		return sanctionMapper.sanctionList(pagingVO);
	}

	@Override
	public int sanctionCompletionCount(PaginationInfoVO<ManagerSanctionVO> pagingVO) {
		return sanctionMapper.sanctionCompletionCount(pagingVO);
	}

	@Override
	public List<ManagerSanctionVO> sanctionCompletionList(PaginationInfoVO<ManagerSanctionVO> pagingVO) {
		return sanctionMapper.sanctionCompletionList(pagingVO);
	}

	@Override
	public ManagerSanctionVO sanctionDetail(String porderCd) {
		return sanctionMapper.sanctionDetail(porderCd);
	}

	@Override
	public List<ManagerSanctionDetailVO> sanctionDetailList(String porderCd) {
		return sanctionMapper.sanctionDetailList(porderCd);
	}

	@Override
	public int sanctionAgree(ManagerSanctionVO sanctionVO) {
		return sanctionMapper.sanctionAgree(sanctionVO);
	}

	@Override
	public int sanctionReject(ManagerSanctionVO sanctionVO) {
		return sanctionMapper.sanctionReject(sanctionVO);
	}

	
	
}
