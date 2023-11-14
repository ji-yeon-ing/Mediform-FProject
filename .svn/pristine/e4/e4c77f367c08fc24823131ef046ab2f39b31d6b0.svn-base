package kr.or.ddit.mapper.manager;

import java.util.List;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.manager.vo.ScheduleDataVO;
import kr.or.ddit.manager.vo.WorkScheduleVO;

public interface ManagerScheduleMapper {

	public List<EmployeeVO> getNurseList();

	public int insertWorkSchedule(List<WorkScheduleVO> wsList);

	public int scheduleInsertCheck(String thisYm);

	public void deleteSchedule(String thisYm);

	public List<ScheduleDataVO> empScheduleCnt(String tempDate);

	public List<ScheduleDataVO> dateScheduleCnt(String tempDate);

	public List<WorkScheduleVO> workScheduleList(String tempDate);
	
}
