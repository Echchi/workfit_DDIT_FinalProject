package kr.or.workFit.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.workFit.service.approval.ReportDetailService;
import kr.or.workFit.service.approval.TempService;
import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/workfit/approval")
public class DetailController {
	
	@Autowired
	private ReportDetailService reportDetailService; 
	
	@Autowired
	private TempService tempService;
	
	
	@PostMapping(value = "showReportDetail", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> showDetail(@RequestBody String docCode) throws Exception{
		
		log.debug("클라이언트에서 넘어온 값,{}", docCode);
		docCode = docCode.replace(" ", "");
		docCode = docCode.replace("odd", "");
		docCode = docCode.replace("even", "");
		log.debug("클라이언트에서 넘어온 값 가공,{}", docCode);
		
		//정보를 담을 맵
		Map<String, Object> map = new HashMap<String, Object>();
		//결재 라인 셀렉트
		List<ApprovalVO> approvalList = tempService.selectAppLineList(docCode);
		//결재 문서 셀렉트
		ApprovalDocVO approvalDocVO = tempService.selectDetail(docCode);
		//참조자 셀렉트
		List<ApprovalReferenceVO> appRefList = tempService.selectReferenceList(docCode);
		//파일은 어떻게 가져오지??
		List<ApprovalAttachVO> appAttachList = tempService.selectAttachList(docCode);
		
		log.debug("approvalDocVO:,{}", approvalDocVO);
		log.debug("approvalList:,{}", approvalList);
		log.debug("appRefList:,{}", appRefList);
		log.debug("appAttachList:,{}", appAttachList);
		
		map.put("approvalDocVO", approvalDocVO);
		map.put("approvalList", approvalList);
		map.put("appRefList", appRefList);
		map.put("appAttachList", appAttachList);
		
		return map;
	}

}
