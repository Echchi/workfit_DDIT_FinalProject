package kr.or.workFit.controller.document;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.workFit.mapper.document.DocumentMapper;
import kr.or.workFit.service.document.DocService;
import kr.or.workFit.vo.DeptDocVO;
import kr.or.workFit.vo.DocVO;
import kr.or.workFit.vo.FreqDocVO;
import kr.or.workFit.vo.MyDocVO;
import kr.or.workFit.vo.PublicDocVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
@RequestMapping("/workfit/document")
public class DocumentController {

	@Autowired
	private DocService docService;
	
	
	/**
	 * @param model(leftNav 파라미터 전달용)
	 * @return	맵핑 Jsp
	 */
	@GetMapping("/docMain")
	public String Start(Model model) {
		List<FreqDocVO> freqDocList = docService.selectListFreqDoc();
		model.addAttribute("menu", "doc");
		model.addAttribute("freqDocList", freqDocList);
		return "workfit/document/docmain";
	}

	

	@GetMapping("/insertDoc/{docType}")
	public String insertMain(Model model,@PathVariable("docType") String docType) {
//		model.addAttribute("menu","doc");
		log.debug("인서트된 문서 타입 :::::::::"+docType);
		switch (docType) {
		case "myDoc":
			model.addAttribute("docType","myDoc");
		break;
		case "deptDoc":
			model.addAttribute("docType","deptDoc");
			break;
		default:
			log.debug("기타 문서함");
			break;
		}
		return "workfit/document/empty/docinsert";
	}
	
	@RequestMapping(value = { "/list" })
	public String listFile(@SessionAttribute("memId") String memId,
			@SessionAttribute("memDeptCode") String deptCode,Model model) {
		log.info("문서 리스트 출력");
		log.debug(memId);
		log.debug(deptCode);
		model.addAttribute("menu", "doc");
		int resultFlag = 0;
		String docCode = "";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("deptCode", deptCode);
		
		resultFlag = docService.checkCreatedDocCode(map);
		
		if(resultFlag == 0) {
			docService.createDocCodeDefault(map);
		}else {
			log.debug("문서번호(docCode)가 존재합니다.");
			docCode = memId;
		}
		model.addAttribute("docCode",docService.getDocCode(map));
		return "workfit/document/docmain";
	}
	
