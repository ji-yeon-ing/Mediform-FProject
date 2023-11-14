package kr.or.ddit.mapper.nurse;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.common.vo.PaginationInfoVO;
import kr.or.ddit.nurse.vo.MedicineVO;
import kr.or.ddit.nurse.vo.PurchaseOrderVO;
import kr.or.ddit.patient.vo.PatientVO;

public interface MedicineMapper {

	public List<MedicineVO> selectMedicineList();

	public List<MedicineVO> medicineSearch(Map<String, String> map);

	public MedicineVO selectMedicine(Map<String, String> map);

//	public int selectMedicineCount(PaginationInfoVO<MedicineVO> pagingVO);
	
//	public List<MedicineVO> selectMedicinePagingList(PaginationInfoVO<MedicineVO> pagingVO);

	public MedicineVO selectMedicineOne(String medcinNm);



	
}
