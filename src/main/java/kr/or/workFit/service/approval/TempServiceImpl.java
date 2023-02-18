package kr.or.workFit.service.approval;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalVO;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("TempService")
public class TempServiceImpl implements TempService {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	
	/**
	 * 임시저장 문서 리스트 셀렉트
	 */
	@Override
	public List<ApprovalDocVO> tempList(ApprovalVO approvalVO) {
		log.debug("여기에 오니?데이터가?, {}", approvalVO);
		return commonDao.selectList("selectTempList", approvalVO);
	}

	
	/**
	 * 임시저장 작성자 데이터
	 */
	@Override
	public ApprovalVO selectApprovalData(ApprovalVO approvalVO) throws Exception {
		return commonDao.select("selectApprovalData", approvalVO);
	}

	
	/**
	 * 문서코드로 결재 문서 디테일 select
	 */
	@Override
	public ApprovalDocVO selectDetail(String docCode) throws Exception {
		return commonDao.select("selectDetail", docCode);
	}

	/**
	 *문서코드로 결재 라인 리스트 셀렉트
	 */
	@Override
	public List<ApprovalVO> selectAppLineList(String docCode) throws Exception {
		return commonDao.selectList("selectAppLineList", docCode);
	}

	/**
	 *문서코드로 결재첨부 리스트 셀렉트
	 */
	@Override
	public List<ApprovalAttachVO> selectAttachList(String docCode) throws Exception {
		return commonDao.selectList("selectAttachList", docCode);
	}

	/**
	 *문서코드로 결재 참조 리스트 셀렉트
	 */
	@Override
	public List<ApprovalReferenceVO> selectReferenceList(String docCode) throws Exception {
		return commonDao.selectList("selectReferenceList", docCode);
	}


	@Override
	public MemberVO getMemINfo(String memId) throws Exception {
		return commonDao.select("getMemINfo", memId);
	}


	@Override
	public ApprovalAttachVO selectAttachInfo(String attachCode) throws Exception {
		return commonDao.select("selectAttachInfo", attachCode);
	}


	@Override
	public int deleteAttach(String attachCode) throws Exception {
		return commonDao.delete("deleteAttach", attachCode);
	}


	@Override
	public int deleteRefer(String docCode) throws Exception {
		return commonDao.delete("deleteRefer", docCode);
	}


	@Override
	public int deleteApprovalLine(String docCode) throws Exception {
		return commonDao.delete("deleteApprovalLine", docCode);
	}


	@Override
	public int updateApprovalDoc(ApprovalDocVO approvalDocVO) throws Exception {
		return commonDao.update("updateApprovalDoc", approvalDocVO);
	}


	@Override
	public int updateAttach(ApprovalAttachVO attVO) throws Exception {
		return commonDao.update("updateAttach", attVO);
	}


	@Override
	public int deleteAttachFromDocCode(String delCode) {
		
		return commonDao.delete("deleteAttachFromDocCode", delCode);
	}


	@Override
	public int deleteDoc(String delCode) {
		return commonDao.delete("deleteDoc", delCode);
	}



}
