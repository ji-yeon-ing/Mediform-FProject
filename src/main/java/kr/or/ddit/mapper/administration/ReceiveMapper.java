package kr.or.ddit.mapper.administration;

import java.util.List;
import java.util.Map;

import kr.or.ddit.administration.vo.MEOAdminVO;
import kr.or.ddit.administration.vo.MTRAdminVO;
import kr.or.ddit.administration.vo.POAdminVO;
import kr.or.ddit.administration.vo.ReceiptVO;
import kr.or.ddit.administration.vo.ReceiveDetailVO;
import kr.or.ddit.administration.vo.ReceiveVO;
import kr.or.ddit.common.vo.PaginationInfoVO;

public interface ReceiveMapper {

	int selectReceiveCount(PaginationInfoVO<ReceiveVO> pagingVO);

	List<ReceiveVO> receiveList(PaginationInfoVO<ReceiveVO> pagingVO);

	ReceiveVO receiveSelect(Map<String, String> map);

	List<ReceiptVO> receiptList(Map<String, String> map);

	ReceiveDetailVO receiveDetaiList(Map<String, String> map);

	List<MEOAdminVO> mEOList(Map<String, String> map);

	List<MTRAdminVO> mTRList(Map<String, String> map);

	List<POAdminVO> pOList(Map<String, String> map);

	int pay(Map<String, Object> map);

	void updateAmount(Map<String, Object> map);

	void updateRceptStatus(Map<String, Object> map);

	ReceiveVO selectAmount(Map<String, Object> map);

	int updateRcivAt(Map<String, Object> map);

	int updateRcivAt2(Map<String, Object> map);

	int updateRcivAt1(Map<String, Object> map);

	ReceiptVO receiptSelect(Map<String, String> map);



}
