package kr.or.ddit.therapist.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.vo.RceptVO;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.therapist.service.ITherapistIReceiptService;
import kr.or.ddit.therapist.vo.MedicalTreatmentRecordVO;
import kr.or.ddit.therapist.vo.OccupationalTherapyVO;
import kr.or.ddit.therapist.vo.PhysicalClinicRoomVO;
import kr.or.ddit.therapist.vo.TherapistPatientVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_THERAPIST')")
@RequestMapping("/mediform/therapist")
public class TherapistCareController {

	@Inject
	private ITherapistIReceiptService therapistreceiptService;
	
		/**
		 * 치료 오더 메인 페이지 
		 * @param model
		 * @return
		 */
		@RequestMapping(value = "/care/main", method = RequestMethod.GET)
		public String therapistForm(Model model) {
			log.info("receiptMain 실행...!");
			
			List<RceptVO> waitingList = therapistreceiptService.waitingList();
			
			List<PhysicalClinicRoomVO> roomList = therapistreceiptService.roomList();
			
			List<OccupationalTherapyVO> oTList = therapistreceiptService.therapyingList();
			
			model.addAttribute("roomList", roomList);
			model.addAttribute("waitingList", waitingList);
			model.addAttribute("oTList", oTList);
			model.addAttribute("menuSelected", "btnCare");
			
//			log.info("oTList 사이즈 : " + oTList.size());
			
//			log.info("waitingList" + waitingList.size());
			
			return "therapist/care";
		}
		
		/**
		 * 환자 상세 정보
		 * @param map
		 * @return
		 */
		@PostMapping(value="/patient/detail")
		public ResponseEntity<TherapistPatientVO> getPatient(@RequestBody Map<String, String> map){
			String rceptNo = map.get("rceptNo");
			log.info("rceptNo : " + rceptNo);
			
			
			// 환자 정보
			TherapistPatientVO patientVO = therapistreceiptService.getPatient(rceptNo);
			
			// 치료 오더 내역 
			List<MedicalTreatmentRecordVO> mtrList = therapistreceiptService.medicalTreatmentRecordList(rceptNo);
			
			patientVO.setMtrList(mtrList);
			
			return new ResponseEntity<TherapistPatientVO>(patientVO, HttpStatus.OK);
		}
		
		/**
		 * 치료 오더 값 변경시 발생하는 이벤트
		 * (치료를 했는지 안했는지에 대한 체크)
		 * @param map
		 * @return
		 */
		@PostMapping(value="/medicalTreatmentRecord/statusChange")
		public ResponseEntity<String> medicalTreatmentRecordUpdate(@RequestBody Map<String, String> map){
			String rceptNo = map.get("rceptNo");			// 접수 번호
			String mdlrtCd = map.get("mdlrtCd");			// 치료 코드
			String mdlrtrdChk = map.get("mdlrtrdChk");		// 치료 여부(T, F)
			String mdlrtCurer = map.get("sessionUserId");	// 치료사
			log.info("mdlrtCurer : " + mdlrtCurer);
			
//			String formatMdlrtrdChk = "";
//			
//			if(mdlrtrdChk != null && mdlrtrdChk.equals("T")) {
//				formatMdlrtrdChk = "F";
//			}else {
//				formatMdlrtrdChk = "T";
//			}
//			
//		
//			log.info("rceptNo : " + rceptNo);
//			log.info("mdlrtCd : " + mdlrtCd);
//			log.info("mdlrtrdChk : " + mdlrtrdChk);
		
		// sql에서 파라미터로 쓸 변수들을  vo로 묶어서 보낸다.(그래야 편하다.)
			MedicalTreatmentRecordVO mtrVO = new MedicalTreatmentRecordVO();
			
			mtrVO.setMdlrtCurer(mdlrtCurer);
			mtrVO.setRceptNo(rceptNo);
			mtrVO.setMdlrtCd(mdlrtCd);
			mtrVO.setMdlrtrdChk(mdlrtrdChk);
			
			// 업데이트 결과값을 담을 변수
			int cnt = 0;
			
			// 널 체크 후 업데이트 실행. 널이면 FAILED 리턴
			if(rceptNo != null && mdlrtCd != null && mdlrtrdChk != null) {
				cnt = therapistreceiptService.medicalTreatmentRecordUpdate(mtrVO);
				
			}else {
				log.info("null체크에서 실패");
				return new ResponseEntity<String>("FAILED", HttpStatus.OK);
			}
			
			// 결과값에 따른 리턴
			if(cnt > 0) {
				log.info("결과값 리턴 성공");
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}else {
				log.info("결과값 리턴 실패");
				return new ResponseEntity<String>("FAILED", HttpStatus.OK);
			}
		}
		
		
		/**
		 * 치료실 환자 배정
		 * @param roomVO
		 * @param ra
		 * @return
		 */
		@PostMapping(value="/physicalClinicRoom/registration")
		public String physicalClinicRoomRegistration(PhysicalClinicRoomVO roomVO, RedirectAttributes ra) {
			
			// 물리치료실 배정
			
			// 방배정 실행 구문
			int roomCnt = therapistreceiptService.physicalClinicRoomRegistration(roomVO);
			// 접수 상태 변경
			int rceptCnt = therapistreceiptService.rceptSttusUpdate(roomVO);
			
			// 결과값을 보내줄 메세지
			String msg = "";
			if(roomCnt > 0 && rceptCnt > 0) {
				msg = "y";
			}else {
				msg = "n";
			}
			ra.addFlashAttribute("msg", msg);
			
			return "redirect:/mediform/therapist/care/main";
		}
		
		
		@PostMapping(value="/therapyRoom/registration")
		public String therapyRoomRegistration(Authentication authentication, PhysicalClinicRoomVO roomVO, RedirectAttributes ra) {
			
			log.info("therapyRoomRegistration() 실행!!! >>> 작업치료 등록 컫트롤러 메소드 도착!!!!");
			
			log.info("작업치료 치료중 업데이트 컨트롤러 메서드에서 진료실 번호 >>> " + roomVO.getRceptClnc());
			
			// 방배정 실행 구문
			int roomCnt = therapistreceiptService.therapyRoomRoomRegistration(roomVO);
			// 접수 상태 변경
			int rceptCnt = therapistreceiptService.rceptTherapySttusUpdate(roomVO);
			
			CustomUser customUser = (CustomUser) authentication.getPrincipal();
			
			roomVO.setMdlrtCurer(customUser.getUsername());
			
			// 치료오더 테이블 업데이트
			int mtrUp = therapistreceiptService.ocMedicalTreatmentRecordUpdate(roomVO);
			
			// 결과값을 보내줄 메세지
			String msg = "";
			if(mtrUp > 0 && rceptCnt > 0) {
				msg = "y";
			}else {
				msg = "n";
			}
			ra.addFlashAttribute("msg", msg);
			ra.addFlashAttribute("otFlag", "ot");
			
			
			return "redirect:/mediform/therapist/care/main";
		}
		
		
		// 작업치료실 치료상태 > 치료완료 클릭시 실행되는 메서드
		@RequestMapping(value="/therapyRoom/update", method=RequestMethod.POST)
		public String updateReceptSttusOc(PhysicalClinicRoomVO roomVO, RedirectAttributes ra) {
			
			log.info("updateReceptSttusOc() 실행!!!");
			
			int result = therapistreceiptService.updateReceptSttusOc(roomVO);
			String msg = "";
			if(result > 0 ) {
				msg = "y";
			}else {
				msg = "n";
			}
			ra.addFlashAttribute("otFlag", "ot");
			ra.addFlashAttribute("msg", msg);
			
			return "redirect:/mediform/therapist/care/main";
		}
		
		
		
