package kr.or.workFit.service.approval;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalBookmarkVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalTemplateVO;
import kr.or.workFit.vo.ApprovalVO;

public interface ReportService {
	/**
	 * 상신함 목록 셀렉트 
	 * @return
	 */
	public List<ApprovalDocVO> reportList(ApprovalVO approvalVO);
	public int selectAttach(String approvalDocCode);
	public ApprovalAttachVO getApprAttach(String aprvId);
	public ApprovalVO selectApproval(String approvalDocCode) throws Exception;
	public int selectApprovalCommentNum(String approvalDocCode);
	public int countreference(String approvalDocCode);
	public int checkBookmark(ApprovalBookmarkVO approvalBookmarkVO);
	public List<ApprovalDocVO> selectListBookmark(ApprovalVO approvalVO);
	public List<ApprovalTemplateVO> selectTemplateList(ApprovalVO approvalVO) throws Exception;

	
	/**
	 * 
	 * @param templatetile
	 * @return 템플릿 틀
	 * @throws Exception
	 * 템플릿 양식 가져오는 메소드
	 */
	public ApprovalTemplateVO getTemplateContent(Map<String, String> map) throws Exception;
	public int insertApprovalDoc(ApprovalDocVO approvalDocVO) throws Exception;
	public int insertApprovalLine(ApprovalVO approvalVO) throws Exception;
	public int insertApprovalReference(ApprovalReferenceVO approvalReferenceVO) throws Exception;
	public int insertApprovalAttach(ApprovalAttachVO attVO) throws Exception;
	public int saveDoc(ApprovalDocVO approvalDocVO) throws Exception;
	public List<Map<String, String>> getReportList(String memId);
	
	public int ingAppvCnt(String memId);
	public int acceptAppvCnt(String memId);
	public int rejectAppvCnt(String memId);
	
}
