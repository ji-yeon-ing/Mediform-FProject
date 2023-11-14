package kr.or.ddit.common.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import kr.or.ddit.common.vo.EmployeeVO;

public interface ILoginService {

	EmployeeVO loginCheck(EmployeeVO employee);

	public int findPasswordChk(EmployeeVO empVO);

	public void sendCode(String empEmail, String rndCd) throws MessagingException, UnsupportedEncodingException;

	public int sendPassword(EmployeeVO employee) throws MessagingException, UnsupportedEncodingException;

}
