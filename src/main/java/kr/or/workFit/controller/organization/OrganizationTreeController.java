package kr.or.workFit.controller.organization;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.workFit.controller.adminpage.CommuteManageController;
import kr.or.workFit.service.organization.OrganizationService;
import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.organizationhelper.TreeNode;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit")
public class OrganizationTreeController {
	
	
	@Inject
	private OrganizationService organizationService;
	
	@GetMapping(value="/organization/organization")
	public String goToOrganizationView(@SessionAttribute("member") MemberVO member, Model model) throws JsonProcessingException {
		model.addAttribute("menu","organization");
//		ObjectMapper objMapper = new ObjectMapper();
//		
//		List<DeptVO> deptList = organizationService.getAllDeptData(member.getCoCode());
//		model.addAttribute("deptData",objMapper.writeValueAsString(deptList));
		
		
		
		
		// --------인사/조직도 클릭했을 때 가운데 나타나는 가로형 조직도 (구글 조직도에서 가져온 것)가 펼처지도록 하기 위해 필요한 데이터들 (시작)-------
		ObjectMapper objMapper = new ObjectMapper();
		
		List<DeptVO> deptList = organizationService.getAllDeptData(member.getCoCode());
		model.addAttribute("deptData",objMapper.writeValueAsString(deptList));
		
//		List<TreeNode> memList = organizationService.getMemData(member.getCoCode());
//		model.addAttribute("memData",objMapper.writeValueAsString(memList));
		// --------인사/조직도 클릭했을 때 가운데 나타나는 가로형 조직도 (구글 조직도에서 가져온 것)가 펼처지도록 하기 위해 필요한 데이터들 (끝)-------
		
		
		
		
		return "workfit/adminpage/organization";
		
	}
	
	
	@ResponseBody
	@GetMapping(value="/getTreeData")
	public List<TreeNode> setLeftNavTreeview(@SessionAttribute("member") MemberVO member, String flag) {
		log.info("leftNav바 트리뷰 세팅하기"); 
		
		
		// 트리에 들어갈 데이터를 리스트 형태로 담아서 보내주기 
		
		List<TreeNode> joined = new ArrayList<TreeNode>();

		if("dept".equals(flag)) {
			joined = organizationService.getDeptData(member.getCoCode());
		}else {
			// list1은 미배정을 제외한 나머지 부서들을 조회하도록 되어있음 따라서 여기에다가 미배정인 부서를 add해주면 됨! 
			List<TreeNode> list1 = organizationService.getDeptData(member.getCoCode()); 
			// 미배정 부서를 가장 마지막으로 두기 위해서 list1에다가 add하기 
//			TreeNode noneAssignDept = organizationService.getnoneAssignDept(member.getCoCode());
//			list1.add(noneAssignDept);
			
			
			List<TreeNode> list2 = organizationService.getMemData(member.getCoCode());
			
			
			
			
			
			joined.addAll(list1);
			joined.addAll(list2); 
		}
		
		
		
		return joined;
	}
	
	@ResponseBody
	@PostMapping(value = "/getMemNodeData")
	public MemberVO getMemDetail(@RequestBody MemberVO memberVO) {
		log.info("회원아이디 ajax통해서 잘 들어왔는지 체크"+memberVO.getMemId());
		return organizationService.getMemDetail(memberVO.getMemId());
	}
	
	@ResponseBody
	@PostMapping(value = "/getDeptAssignedMember")
	public List<TreeNode> getDeptAssignedMember(@SessionAttribute("member") MemberVO member,@RequestBody TreeNode treeNode){
		log.info("클릭한 부서의 하위부서까지 모든 사원들을 꺼내오자!");
		treeNode.setCoCode(member.getCoCode());
		
		String flag = treeNode.getFlagForClassifyingDeptAndMem();
		List<TreeNode> list = new ArrayList<TreeNode>();
		if("dep".equals(flag)) {
			list = organizationService.getDeptAssignedMember(treeNode);
		}else {
			MemberVO memberVO = organizationService.getMemDetail(treeNode.getDeptCode());
			
			treeNode.setMemName(memberVO.getMemName());
			treeNode.setMemJobGrade(memberVO.getMemJobGrade());
			treeNode.setMemId(memberVO.getMemId());
			treeNode.setMemEmail(member.getMemEmail());
			
			String depName = organizationService.selectOneDeptName(memberVO.getDeptFk());
			treeNode.setDeptName(depName);
			
			list.add(treeNode);
		}
		
		return list;
	}
	

}
