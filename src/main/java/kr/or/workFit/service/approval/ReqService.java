package kr.or.workFit.service.approval;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalVO;
import kr.or.workFit.vo.MemberVO;

public interface ReqService {
// 회원 아이디로 이름 뽑기
	public String changeId2Nm(String memId);
	
// 결재문서
	public List<ApprovalVO> selectAppvContentList(String approvalDocCode);
	
	public List<ApprovalVO> selectAppvList(String memId);
	
	public ApprovalDocVO selectAppvDoc(String approvalDocCode);
	
	public ApprovalVO selectAppv(ApprovalVO approvalVO);
	
	public int selectPreCheck(String approvalDocCode);
	// 결재문서 참조
	public List<ApprovalReferenceVO> selectAppvRef(String approvalDocCode);
	public int insertAppvRef(ApprovalReferenceVO approvalReferenceVO);
	public List<String> selectRefList(String memId);

	// 모든 회원 뽑기
	public List<MemberVO> selectAllMemforRef (String approvalDocCode);
	
// 의견
	public int selectCommentCount (String approvalDocCode);
	
	public int updateAppvComment (ApprovalVO approvalVO);
	
// 첨부파일
	public List<ApprovalAttachVO> selectAttaches (String approvalDocCode);
	
	public int selectAttachCount (String approvalDocCode);
	
// 기안자
	public ApprovalVO selectAppvStart (String approvalDocCode);
	
//	승인
	public int approvalFlagCheck (String approvalDocCode);
	
	public int updateMidApproval (ApprovalVO approvalVO);
	
	public int updateFinalApproval (String approvalDocCode);

	// 반려
	public int rejectApproval (ApprovalVO forApprovalVO);
	
	public int updateFinalRej (String approvalDocCode);

// 첨부파일 추가
	public int saveFile(ApprovalAttachVO uploadedFile); 

// 북마크
	public int insertBookMark(ApprovalVO approvalVO);
	
	public int DelBookMark(ApprovalVO approvalVO);
	
	/// 리펙
	public List<Map<String, Object>> getRequested(String memId);
	public List<Map<String, Object>> getProcessing(String memId);
	public List<Map<String, Object>> getProcessed(String memId);
	public List<Map<String, Object>> getCanceled(String memId);
	public List<Map<String, Object>> getReference(String memId);
	public int getCountAppv(String memId);
	public int getProcessingCnt(String memId);
	public int getProcessedCnt(String memId);
	public int getCanceledCnt(String memId);
	public int getReferenceCnt(String memId);
}