	@GetMapping(value = "/mydocList") // 생성
	@ResponseBody
	public List<DocVO> myDocList(@SessionAttribute("memId") String memId,
			@SessionAttribute("memDeptCode") String deptCode,Model model,
			@RequestParam(value = "searchType",required = false, defaultValue = "fileName") String searchType,
			@RequestParam(value = "searchBtn" ,required = false) String searchBtn,
			@RequestParam(value = "searchWord", required = false) String searchWord
			) {
		log.info("내 문서 리스트 출력 C:::");
		log.debug("memId :"+memId);
		log.debug("deptCode :"+deptCode);
		log.debug("searchWord :"+searchWord);
		log.debug("searchType :"+searchType);
		log.debug("searchBtn :"+searchBtn);
		Map<String, String> map = new HashMap<String, String>();
		if(StringUtils.isNotBlank(searchWord)) {
			if("fileName".equals(searchType)) {
				log.debug("searchType :"+searchType);
				log.debug("searchWord :"+searchWord);
				map.put("searchType",searchType);
				map.put("searchWord",searchWord);
			}else {
				log.debug("searchType :"+searchType);
				log.debug("searchWord :"+searchWord);
			}
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		if(StringUtils.isNotBlank(searchBtn)) {
			map.put("searchBtn",searchBtn);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchWord", searchWord);
		}
		int resultFlag = 0;
		String docCode = null;
//		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("deptCode", deptCode);
		resultFlag = docService.checkCreatedDocCode(map);
		if(resultFlag == 0) {
			docService.createDocCodeDefault(map);
		}else {
			log.debug("문서번호 존재합니다.");
			docCode = memId;
		}
		return docService.ListMyDoc(map);
	}
	
	@GetMapping("/delete/{docType}/{docCode}")
	@ResponseBody
	public String deleteMyDoc(
			@PathVariable("docCode") String docCode,
			@PathVariable("docType") String docType
			) {
		log.debug("docType :" + docType);
		log.debug("docCode :" + docCode);
		String deleteWhere = "document";
		String result = "";
		int resultCnt = 0;
		
		if(docType.equals("myDoc")) {
			MyDocVO myDocVO = docService.getFile(docCode);
			resultCnt = docService.deleteMyDoc(docCode); 
			if(resultCnt > 0) {
				log.debug("MyDoc 삭제 성공");
				result= "success";
				deleteFolder(myDocVO.getMyDocPath(),myDocVO.getMyDocName(),deleteWhere);
			}else {
				log.debug("MyDoc 삭제 실패");
				result = "failed";
			}
		}
		if(docType.equals("deptDoc")) {
			DeptDocVO deptDocVO = docService.getDeptFile(docCode);
			resultCnt = docService.deleteDeptDoc(docCode); 
			if(resultCnt > 0) {
				log.debug("Dept 삭제 성공");
				result= "success";
				deleteFolder(deptDocVO.getDeptDocPath(),deptDocVO.getDeptDocName(),deleteWhere);
			}else {
				log.debug("Dept 삭제 실패");
				result = "failed";
			}
		}
		
		return result;
	}
	
//	@GetMapping("/delete/{mdId}")
//	@ResponseBody
//	public String deleteMyDoc(
//			@PathVariable("mdId") String mdId
//			) {
//		MyDocVO myDocVO = docService.getFile(mdId);
//		String deleteWhere = "document";
//		String result = "";
//		int resultCnt = 0;
//		resultCnt = docService.deleteMyDoc(mdId); 
//		if(resultCnt > 0) {
//			log.debug("MyDoc 삭제 성공");
//			result= "success";
//			deleteFolder(myDocVO.getMyDocPath(),myDocVO.getMyDocName(),deleteWhere);
//		}else {
//			log.debug("MyDoc 삭제 실패");
//			result = "failed";
//		}
//		
//		return result;
//	}

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
	
	
	
	@GetMapping(value = "/deptdocList") // 생성
	@ResponseBody
	public List<DocVO> deptDocList(@SessionAttribute("memId") String memId,
			@SessionAttribute("memDeptCode") String deptCode,Model model,
			@RequestParam(value = "searchType",required = false, defaultValue = "fileName") String searchType,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		log.info("문서 리스트 출력");
//		log.debug("parameter:  {}",data);
		log.debug(memId);
		log.debug(deptCode);
//		String searchWord = (String) data.get("searchWord");
//		String searchType = (String) data.get("searchType");
		log.debug("searchWord :"+searchWord);
		log.debug("searchType :"+searchType);
		Map<String, String> map = new HashMap<String, String>();
		if(StringUtils.isNotBlank(searchWord)) {
			if("fileName".equals(searchType)) {
				log.debug("searchType :"+searchType);
				log.debug("searchWord :"+searchWord);
				map.put("searchType",searchType);
				map.put("searchWord",searchWord);
			}else {
				log.debug("searchType :"+searchType);
				log.debug("searchWord :"+searchWord);
			}
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		int resultFlag = 0;
		String docCode = null;
//		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("deptCode", deptCode);
		resultFlag = docService.checkCreatedDocCode(map);
		if(resultFlag == 0) {
			docService.createDocCodeDefault(map);
		}else {
			log.debug("문서번호 존재합니다.");
//			docCode = docService.getDocCode(map);
			docCode = memId;
		}
//		log.debug(docService.ListMyDoc(docCode)+"");
		return docService.ListDeptDoc(map);
	}

	@GetMapping(value = "/publicdocList") // 생성
	@ResponseBody
	public List<PublicDocVO> publicDocList() {
		log.info("문서 리스트 출력");
		return docService.selectListPublicDoc();
	}

	@GetMapping(value = "/freqdocList") // 생성
	@ResponseBody
	public List<FreqDocVO> freqDocList() {
		log.info("문서 리스트 출력");
		return docService.selectListFreqDoc();
	}
	
	@PostMapping(value = "/insertData", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<String> insertTest(MyDocVO myDocVO, HttpServletRequest req, HttpServletResponse resp,
			List<MultipartFile> uploadFiles, MultipartHttpServletRequest file)
			throws IllegalStateException, IOException {
		log.debug("인서트 들어왔음");
//		log.debug("체크 : " + uploadFiles.get(0).getOriginalFilename());   // 그냥 왔나 눈으로 확인!
		ServletContext sc = req.getSession().getServletContext();
		String realPath = sc.getRealPath("/resources/uploads");
		System.out.println(realPath);

		List<String> filePathList = new ArrayList<String>();
		PrintWriter writer = resp.getWriter();
		for (MultipartFile multipartFile : uploadFiles) {
			multipartFile.transferTo(new File(realPath + "/" + multipartFile.getOriginalFilename()));
			System.out.println("test");
			filePathList.add(sc.getContextPath() + "/resources/uploads/" + multipartFile.getOriginalFilename());
		}
		return filePathList;
	}

	// ---------------

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody List<MyDocVO> upload(MultipartHttpServletRequest request, 
											@RequestParam HashMap<String, Object> parameter,
											@SessionAttribute("memId") String memId
											)throws IOException {
		
		log.debug("parameter : {}", parameter);
		String docType = "myDoc";
		String docCode = (String) parameter.get("docCode");
		log.debug("docCode : " + docCode);
		
		
		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();

		// Maintain a list to send back the files info. to the client side
		List<MyDocVO> uploadedFiles = new ArrayList<MyDocVO>();
		log.debug("" + fileMap.values());
		
		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {
			
			// Save the file to local disk
			saveFileToLocalDisk(multipartFile,memId,docType);
			
			MyDocVO fileInfo = getUploadedFileInfo(multipartFile,docCode,memId);

			// Save the file info to database
			int success = saveFileToDatabase(fileInfo);

			// adding the file info to the list
			uploadedFiles.add(fileInfo);
		}

		return uploadedFiles;
	}
	
	@RequestMapping(value = "/uploadDept", method = RequestMethod.POST)
	public @ResponseBody List<DeptDocVO> uploadDept(MultipartHttpServletRequest request, 
			@RequestParam HashMap<String, Object> parameter,
			@SessionAttribute("memId") String memId,
			@SessionAttribute("memDeptCode") String memDeptCode
			)throws IOException {
		
		log.debug("parameter : {}", parameter);
		String docType = "deptDoc";
		String docCode = (String) parameter.get("docCode");
		log.debug("docCode : " + docCode);
		
		
		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();
		
		// Maintain a list to send back the files info. to the client side
		List<DeptDocVO> uploadedFiles = new ArrayList<DeptDocVO>();
		log.debug("" + fileMap.values());
		
		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {
			
			// Save the file to local disk
//			saveDeptFileToLocalDisk(multipartFile,memId);
			saveFileToLocalDisk(multipartFile,memDeptCode,docType);
			
			DeptDocVO fileInfo = getUploadedDeptFileInfo(multipartFile,docCode,memDeptCode);
			
			// Save the file info to database
			int success = saveDeptFileToDatabase(fileInfo);
			
			// adding the file info to the list
			uploadedFiles.add(fileInfo);
		}
		
		return uploadedFiles;
	}


	@RequestMapping(value = "/get/{mdId}", method = RequestMethod.GET)
	public void getFile(HttpServletResponse response, @PathVariable String mdId) {

		MyDocVO dataFile = docService.getFile(mdId);

		File file = new File(dataFile.getMyDocPath(), dataFile.getMyDocName());
		String fileName ="";
		try {
			fileName = URLEncoder.encode(dataFile.getMyDocName(), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			response.setContentType(dataFile.getMyDocType());
			response.setHeader("Content-disposition", "attachment; filename=\"" + fileName + "\"");

			FileCopyUtils.copy(FileUtils.readFileToByteArray(file), response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@PostMapping(value = "/getCheck")
	public void getZipFile(HttpServletResponse response,@RequestParam Map<String, String> param) {
		List<MyDocVO> dataFileList = new ArrayList<MyDocVO>();
		String[] mdIdList = {};
		List<File> files = new ArrayList<File>();
		
		File zipFile = new File("압축파일.zip");
		byte[] buf = new byte[4096];
		// 파일 ID 가져와서 FileList만들기.
		for (String mdId : mdIdList) {
			MyDocVO fileInfo = docService.getFile(mdId);
			File file = new File(fileInfo.getMyDocPath(),fileInfo.getMyDocName());
			files.add(file);
		}
		try {
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFile));
			for(File file : files) {
				try {
					FileInputStream in = new FileInputStream(file);
				} catch (FileNotFoundException e1) {
					e1.printStackTrace();
				}
				ZipEntry ze = new ZipEntry(file.getName());
				try {
					out.putNextEntry(ze);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				int len;
				
			}
		} catch (FileNotFoundException e2) {
			e2.printStackTrace();
		}
	}
	
	private void saveFileToLocalDisk(MultipartFile multipartFile, String memId,String docType) throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile,memId,docType);

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
		
		File savefile = new File(outputFileName);
		
		String filePath = outputFileName.substring(0,outputFileName.lastIndexOf("/"));
		String fileName = outputFileName.substring(outputFileName.lastIndexOf("/")+1,outputFileName.lastIndexOf("."));
		log.debug("File Path : "+filePath);
		log.debug("File Name : "+fileName);
		log.debug("File Type : "+ multipartFile.getContentType());
		if(multipartFile.getContentType().contains("image")) {
//			saveThumbnails(filePath, savefile,fileName);
		}
	}
	
//	private void saveDeptFileToLocalDisk(MultipartFile multipartFile, String memId) throws IOException, FileNotFoundException {
//		
//		String outputFileName = getOutputFilename(multipartFile,memId);
//		
//		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
//		
//		File savefile = new File(outputFileName);
//		
//		String filePath = outputFileName.substring(0,outputFileName.lastIndexOf("/"));
//		String fileName = outputFileName.substring(outputFileName.lastIndexOf("/")+1,outputFileName.lastIndexOf("."));
//		log.debug("File Path : "+filePath);
//		log.debug("File Name : "+fileName);
//		if(multipartFile.getContentType().contains("image")) {
//			saveThumbnails(filePath, savefile,fileName);
//		}
////		saveThumbnails(filePath, savefile,fileName);
//	}
//	
	private void saveThumbnails(String filePath,File savefile,String fileName) {
		File thumbnail = new File(filePath+"/small/");
		
		if(!thumbnail.exists()) {
			thumbnail.mkdirs();
		}
		String thumbnailFile = filePath+"/small/"+fileName;
		try {
			BufferedImage bo_img = ImageIO.read(savefile);
			double ratio = 2;	
	        int width = (int) (bo_img.getWidth() / ratio);
	        int height = (int) (bo_img.getHeight() / ratio);
	        Thumbnails.of(savefile).size(width, height).outputFormat("jpg").toFile(new File(thumbnailFile));
//			BufferedImage destImg = Scalr.resize(bo_img, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
//			String formatName = savefile.getName().substring(savefile.getName().lastIndexOf(".") + 1);
//			ImageIO.write(destImg, formatName.toUpperCase(), new File(thumbnailFile));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private int saveFileToDatabase(MyDocVO uploadedFile) {
		// 디버그라도 메소드를 적으면.. 두 번온다..
		return docService.saveFile(uploadedFile);

	}
	private int saveDeptFileToDatabase(DeptDocVO uploadedFile) {
		// 디버그라도 메소드를 적으면.. 두 번온다..
		return docService.saveDeptfile(uploadedFile);
		
	}

	private String getOutputFilename(MultipartFile multipartFile,String privatePath,String docType) {
		if(docType.equals("myDoc")) {
			return getDestinationLocation(privatePath,docType) + multipartFile.getOriginalFilename();
		}else {
			
			return getDestinationLocation(privatePath,docType) + multipartFile.getOriginalFilename();
		}
		
	}
	
	private MyDocVO getUploadedFileInfo(MultipartFile multipartFile,String docCode,String memId) throws IOException {

		MyDocVO fileInfo = new MyDocVO();
		fileInfo.setMyDocName(multipartFile.getOriginalFilename());
		fileInfo.setMyDocNewname("saved_" + multipartFile.getOriginalFilename());
		fileInfo.setDocCode(docCode);
		fileInfo.setMyDocSize(multipartFile.getSize());
		fileInfo.setMyDocType(multipartFile.getContentType());
		fileInfo.setMyDocPath(getDestinationLocation(memId,"myDoc"));

		return fileInfo;
	}

	private String getDestinationLocation(String privatePath,String docType) {
		String defaultDrive = "Z:/upload/Doc/";
//		privatePath = memId;
		String deptPath = "";
		String savePath = "";		// Z:/upload/Doc/ + memId + /
		if(!docType.equals("myDoc")) {
			privatePath = "Dept/" +privatePath;
		}
		savePath = defaultDrive+privatePath+"/";	
		File file = new File(savePath);											// 파일 객체 생성
		if(!file.exists()) {														// 없으면 폴더 만륻어
			file.mkdirs();															
		}
		return savePath;
	}
	
	
	
	
	private String getOutputDeptFilename(MultipartFile multipartFile,String memId) {
//		String savePath = "Z:/upload/Doc/"+memId+"/";
//		File file = new File(savePath);											// 파일 객체 생성
//		if(!file.exists()) {														// 없으면 폴더 만륻어
//			file.mkdirs();															
//		}
//		return savePath+ multipartFile.getOriginalFilename();
		return getDeptDestinationLocation(memId) + multipartFile.getOriginalFilename();
	}

	private DeptDocVO getUploadedDeptFileInfo(MultipartFile multipartFile,String docCode,String privatePath) throws IOException {
		
		DeptDocVO fileInfo = new DeptDocVO();
		fileInfo.setDeptDocName(multipartFile.getOriginalFilename());
		fileInfo.setDeptDocNewname(UUID.randomUUID().toString()+ multipartFile.getOriginalFilename());
		fileInfo.setDocCode(docCode);
		fileInfo.setDeptDocSize(multipartFile.getSize());
		fileInfo.setDeptDocType(multipartFile.getContentType());
		fileInfo.setDeptDocPath(getDeptDestinationLocation(privatePath));
		
		return fileInfo;
	}
	private String getDeptDestinationLocation(String privatePath) {
		String defaultDrive = "Z:/upload/Doc/Dept/";
//		privatePath = memId;
		String deptPath = "";
		String savePath = defaultDrive+privatePath+"/";
		File file = new File(savePath);											// 파일 객체 생성
		if(!file.exists()) {														// 없으면 폴더 만륻어
			file.mkdirs();															
		}
		return savePath;
	}
	
	@GetMapping("/usage")
	@ResponseBody
	public Map<String, Long> getDiskUsage(
			@SessionAttribute("memId") String memId,
			@SessionAttribute("memDeptCode") String deptCode,
			@SessionAttribute("memCo") String coCode,
//			@RequestParam(value = "searchType",required = false, defaultValue = "fileName") String searchType,
//			@RequestParam(value = "searchWord", required = false) String searchWord,
			Model model){
		List<Map<String, String>> usageList = new ArrayList<Map<String,String>>();
		Map<String, Long> usageMap= new HashMap<String, Long>();
		Map<String, String> usageParamMap= new HashMap<String, String>();
		usageParamMap.put("memId", memId);
		usageParamMap.put("coCode", coCode);
		
		docService.getCoStorage(usageParamMap);
		log.debug("회사 용량 : ",docService.getCoStorage(usageParamMap));
		
		usageMap.put("coUsage", docService.getCoStorage(usageParamMap));
		return usageMap;
	}
	
	@GetMapping("/usageInfo/{docType}")
	@ResponseBody
	public List<MyDocVO> getDiskUsageInfo(
			@SessionAttribute("memId") String memId,
			@SessionAttribute("memDeptCode") String deptCode,
			@SessionAttribute("memCo") String coCode,
			@PathVariable("docType") String docType,
//			@RequestParam(value = "searchType",required = false, defaultValue = "fileName") String searchType,
//			@RequestParam(value = "searchWord", required = false) String searchWord,
			Model model){
		
		log.debug("docType : "+docType);
//		List<Map<String, String>> usageList = new ArrayList<Map<String,String>>();
//		Map<String, Integer> usageMap= new HashMap<String, Integer>();
		Map<String, String> usageParamMap= new HashMap<String, String>();
		usageParamMap.put("memId", memId);
		usageParamMap.put("coCode", coCode);
		usageParamMap.put("deptCode", deptCode);
		List<MyDocVO> myDocSizeList = new ArrayList<MyDocVO>();
		if(docType.equals("myDoc")) {
			myDocSizeList = docService.getMyDocUsage(usageParamMap);
		}
		if(docType.equals("deptDoc")) {
			myDocSizeList = docService.getDeptDocUsage(usageParamMap);
		}
		
//		log.debug("회사 용량 정보 : ",docService.getMyDocUsage(usageParamMap));
		
//		usageMap.put("coUsage", docService.getCoStorage(usageParamMap));
		return myDocSizeList;
	}
	
	
	
	
	// --------- TEST
	@RequestMapping(value = { "/list2" })
	public String listFiles(Model model, Map<String, Object> map) {
//		model.addAttribute("menu", "doc");
		map.put("fileList", docService.listFiles());
		
		return "workfit/document/docmy";
	}
	
	@GetMapping("/myDoc")
	public String myDocMain(Model model) {
		List<MyDocVO> myDocList = docService.selectListMyDoc();

		model.addAttribute("menu", "doc");
		model.addAttribute("mydoc", myDocList);
		return "workfit/document/docmy";
	}

	@GetMapping("/deptDoc")
	public String deptDocMain(Model model) {
		model.addAttribute("menu", "doc");
		return "workfit/document/docdept";
	}

	@GetMapping("/publicDoc")
	public String publicDocMain(Model model) {
		model.addAttribute("menu", "doc");
		return "workfit/document/docpublic";
	}
}