		// 물리치료실 치료상태 > 치료완료 클릭시 실행되는 메서드
		@PostMapping(value="/physicalClinicRoom/updateRceptSttusCp")
		public String updateRceptSttusCp(PhysicalClinicRoomVO roomVO, RedirectAttributes ra) {
			
			log.info("roomVO : " + roomVO);
			
			int result = this.therapistreceiptService.updateRceptSttusCp(roomVO);
			
			// 치료상태 변경할 때 환자,접수번호, 치료사 null로 바꿔주기
			int deleteResult = therapistreceiptService.deletePcr(roomVO);
			String msg = "";
			if(result > 0 && deleteResult > 0) {
				msg = "y";
			}else {
				msg = "n";
			}
			
			ra.addFlashAttribute("msg", msg);
			
			log.info("updateRceptSttusCp->result : " + result);
			
			return "redirect:/mediform/therapist/care/main";
		}
		
		
		// 물리치료실 치료상태 > 작업치료실 이동 클릭 시 실행되는 메서드
		@PostMapping(value = "physicalClinicRoom/updateRceptSttusOt")
		
		public String updateRceptSttusOt(PhysicalClinicRoomVO roomVO, RedirectAttributes ra) {
			
			int result = this.therapistreceiptService.updateRceptSttusOt(roomVO);
			
			// 치료상태 변경할 때 환자,접수번호, 치료사 null로 바꿔주기
			int deleteResult = therapistreceiptService.deletePcr(roomVO);
			String msg = "";
			if(result > 0 && deleteResult > 0) {
				msg = "y";
			}else {
				msg = "n";
			}
			
			ra.addFlashAttribute("msg", msg);
			
			
//			log.info("updateRceptSttusCp->result : " + result);
			
			return "redirect:/mediform/therapist/care/main";
		}
		
		@ResponseBody
		@PostMapping(value="/physicalClinicRoom/medicalTreatmentRecord/check")
		public ResponseEntity<String> mtrCheck(@RequestBody PhysicalClinicRoomVO roomVO){
			
			// 잔여 작업치료 체크
			int cnt = therapistreceiptService.mtrCheck(roomVO);
			String result = "";
			
			// 값이 있으면 
			if(cnt > 0) {
				result = "failed";
			}else {
				// 없으면 submit 해도 된다.
				result = "success";
			}
			
			return new ResponseEntity<String>(result, HttpStatus.OK);
			
		}
}












