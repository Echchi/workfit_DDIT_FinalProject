package kr.or.workFit.controller.board;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

import kr.or.workFit.service.board.BoardService;
import kr.or.workFit.vo.BoardAttachSerVO;
import kr.or.workFit.vo.BoardAttachVO;
import kr.or.workFit.vo.PostVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/workfit/board")
@Slf4j
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	/**
	 * @author 박형기
	 * @param session : For login MemInfo
	 * @param type : type of Board
	 * @return	: Jsp Mapping
	 */
	@GetMapping("/list/{type}")
	public String freeList(Model model, HttpSession session, 
			@PathVariable String type,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord) {
		log.debug("freeBoard 들어왔습니다.");
		log.debug("boardType : " + type);
		
		// CheckBoardCodeIsNull
		String coCode = (String) session.getAttribute("memCo");
		String goPage = "workfit/board/";
		boardService.checkCreatedBoardCode(coCode);
		
		Map<String, String> map = new HashMap<String, String>();
		if(StringUtils.isNotBlank(searchWord)) {
			if("title".equals(searchType)) {
//				pagingVO.setSearchType("title");	// 제목으로 검색
				log.debug("searchType :"+searchType);
				log.debug("searchWord :"+searchWord);
				map.put("searchType",searchType);
				map.put("searchWord",searchWord);
			}else {
				log.debug("searchType :"+searchType);
				log.debug("searchWord :"+searchWord);
//				pagingVO.setSearchType("writer");	// 작성자로 검색		
			}
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		map.put("coCode", coCode);
		map.put("boardType", type);
		
		List<PostVO> postList = new ArrayList<PostVO>();
		postList = boardService.selectListPost(map);
		
		
		if (postList.size() > 0) {
			log.debug("놀랍게도 글이 존재합니다.");
			session.setAttribute("Cd", postList.get(0).getBoardCode());
		}else {
			log.debug("글이 존재하지 않습니다.");
			session.setAttribute("Cd", boardService.getBoardCode(map));
		}
		
		switch (type) {
			case "notice":
				goPage += "notice";
				break;
			case "free":			
				goPage += "free";
				break;
			case "monthly":
				goPage += "monthly";
				break;
			default:
				goPage += "notice";
				log.debug("기타 값이 들어왔읍니다.");
//				goPage = "redirect:/workfit/login";
				break;
		}
		model.addAttribute("menu", "board");
		model.addAttribute("postList", postList);

		return goPage;
	}

	@GetMapping("/insert/{boardType}")
	public String insertFreeForm(Model model,@PathVariable("boardType") String boardType) {
		model.addAttribute("menu", "board");
		
		switch (boardType) {
		case "notice":
			log.debug("공지사항 입력에 들어왔습니다.");
			model.addAttribute("bstatus","notice");
			break;
		case "free":
			log.debug("자게 입력에 들어왔습니다.");
			model.addAttribute("bstatus","free");
			break;
		case "monthly":
			log.debug("이달의 사원 입력에 들어왔습니다.");
			model.addAttribute("bstatus","monthly");
			break;
		default:
			log.debug("입력 값의 주소가 이상하게 들어왔습니다.");
			break;
	}
		return "workfit/board/insertFree";
	}
	
	
	@PostMapping("/freeBoard/insert")
	public String insertFreeBoard(HttpSession session,
								  Model model,
								  PostVO postVO,
								  HttpServletRequest req,
								  MultipartHttpServletRequest request,
								  @RequestParam(value = "postPopup", required = false) String postPopup,
//								  MultipartFile[] poFile,
								  @RequestParam HashMap<String, Object> parameter) throws IOException, Exception {
		log.debug("Board Insert Post ::::::");
		log.debug("parameter : {}", parameter);
		Map<String, MultipartFile> fileMap = request.getFileMap();
		log.debug("FileMap : "+fileMap.values());
//		log.debug("파일리스트?:"+poFile);
		String boardType = (String)parameter.get("boardType");
		Map<String, String> getCodeMap = new HashMap<String, String>();
		
		getCodeMap.put("coCode", (String) session.getAttribute("memCo"));
		getCodeMap.put("boardType", boardType);
		
		String boardCode = boardService.getBoardCode(getCodeMap);
		log.debug(boardCode);
		postVO.setBoardCode(boardCode);
		
		{
			List<BoardAttachVO> fileList = new ArrayList<BoardAttachVO>();
			MultipartFile[] poFile = new MultipartFile[fileMap.size()];
			int index = 0;
			for (MultipartFile multipartFile : fileMap.values()) {
				BoardAttachVO fileInfo = new BoardAttachVO(multipartFile);
				fileList.add(fileInfo);
				poFile[index++] = multipartFile;
			}
			postVO.setPoFile(poFile);
			
		}
		
		/*
		// Block Test
		{
			for (MultipartFile multipartFile : poFile) {
				BoardAttachSerVO fileInfo = new BoardAttachSerVO(multipartFile);
				log.debug("파일 이름2 : " +fileInfo.getBoardAttachName());
			}
		}
		*/
		log.debug("제목 : "+postVO.getPostTitle());
		log.debug("내용 :" +postVO.getPostContent());
		log.debug("보드코드 :" +postVO.getBoardCode());
		log.debug("멤버 아이디 :"+ postVO.getMemId());
		log.debug("조회 수 : " + postVO.getPostHit());
//		log.debug(req.getParameter("test") + "");
		log.debug("팝업 여부 : "+postVO.getPostPopup());
		
		int result = 0;
		
		if(postPopup.equals("y")){
			Map<String, String> popMap = new HashMap<String, String>();
			popMap.put("coCode", (String) session.getAttribute("memCo"));
			popMap.put("boardType", boardType);
			log.debug("팝업 버튼이 활성화됨..");
			boardService.popUpValidateOne(popMap);
			model.addAttribute("isChanged","true");
		}
		
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		
		if (StringUtils.isBlank(postVO.getPostTitle())) {
			errors.put("postTitle", "제목을 입력해주세요.");
		}
		if (StringUtils.isBlank(postVO.getPostContent())) {
			errors.put("postContent", "내용을 입력해주세요.");
		}
		if (errors.size() > 0) { // 에러가 있음
			model.addAttribute("errors", errors);
			model.addAttribute("postVO", postVO);
			goPage = "workfit/board/free";
		} else { // 정상
			postVO.setMemId(postVO.getMemId());
			Map<String, String> dataMap = boardService.insertPost(req, postVO,boardType);	//TEST
			result = Integer.parseInt(dataMap.get("result"));
			String postCode = dataMap.get("postCode");
			log.debug("postCode : " + postCode);
			if (result == 1) {
//				model.addAttribute("success","success");
//				model.addAttribute("boardType",boardType);
				goPage = "redirect:/workfit/board/list/"+boardType;
				
//				goPage = "redirect:/workfit/board/freeBoard/detail?postCode=pc"+postCode+"&boardType="+boardType;
				log.debug("정상 삽입되고 redirect되는 곳 :"+ goPage);
			} else {
				log.debug("에러 발생이네..?");
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				goPage = "workfit/board/free";
			}
		}
		
		return goPage;
	}
	
	

	@GetMapping("/freeBoard/detail")
	public String detailFreeBoard(Model model, String postCode,String boardType) {
		log.debug("디텔 들어왔읍니다.");
		log.debug(boardType);
		log.debug(postCode);
		PostVO postVO = boardService.detail(postCode);
		
		model.addAttribute("menu", "board");
		model.addAttribute("postVO", postVO);
		/*
		switch (boardType) {
		case "free":
			model.addAttribute("boardType",boardType);
			break;
		case "notice":
			model.addAttribute("boardType",boardType);
			break;
		default:
			break;
		}
		*/
		log.debug("Detail PostVO 값 : "+postVO);
		model.addAttribute("boardType",boardType);
		model.addAttribute("postVO", postVO);
		return "workfit/board/detailfree";
	}
	
	@GetMapping("/freeBoard/modify")
	public String modifyFreeBoardForm(Model model, String postCode) {
		PostVO postVO = boardService.detail(postCode);
		model.addAttribute("postVO", postVO);
		model.addAttribute("menu", "board");
		model.addAttribute("status", "modi");
		
		return "workfit/board/insertFree";
	}
	
	@PostMapping("/freeBoard/modify")
	public String modifyFreeBoard(HttpServletRequest req,Model model, String postCode, PostVO postVO) {
		log.debug("업뎃폼 들어왔음");
		log.debug(postCode);
		int result = 0;
		result = boardService.modiPost(req,postVO);
		System.out.println(result);
		
		return "redirect:/workfit/board/freeBoard/detail?postCode="+postVO.getPostCode();
	}
	
	@PostMapping("/freeBoard/delete")
	public String deleteFreeBoard(Model model, String postCode) {
		log.debug("딜릿 들어왔음");
		log.debug(postCode);
		int result = 0;
		result = boardService.deletePost(postCode);
		log.debug("딜릿 결과 :" + result);
		return "redirect:/workfit/board/list/notice";
	}
	@GetMapping("/freeBoard/get/{baId}")
	public void getFile(HttpServletResponse response, @PathVariable String baId) {
		BoardAttachVO dataFile = boardService.getFile(baId);
		boardService.downFile(response,dataFile);
	}
	
	@GetMapping("/popup")
	public String getPopup(String postCode,Model model) {
		List<PostVO> postList = boardService.selectListPostPopup();
		model.addAttribute("postList",postList);
		return "workfit/board/attendance/popup";
	}
	
	
	
	
	
	
	// =====================================================================================================================================================================
	/*
	@GetMapping("/monthBoard")
	public String monthBoardList(Model model) {
		model.addAttribute("menu", "board");
		return "workfit/board/monthly";
	}

	@GetMapping("/notice")
	public String noticeList(Model model) {
		model.addAttribute("menu", "board");
		return "workfit/board/notice";
	}
	*/
	
//	@GetMapping("/freeBoard/download")
//	public View noticeProcess(
//			HttpServletRequest req, HttpServletResponse resp,
//			int fileNo, ModelMap model) {
//		NoticeFileVO noticeFileVO = noticeService.noticeDownload(fileNo);
//		Map<String, Object> noticeFileMap = new HashMap<String, Object>();
//		noticeFileMap.put("fileName", noticeFileVO.getFileName());
//		noticeFileMap.put("fileSize", noticeFileVO.getFileSize());
//		noticeFileMap.put("fileSavepath", noticeFileVO.getFileSavepath());
//		model.addAttribute("noticeFileMap", noticeFileMap);
//		
//		// 리턴되는 noticeDownloadView는 jsp페이지로 존재하는 페이지 Name을 요청하는게 아니라,
//		// 클래스를 요청 하는것인데, 해당 클래스가 스프링에서 제공하는 AbstractView 클래스를 상속받은 클래스인데
//		// 그 클래스는 AbstractView를 상속받아 renderMergeOutputModel 함수를 재정의할 때 View로 취급할 수 있게 해준다.
//		return new NoticeDownloadView();
//	}
	
	// 테스트 소스.
	/*
	@PostMapping("/freeBoard/insertBoardAttach")
	public @ResponseBody Map<String,Object>  insertFreeBoardFile(
			MultipartHttpServletRequest request,
			HttpServletResponse response,
			@RequestParam HashMap<String, Object> parameter
			) throws Exception {
		
		log.debug("parameter : {}", parameter);
		log.debug("parameter : {}", parameter);
		log.debug("parameter : {}", parameter);
		log.debug("parameter : {}", parameter); 
		log.debug("parameter : {}", parameter);
		log.debug("parameter : {}", parameter);
		
		Map<String, Object> fileMapRet = new HashMap<String,Object>();
		Map<String, MultipartFile> fileMap = request.getFileMap();
		
		// Maintain a list to send back the files info. to the client side
		List<BoardAttachVO> uploadedFiles = new ArrayList<BoardAttachVO>();
		List<BoardAttachSerVO> uploadFile = new ArrayList<BoardAttachSerVO>();
		
		log.debug("" + fileMap.values());
		Map<String, Object> fMap = boardService.getUploadedFileInfo(fileMap);
		uploadedFiles = (List<BoardAttachVO>) fMap.get("uploadedFiles");
		uploadFile = (List<BoardAttachSerVO>) fMap.get("uploadFile");
		
		//Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {

			// Save the file to local disk
//			saveFileToLocalDisk(multipartFile);

			BoardAttachVO fileInfo = boardService.getUploadedFileInfo(multipartFile);

			// Save the file info to database
//			int success = saveFileToDatabase(fileInfo);

			// adding the file info to the list
			uploadedFiles.add(fileInfo);
		}
		fileMapRet.put("response", uploadedFiles);
		
		
		{ // 테스트 검증 소스
			if (uploadedFiles != null) {
				for (BoardAttachVO boardAttachVO : uploadedFiles) {
					log.debug(boardAttachVO.getBoardAttachName() + "파일이름");	
				}
			}
			if(uploadedFiles.size() == fileMap.size()) {
				log.debug("전부 다 전송 됐수다.");
				String objectToReturn = "{ 'success' : 'success'}";
				fileMapRet.put("success", "success");
				
				fileMapRet.put("fileInfo", uploadedFiles);
//				fileMapRet.put("fileRealInfo", uploadFile);
				
//				out.print(objectToReturn);
			}else {
				log.debug("실패했슴둥..");
				fileMapRet.put("success", "failed");
//				request.setAttribute("success", "failed");
			}
		}

		return fileMapRet;
	}

	*/
	
}
