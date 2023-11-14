package kr.or.ddit.common.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileVO {

	private String fileNo; // 파일 이름
	private String fileOrigin; // 파일 출처 (해당 키값)
	private int filePriort; // 우선순위
	private String fileNm; // 파일이름
	private String fileExtsn; // 확장자명
	private String fileFlpth; // 저장경로
	private String filePatntNo; // 환자번호
	private String fileClnicNo; // 진료번호
	private String fileRceptNo; // 접수 번호
	
	
	// 멀티파트로 받을 때 변수 -> 서비스 임플에서 가공
	private MultipartFile item;
	
	public FileVO(){}
	
	public FileVO(MultipartFile item) {
		
		this.item = item;
		this.fileNm = item.getOriginalFilename();
		this.fileExtsn = item.getContentType();
		
		
	}
	
	
	
}
