package kr.or.workFit.service.organization;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.organization.OrganizationMapper;
import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.organizationhelper.TreeNode;

@Service
public class OrganizationServiceImpl implements OrganizationService {

	@Inject
	private OrganizationMapper mapper;
	
	@Override
	public List<TreeNode> getMemData(String coCode) {
		return mapper.getMemData(coCode);
	}

	@Override
	public List<TreeNode> getDeptData(String coCode) {
		return mapper.getDeptData(coCode);
	}

	@Override
	public MemberVO getMemDetail(String memId) {
		// TODO Auto-generated method stub
		return mapper.getMemDetail(memId);
	}

	@Override
	public List<DeptVO> getAllDeptData(String coCode) {
		// TODO Auto-generated method stub
		return mapper.getAllDeptData(coCode);
	}

	@Override
	public List<TreeNode> getDeptAssignedMember(TreeNode treeNode) {
		// TODO Auto-generated method stub
		return mapper.getDeptAssignedMember(treeNode);
	}

	@Override
	public TreeNode getnoneAssignDept(String coCode) {
		// TODO Auto-generated method stub
		return mapper.getnoneAssignDept(coCode);
	}

	@Override
	public String selectOneDeptName(String deptFk) {
		// TODO Auto-generated method stub
		return mapper.selectOneDeptName(deptFk);
	}

}
