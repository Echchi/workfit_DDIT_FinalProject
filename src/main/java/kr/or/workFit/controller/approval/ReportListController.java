package kr.or.workFit.controller.approval;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.approval.ReportServiceImpl;
import kr.or.workFit.service.approval.ReqServiceImpl;
import kr.or.workFit.vo.ApprovalBookmarkVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalTemplateVO;
import kr.or.workFit.vo.ApprovalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/approval")
public class ReportListController {

   @Autowired
   private ReportServiceImpl service;
   
   @Autowired
   private ReqServiceImpl reqService;
   
   
   //상신함 리스트 구성 
   @GetMapping("/report")
   public String reportList(Model model, @SessionAttribute("memId") String memId, 
		   					@SessionAttribute("memName") String memName, 
		   					@SessionAttribute("memJobGrade") String memJobGrade) throws Exception {
	   
	   SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy.MM.dd.");
	   
	   //기본 내 정보
	   ApprovalVO approvalVO = new ApprovalVO(); 
	   approvalVO.setMemId(memId);
	   approvalVO.setMemName(memName); 
	   approvalVO.setApprovalMemGrade(memJobGrade);
	   
	   // 결재 양식 목록 
	   List<ApprovalTemplateVO> templateList = service.selectTemplateList(approvalVO);
	   List<Map<String, String>> reportListInfo = service.getReportList(memId);
	   log.debug("reportListInfo 데이터 확인:{}",reportListInfo);
	   
	   for(Map<String, String> map : reportListInfo ) {
		   String date = newDtFormat.format(map.get("APPROVALDATE"));
		   log.debug("현수의 날짜 확인:{}",date);
		   
		   map.put("APPROVALDATE", date);
	   }
	   
	   
	   //템플릿 종류 저장 map 
	   Map<String, Object> templateMap = new HashMap<String, Object>(); 
	   if(mapMaker(templateList) != null) {
		   templateMap = mapMaker(templateList);
	   }
	   
	   
	   // 결재 수신 값
	   int requestedCnt = reqService.getCountAppv(memId);
	   int processingCnt = reqService.getProcessingCnt(memId);
	   int processedCnt = reqService.getProcessedCnt(memId);
	   
	   // 결재 상신 값
	   int ingAppvCnt = service.ingAppvCnt(memId);
	   int acceptAppvCnt = service.acceptAppvCnt(memId);
	   int rejectAppvCnt = service.rejectAppvCnt(memId);
	   
	   model.addAttribute("menu", "approval");
	   model.addAttribute("myInfo", approvalVO);
	   model.addAttribute("reportListInfo", reportListInfo);
	   model.addAttribute("templateMap", templateMap);
	   model.addAttribute("requestedCnt", requestedCnt);
	   model.addAttribute("processingCnt", processingCnt);
	   model.addAttribute("processedCnt", processedCnt);
	   model.addAttribute("acceptAppvCnt", acceptAppvCnt);
	   model.addAttribute("ingAppvCnt", ingAppvCnt);
	   model.addAttribute("rejectAppvCnt", rejectAppvCnt);
	   
	   return "workfit/approval/reportList";
	   
		/*
		 * ApprovalVO approvalVO = new ApprovalVO(); approvalVO.setMemId(memId);
		 * approvalVO.setMemName(memName); approvalVO.setApprovalMemGrade(memJobGrade);
		 * SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		 * 
		 * // 결재문서 목록 List<ApprovalDocVO> reportLsit = service.reportList(approvalVO);
		 * // 결재 양식 목록 List<ApprovalTemplateVO> templateList =
		 * service.selectTemplateList(approvalVO); // 결재의견 저장 map Map<String, Object>
		 * commentMap = new HashMap<String, Object>(); // 결재일시 저장 map Map<String,
		 * Object> dateMap = new HashMap<String, Object>(); // 결재첨부파일 유무 map Map<String,
		 * Object> attachMap = new HashMap<String, Object>(); // 참조(댓글) 저장 map
		 * Map<String, Object> referenceMap = new HashMap<String, Object>(); // 북마크여부 저장
		 * map Map<String, Object> bookmarkMap = new HashMap<String, Object>(); // 최종
		 * ajax 반환 json 데이터 Map<String, Object> json = new HashMap<String, Object>(); //
		 * 템플릿 종류 저장 map Map<String, Object> templateMap = new HashMap<String,
		 * Object>(); if(mapMaker(templateList) != null) { templateMap =
		 * mapMaker(templateList); }
		 * 
		 * // int count = 0; for (ApprovalDocVO vo : reportLsit) { // if(count == 1)
		 * break; // count++; // 결재의견 개수 int commentNum =
		 * service.selectApprovalCommentNum(vo.getApprovalDocCode());
		 * log.info("commentNum:" + commentNum); commentMap.put(vo.getApprovalDocCode(),
		 * commentNum);
		 * 
		 * // 북마크 여부 체크 ApprovalBookmarkVO bookMarkVO = new ApprovalBookmarkVO();
		 * bookMarkVO.setApprovalDocCode(vo.getApprovalDocCode());
		 * bookMarkVO.setMemId(approvalVO.getMemId()); int bookmarkCheck =
		 * service.checkBookmark(bookMarkVO); String bookCheck = ""; if (bookmarkCheck
		 * == 1) { bookCheck = "○"; } else { bookCheck = "X"; } //
		 * bookmarkMap.put(vo.getApprovalDocCode(), bookCheck);
		 * bookmarkMap.put(vo.getApprovalDocCode(), bookmarkCheck);
		 * 
		 * // 결재일시 ApprovalVO apVO = service.selectApproval(vo.getApprovalDocCode());
		 * log.info("approvalVO:" + apVO); log.info("approvalVO날짜 들어가는것:" +
		 * apVO.getApprovalDate()); dateMap.put(vo.getApprovalDocCode(),
		 * newDtFormat.format(apVO.getApprovalDate()));
		 * 
		 * // 첨부파일 개수 int attachNum = service.selectAttach(vo.getApprovalDocCode());
		 * log.info("attachNum:" + attachNum); attachMap.put(vo.getApprovalDocCode(),
		 * attachNum);
		 * 
		 * // 결재참조(댓글)개수 int referenceNum =
		 * service.countreference(vo.getApprovalDocCode()); log.info("referenceNum:" +
		 * referenceNum); referenceMap.put(vo.getApprovalDocCode(), referenceNum); }
		 * 
		 * 
		 * model.addAttribute("menu", "approval");
		 * 
		 * model.addAttribute("myInfo", approvalVO); model.addAttribute("reportList",
		 * reportLsit); model.addAttribute("commentMap", commentMap);
		 * model.addAttribute("dateMap", dateMap); model.addAttribute("attachMap",
		 * attachMap); model.addAttribute("referenceMap", referenceMap);
		 * model.addAttribute("bookmarkMap", bookmarkMap);
		 * model.addAttribute("templateMap", templateMap);
		 * 
		 * return "workfit/approval/reportList";
		 */
   }
   
   // 결재 양식 리스트 뿌리기 위한 메서드
   private Map<String, Object> mapMaker(List<ApprovalTemplateVO> list) {
	  if(list == null || list.size() == 0 ) {
		  return null;
	  }
      Map<String, Object> templateMap = new HashMap<String, Object>();
      for(ApprovalTemplateVO vo : list) {
         String type = vo.getApprovalTemplateType();
         if(!templateMap.containsKey(type)) {
            List<ApprovalTemplateVO> newList = new ArrayList<ApprovalTemplateVO>();
            newList.add(vo);
            templateMap.put(type, newList);
         }else{
            List<ApprovalTemplateVO> existList = (List<ApprovalTemplateVO>) templateMap.get(type);
            existList.add(vo);
            templateMap.put(type, existList);
         }
      }
      log.debug("템플릿 맵 키 값 확인"+templateMap.keySet().toString());
      log.debug("템플릿 제목확인" + templateMap.get("근태").toString());
      return templateMap;
   }
   
   

}