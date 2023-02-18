package kr.or.workFit.controller.adminpage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.workFit.service.organization.OrganizationService;
import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.organizationhelper.LargeInfoMemberVO;
import kr.or.workFit.vo.organizationhelper.TreeNode;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit")
public class OrganizationManagingController {
	
	@Inject
	private OrganizationService organizationService;
	
	
	@GetMapping(value="/organizationmanage/organization")
	public String goToOrganizationView(@SessionAttribute("member") MemberVO member, Model model) throws JsonProcessingException {
		log.info("인사페이지 들어가자!");
		
		model.addAttribute("menu","organizationManage");
		ObjectMapper objMapper = new ObjectMapper();
		
		
		
		
		List<DeptVO> deptList = organizationService.getAllDeptData(member.getCoCode());
		model.addAttribute("deptData",objMapper.writeValueAsString(deptList));
		
		List<TreeNode> memList = organizationService.getMemData(member.getCoCode());
		model.addAttribute("memData",objMapper.writeValueAsString(memList));
		
		
		return "workfit/adminpage/organization";
		
	}
	
	@GetMapping(value = "/organizationmanage/memTable")
	public String goToMemTable(@SessionAttribute("member") MemberVO member, Model model) {
		log.info("인사 페이지에서 직원 조회 배너 메뉴 들어가기!");
		model.addAttribute("menu","organizationManage");
		
//		List<LargeInfoMemberVO> deptMemberList = organizationService.getMyComDeptMember(member);

//		List<LargeInfoMemberVO> CompanyMemberList = organizationService.getMyComAllMember(member.getCoCode());
	
		
		return "workfit/adminpage/memberListForLv2";
	}
	
	
}
