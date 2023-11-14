package kr.or.ddit.administration.service;


import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.EmployeeVO;

public interface IEmployeeService {

	ServiceResult employeeInsert(HttpServletRequest req, EmployeeVO employeeVO);

}
