package kr.or.ddit.therapist.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.vo.RceptVO;
import kr.or.ddit.mapper.therapist.TherapistReceiptMapper;
import kr.or.ddit.therapist.vo.MedicalTreatmentRecordVO;
import kr.or.ddit.therapist.vo.OccupationalTherapyVO;
import kr.or.ddit.therapist.vo.PhysicalClinicRoomVO;
import kr.or.ddit.therapist.vo.TherapistPatientVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TherapistReceiptServiceImpl implements ITherapistIReceiptService {
	
	@Inject
	private TherapistReceiptMapper therapistreceiptMapper;

	@Override
	public List<RceptVO> waitingList() {
		
		List<RceptVO> waitingList = therapistreceiptMapper.waitingList();
		
		return waitingList;
	}

	@Override
	public List<PhysicalClinicRoomVO> roomList() {
		
		return therapistreceiptMapper.roomList();
	}

	@Override
	public TherapistPatientVO getPatient(String rceptNo) {
		return therapistreceiptMapper.getPatient(rceptNo);
	}

	@Override
	public List<MedicalTreatmentRecordVO> medicalTreatmentRecordList(String rceptNo) {
		return therapistreceiptMapper.medicalTreatmentRecordList(rceptNo);
	}

	@Override
	public int medicalTreatmentRecordUpdate(MedicalTreatmentRecordVO mtrVO) {
		return therapistreceiptMapper.medicalTreatmentRecordUpdate(mtrVO);
	}

	@Override
	public int physicalClinicRoomRegistration(PhysicalClinicRoomVO roomVO) {
		return therapistreceiptMapper.physicalClinicRoomRegistration(roomVO);
	}

	@Override
	public int rceptSttusUpdate(PhysicalClinicRoomVO roomVO) {
		return therapistreceiptMapper.rceptSttusUpdate(roomVO);
	}
	
	@Override
	public int therapyRoomRoomRegistration(PhysicalClinicRoomVO roomVO) {
		return therapistreceiptMapper.therapyRoomRoomRegistration(roomVO);
	}

	@Override
	public int rceptTherapySttusUpdate(PhysicalClinicRoomVO roomVO) {
		log.info("업데이트해야할 작업 치료방 번호 >>> " + roomVO.getRceptClnc());
		
		return therapistreceiptMapper.rceptTherapySttusUpdate(roomVO);
	}
	

	@Override
	public int updateRceptSttusCp(PhysicalClinicRoomVO roomVO) {
		int result = this.therapistreceiptMapper.updateRceptSttusCp(roomVO);
		result += this.therapistreceiptMapper.updatePhysicalSttusCp(roomVO);
		log.info("result : " + result);
		
		return result;
	}

	@Override
	public int updateRceptSttusOt(PhysicalClinicRoomVO roomVO) {
		int result = this.therapistreceiptMapper.updateRceptSttusOt(roomVO);
		result += this.therapistreceiptMapper.updatePhysicalSttusOt(roomVO);
		
		return result;
	}

	
	@Override
	public List<OccupationalTherapyVO> therapyingList() {
		
		return therapistreceiptMapper.therapyingList();
	}

	@Override
	public int ocMedicalTreatmentRecordUpdate(PhysicalClinicRoomVO roomVO) {
		return therapistreceiptMapper.ocMedicalTreatmentRecordUpdate(roomVO);
	}

	@Override
	public int updateReceptSttusOc(PhysicalClinicRoomVO roomVO) {
		return therapistreceiptMapper.updateReceptSttusOc(roomVO);
	}

	@Override
	public int deletePcr(PhysicalClinicRoomVO roomVO) {
		
		return therapistreceiptMapper.deletePcr(roomVO);
	}

	@Override
	public int mtrCheck(PhysicalClinicRoomVO roomVO) {
		return therapistreceiptMapper.mtrCheck(roomVO);
	}

	



}
