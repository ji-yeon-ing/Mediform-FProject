package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private RequestCache requestCache = new HttpSessionRequestCache();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("onAuthenticationSuccess() 실행!!!");
		
		User customUser = (User) authentication.getPrincipal();
		log.info("username : " + customUser.getUsername());
		log.info("password : " + customUser.getPassword());
		log.info("authorities : " + customUser.getAuthorities());
		
		clearAuthenticationAttribute(request);
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
	
		String targetUrl = "";
		
		System.out.println(customUser.getAuthorities());
		
		if(customUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
			targetUrl = request.getContextPath() + "/mediform/admin/home";
		}
		if(customUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MANAGER"))) {
			targetUrl = request.getContextPath() + "/mediform/manager/home";
		}
		if(customUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_NURSE"))) {
			targetUrl = request.getContextPath() + "/mediform/nurse/home";
		}
		if(customUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_DOCTOR"))) {
			targetUrl = request.getContextPath() + "/mediform/doctor/home";
		}
		if(customUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_THERAPIST"))) {
			targetUrl = request.getContextPath() + "/mediform/therapist/home";
		}
		if(customUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_DIRECTOR"))) {
			targetUrl = request.getContextPath() + "/mediform/manager/home";
		}
		if(customUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
			targetUrl = request.getContextPath() + "/mediform/admin/home";
		}
		if(savedRequest != null) {
			targetUrl = savedRequest.getRedirectUrl();
		}
		
		log.info("Login Success targetUrl : " + targetUrl);
		response.sendRedirect(targetUrl);
		
	}

	public void clearAuthenticationAttribute(HttpServletRequest req) {

		HttpSession session = req.getSession();
		if(session == null) {
			return;
		}
		// SPRING_SECURITY_LAST_EXCEPTION 값
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		
	}

}
