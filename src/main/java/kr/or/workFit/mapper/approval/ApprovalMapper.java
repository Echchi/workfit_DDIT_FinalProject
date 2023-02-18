package kr.or.workFit.mapper.approval;

import java.util.List;

import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalBookmarkVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalVO;

public interface ApprovalMapper {
	
	//결재문서 
	public List<ApprovalDocVO> selectReport(ApprovalVO approvalVO);
	//결재문서에 연관된 첨부파일 
	public int selectAttach(String approvalDocCode);
	//결재문서 첨부파일 정보 가져오기
	public ApprovalAttachVO getApprAttach(String aprvId);
	//결재문서에 연관된 결재
	public ApprovalVO selectApproval(String approvalDocCode);
	//결재문서 연관 결재 의견 
	public int selectApprovalCommentNum(String approvalDocCode);
	//결재참조
	public int countreference(String approvalDocCode);
	//북마크 여부
	public int checkBookmark(ApprovalBookmarkVO approvalBookmarkVO);
	//내 북마크 목록 가져오기
	public List<ApprovalDocVO> selectListBookmark(ApprovalVO approvalVO);

	public int ingAppvCnt(String memId);
	public int acceptAppvCnt(String memId);
	public int rejectAppvCnt(String memId);

}
