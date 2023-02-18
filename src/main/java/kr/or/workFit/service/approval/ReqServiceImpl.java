package kr.or.workFit.service.approval;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.approval.ApprovalReqMapper;
import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalVO;
import kr.or.workFit.vo.MemberVO;

@Service
public class ReqServiceImpl implements ReqService {
	
	@Inject
	private ApprovalReqMapper mapper;
	
	@Override
	public List<ApprovalVO> selectAppvList(String memId) {
		return mapper.selectAppvList(memId);
	}
	

	@Override
	public ApprovalDocVO selectAppvDoc(String approvalDocCode) {
		return mapper.selectAppvDoc(approvalDocCode);
	}
	
	
	@Override
	public ApprovalVO selectAppv(ApprovalVO approvalVO) {
		return mapper.selectAppv(approvalVO);
	}

	
	@Override
	public int selectCommentCount(String approvalDocCode) {
		return mapper.selectCommentCount(approvalDocCode);
	}
	
	@Override
	public int selectAttachCount(String approvalDocCode) {
		return mapper.selectAttachCount(approvalDocCode);
	}
	
	@Override
	public ApprovalVO selectAppvStart(String approvalDocCode) {
		return mapper.selectAppvStart(approvalDocCode);
	}

	@Override
	public List<ApprovalVO> selectAppvContentList(String approvalDocCode) {
		return mapper.selectAppvContentList(approvalDocCode);
	}

	@Override
	public List<ApprovalAttachVO> selectAttaches(String approvalDocCode) {
		return mapper.selectAttaches(approvalDocCode);
	}


	@Override
	public int updateAppvComment(ApprovalVO approvalVO) {
		return mapper.updateAppvComment(approvalVO);
		
	}


	@Override
	public int approvalFlagCheck(String approvalDocCode) {
		return mapper.approvalFlagCheck(approvalDocCode);
	}


	@Override
	public int updateMidApproval(ApprovalVO approvalVO) {
		return mapper.updateMidApproval(approvalVO);
	}


	@Override
	public int updateFinalApproval(String approvalDocCode) {
		return mapper.updateFinalApproval(approvalDocCode);
	}


	@Override
	public int selectPreCheck(String approvalDocCode) {
		return mapper.selectPreCheck(approvalDocCode);
	}


	@Override
	public int rejectApproval(ApprovalVO approvalVO) {
		return mapper.rejectApproval(approvalVO);
	}


	@Override
	public int updateFinalRej(String approvalDocCode) {
		return mapper.updateFinalRej(approvalDocCode);
	}


	@Override
	public String changeId2Nm(String memId) {
		return mapper.changeId2Nm(memId);
	}


	@Override
	public List<ApprovalReferenceVO> selectAppvRef(String approvalDocCode) {
		return mapper.selectAppvRef(approvalDocCode);
	}


	@Override
	public List<MemberVO> selectAllMemforRef(String approvalDocCode) {
		return mapper.selectAllMemforRef(approvalDocCode);
	}


	@Override
	public int insertAppvRef(ApprovalReferenceVO approvalReferenceVO) {
		return mapper.insertAppvRef(approvalReferenceVO);
	}


	@Override
	public List<String> selectRefList(String memId) {
		return mapper.selectRefList(memId);
	}


	@Override
	public int saveFile(ApprovalAttachVO uploadedFile) {
		return mapper.saveFile(uploadedFile);
	}


	@Override
	public int insertBookMark(ApprovalVO approvalVO) {
		return mapper.insertBookMark(approvalVO);
	}


	@Override
	public int DelBookMark(ApprovalVO approvalVO) {
		return mapper.DelBookMark(approvalVO);
	}


	
	
	///// 리팩
	@Override
	public List<Map<String, Object>> getRequested(String memId) {
		return mapper.getRequested(memId);
	}


	@Override
	public List<Map<String, Object>> getProcessing(String memId) {
		return mapper.getProcessing(memId);
	}


	@Override
	public List<Map<String, Object>> getProcessed(String memId) {
		return mapper.getProcessed(memId);
	}


	@Override
	public List<Map<String, Object>> getCanceled(String memId) {
		return mapper.getCanceled(memId);
	}


	@Override
	public List<Map<String, Object>> getReference(String memId) {
		return mapper.getReference(memId);
	}


	@Override
	public int getCountAppv(String memId) {
		return mapper.getCountAppv(memId);
	}


	@Override
	public int getProcessingCnt(String memId) {
		return mapper.getProcessingCnt(memId);
	}


	@Override
	public int getProcessedCnt(String memId) {
		return mapper.getProcessedCnt(memId);
	}


	@Override
	public int getCanceledCnt(String memId) {
		return mapper.getCanceledCnt(memId);
	}


	@Override
	public int getReferenceCnt(String memId) {
		return mapper.getReferenceCnt(memId);
	}







	
	
	

}
