package kr.or.ddit.administration.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.vo.FileVO;
import lombok.Data;

@Data
public class NoticeBoardVO {

	private String ntbdNo; // 공지사항 번호
	private String empNm; // 작성자 이름
	private String ntbdSj; // 제목
	private String ntbdWriter; // 작성자
	@DateTimeFormat(pattern = "yyyy.MM.dd HH:mm")
	private Date ntbdDay; // 게시일자
	private String ntbdCn; // 내용
	private String ntbdAtchmnfl; // 첨부파일
	private int ntbdRdcnt; // 조회수
	private String ntbdIpcrAt; // 중요여부
	@DateTimeFormat(pattern = "yyyy.MM.dd HH:mm")
	private Date ntbdUpdde; // 수정일자
	
	private String[] delNoticeNo;
	private MultipartFile[] atchBoFile; 
	private List<FileVO> fileList;
	
	public void setAtchBoFile(MultipartFile[] atchBoFile) {
		this.atchBoFile = atchBoFile;
		if(atchBoFile != null) {
			List<FileVO> fileList = new ArrayList<FileVO>();
			for(MultipartFile item : atchBoFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FileVO fileVO = new FileVO(item);
				fileList.add(fileVO);
			}
			this.fileList = fileList;
		}
	}
	
	
	
	
}
