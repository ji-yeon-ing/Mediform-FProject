package kr.or.ddit.common.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.administration.ServiceResult;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.mapper.common.MypageMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MypageServiceImpl implements IMypageService {

	@Inject
	private MypageMapper mypageMapper;
	
	@Inject
	private PasswordEncoder pe;
	
	@Override
	public ServiceResult employeeUpdate(HttpServletRequest req, EmployeeVO employeeVO) {
		
		ServiceResult result = null;
		
		String uploadPath =  req.getServletContext().getRealPath("/resources/profile");
		
		File file = new File(uploadPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String proFileImg = ""; // 회원정보에 추가될 프로필 이미지 경로
		String fileName = "";
		try {
			MultipartFile profileImgFile = employeeVO.getImgFile();
			
			// 촬영으로 넘어온 파일과 컴퓨터에서 선택한 파일을 구분하기 위한 flag
			String flag = employeeVO.getProfileFlag();
			
			// 촬영용 사진일 때 
			if(flag != null && flag.equals("1")) {
				// 파일화 되지 못한 이미지 데이터
				String binaryData = employeeVO.getImgSrc();
				FileOutputStream stream = null;
				try {
					log.info("binary : " + binaryData);
					if(binaryData == null || binaryData=="") {
		                throw new Exception();    
		            }
					
					binaryData = binaryData.replaceAll("data:image/png;base64,", "");
					byte[] byteFile = Base64.decodeBase64(binaryData);
					log.info("byteFile : " + byteFile + " || " + byteFile.length);
					fileName =  UUID.randomUUID().toString();
					fileName += "_capturedByAdm.png";
					uploadPath += "/" + fileName;		// 업로드 경로
					stream = new FileOutputStream(uploadPath);
					stream.write(byteFile);
					stream.close();
					log.info("파일 등록 완료");
					
					proFileImg = "/resources/profile/" + fileName;
					
				}catch(Exception e) {
					log.info("파일 등록 실패");
				}finally {
					stream.close();
				}
				
			// 컴퓨터에서 고른 사진일 때
			}else if(flag != null && flag.equals("2")) {
				
				if(profileImgFile.getOriginalFilename() != null &&
						!profileImgFile.getOriginalFilename().equals("")) {
					fileName = UUID.randomUUID().toString(); // UUID 파일명 생성
					fileName += "_" + profileImgFile.getOriginalFilename(); // UUID_원본파일명
					uploadPath += "/" + fileName; // 최종 업로드하기 위한 파일 경로
					profileImgFile.transferTo(new File(uploadPath)); // 해당 위치 경로에 파일 복사
					proFileImg = "/resources/profile/" + fileName; // 파일 복사가 일어난 파일의 위치로 접근하기 위한 URI 설정
//					System.out.println("fileName : " +  fileName);
				}
//				System.out.println("uploadPath : " + uploadPath);
//				System.out.println("profileImgFile : " + profileImgFile);
//				System.out.println("proFileImg : " + proFileImg);
				
			}
			
			employeeVO.setEmpProfile(proFileImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String encPw = pe.encode(employeeVO.getEmpPw());
		employeeVO.setEmpPw(encPw);
		System.out.println("!!!!!!!!비밀번호 :::" + employeeVO.getEmpPw());
		log.info("!!!!!!!!비밀번호 :::" + employeeVO.getEmpPw());
		
		int status = mypageMapper.employeeUpdate(employeeVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public EmployeeVO selectInfo(String id) {
		return mypageMapper.selectInfo(id);
	}

}
