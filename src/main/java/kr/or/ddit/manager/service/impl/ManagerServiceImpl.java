package kr.or.ddit.manager.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.AuthorityVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.manager.service.IManagerService;
import kr.or.ddit.manager.vo.ScheduleDataVO;
import kr.or.ddit.manager.vo.WorkScheduleVO;
import kr.or.ddit.mapper.manager.ManagerEmployeeMapper;
import kr.or.ddit.mapper.manager.ManagerScheduleMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManagerServiceImpl implements IManagerService{

	@Inject
	private ManagerScheduleMapper scheduleMapper;
	
	@Inject
	private ManagerEmployeeMapper managerMapper;
	
	// 자바 메일 sender 의존성 주입
	@Inject
	private JavaMailSender emailSender;
	
	@Inject
	private PasswordEncoder pe;
	
	/**
	 * 회원 상세 조회
	 */
	@Override
	public EmployeeVO getEmployee(String empNo) {
		return managerMapper.getEmployee(empNo);
	}

	/**
	 * 반려 URL
	 */
	@Override
	public ServiceResult rejectUpdate(EmployeeVO empVO) throws MessagingException, UnsupportedEncodingException{
		ServiceResult result = null;
		int cnt  = managerMapper.rejectUpdate(empVO);
		if(cnt > 0) {
			String empResult = "N";
			MimeMessage message = sendMessage(empVO, empResult);
			emailSender.send(message);
			result = ServiceResult.OK;
			log.info("impl serviceressult : " + result);
		}else {
			result = ServiceResult.FAILED;
			log.info("impl serviceressult : " + result);
		}
		return result;
	}

	/**
	 * 승인 처리 URL
	 * @throws MessagingException 
	 */
	@Transactional
	@Override
	public ServiceResult agreeEmployee(EmployeeVO empVO) throws MessagingException, UnsupportedEncodingException {
		ServiceResult result = null;
		UUID uuid = UUID.randomUUID();
		// 랜덤 비밀번호
		String rndPw = uuid.toString().replace("-", "").substring(0,8);
		
		// 인코딩한 비밀번호
		// 시큐리티 적용 후 하겠음.(적용후 setEmpPw 바꾸기)
		String encPw = pe.encode(rndPw);
		log.info("인코딩 전 비밀번호: " + rndPw);
		log.info("인코딩 후 비밀번호: " + encPw);
		empVO.setEmpPw(encPw);
		
		// 소속에 따른 권한 부여
		AuthorityVO auth = new AuthorityVO();
		auth.setEmpNo(empVO.getEmpNo());
		String empSe = empVO.getEmpSe();
		String authName = "";
		log.info("empSe : " + empSe);
		if(empSe != null && empSe.equals("d")) {
			authName = "ROLE_DOCTOR";
		}else if(empSe != null && empSe.equals("n")) {
			authName = "ROLE_NURSE";
		}else if(empSe != null && empSe.equals("a")) {
			authName = "ROLE_ADMIN";
		}else if(empSe != null && empSe.equals("t")) {
			authName = "ROLE_THERAPIST";
		}else if(empSe != null && empSe.equals("k")) {
			authName = "ROLE_DIRECTOR";
		}else if(empSe != null && empSe.equals("m")) {
			authName = "ROLE_MANAGER";
		}
		
		auth.setAuthorNm(authName);
		
		
		
		int authCnt = managerMapper.insertAuth(auth);
		int cnt = managerMapper.agreeEmployee(empVO);
		if(cnt > 0 && authCnt > 0) {
			empVO.setEmpPw(rndPw);
			String empResult = "Y";
			MimeMessage message = sendMessage(empVO, empResult);
			emailSender.send(message);
			result = ServiceResult.OK;
			log.info("impl serviceressult : " + result);
		}else {
			result = ServiceResult.FAILED;
			log.info("impl serviceressult : " + result);
		}
		return result;
	}
	
	/**
	 * 승인/반려에 따른 메일을 보내는 메소드
	 * @param empVO
	 * @param empResult
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public MimeMessage sendMessage(EmployeeVO empVO, String empResult) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setTo(empVO.getEmpEmail());	// 받는 사람 이메일
		helper.setSubject("메디폼 재활병원 회원 신청 결과 안내");	// 메일 제목
		
		String emailContent = "";	// html식 메일 내용
		if(empResult.equals("Y")) {
			emailContent = agreeContent(empVO);	
		}else if(empResult.equals("N")){
			emailContent = rejectContent(empVO);
		}
		
		helper.setText(emailContent, true);	// 메일 내용
		
		helper.setFrom(new InternetAddress("nammj0419@gmail.com","메디폼재활병원"));	// 메일주소, 보내는 사람 이름
		
		return message;
	}
	
	// 회원가입 최종승인 안내 메일 문구
	// html 형식의 문자열 생성 -> 메일 내용
	/**
	 * 승인 메일 html
	 * @param empVO
	 * @return
	 */
	public String agreeContent(EmployeeVO empVO) {
		StringBuilder sb = new StringBuilder();
		
		String content = "";
		content += "<html>";
		content += "<head>";
		content += "<title>메디폼 재활병원</title>";
		content += "</head>";
		content += "<body>";
		content += "<div style='margin:100px;'>";
		content += "<h1>귀하의 회원가입 신청 결과 <font color='red'>승인</font> 처리 되었습니다.</h1>";
		content += "<p>비밀번호를 확인해주시고, 로그인 후 반드시 비밀번호를 변경하여 주세요.<p>";
		content += "<br/>";
		content += "<hr/>";
		content += "<h2>아이디 : "+ empVO.getEmpNo() + "</h2>";
		content += "<h2>임시비밀번호 : "+ empVO.getEmpPw() + "</h2>";
		content += "<br/>";
		content += "<hr/>";
		content += "</div>";
		content += "</body>";
		
		sb.append(content);
		
		return sb.toString();
	}
	
	// 회원가입 최종승인 안내 메일 문구
	// html 형식의 문자열 생성 -> 메일 내용
	/**
	 * 반려시 메일 html
	 * @param empVO
	 * @return
	 */
	public String rejectContent(EmployeeVO empVO) {
		StringBuilder sb = new StringBuilder();
		
		String content = "";
		content += "<html>";
		content += "<head>";
		content += "<title>메디폼 재활병원</title>";
		content += "</head>";
		content += "<body>";
		content += "<div style='margin:100px;'>";
		content += "<h1>귀하의 회원가입 신청 결과 <font color='red'>반려</font> 처리 되었습니다.</h1>";
		content += "<p>반려 사유를 확인해 주세요.<p>";
		content += "<br/>";
		content += "<hr/>";
		content += "<h2>반려사유 : "+ empVO.getRjctResn() + "</h2>";
		content += "<br/>";
		content += "<hr/>";
		content += "</div>";
		content += "</body>";
		
		sb.append(content);
		
		return sb.toString();
	}

	/**
	 * 권한 삭제
	 */
	@Override
	public int deleteAuth(EmployeeVO empVO) {
		return managerMapper.deleteAuth(empVO);
	}

	/**
	 * 퇴직 처리
	 */
	@Override
	public int retireEmp(EmployeeVO empVO) {
		return managerMapper.retireEmp(empVO);
	}
	
	/**
	 * 직원 수정
	 */
	@Override
	public int updateEmp(EmployeeVO empVO) {
		return managerMapper.updateEmp(empVO);
	}

	/**
	 * 페이징 처리를 위한 멤버수 카운트
	 */
	@Override
	public int selectEmpCount(PaginationInfoVO<EmployeeVO> empPagingVO) {
		return managerMapper.selectEmpCount(empPagingVO);
	}

	/**
	 * 회원 목록 조회
	 */
	@Override
	public List<EmployeeVO> selectEmpList(PaginationInfoVO<EmployeeVO> empPagingVO) {
		return managerMapper.selectEmpList(empPagingVO);
	}
	
	/**
	 * 처리 내역
	 */
	@Override
	public int completeCount(PaginationInfoVO<EmployeeVO> pagingVO) {
		return managerMapper.completeCount(pagingVO);
	}

	/**
	 * 처리 내역 리스트
	 */
	@Override
	public List<EmployeeVO> completeList(PaginationInfoVO<EmployeeVO> pagingVO) {
		return managerMapper.completeList(pagingVO);
	}

	/**
	 * 직원 조직도 리스트
	 */
	@Override
	public List<EmployeeVO> ogzChart() {
		return managerMapper.ogzChart();
	}

	/**
	 * 직급 체크
	 */
	@Override
	public int clsfCheck(EmployeeVO empVO) {
		return managerMapper.clsfCheck(empVO);
	}

	/**
	 * 
	 */
	@Override
	public Map<String, Integer> allCnt() {
		return managerMapper.allCnt();
	}
	
	/**
	 *  간호 근무 일정 등록
	 */
	@Override
	public int insertWorkSchedule(List<WorkScheduleVO> wsList) {
		return scheduleMapper.insertWorkSchedule(wsList);
	}
	
	/**
	 * 간호 근무 일정 등록 전 중복 체크
	 */
	@Override
	public int scheduleInsertCheck(String thisYm) {
		return scheduleMapper.scheduleInsertCheck(thisYm);
	}
	
	/**
	 * 간호 근무 일정 등록 시 중복되는 값 있으면 삭제하는 메서드
	 */
	@Override
	public void deleteSchedule(String thisYm) {
		scheduleMapper.deleteSchedule(thisYm);
	}

	/**
	 * 엑세 양식 다운로드 메서드
	 */
	@Override
	public Workbook excelNurseScheduleDownload(String reqYm) {
		// 넘겨받은 파라미터로 해당 월의 첫 날의 요일과 말일의 값을 구하기
		log.info("reqYm : " + reqYm);
		
		String[] yearMonth = reqYm.split("-");
		int thisYear = Integer.parseInt(yearMonth[0]);
		int thisMonth = Integer.parseInt(yearMonth[1]);
		
		// 입력받은 연도와 월을 기반으로 Calendar 객체를 생성
		Calendar calendar = Calendar.getInstance();
		calendar.set(thisYear, thisMonth - 1, 1); // 월은 0부터 시작하므로 1을 빼줍니다.
		
		// 요일 구하기
		// 1~7 (일요일부터 시작)
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		
		// 말일 구하기
		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		// 반복문 돌릴 요일 배열
		String[] weekArr = {"토", "일", "월", "화", "수", "목", "금"};
		
		// 엑셀 파일 객체 생성
		Workbook workbook = new HSSFWorkbook();
		
		// 스타일 설정을 위한 객체 생성
		// 첫번째 행
		CellStyle headerDayStyle = workbook.createCellStyle();
		// 두번째 행
		CellStyle headerStyle = workbook.createCellStyle();
		// 빈 공간 상위
		CellStyle headerTemp = workbook.createCellStyle();
		// 빈 공간 하위
		CellStyle headerTemp2 = workbook.createCellStyle();
		
		CellStyle headerTemp3 = workbook.createCellStyle();
		
		// 간호 사번 출력용 스타일이자 테두리 스타일 적용이 안된 기본용으로 사용
		CellStyle nurseListNo = workbook.createCellStyle();
		// 간호 리스트
		CellStyle nurseListStyle = workbook.createCellStyle();
		
		// 테두리 스타일 설정
		// 첫째행
		headerTemp.setBorderRight(BorderStyle.MEDIUM);
		
		// 둘째행
		headerTemp2.setBorderBottom(BorderStyle.MEDIUM);
		
		// 둘째행 오른쪽 빈칸
		headerTemp3.setBorderBottom(BorderStyle.MEDIUM);
		headerTemp3.setBorderRight(BorderStyle.MEDIUM);
		
		// 둘째줄 나머지
		headerStyle.setBorderBottom(BorderStyle.MEDIUM);
		
		nurseListStyle.setBorderRight(BorderStyle.MEDIUM);
		
		// 폰트 설정을 위한 객체 생성
		Font font = workbook.createFont();
		font.setBold(true); // 굵게 설정
		font.setFontHeightInPoints((short) 11);
		
		// 스타일에 폰트 적용
		headerDayStyle.setFont(font);
		headerStyle.setFont(font);
		nurseListStyle.setFont(font);
		nurseListNo.setFont(font);
		
		
		// 가운데 정렬 설정
		headerDayStyle.setAlignment(HorizontalAlignment.CENTER);
		headerDayStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		nurseListStyle.setAlignment(HorizontalAlignment.CENTER);
		nurseListStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		nurseListNo.setAlignment(HorizontalAlignment.CENTER);
		nurseListNo.setVerticalAlignment(VerticalAlignment.CENTER);
		
		// sheet 생성
		Sheet sheet = workbook.createSheet(reqYm + " 근무일정표");

		// A 열의 넓이를 15로 설정
        int columnWidth = 15 * 256; // 엑셀에서의 넓이 단위는 1/256입니다.
        sheet.setColumnWidth(0, columnWidth); // 0은 A 열을 나타냅니다.
		
		//  현재 행
		int rowNo = 0;
		
		// 첫번째 행 생성
		Row headerRow = sheet.createRow(rowNo++);
		// 첫번째 행에는 해당 월의 총 일 수를 반복문을 통해 기입
		for (int i = 0; i < lastDay + 2; i++) {
		    Cell cell;
		    if (i == 0) {
		    	cell = headerRow.createCell(i);
		    	cell.setCellValue(reqYm);
		    	cell.setCellStyle(nurseListNo);
		    }else if(i == 1) {
		    	cell = headerRow.createCell(i);
		    	cell.setCellStyle(headerTemp);
		    }else {
		    	cell = headerRow.createCell(i);
		    	cell.setCellValue(i - 1);
		    	cell.setCellStyle(headerDayStyle);
		    }
		}
		
		// 두번째 행 생성
		Row secHeaderRow = sheet.createRow(rowNo++);
		// 두번째 행에는 해당 일에 대한 요일이 입력 됨
		for (int i = 0; i < lastDay + 2; i++) {
		    Cell cell;
		    Cell tempCell;
		    if (i == 0) {
		    	tempCell = secHeaderRow.createCell(i);
		    	tempCell.setCellStyle(headerTemp2);
		    } else if(i == 1){
		    	cell = secHeaderRow.createCell(1);
		    	cell.setCellStyle(headerTemp3);
		    	
		    }else {
		    	cell = secHeaderRow.createCell(i);
		    	cell.setCellValue(weekArr[dayOfWeek % 7]);
		    	cell.setCellStyle(headerStyle);
		    	dayOfWeek++;
		    	
		    }
		}
		
		// 간호사 list
		List<EmployeeVO> nurseList = scheduleMapper.getNurseList();
		for (int i = 0; i < nurseList.size(); i++) {
		    Row row = sheet.createRow(rowNo++);
		    Cell noCell = row.createCell(0);
		    noCell.setCellValue(nurseList.get(i).getEmpNo());
		    noCell.setCellStyle(nurseListNo);
		    
		    Cell nameCell = row.createCell(1);
		    nameCell.setCellValue(nurseList.get(i).getEmpNm());
		    nameCell.setCellStyle(nurseListStyle);
		    
		    for(int j = 0; j < lastDay; j++) {
		    	Cell blankCell = row.createCell(j + 2);
		    	blankCell.setCellStyle(nurseListNo);
		    }
		}
		
		
		return workbook;
	}

	/**
	 * 일 변환 계산 메서드
	 */
	@Override
	public Map<String, Object> daysCalculator(String tempDate) {
		String[] yearMonth = tempDate.split("-");
		int thisYear = Integer.parseInt(yearMonth[0]);
		int thisMonth = Integer.parseInt(yearMonth[1]);
		
		// 입력받은 연도와 월을 기반으로 Calendar 객체를 생성
		Calendar calendar = Calendar.getInstance();
		calendar.set(thisYear, thisMonth - 1, 1); // 월은 0부터 시작하므로 1을 빼줍니다.
		
		// 요일 구하기
		// 1~7 (일요일부터 시작)
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		
		// 말일 구하기
		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 반복문 돌릴 요일 배열
		String[] weekArr = {"일", "월", "화", "수", "목", "금", "토"};
		
		List<String> scheduleList = new ArrayList<>();

		int dayOfMonth = 1;

		while (dayOfMonth <= lastDay) {
		    String dayOfWeekStr = weekArr[dayOfWeek];
		    scheduleList.add(dayOfWeekStr);
		    dayOfWeek = (dayOfWeek + 1) % weekArr.length;
		    dayOfMonth++;
		}
		
		map.put("daysList", scheduleList);
		map.put("lastDay", lastDay);
		
		return map;
	}

	/**
	 * 간호 근무 일정 테이블을 만들기 위한 통계 메서드 
	 */
	@Override
	public List<ScheduleDataVO> empScheduleCnt(String tempDate) {
		return scheduleMapper.empScheduleCnt(tempDate);
	}

	/**
	 * 간호 근무 일정 테이블을 만들기 위한 통계 메서드 
	 */
	@Override
	public List<ScheduleDataVO> dateScheduleCnt(String tempDate) {
		return scheduleMapper.dateScheduleCnt(tempDate);
	}

	/**
	 * 간호 근무 일정 테이블을 만들기 위한 통계 메서드 
	 */
	@Override
	public List<WorkScheduleVO> workScheduleList(String tempDate) {
		return scheduleMapper.workScheduleList(tempDate);
	}

	@Override
	public List<EmployeeVO> confirmList() {
		return managerMapper.confirmList();
	}

	

	

	

	

	





	
	
}
