package kr.or.workFit.service.board;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.workFit.mapper.board.BoardMapper;
import kr.or.workFit.vo.BoardAttachSerVO;
import kr.or.workFit.vo.BoardAttachVO;
import kr.or.workFit.vo.PostVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<PostVO> selectListPost(Map<String,String> map) {
		log.debug("PostList Service....");
		return boardMapper.selectListPost(map);
	}

	@Override
//	public int insertPost(HttpServletRequest req,PostVO postVO) {	// Test
	public Map<String, String> insertPost(HttpServletRequest req,PostVO postVO,String boardType) {
//		boardMapper.insertPostFile(uploadedFile);
		Map<String, String> dataMap = new HashMap<String, String>();
		log.debug(postVO.getPostCode());
		log.debug("postVO.getBoardAttachs: "+postVO.getBoardAttachs());
		int result = 0;
		int cnt = boardMapper.insertPost(postVO);
		log.debug("cnt 값 : "+ cnt);
		if(cnt > 0) {
			List<BoardAttachVO> boardAttachs = postVO.getBoardAttachs();
			log.debug(""+boardAttachs);
			try {
				log.debug(postVO.getPostCode());
				postAttach(boardAttachs, postVO.getPostCode(),req,boardType);
			}catch(Exception e) {
				e.printStackTrace();
			}
			result = 1;
		}else {
			result = 0;
		}
		dataMap.put("result", result+"");
		dataMap.put("postCode", postVO.getPostCode());
		
		return dataMap;
//		return boardMapper.insertPost(postVO);
	}
	
