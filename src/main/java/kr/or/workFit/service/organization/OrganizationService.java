package kr.or.workFit.service.organization;

import java.util.List;

import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.organizationhelper.TreeNode;

public interface OrganizationService {

	public List<TreeNode> getMemData(String coCode);

	public List<TreeNode> getDeptData(String coCode);

	public MemberVO getMemDetail(String memId);

	public List<DeptVO> getAllDeptData(String coCode);

	public List<TreeNode> getDeptAssignedMember(TreeNode treeNode);

	public TreeNode getnoneAssignDept(String coCode);

	public String selectOneDeptName(String deptFk);

}
