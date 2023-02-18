package kr.or.workFit.mapper.mail;

import java.util.List;

import kr.or.workFit.vo.EmailAttachVO;
import kr.or.workFit.vo.EmailTargetVO;
import kr.or.workFit.vo.EmailVO;
import kr.or.workFit.vo.MemberVO;

public interface MailMapper {

	public void insertMail(EmailVO mailVO);

	public void insertEmailTarget(EmailTargetVO emtVO);

	public List<EmailVO> selectSendMailList(MemberVO member);

	public List<EmailVO> selectReceiveMailList(MemberVO member);

	public List<EmailVO> selectReceiveImportantMailList(MemberVO member);

	public List<EmailVO> selectTempMailList(MemberVO member);

	public List<EmailVO> selectTrashMailList(MemberVO member);

	public MemberVO selectMemData(String memId);

	public EmailVO selectEmailData(String emailCode);

	public List<EmailTargetVO> selectEmailTargetDatas(String emailCode);

	public void updateMail(EmailVO mailVO);

	public void updateEmailTarget(EmailTargetVO emtVO);

	public void deleteTargetDatas(EmailVO mailVO);

	public int insertAttachFile(EmailAttachVO emailAttachVO);

	public List<EmailAttachVO> selectMailAttachFile(String emailCode);

	public EmailAttachVO getFile(String emailAttachCode);

	public void deleteMailAtSended(EmailTargetVO emailTargetVO);

	public void deleteMailAtReceived(EmailTargetVO emailTargetVO);
	
	public void insertAttachFileIncludeImg(EmailAttachVO emailAttachVO);

	public EmailAttachVO getOneImgAttachFile(String emailAttachCode);

	public void updateMailAtSended(EmailTargetVO emailTargetVO);

	public void updateMailAtReceived(EmailTargetVO emailTargetVO);
}
