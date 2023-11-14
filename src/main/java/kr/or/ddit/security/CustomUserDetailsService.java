package kr.or.ddit.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.mapper.common.LoginMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Inject
	private LoginMapper loginMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("loadUserByUsername() 실행!!!");
		
		EmployeeVO employee;
		
		try {
			employee = loginMapper.readByUserId(username);
			log.info("" + employee);
			return employee == null ? null : new CustomUser(employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	
}
