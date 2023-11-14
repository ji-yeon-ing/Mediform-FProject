package kr.or.ddit.mapper.nurse;

import java.util.List;
import java.util.Map;

import kr.or.ddit.nurse.vo.OrderDetailVO;
import kr.or.ddit.nurse.vo.PurchaseOrderVO;

public interface OrderMapper {
	public int insertPurchaseOrder(PurchaseOrderVO purchaseOrderVO);
	public int insertOrderDetail(OrderDetailVO detail);
	public List<PurchaseOrderVO> selectOrderList();
	public List<OrderDetailVO> selectPurchaseList();
	public List<OrderDetailVO> selectOrderDetailList(String porderCd);
	public int approveOrder(Map<String, String> map);
	public int rejectOrder(Map<String, String> map);
}