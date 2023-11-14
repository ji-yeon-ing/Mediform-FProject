package kr.or.ddit.administration.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.RceptVO;

public interface IRceptService {

	ServiceResult receiptInsert(Map<String, Object> map);

	List<RceptVO> watingList();

	List<RceptVO> watingAllList();

	int receiptSelect(Map<String, Object> map);

}
