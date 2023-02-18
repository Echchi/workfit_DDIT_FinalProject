/*
 * package kr.or.workFit.controller.approval;
 * 
 * import java.text.SimpleDateFormat; import java.util.HashMap; import
 * java.util.List; import java.util.Map;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestBody; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.bind.annotation.SessionAttribute;
 * 
 * import kr.or.workFit.service.approval.ReportServiceImpl; import
 * kr.or.workFit.vo.ApprovalBookmarkVO; import kr.or.workFit.vo.ApprovalDocVO;
 * import kr.or.workFit.vo.ApprovalVO; import kr.or.workFit.vo.MemberVO; import
 * lombok.extern.slf4j.Slf4j;
 * 
 * @Controller
 * 
 * @Slf4j
 * 
 * @RequestMapping("/workfit/approval") public class ReportingApprovalController
 * {
 * 
 * @Autowired private ReportServiceImpl service;
 * 
 * @GetMapping("/report") public String reportPage(Model model) {
 * 
 * model.addAttribute("menu","approval"); return "workfit/approval/reporting"; }
 * 
 * @ResponseBody
 * 
 * @GetMapping(value = "/reporting", produces =
 * "application/json;charset=utf-8") // 조회 public Map<String, Object>
 * report(@SessionAttribute("memId") String memId, Model model) {
 * 
 * ApprovalVO approvalVO = new ApprovalVO(); approvalVO.setMemId(memId); // 결재문서
 * 가져오기 model.addAttribute("menu","approval"); return selectMethod(approvalVO);
 * 
 * }
 * 
 * @ResponseBody
 * 
 * @PostMapping(value = "/selectByDate", produces =
 * "application/json;charset=utf-8") // 조회 // public Map<String, Object>
 * selectByDate(@SessionAttribute("memId") String memId, @RequestBody ApprovalVO
 * appVO) { public Map<String, Object> selectByDate(@SessionAttribute("memId")
 * String memId, ApprovalVO appVO) { log.info("selectByDate 시작했다");
 * log.info("selectByDate 넘어온 값 확인" + appVO.getStartDate());
 * log.info("selectByDate 넘어온 값 확인" + appVO.getEndDate());
 * 
 * appVO.setMemId(memId);
 * 
 * 
 * return selectMethod(appVO);
 * 
 * }
 * 
 * 
 * 
 * public Map<String, Object> selectMethod(ApprovalVO approvalVO) {
 * 
 * SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
 * 
 * List<ApprovalDocVO> reportLsit = service.reportList(approvalVO);
 * log.info("북마크 왜 안들어있음?" + reportLsit.get(0).getApprovalBookmark());
 * 
 * 
 * // 결재의견 저장 map Map<String, Object> commentMap = new HashMap<String,
 * Object>();
 * 
 * // 결재일시 저장 map Map<String, Object> dateMap = new HashMap<String, Object>();
 * 
 * // 결재첨부파일 유무 map Map<String, Object> attachMap = new HashMap<String,
 * Object>();
 * 
 * // 참조(댓글) 저장 map Map<String, Object> referenceMap = new HashMap<String,
 * Object>();
 * 
 * // 북마크여부 저장 map Map<String, Object> bookmarkMap = new HashMap<String,
 * Object>();
 * 
 * // 최종 ajax 반환 json 데이터 Map<String, Object> json = new HashMap<String,
 * Object>();
 * 
 * for (ApprovalDocVO vo : reportLsit) { // 결재의견 개수 int commentNum =
 * service.selectApprovalCommentNum(vo.getApprovalDocCode());
 * log.info("commentNum:" + commentNum); commentMap.put(vo.getApprovalDocCode(),
 * commentNum);
 * 
 * //북마크 여부 체크 ApprovalBookmarkVO bookMarkVO = new ApprovalBookmarkVO();
 * bookMarkVO.setApprovalDocCode(vo.getApprovalDocCode());
 * bookMarkVO.setMemId(approvalVO.getMemId()); int bookmarkCheck =
 * service.checkBookmark(bookMarkVO); String bookCheck= ""; if(bookmarkCheck ==
 * 1) { bookCheck = "○"; }else { bookCheck = "X"; }
 * bookmarkMap.put(vo.getApprovalDocCode(), bookCheck);
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
 * referenceNum); referenceMap.put(vo.getApprovalDocCode(), referenceNum);
 * 
 * } json.put("reportList", reportLsit); json.put("commentMap", commentMap);
 * json.put("dateMap", dateMap); json.put("attachMap", attachMap);
 * json.put("referenceMap", referenceMap); json.put("bookmarkMap", bookmarkMap);
 * 
 * return json; }
 * 
 * }
 */