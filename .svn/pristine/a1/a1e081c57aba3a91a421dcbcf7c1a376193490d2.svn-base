package kr.or.ddit.mapper.manager;

import java.util.List;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.vo.ManagerSanctionDetailVO;
import kr.or.ddit.manager.vo.ManagerSanctionVO;

public interface ManagerSanctionMapper {

	public int sanctionCount(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	public List<ManagerSanctionVO> sanctionList(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	public int sanctionCompletionCount(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	public List<ManagerSanctionVO> sanctionCompletionList(PaginationInfoVO<ManagerSanctionVO> pagingVO);

	public ManagerSanctionVO sanctionDetail(String porderCd);

	public List<ManagerSanctionDetailVO> sanctionDetailList(String porderCd);

	public int sanctionAgree(ManagerSanctionVO sanctionVO);

	public int sanctionReject(ManagerSanctionVO sanctionVO);


}
