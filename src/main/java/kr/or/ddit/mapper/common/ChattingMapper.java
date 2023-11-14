package kr.or.ddit.mapper.common;

import java.util.List;
import java.util.Map;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.ChattingRoomVO;
import kr.or.ddit.common.vo.ChattingVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.common.vo.FileVO;

public interface ChattingMapper {

	List<EmployeeVO> friendList();

	int createRoom(String roomName);

	void insertChattMember(ChattingRoomVO chattingRoomVO);

	List<ChattingRoomVO> selectChattingRoomList(Map<String, String> map);

	void insertFirstInvite();

	int chattingInsert(Map<String, String> map);

	List<ChattingVO> chattingList(Map<String, Object> map);

	int chatReadUpdate(Map<String, String> map);

	ChattingRoomVO roomInfo(Map<String, String> map);

	void fileInsert(ChattingVO chattingVO);

	ChattingVO downloadChat(String chttIndx);




}
