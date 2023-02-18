package kr.or.workFit.service.document;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.workFit.mapper.document.DocumentMapper;
import kr.or.workFit.vo.DeptDocVO;
import kr.or.workFit.vo.DocVO;
import kr.or.workFit.vo.FreqDocVO;
import kr.or.workFit.vo.MyDocVO;
import kr.or.workFit.vo.PublicDocVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DocServiceImpl implements DocService {

	@Autowired
	private DocumentMapper documentMapper;
	
	
	@Override
	public int checkCreatedDocCode(Map<String, String> map) {
		
		return documentMapper.checkCreatedDocCode(map);
	}
	@Override
	public int createDocCodeDefault(Map<String, String> map) {
		return documentMapper.createDocCodeDefault(map);
	}
	@Override
	public String getDocCode(Map<String, String> map) {
		return documentMapper.getDocCode(map);
	}
	
	
	@Override
	public List<DocVO> ListMyDoc(Map<String, String> map) {
		log.info("listmyDoc");
		return documentMapper.ListMyDoc(map);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<DocVO> ListDeptDoc(Map<String, String> map) {
		return documentMapper.ListDeptDoc(map);
	}
	
	
	@Override
	@Transactional(readOnly = true)
	public MyDocVO getFile(String mdId) {
		return documentMapper.getFile(mdId);
	}
	
	
	@Override
	@Transactional(readOnly = true)
	public DeptDocVO getDeptFile(String ddId) {
		return documentMapper.getDeptFile(ddId);
	}
	
	@Override
	@Transactional
	public int saveFile(MyDocVO uploadedFile) {
		System.out.println("myDoc 업로드..");
		return documentMapper.saveFile(uploadedFile);
	}
	
	@Override
	@Transactional
	public int saveDeptfile(DeptDocVO uploadedFile) {
		System.out.println("myDoc 업로드..");
		return documentMapper.saveDeptfile(uploadedFile);
	}
	@Override
	public long getCoStorage(Map<String, String> map) {
		System.out.println("회사 용량 DB");
		return documentMapper.getCoStorage(map);
	}
	@Override
	public List<MyDocVO> getMyDocUsage(Map<String, String> map) {
		System.out.println("나의 용량 사용량DB");
		return documentMapper.getMyDocUsage(map);
	}
	@Override
	public List<MyDocVO> getDeptDocUsage(Map<String, String> map) {
		System.out.println("부서 용량 사용량DB");
		// TODO Auto-generated method stub
		return documentMapper.getDeptDocUsage(map);
	}
	
	

	@Override
	@Transactional(readOnly = true)
	public List<MyDocVO> listFiles() {
		return documentMapper.listFiles();
	}
	@Override
	public List<DeptDocVO> listDeptFiles() {
		return documentMapper.listDeptFiles();
	}
	
	
	
	@Override
	public List<MyDocVO> selectListMyDoc() {
		return documentMapper.selectListMyDoc();
	}
	@Override
	public List<DeptDocVO> selectListDeptDoc() {
		return documentMapper.selectListDeptDoc();
	}
	@Override
	public List<PublicDocVO> selectListPublicDoc() {
		return documentMapper.selectListPublicDoc();
	}
	@Override
	public List<FreqDocVO> selectListFreqDoc() {
		return documentMapper.selectListFreqDoc();
	}
	/*
	private void saveFileToLocalDisk(MultipartFile multipartFile, String memId) throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile,memId);

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
	}

	private int saveFileToDatabase(MyDocVO uploadedFile) {
//		log.debug(docService.saveFile(uploadedFile) + "");	// 디버그라도 메소드를 적으면.. 두 번온다..
		return docService.saveFile(uploadedFile);

	}

	private String getOutputFilename(MultipartFile multipartFile,String memId) {
//		String savePath = "Z:/upload/Doc/"+memId+"/";
//		File file = new File(savePath);											// 파일 객체 생성
//		if(!file.exists()) {														// 없으면 폴더 만륻어
//			file.mkdirs();															
//		}
//		return savePath+ multipartFile.getOriginalFilename();
		return getDestinationLocation(memId) + multipartFile.getOriginalFilename();
	}

	private MyDocVO getUploadedFileInfo(MultipartFile multipartFile,String docCode,String memId) throws IOException {

		MyDocVO fileInfo = new MyDocVO();
		fileInfo.setMyDocName(multipartFile.getOriginalFilename());
		fileInfo.setMyDocNewname("saved_" + multipartFile.getOriginalFilename());
		fileInfo.setDocCode(docCode);
		fileInfo.setMyDocSize(multipartFile.getSize());
		fileInfo.setMyDocType(multipartFile.getContentType());
		fileInfo.setMyDocPath(getDestinationLocation(memId));

		return fileInfo;
	}

	private String getDestinationLocation(String privatePath) {
		String defaultDrive = "Z:/upload/Doc/";
//		privatePath = memId;
		String deptPath = "";
		String savePath = defaultDrive+privatePath+"/";
		File file = new File(savePath);											// 파일 객체 생성
		if(!file.exists()) {														// 없으면 폴더 만륻어
			file.mkdirs();															
		}
		return savePath;
	}
	*/
	
	@Override
	public int insertMyDoc(MyDocVO myDocVO) {
		return 0;
	}
	@Override
	public int insertDeptDoc(DeptDocVO deptDocVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertPublicDoc(PublicDocVO publicDocVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertFreqDoc(FreqDocVO freqDocVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateMyDoc(MyDocVO myDocVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateDeptDoc(DeptDocVO deptDocVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updatePublicDoc(PublicDocVO publicDocVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateFreqDoc(FreqDocVO freqDocVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteMyDoc(String mdId) {
		
		return documentMapper.deleteMyDoc(mdId);
	}
	@Override
	public int deleteDeptDoc(String ddId) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deletePublicDoc(String pdId) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteFreqDoc(String fdId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