//	@Override
//	public int insertPost(PostVO postVO) {
//		return boardMapper.insertPost(postVO);
//	}

	@Override
	public PostVO detail(String postCode) {
		boardMapper.hitUp(postCode);
		PostVO postVO = boardMapper.detail(postCode);
		if(postVO.getBoardAttachs().get(0).getBoardAttachName() == null) {
			log.debug("첨부파일 비어있음!!!!!!!!!!!!!!!!!!!!!!");
			postVO.setBoardAttachs(null);
		}
		return postVO;
	}

	@Override
	public int modiPost(HttpServletRequest req,PostVO postVO) {
		if(postVO.getBoardAttachs() != null) {
			log.debug("파일이 존재하는데 수정가능하냐?");
//			if()
		}else {
			log.debug("파일 존재하지 않아!");
		}
		// BoardType 변수가 필요한지 확인할 것.
		String boardType = "modi";
		int cnt = boardMapper.modiPost(postVO);
		if(cnt>0) {
			List<BoardAttachVO> boardAttachs = postVO.getBoardAttachs();
			try {
				postAttach(boardAttachs, postVO.getPostCode(), req,boardType);
				
			} catch (IOException e) {
				log.debug("파일 입력 에러 발생");
				e.printStackTrace();
			}
			
			
		}
		
		return cnt;
	}

	@Override
	public int deletePost(String postCode) {
		log.debug("게시글 삭제 :::");
		int cnt = boardMapper.countBoardAttach(postCode);
		log.debug("cnt 값 : " + cnt);
		String deletePlace = "document";
		
		if(cnt != 0) {
			BoardAttachVO boardAttachVO = boardMapper.selectListBoardAttach(postCode);
			deleteFolder(boardAttachVO.getBoardAttachPath(), boardAttachVO.getBoardAttachName(), deletePlace);
			boardMapper.delAllBoardAttach(postCode);
		}
		return boardMapper.deletePost(postCode);
	}
	
	public static void deleteFolder(String path,String fileName,String deletePlace) {
		File folder = new File(path);
		
		if(folder.exists()) {
			File[] deleteFile = folder.listFiles();
			
			for(int i = 0 ; i< deleteFile.length; i++) {
				if(deleteFile[i].isFile()) {
					if(deleteFile[i].getName().equals(fileName)) {
						deleteFile[i].delete();
					}
				}else {
					deleteFolder(deleteFile[i].getPath(),fileName,deletePlace);
				}
//				deleteFile[i].delete();
			}
			if(!folder.exists()) {
				folder.delete();
			}
		}
		if(deletePlace != "document") {
			try {
				if(folder.exists()) {
					File[] folderList = folder.listFiles();
					
					for(int i = 0 ; i< folderList.length; i++) {
						if(folderList[i].isFile()) {
							folderList[i].delete();
						}else {
							deleteFolder(folderList[i].getPath(),fileName,deletePlace);
						}
						folderList[i].delete();
					}
					if(!folder.exists()) {
						folder.delete();
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	private void postAttach(List<BoardAttachVO> boardAttachs,
							String postCode, HttpServletRequest req, String boardType) throws IOException {
		
		if(boardAttachs != null && boardAttachs.size() > 0) {
			for (BoardAttachVO boardAttachVO : boardAttachs) {
				
				String saveName = UUID.randomUUID().toString();	// 중복 방지.
				String endFilename = boardAttachVO.getBoardAttachName().split("\\.")[1];	// FileType
//				String defaultLocate = "z:";												// 초기 경로 설정
//				String saveLocate = defaultLocate + "/" + postCode +"/";
				
				String saveLocate = getDestinationLocation(postCode,boardType);		// Z:/upload/{boardType}/{postCode}/
//				String saveLocate = req.getServletContext().getRealPath("/resources/uploads");
				File file = new File(saveLocate);											// 파일 객체 생성
				if(!file.exists()) {														// 없으면 폴더 만륻어
					file.mkdirs();															
				}
				// 업로드 된 파일을 저장할 위치 선정(위치 + 파일명)
//				saveLocate = saveLocate + "/" + saveName+boardAttachVO.getBoardAttachName() + "." + endFilename;
				String savefileName =  saveLocate + saveName;
				File saveFile = new File(saveLocate);		// File Created!
				log.debug("업로드 중....");
				// adding the file Info
				boardAttachVO.setPostCode(postCode);
				boardAttachVO.setBoardAttachPath(saveLocate);
//				boardAttachVO.setBoardAttachNewname(saveName+"."+endFilename);
				boardAttachVO.setBoardAttachNewname(saveName);
				
				// Save the file info to database
				boardMapper.insertPostFile(boardAttachVO);	// File Value Inject!
				
				// Save File to Local Disk!
				InputStream is = boardAttachVO.getFile().getInputStream();	
				FileCopyUtils.copy(is, new FileOutputStream(new File(savefileName)));
				is.close();
			}
		}
	}
	
	
	
	@Override
	public Map<String, Object> getUploadedFileInfo(Map<String, MultipartFile> fileMap) throws Exception {
		List<BoardAttachVO> uploadedFiles = new ArrayList<BoardAttachVO>();
		List<BoardAttachSerVO> uploadFile = new ArrayList<BoardAttachSerVO>();
		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {

			BoardAttachSerVO fileReal = new BoardAttachSerVO(multipartFile);
			uploadFile.add(fileReal);
			BoardAttachVO fileInfo = justFileInfo(multipartFile);
			uploadedFiles.add(fileInfo);
		}
		Map<String, Object> fMap = new HashMap<String, Object>();
		fMap.put("uploadedFiles", uploadedFiles);
		fMap.put("uploadFile", uploadFile);

//				fileMapRet.put("response", uploadedFiles);
		return fMap;
	}
	
	private BoardAttachVO justFileInfo(MultipartFile multipartFile) throws IOException, Exception {
		
		BoardAttachSerVO prefileInfo = new BoardAttachSerVO(multipartFile);
//		fileInfo.setMyDocCode("md" + (cnt));		// 쿼리 시퀀스로 변경.
		BoardAttachVO fileInfo = new BoardAttachVO();
		prefileInfo.setBoardAttachNewname("saved_" + multipartFile.getOriginalFilename());
//		fileInfo.("dc001");
		prefileInfo.setBoardAttachSize(multipartFile.getSize());
//		prefileInfo.set(multipartFile.getContentType());
//		prefileInfo.setBoardAttachPath(getDestinationLocation());
//		fileInfo.setFile((MultipartFile)fileInfo.getFile().getInputStream());
//		prefileInfo.setFile(null);
		fileInfo.setBoardAttachCode(prefileInfo.getBoardAttachCode());
		fileInfo.setBoardAttachName(prefileInfo.getBoardAttachName());
		fileInfo.setBoardAttachNewname("saved"+prefileInfo.getBoardAttachNewname());
		fileInfo.setBoardAttachPath(prefileInfo.getBoardAttachPath());
		fileInfo.setBoardAttachSize(prefileInfo.getBoardAttachSize());
		return fileInfo;
	}
	private String getDestinationLocation(String privatePath,String boardType) {
		String defaultDrive = "Z:/upload/"+boardType+"/";
		String deptPath = "";
		String savePath = defaultDrive+privatePath+"/";
		File file = new File(savePath);											// 파일 객체 생성
		if(!file.exists()) {														// 없으면 폴더 만륻어
			file.mkdirs();															
		}
		return savePath;
	}
	
	@Override
	@Transactional(readOnly = true)
	public BoardAttachVO getFile(String baId) {
		return boardMapper.getFile(baId);
	}
	
	@Override
	public int delBoardAttach(BoardAttachVO boardAttachVO) {
		return boardMapper.delBoardAttach(boardAttachVO);
	}

	@Override
	public void downFile(HttpServletResponse response,BoardAttachVO dataFile) {
		String path = null;
		String type = null;
		String newName = null;
		if(dataFile != null) {
		 path = dataFile.getBoardAttachPath().split("\\.")[0];
		 type = dataFile.getBoardAttachName().split("\\.")[1];
		 newName = dataFile.getBoardAttachNewname();
		log.debug("path : "+ path);
		log.debug("split : "+ dataFile.getBoardAttachPath().split("\\/")[0]+dataFile.getBoardAttachPath().split("\\/")[1]);
		
		}
//		File file = new File(dataFile.getBoardAttachPath(), dataFile.getBoardAttachName());
//		File file = new File(dataFile.getBoardAttachPath().split("\\/")[0]+"\\/"+dataFile.getBoardAttachPath().split("\\/")[1]+"\\/", dataFile.getBoardAttachNewname());
		File file = new File(path, dataFile.getBoardAttachNewname());
		String fileName = "";
		try {
			fileName = URLEncoder.encode(dataFile.getBoardAttachName(), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			response.setContentType(dataFile.getBoardAttachType());
			response.setHeader("Content-disposition", "attachment; filename=\"" + fileName + "\"");
			FileCopyUtils.copy(FileUtils.readFileToByteArray(file), response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	@Override
//	public List<PostVO> selectListPostPopup(String postCode) {
//		return boardMapper.selectListPostPopup(postCode);
//	}
	@Override
	public List<PostVO> selectListPostPopup() {
		return boardMapper.selectListPostPopup();
	}

	@Override
	public void checkCreatedBoardCode(String coCode) {
		
		int cnt = boardMapper.checkCreatedBoardCode(coCode);
		if(cnt > 0) {
			log.debug("boardCode isExisted");
		}else {
			log.debug("Created BoardCode");
			List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
			String[] boardList = {"notice","free","monthly"};
			for(String str : boardList) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("coCode", coCode);
				map.put("boardType", str);
				boardMapper.createBoardCodeDefault(map);
//				mapList.add(map);
			}
		}
		
	}

	@Override
	public String getBoardCode(Map<String, String> map) {
		return boardMapper.getBoardCode(map);
	}
	
	private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile);

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
	}

	private String getOutputFilename(MultipartFile multipartFile) {

		return "D:/" + multipartFile.getOriginalFilename();
	}

	@Override
	public int popUpValidateOne(Map<String, String> map) {
		System.out.println("PopupvalidateOne");
		return boardMapper.popUpValidateOne(map);
	}

}
