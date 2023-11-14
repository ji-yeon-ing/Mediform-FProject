package kr.or.ddit.doctor.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.doctor.service.IDoctorRoundService;
import kr.or.ddit.doctor.vo.DoctorRoundClinicVO;
import kr.or.ddit.doctor.vo.DoctorRoundInpatientRecordVO;
import kr.or.ddit.doctor.vo.DoctorRoundMedicalExamOrderVO;
import kr.or.ddit.doctor.vo.DoctorRoundNurseRecordVO;
import kr.or.ddit.doctor.vo.DoctorRoundOtptRecordVO;
import kr.or.ddit.doctor.vo.DoctorRoundPrescriptionOrderVO;
import kr.or.ddit.doctor.vo.DoctorRoundSickAndWoundedVO;
import kr.or.ddit.doctor.vo.DoctorRoundVO;
import kr.or.ddit.mapper.doctor.DoctorRoundMapper;
import kr.or.ddit.nurse.vo.VitalVO;
import kr.or.ddit.patient.vo.PatientVO;

@Service
public class DoctorRoundServiceImpl implements IDoctorRoundService{
	
	@Inject
	private DoctorRoundMapper roundMapper;

	@Override
	public List<DoctorRoundInpatientRecordVO> getInpatientRecordDateList(DoctorRoundVO roundVO) {
		return roundMapper.getInpatientRecordDateList(roundVO);
	}

	@Override
	public List<DoctorRoundClinicVO> getClinicDateList(DoctorRoundVO roundVO) {
		return roundMapper.getClinicDateList(roundVO);
	}

	@Override
	public List<DoctorRoundOtptRecordVO> getOtptRecordDateList(DoctorRoundVO roundVO) {
		return roundMapper.getOtptRecordDateList(roundVO);
	}

	@Override
	public List<DoctorRoundNurseRecordVO> getNurseRecordDateList(DoctorRoundVO roundVO) {
		return roundMapper.getNurseRecordDateList(roundVO);
	}

	@Override
	public DoctorRoundClinicVO getClinicVO(DoctorRoundClinicVO clinicVO) {
		return roundMapper.getClinicVO(clinicVO);
	}

	@Override
	public List<DoctorRoundSickAndWoundedVO> roundSickAndWoundedList(DoctorRoundClinicVO clinicVO) {
		return roundMapper.roundSickAndWoundedList(clinicVO);
	}

	@Override
	public List<DoctorRoundPrescriptionOrderVO> prescriptionOrderList(DoctorRoundClinicVO clinicVO) {
		return roundMapper.prescriptionOrderList(clinicVO);
	}

	@Override
	public int insertRound(DoctorRoundInpatientRecordVO inpatientRecordVO) {
		return roundMapper.insertRound(inpatientRecordVO);
	}

	@Override
	public DoctorRoundInpatientRecordVO getInpatientRecord(DoctorRoundInpatientRecordVO inpatientRecordVO) {
		return roundMapper.getInpatientRecord(inpatientRecordVO);
	}

	@Override
	public DoctorRoundNurseRecordVO getNurseRecord(DoctorRoundNurseRecordVO nurseRecordVO) {
		return roundMapper.getNurseRecord(nurseRecordVO);
	}

	@Override
	public DoctorRoundOtptRecordVO getOtptRecord(DoctorRoundOtptRecordVO otptRecordVO) {
		return roundMapper.getOtptRecord(otptRecordVO);
	}

	@Override
	public DoctorRoundVO doctorRoundDate(DoctorRoundVO roundVO) {
		return roundMapper.doctorRoundDate(roundVO);
	}

	@Override
	public PatientVO doctorRoundPatient(DoctorRoundVO roundVO) {
		return roundMapper.doctorRoundPatient(roundVO);
	}

	@Override
	public VitalVO doctorRoundPatientVital(DoctorRoundVO roundVO) {
		return roundMapper.doctorRoundPatientVital(roundVO);
	}

	@Override
	public List<DoctorRoundMedicalExamOrderVO> medicalExamOrderList(DoctorRoundClinicVO clinicVO) {
		return roundMapper.medicalExamOrderList(clinicVO);
	}


}
