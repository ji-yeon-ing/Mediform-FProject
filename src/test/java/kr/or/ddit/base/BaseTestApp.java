package kr.or.ddit.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.doctor.vo.ClinicVO;
import kr.or.ddit.mapper.nurse.RoomMapper;

public class BaseTestApp {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] {"/kr/or/ddit/base/context-test.xml"});
		
		RoomMapper roomMapper = (RoomMapper)context.getBean("roomMapper");
		
		System.out.println(roomMapper);
		
		Map<String, String> map = new HashMap<String, String>();
		
		List<ClinicVO> list = roomMapper.patntClnicList(map);
		
		for(ClinicVO clinicVO:list) {
			System.out.println(clinicVO);
		}
		
	}
}
