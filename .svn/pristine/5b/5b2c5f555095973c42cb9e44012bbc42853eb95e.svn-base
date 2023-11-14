package kr.or.ddit.manager.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.service.IManagerReceiveService;
import kr.or.ddit.manager.vo.ManagerReceiveVO;
import kr.or.ddit.mapper.manager.ManagerReceiveMapper;

@Service
public class ManagerReceiveServiceImpl implements IManagerReceiveService{
	
	@Inject
	private ManagerReceiveMapper receiveMapper;
	
	@Override
	public int receiveCount(PaginationInfoVO<ManagerReceiveVO> pagingVO) {
		return receiveMapper.receiveCount(pagingVO);
	}

	@Override
	public List<ManagerReceiveVO> receiveList(PaginationInfoVO<ManagerReceiveVO> pagingVO) {
		return receiveMapper.receiveList(pagingVO);
	}

	@Override
	public ManagerReceiveVO getReceive(String rciptNo) {
		return receiveMapper.getReceive(rciptNo);
	}

	@Override
	public int unpaidCount(PaginationInfoVO<ManagerReceiveVO> pagingVO) {
		return receiveMapper.unpaidCount(pagingVO);
	}

	@Override
	public List<ManagerReceiveVO> unpaidList(PaginationInfoVO<ManagerReceiveVO> pagingVO) {
		return receiveMapper.unpaidList(pagingVO);
	}

	@Override
	public ManagerReceiveVO getUnpaid(String rcivNo) {
		return receiveMapper.getUnpaid(rcivNo);
	}

}
