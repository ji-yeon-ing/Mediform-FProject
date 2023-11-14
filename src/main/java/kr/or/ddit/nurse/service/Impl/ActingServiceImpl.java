package kr.or.ddit.nurse.service.Impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.ServiceResult;
import kr.or.ddit.common.vo.FileVO;
import kr.or.ddit.doctor.vo.MedicalExaminationOrderVO;
import kr.or.ddit.mapper.nurse.ActingMapper;
import kr.or.ddit.nurse.service.IActingService;
import kr.or.ddit.nurse.vo.VitalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ActingServiceImpl implements IActingService{

	@Inject
	private ActingMapper actingMapper;
	
	@Override
	public List<VitalVO> selectVitalList(Map<String, String> map) {
		return actingMapper.selectVitalList(map);
	}

	@Override
	public ServiceResult examResultInsert(Map<String, String> map) {
		ServiceResult result = null;
		
		int status = actingMapper.examResultInsert(map);
		
		if(status > 0) {
			log.info("검사 결과 업데이트 성공 // 건수 >>> " + status);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult vitalResultInsert(Map<String, String> map) {
		ServiceResult result = null;
		
		int status = actingMapper.vitalResultInsert(map);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<MedicalExaminationOrderVO> vitalResultselect(Map<String, String> map) {
		return actingMapper.vitalResultselect(map);
	}

	@Override
	public ServiceResult insertXray(HttpServletRequest req, MedicalExaminationOrderVO meoVO) {

		ServiceResult result = null;
		
		
		// 아래에 혈액검사, 소변검사 update한 mapper 재활용!
		// 그리고 아래 주석 준 line 다 풀어주세요
//		int status = actingMapper.XXXXXX
		
		
//		if(status > 0) {
			log.info("일단 오더 업데이트 업로드 성공!!!");
			
			List<FileVO> fileList = meoVO.getXRayList();
			
			log.info("보낸 Xray 파일 개수 >>> " + fileList.size());
			
			
			try {
				log.info("서비스 - 파일업로드 직전 두근!!");
				fileUpload(fileList, meoVO, req);
			} catch (Exception e) {
				log.info("서비스 - catch에 잡힘 ㄲㅂ,,,!!");
				e.printStackTrace();
			}
			
			result = ServiceResult.OK;
			log.info("성공!!!");
//		}else {
			result = ServiceResult.FAILED;
			log.info("실패는 성공의 어머니!!!");
//		}
		
		return result;
	}

	private void fileUpload(List<FileVO> fileList, MedicalExaminationOrderVO meoVO, HttpServletRequest req)
			throws IllegalStateException, IOException {

		String savePath = "/resources/xray/";


		if (fileList != null && fileList.size() > 0) {
			log.info("파일이 있음!!!service에 파일 처리 메소드까지 넘어옴");

			for (FileVO fileVO : fileList) {

				MultipartFile xrayFile = fileVO.getItem();

				String xrayImg = "";
				
				log.info("파일 이름 : >>>>>>> 서비스impl 파일 업로드 메소드 (파일이름)" + xrayFile.getOriginalFilename());


				// 파일 업로드 처리 시작
				String saveName = UUID.randomUUID().toString(); // UUID의 랜던 파일명 생성
				saveName = saveName + "_" + xrayFile.getOriginalFilename().replaceAll(" " , "_");;
				// String endFileName = noticeFileVO.getFileName().split("\\.")[1]; // 디버깅 및 확장자
				// 추출 참고
//				String saveLocate = req.getServletContext().getRealPath(savePath + meoVO.getMecCd());
				String saveLocate = req.getServletContext().getRealPath(savePath);
				File file = new File(saveLocate);
				if (!file.exists()) { // 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
					file.mkdirs(); // 폴더 생성
				}
				saveLocate += "/" + saveName;
				// .../resources/notice/15 경로
//				xrayFile.transferTo(new File(saveLocate));
				xrayImg = "/resources/xray/" + saveName;


				// /resources/notice/15/UUID_원본파일명
				fileVO.setFileOrigin(meoVO.getMecCd()); // 게시글 번호 설정
				fileVO.setFileFlpth(xrayImg); // 파일 업로드 경로 설정

				fileVO.setFilePatntNo(meoVO.getClnicNo());
				fileVO.setFileRceptNo(meoVO.getRceptNo());
				actingMapper.insertXrayFile(fileVO); // 공지사항 게시글 파일 데이터 추가

				File saveFile = new File(saveLocate);
				fileVO.getItem().transferTo(saveFile); // 파일 복사
			}

//		         for (FileVO fileVO : fileList) {
//		            // 파일 업로드 처리 시작
//		            String saveName = UUID.randomUUID().toString(); // UUID의 랜던 파일명 생성
//		            saveName = saveName + "_" + fileVO.getFileNm().replaceAll(" ", "_");
//		            //String endFileName = noticeFileVO.getFileName().split("\\.")[1]; // 디버깅 및 확장자 추출 참고
			//
//		            // .../resources/notice/15 경로
//		            String saveLocate = req.getServletContext().getRealPath(savePath + meoVO.getMecCd());
//		            File file = new File(saveLocate);
//		            if (!file.exists()) { // 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
//		               file.mkdirs(); // 폴더 생성
//		            }
			//
//		            // /resources/notice/15/UUID_원본파일명
//		            saveLocate += "/" + saveName;
//		            fileVO.setFileOrigin(meoVO.getMecCd()); // 게시글 번호 설정
//		            fileVO.setFileFlpth(saveLocate); // 파일 업로드 경로 설정
//		            
//		            fileVO.setFilePatntNo(meoVO.getClnicNo());
//		            fileVO.setFileRceptNo(meoVO.getRceptNo());
//		            actingMapper.insertXrayFile(fileVO); // 공지사항 게시글 파일 데이터 추가
			//
//		            File saveFile = new File(saveLocate);
//		            fileVO.getItem().transferTo(saveFile); // 파일 복사
//		         }
		}

	}

}