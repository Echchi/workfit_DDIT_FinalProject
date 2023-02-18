package kr.or.workFit.service.approval;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.workFit.mapper.approval.ApprovalMapper;
import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalBookmarkVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalTemplateVO;
import kr.or.workFit.vo.ApprovalVO;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ApprovalMapper mapper;
	
	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	@Override
	public List<ApprovalDocVO> reportList(ApprovalVO approvalVO) {
		
		return mapper.selectReport(approvalVO);
	}
	@Override
	public int selectApprovalCommentNum(String approvalDocCode) {
		return mapper.selectApprovalCommentNum(approvalDocCode);
	}
	@Override
	public ApprovalVO selectApproval(String approvalDocCode) throws Exception {
		return commonDao.select("selectApproval", approvalDocCode);
		//return mapper.selectApproval(approvalDocCode);
	}
	@Override
	public int selectAttach(String approvalDocCode) {
		return mapper.selectAttach(approvalDocCode);
	}
	@Override
	public int countreference(String approvalDocCode) {
		return mapper.countreference(approvalDocCode);
	}

	@Override
	public int checkBookmark(ApprovalBookmarkVO approvalBookmarkVO) {
		return mapper.checkBookmark(approvalBookmarkVO);
	}

	@Override
	public List<ApprovalDocVO> selectListBookmark(ApprovalVO approvalVO) {
		return mapper.selectListBookmark(approvalVO);
	}

	@Override
	public List<ApprovalTemplateVO> selectTemplateList(ApprovalVO approvalVO) throws Exception {
		return commonDao.selectList("selectTemplateList", approvalVO);
	}

	@Override
	public ApprovalTemplateVO getTemplateContent(Map<String, String> map) throws Exception {
		return commonDao.select("getTemplateContent", map);
	}

	@Override
	public int insertApprovalDoc(ApprovalDocVO approvalDocVO) throws Exception {
		return commonDao.insert("insertApprovalDoc", approvalDocVO);
	}

	@Override
	public int insertApprovalLine(ApprovalVO approvalVO) throws Exception {
		return commonDao.insert("insertApprovalLine", approvalVO);
	}

	@Override
	public int insertApprovalReference(ApprovalReferenceVO approvalReferenceVO) throws Exception {
		return commonDao.insert("insertApprovalReference", approvalReferenceVO);
	}

	@Override
	public int insertApprovalAttach(ApprovalAttachVO attVO) throws Exception {
		return commonDao.insert("insertApprovalAttach", attVO);
	}

	@Override
	public int saveDoc(ApprovalDocVO approvalDocVO) throws Exception {
		return commonDao.insert("saveDoc",approvalDocVO);
	}
	
	
	/**
	 * 리팩토링 후 상신함 리스트 가져오는 메소드
	 */
	@Override
	public List<Map<String, String>> getReportList(String memId) {
		return commonDao.selectList("getReportList", memId);
	}
	@Override
	public int ingAppvCnt(String memId) {
		return mapper.ingAppvCnt(memId);
	}
	@Override
	public int acceptAppvCnt(String memId) {
		return mapper.acceptAppvCnt(memId);
	}
	@Override
	public int rejectAppvCnt(String memId) {
		return mapper.rejectAppvCnt(memId);
	}
	@Override
	public ApprovalAttachVO getApprAttach(String aprvId) {
		// TODO Auto-generated method stub
		return mapper.getApprAttach(aprvId);
	}
	
	





}
