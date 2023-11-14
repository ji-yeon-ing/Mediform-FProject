package kr.or.ddit.mapper.doctor;

import java.util.List;

import kr.or.ddit.doctor.vo.DoctorRoundClinicVO;
import kr.or.ddit.doctor.vo.DoctorRoundInpatientRecordVO;
import kr.or.ddit.doctor.vo.DoctorRoundMedicalExamOrderVO;
import kr.or.ddit.doctor.vo.DoctorRoundNurseRecordVO;
import kr.or.ddit.doctor.vo.DoctorRoundOtptRecordVO;
import kr.or.ddit.doctor.vo.DoctorRoundPrescriptionOrderVO;
import kr.or.ddit.doctor.vo.DoctorRoundSickAndWoundedVO;
import kr.or.ddit.doctor.vo.DoctorRoundVO;
import kr.or.ddit.nurse.vo.VitalVO;
import kr.or.ddit.patient.vo.PatientVO;

public interface DoctorRoundMapper {

	public List<DoctorRoundInpatientRecordVO> getInpatientRecordDateList(DoctorRoundVO roundVO);

	public List<DoctorRoundClinicVO> getClinicDateList(DoctorRoundVO roundVO);

	public List<DoctorRoundOtptRecordVO> getOtptRecordDateList(DoctorRoundVO roundVO);

	public List<DoctorRoundNurseRecordVO> getNurseRecordDateList(DoctorRoundVO roundVO);

	public DoctorRoundClinicVO getClinicVO(DoctorRoundClinicVO clinicVO);

	public List<DoctorRoundSickAndWoundedVO> roundSickAndWoundedList(DoctorRoundClinicVO clinicVO);

	public List<DoctorRoundPrescriptionOrderVO> prescriptionOrderList(DoctorRoundClinicVO clinicVO);

	public int insertRound(DoctorRoundInpatientRecordVO inpatientRecordVO);

	public DoctorRoundInpatientRecordVO getInpatientRecord(DoctorRoundInpatientRecordVO inpatientRecordVO);

	public DoctorRoundNurseRecordVO getNurseRecord(DoctorRoundNurseRecordVO nurseRecordVO);

	public DoctorRoundOtptRecordVO getOtptRecord(DoctorRoundOtptRecordVO otptRecordVO);

	public DoctorRoundVO doctorRoundDate(DoctorRoundVO roundVO);

	public PatientVO doctorRoundPatient(DoctorRoundVO roundVO);

	public VitalVO doctorRoundPatientVital(DoctorRoundVO roundVO);

	public List<DoctorRoundMedicalExamOrderVO> medicalExamOrderList(DoctorRoundClinicVO clinicVO);

}
