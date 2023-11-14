package kr.or.ddit.administration.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.administration.vo.MEOAdminVO;
import kr.or.ddit.administration.vo.MTRAdminVO;
import kr.or.ddit.administration.vo.POAdminVO;
import kr.or.ddit.administration.vo.ReceiptVO;
import kr.or.ddit.administration.vo.ReceiveDetailVO;
import kr.or.ddit.administration.vo.ReceiveVO;
import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.mapper.administration.ReceiveMapper;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReceiveServiceImpl implements IReceiveService {

	@Inject
	private ReceiveMapper receiveMapper;
	
	@Override
	public int selectReceiveCount(PaginationInfoVO<ReceiveVO> pagingVO) {
		
		
		return receiveMapper.selectReceiveCount(pagingVO);
	}

	@Override
	public List<ReceiveVO> receiveList(PaginationInfoVO<ReceiveVO> pagingVO) {
		return receiveMapper.receiveList(pagingVO);
	}

	@Override
	public ReceiveVO receiveSelect(Map<String, String> map) {
		return receiveMapper.receiveSelect(map);
	}

	@Override
	public List<ReceiptVO> receiptList(Map<String, String> map) {
		return receiveMapper.receiptList(map);
	}

	@Override
	public ReceiveDetailVO receiveDetaiList(Map<String, String> map) {
		return receiveMapper.receiveDetaiList(map);
	}

	@Override
	public List<MEOAdminVO> mEOList(Map<String, String> map) {
		return receiveMapper.mEOList(map);
	}

	@Override
	public List<MTRAdminVO> mTRList(Map<String, String> map) {
		return receiveMapper.mTRList(map);
	}

	@Override
	public List<POAdminVO> pOList(Map<String, String> map) {
		return receiveMapper.pOList(map);
	}

	@Override
	public ServiceResult pay(Map<String, Object> map) {
		
		ServiceResult result = null;
		
		int status = receiveMapper.pay(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
			log.info("영수증 성공!!!!!!");
			receiveMapper.updateAmount(map);
			receiveMapper.updateRceptStatus(map);
			ReceiveVO receiveVO = receiveMapper.selectAmount(map);
			
			log.info("납부한 금액 >>> " + receiveVO.getRcivAmount());
			log.info("납부할 금액 >>> " + receiveVO.getPrearngeAmount());
			
			int rcivAmount = receiveVO.getRcivAmount();
			int prearngeAmount = receiveVO.getPrearngeAmount();
			
			if(rcivAmount == prearngeAmount) {
				log.info("납부한 금액 = 납부할 금액 >>> 납부 완료");
				int status1 = receiveMapper.updateRcivAt1(map);
				log.info("납부 완료 >>> " + status1);
			}else if(rcivAmount == 0 && prearngeAmount != 0) {
				log.info("미수납");
				int status2 = receiveMapper.updateRcivAt(map);
				log.info("미수납 >>> " + status2);
			}else if(rcivAmount != prearngeAmount && rcivAmount > 0) {
				log.info("부분 수납");
				int status3 = receiveMapper.updateRcivAt2(map);
				log.info("부분 수납 >>> " + status3);
			}
			
			
		}else {
			result = ServiceResult.FAILED;
			log.info("영수증 실패!!!!!!");
		}
		
		return result;
	}

	@Override
	public ReceiptVO receiptSelect(Map<String, String> map) {
		return receiveMapper.receiptSelect(map);
	}

}
