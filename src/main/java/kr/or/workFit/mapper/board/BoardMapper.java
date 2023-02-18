package kr.or.workFit.mapper.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.annotations.Mapper;

import kr.or.workFit.vo.BoardAttachVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.MyDocVO;
import kr.or.workFit.vo.PostVO;

@Mapper
public interface BoardMapper {
//	public List<PostVO> selectListPost(String coCode);
	public List<PostVO> selectListPost(Map<String,String> map);
	
	public int insertPost(PostVO postVO);
	
	public int hitUp(String postCode);
	
	public PostVO detail(String postCode);
	
	public int modiPost(PostVO postVO);
	
	public int deletePost(String postCode);
	
	public int insertPostFile(BoardAttachVO uploadedFile);
	
	public void getBoardAttachCode();
	
	public BoardAttachVO getFile(String baId);
	
	public int delBoardAttach(BoardAttachVO boardAttachVO);
	
	public int delAllBoardAttach(String postCode);
	
	public int countBoardAttach(String postCode);
	
	public BoardAttachVO selectListBoardAttach(String postCode);
	
	public int getBoardAttachNo(String postCode);
	
	// -- TEST
//	public List<PostVO> selectListPostPopup(String postCode);
	
	public List<PostVO> selectListPostPopup();
	
	public int checkCreatedBoardCode(String coCode);
	
	public int createBoardCodeDefault(Map<String, String> map);
	
	public String getBoardCode(Map<String, String> map);
	
	public int getPopupCode(Map<String, String> map);
	
	public int popUpValidateOne(Map<String, String> map);
	
	public void changePopNotice(String postCode);
}
