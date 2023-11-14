package kr.or.ddit.nurse.service.Impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.nurse.OrderMapper;
import kr.or.ddit.nurse.ServiceResult;
import kr.or.ddit.nurse.service.IOrderService;
import kr.or.ddit.nurse.vo.OrderDetailVO;
import kr.or.ddit.nurse.vo.PurchaseOrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderServiceImpl implements IOrderService {


	@Inject
	private OrderMapper orderMapper;
	
	@Override
	public ServiceResult insertPurchaseOrder(PurchaseOrderVO purchaseOrderVO) {
		ServiceResult result = null;
		int status = orderMapper.insertPurchaseOrder(purchaseOrderVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public int insertOrderDetail(OrderDetailVO detail) {
	    return orderMapper.insertOrderDetail(detail);
	}

	@Override
	public List<PurchaseOrderVO> selectOrderList() {
		return orderMapper.selectOrderList();
	}

	@Override
	public List<OrderDetailVO> selectPurchaseList() {
		return orderMapper.selectPurchaseList();
	}

	@Override
	public List<OrderDetailVO> selectOrderDetailList(String porderCd) {
		return orderMapper.selectOrderDetailList(porderCd);
	}

	@Override
	public ServiceResult approveOrder(Map<String, String> map) {
	
		ServiceResult result = null;
		
		int status = orderMapper.approveOrder(map);
		
		if(status > 0) {
			log.info("1차승인 업데이트 성공 // 건수 >>> " + status);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult rejectOrder(Map<String, String> map) {
		
		ServiceResult result = null;
		
		int status = orderMapper.rejectOrder(map);
		
		if(status > 0) {
			log.info("1차반려 업데이트 성공 // 건수 >>> " + status);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
