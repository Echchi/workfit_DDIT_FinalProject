package kr.or.workFit.service.approval;

import java.util.List;

import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalVO;
import kr.or.workFit.vo.MemberVO;

/**
 * @author PC-11
 *
 */
public interface TempService {

	public List<ApprovalDocVO> tempList(ApprovalVO approvalVO) throws Exception;
	public ApprovalVO selectApprovalData(ApprovalVO approvalVO) throws Exception;
	public ApprovalDocVO selectDetail(String docCode) throws Exception;
	public List<ApprovalVO> selectAppLineList(String docCode) throws Exception;
	public List<ApprovalAttachVO> selectAttachList(String docCode) throws Exception;
	public List<ApprovalReferenceVO> selectReferenceList(String docCode) throws Exception;
	public MemberVO getMemINfo(String memId) throws Exception;
	public ApprovalAttachVO selectAttachInfo(String attachCode) throws Exception;
	public int deleteAttach(String attachCode) throws Exception;
	public int deleteRefer(String docCode) throws Exception;
	public int deleteApprovalLine(String docCode) throws Exception;
	public int updateApprovalDoc(ApprovalDocVO approvalDocVO) throws Exception;
	public int updateAttach(ApprovalAttachVO attVO) throws Exception;
	
	
	/** 문서코드 가지고 첨부 파일삭제 
	 * @param delCode
	 * @return
	 */
	public int deleteAttachFromDocCode(String delCode);
	
	/** 문서코드 가지고 문서함 삭제
	 * @param delCode
	 * @return
	 */
	public int deleteDoc(String delCode); 
}
