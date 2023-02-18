package kr.or.workFit.service.document;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.DeptDocVO;
import kr.or.workFit.vo.DocVO;
import kr.or.workFit.vo.FreqDocVO;
import kr.or.workFit.vo.MyDocVO;
import kr.or.workFit.vo.PublicDocVO;

public interface DocService {
	public List<MyDocVO> selectListMyDoc();
	public List<DeptDocVO> selectListDeptDoc();
	public List<PublicDocVO> selectListPublicDoc();
	public List<FreqDocVO> selectListFreqDoc();

	public List<DocVO> ListMyDoc(Map<String, String> map);
	public List<DocVO> ListDeptDoc(Map<String,String> map);
//	public List<DocVO> ListMyDoc(String memId);
	
	public int insertMyDoc(MyDocVO myDocVO);
	public int insertDeptDoc(DeptDocVO deptDocVO);
	public int insertPublicDoc(PublicDocVO publicDocVO);
	public int insertFreqDoc(FreqDocVO freqDocVO);
	
	
	public int updateMyDoc(MyDocVO myDocVO);
	public int updateDeptDoc(DeptDocVO deptDocVO);
	public int updatePublicDoc(PublicDocVO publicDocVO);
	public int updateFreqDoc(FreqDocVO freqDocVO);
	
	
	public int deleteMyDoc(String mdId);
	public int deleteDeptDoc(String ddId);
	public int deletePublicDoc(String pdId);
	public int deleteFreqDoc(String fdId);
	
	public long getCoStorage(Map<String,String> map);
	public List<MyDocVO> getMyDocUsage(Map<String, String> map);
	public List<MyDocVO> getDeptDocUsage(Map<String, String> map);
	//---------- 파일 업로드 테스트
	
	public List<MyDocVO> listFiles();
	public MyDocVO getFile(String mdId);
	public int saveFile(MyDocVO uploadedFile);	
//	public MyDocVO saveFile(MyDocVO uploadedFile);
	
	public List<DeptDocVO> listDeptFiles();
	public DeptDocVO getDeptFile(String mdId);
	public int saveDeptfile(DeptDocVO uploadedFile);
	
	
	public int checkCreatedDocCode(Map<String, String> map);	
	public int createDocCodeDefault(Map<String, String> map);
	public String getDocCode(Map<String, String> map);
	
	

}
