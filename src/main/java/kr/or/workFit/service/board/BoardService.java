package kr.or.workFit.service.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import kr.or.workFit.vo.BoardAttachVO;
import kr.or.workFit.vo.PostVO;

public interface BoardService {
	public List<PostVO> selectListPost(Map<String, String> map);
	
//	public int insertPost(HttpServletRequest req,PostVO postVO);
	// TEST
	public Map<String, String> insertPost(HttpServletRequest req,PostVO postVO,String boardType);
	
	
	public PostVO detail(String postCode);
	
	public int modiPost(HttpServletRequest req,PostVO postVO);
	
	public int deletePost(String postCode);
	
	public Map<String,Object> getUploadedFileInfo(Map<String, MultipartFile> fileMap) throws IOException, Exception;
//	public List<BoardAttachVO> getUploadedFileInfo(Map<String, MultipartFile> fileMap) throws IOException, Exception;
//	public BoardAttachVO getUploadedFileInfo(MultipartFile multipartFile) throws IOException, Exception;

//	public void insertPostFile(BoardAttachVO uploadedFile);
	public BoardAttachVO getFile(String baId);
	
	public void downFile(HttpServletResponse response,BoardAttachVO dataFile);
	
	public int delBoardAttach(BoardAttachVO boardAttachVO);
	

//-- TEST
//	public List<PostVO> selectListPostPopup(String postCode);
	public List<PostVO> selectListPostPopup();
	
	public void checkCreatedBoardCode(String coCode);
	
	public int popUpValidateOne(Map<String, String> map);
	
	public String getBoardCode(Map<String, String> map);
// ---------------- 로직에서만 사용. ----------------	
//	public BoardAttachVO selectListBoardAttach(String postCode);
//	public int hitUp(String postCode);
//	public int delAllBoardAttach(BoardAttachVO boardAttachVO);
//	public int countBoardAttach(String postCode);
//	public int createBoardCodeDefault(String memId);
}
