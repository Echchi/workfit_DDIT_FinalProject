package kr.or.workFit.controller.approval;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.approval.ReportServiceImpl;
import kr.or.workFit.vo.ApprovalBookmarkVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/workfit/approval")
public class BookmarkController {

	@Autowired
	private ReportServiceImpl service;

	@GetMapping("/bookmark")
	public String reportPage(Model model, @SessionAttribute("memId") String memId) throws Exception {
		
		model.addAttribute("menu","approval");
		
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setMemId(memId);
		
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy.MM.dd.");
		
		List<ApprovalDocVO> bookmarkList = service.selectListBookmark(approvalVO);
		
		//작성자 저장 map
		Map<String, Object> writerMap = new HashMap<String, Object>();
		
		// 참조(댓글) 저장 map
		Map<String, Object> referenceMap = new HashMap<String, Object>();
		
		// 결재첨부파일 유무 map
		Map<String, Object> attachMap = new HashMap<String, Object>();
		
		// 결재의견 저장 map
		Map<String, Object> commentMap = new HashMap<String, Object>();

		// 결재일시 저장 map
		Map<String, Object> dateMap = new HashMap<String, Object>();

		// 북마크여부 저장 map
		Map<String, Object> bookmarkMap = new HashMap<String, Object>();
		
		
		for (ApprovalDocVO vo : bookmarkList) {
			// 결재의견 개수
			int commentNum = service.selectApprovalCommentNum(vo.getApprovalDocCode());
			log.info("commentNum:" + commentNum);
			commentMap.put(vo.getApprovalDocCode(), commentNum);

			// 결재일시
			ApprovalVO apVO = service.selectApproval(vo.getApprovalDocCode());
			log.info("approvalVO:" + apVO);
			log.info("approvalVO날짜 들어가는것:" + apVO.getApprovalDate());
			dateMap.put(vo.getApprovalDocCode(), newDtFormat.format(apVO.getApprovalDate()));
			writerMap.put(vo.getApprovalDocCode(), apVO.getMemName());
			

			// 첨부파일 개수
			int attachNum = service.selectAttach(vo.getApprovalDocCode());
			log.info("attachNum:" + attachNum);
			attachMap.put(vo.getApprovalDocCode(), attachNum);

			// 결재참조(댓글)개수
			int referenceNum = service.countreference(vo.getApprovalDocCode());
			log.info("referenceNum:" + referenceNum);
			referenceMap.put(vo.getApprovalDocCode(), referenceNum);
			
			//북마크 여부 체크
			ApprovalBookmarkVO bookMarkVO = new ApprovalBookmarkVO();
			bookMarkVO.setApprovalDocCode(vo.getApprovalDocCode());
			bookMarkVO.setMemId(approvalVO.getMemId());
			int bookmarkCheck = service.checkBookmark(bookMarkVO);
//			String bookCheck= "";
//			if(bookmarkCheck == 1) {
//				bookCheck = "○";
//			}else {
//				bookCheck = "X";
//			}
			bookmarkMap.put(vo.getApprovalDocCode(), bookmarkCheck);
		}
		
		model.addAttribute("bookmarkList",bookmarkList);
		model.addAttribute("commentMap",commentMap);
		model.addAttribute("dateMap",dateMap);
		model.addAttribute("attachMap",attachMap);
		model.addAttribute("writerMap",writerMap);
		model.addAttribute("referenceMap",referenceMap);
		model.addAttribute("bookmarkMap",bookmarkMap);
		
		return "workfit/approval/bookmark";
	}

}
