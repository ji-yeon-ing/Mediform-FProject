package kr.or.ddit.mapper.common;

import kr.or.ddit.common.vo.EmployeeVO;

public interface LoginMapper {

	EmployeeVO loginCheck(EmployeeVO employee);

	EmployeeVO readByUserId(String username);

	public int findPasswordChk(EmployeeVO empVO);

	public int passwordUpdate(EmployeeVO empVO);

}
