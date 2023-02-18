package kr.or.workFit.service.mail;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import kr.or.workFit.controller.commons.FilePath;
import kr.or.workFit.mapper.mail.MailMapper;
import kr.or.workFit.vo.BoardAttachVO;
import kr.or.workFit.vo.EmailAttachVO;
import kr.or.workFit.vo.EmailTargetVO;
import kr.or.workFit.vo.EmailVO;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MailServiceImpl implements MailService {

	@Inject
	MailMapper mapper;

	@Override
	public void insertMail(EmailVO mailVO) {
		// TODO Auto-generated method stub
		mapper.insertMail(mailVO);
	}

	@Override
	public void insertEmailTarget(EmailTargetVO emtVO) {
		// TODO Auto-generated method stub
		mapper.insertEmailTarget(emtVO);

	}

	@Override
	public List<EmailVO> selectSendMailList(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.selectSendMailList(member);
	}

	@Override
	public List<EmailVO> selectReceiveMailList(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.selectReceiveMailList(member);
	}

	@Override
	public List<EmailVO> selectReceiveImportantMailList(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.selectReceiveImportantMailList(member);
	}

	@Override
	public List<EmailVO> selectTempMailList(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.selectTempMailList(member);
	}

	@Override
	public List<EmailVO> selectTrashMailList(MemberVO member) {
		// TODO Auto-generated method stub
		return mapper.selectTrashMailList(member);
	}

	@Override
	public MemberVO selectMemData(String memId) {
		// TODO Auto-generated method stub
		return mapper.selectMemData(memId);
	}

	@Override
	public EmailVO selectEmailData(String emailCode) {
		// TODO Auto-generated method stub
		return mapper.selectEmailData(emailCode);
	}

	@Override
	public List<EmailTargetVO> selectEmailTargetDatas(String emailCode) {
		// TODO Auto-generated method stub
		return mapper.selectEmailTargetDatas(emailCode);
	}

	@Override
	public void updateMail(EmailVO mailVO) {
		// TODO Auto-generated method stub
		mapper.updateMail(mailVO);
	}

	@Override
	public void deleteTargetDatas(EmailVO mailVO) {
		// TODO Auto-generated method stub
		mapper.deleteTargetDatas(mailVO);
	}

	@Override
	public void insertAttachFile(HttpServletRequest req, EmailVO emailVO) {
		// TODO Auto-generated method stub
			log.debug("요게 몇번");
		
			log.debug("emailVO확인2 {}",emailVO);
			List<EmailAttachVO> emailAttachs = emailVO.getEmailAttachs();
			log.debug("emailVO확인3 {}",emailVO);
			log.debug("emailAttachs확인"+emailAttachs);
			
			
			try {
				System.out.println("영호의 메일코드 체크3"+emailVO.getEmailCode());
				log.debug("emailVO확인4 {}",emailVO);
				emailAttach(emailAttachs, (String)emailVO.getEmailCode(), req);
			} catch (Exception e) {
				e.printStackTrace();
			}


	}

	private void emailAttach(List<EmailAttachVO> emailAttachs, String emailCode, HttpServletRequest req)
			throws IOException {

		log.debug("emailCode: " + emailCode);
		
		if (emailAttachs != null && emailAttachs.size() > 0) {
			log.debug("if문 들어오나요?? 이메일체크에서");
			for (EmailAttachVO emailAttachVO : emailAttachs) {
				log.debug("for문 들어오나요?? 이메일체크에서");
				
				
				
				
				String saveName = UUID.randomUUID().toString(); // 중복 방지.
				String endFilename = emailAttachVO.getEmailAttachName().split("\\.")[1]; // 확장자
				String defaultLocate = "z:/upload/email"; // 초기 경로 설정
				String saveLocate = defaultLocate + "/" + emailCode + "/";
				// String saveLocate =
				// req.getServletContext().getRealPath("/resources/uploads");
				File file = new File(saveLocate); // 파일 객체 생성
				if (!file.exists()) { // 없으면 폴더 만륻어
					file.mkdirs();
				}
				// 업로드 된 파일을 저장할 위치 선정(위치 + 파일명)
				// saveLocate = saveLocate + "/" + saveName+boardAttachVO.getBoardAttachName() +
				// "." + endFilename;
				saveLocate = saveLocate + saveName;
				File saveFile = new File(saveLocate); // File Created!
				emailAttachVO.setEmailCode(emailCode);
				
				emailAttachVO.setEmailAttachPath(saveLocate);
				// boardAttachVO.setBoardAttachNewname(saveName+"."+endFilename);
				emailAttachVO.setEmailAttachSavename(saveName);
				
				log.debug("emailAttachVO {}", emailAttachVO);
				
				
				
				
				
				// 만약 이미지 파일인 경우 아래의 로직을 추가적으로 실행하도록 함 
				// 여기서 이메일의 타입이 이미지인지 확인 후 이미지에 해당하는 파일이면 새로 만든 imgPath라는 컬럼(이미지 태그의 src에 넣기 위한 경로)에다가 데이터를 기입해준다 
				// 새로운 컬럼에다 데이터를 기입해줌과 동시에 여기(workfit)의 resource의 uploads폴더에 파일을 transferTo??로 복사해서 넣어준다 
				System.out.println("이미지 파일 이름 체크좀 할게요"+emailAttachVO.getEmailAttachName());
				
				
				String[] arr = emailAttachVO.getEmailAttachName().split(".");
				System.out.println("길이 체크좀 할게요"+arr.length);
				for(String i : arr) {
					System.out.println("아웃오브 체크"+i);
					System.out.println("이게 왜 아웃오브??"+i);
				}
				
				if(emailAttachVO.getEmailAttachType().startsWith("image")) { // 이미지 파일이면 if문 들어감 
				
					ServletContext sc = req.getSession().getServletContext();	// ContextPath
					String realPath = sc.getRealPath("/resources/uploads/emailImages");
					String dbSavePath = sc.getContextPath() + "/resources/uploads/emailImages/" + emailAttachVO.getFile().getOriginalFilename();
					emailAttachVO.setEmailImgPath(dbSavePath);
					
					FilePath pathMaker = new FilePath();
					String savePath = pathMaker.getRealPath(realPath);  // webapp/resources/uploads/ 등등
					log.debug("savepath: "+savePath);
					emailAttachVO.getFile().transferTo(new File(savePath + "/" +  emailAttachVO.getFile().getOriginalFilename()));
					mapper.insertAttachFileIncludeImg(emailAttachVO);
				}else {
					
					mapper.insertAttachFile(emailAttachVO); // File Value Inject!
				}
				
				
				

				InputStream is = emailAttachVO.getFile().getInputStream(); // Save File to Local Disk!
				FileCopyUtils.copy(is, new FileOutputStream(saveLocate));
				// FileCopyUtils.copy(is, new
				// FileOutputStream(saveLocate+saveName+"."+endFilename));
				// FileUtils.copyInputStreamToFile(is, saveFile);
				is.close();
			}
		}
	}

	@Override
	public List<EmailAttachVO> selectMailAttachFile(String emailCode) {
		// TODO Auto-generated method stub
		return mapper.selectMailAttachFile(emailCode);
	}

	@Override
	public EmailAttachVO getFile(String emailAttachCode) {
		// TODO Auto-generated method stub
		return mapper.getFile(emailAttachCode);
	}

	@Override
	public void downFile(HttpServletResponse response, EmailAttachVO dataFile) {
		// TODO Auto-generated method stub
		String path = null;
		String fileType = "";
		
		if(dataFile != null) {
		 path = dataFile.getEmailAttachPath().split("\\.")[0];
		log.debug("path : "+ path);
		log.debug("split : "+ dataFile.getEmailAttachPath().split("\\/")[0]+dataFile.getEmailAttachPath().split("\\/")[1]);
		fileType = dataFile.getEmailAttachName().substring(dataFile.getEmailAttachName().lastIndexOf(".")+1);
		log.debug("fileType :"+ fileType);
		log.debug("dataFile.getEmailAttachName().lastIndexOf(\"\\\\.\") :"+ dataFile.getEmailAttachName().lastIndexOf("."));
		}
//		File file = new File(dataFile.getBoardAttachPath(), dataFile.getBoardAttachName());
		File file = new File(dataFile.getEmailAttachPath());
		String fileName = "";
		try {
			fileName = URLEncoder.encode(dataFile.getEmailAttachName(), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			response.setContentType(dataFile.getEmailAttachType());
			response.setHeader("Content-disposition", "attachment; filename=\"" + fileName + "\"");
			FileCopyUtils.copy(FileUtils.readFileToByteArray(file), response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteMailAtSended(EmailTargetVO emailTargetVO) {
		// TODO Auto-generated method stub
		mapper.deleteMailAtSended(emailTargetVO);
	}
	
	@Override
	public void deleteMailAtReceived(EmailTargetVO emailTargetVO) {
		// TODO Auto-generated method stub
		mapper.deleteMailAtReceived(emailTargetVO);
	}

	@Override
	public EmailAttachVO getOneImgAttachFile(String emailAttachCode) {
		return mapper.getOneImgAttachFile(emailAttachCode);
	}

	@Override
	public void updateMailAtSended(EmailTargetVO emailTargetVO) {
		// TODO Auto-generated method stub
		mapper.updateMailAtSended(emailTargetVO);
	}

	@Override
	public void updateMailAtReceived(EmailTargetVO emailTargetVO) {
		// TODO Auto-generated method stub
		mapper.updateMailAtReceived(emailTargetVO);
	}

}
