package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.nurse.ServiceResult;
import kr.or.ddit.nurse.vo.OrderDetailVO;
import kr.or.ddit.nurse.vo.PurchaseOrderVO;

public interface IOrderService {
	public ServiceResult insertPurchaseOrder(PurchaseOrderVO purchaseOrderVO);
	public int insertOrderDetail(OrderDetailVO detail);
	public List<PurchaseOrderVO> selectOrderList();
	public List<OrderDetailVO> selectPurchaseList();
	public List<OrderDetailVO> selectOrderDetailList(String porderCd);
	public ServiceResult approveOrder(Map<String, String> map);
	public ServiceResult rejectOrder(Map<String, String> map);
}
