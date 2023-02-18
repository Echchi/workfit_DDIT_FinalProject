package kr.or.workFit.vo;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class EmailAttachVO {
	private String emailAttachCode;
	private String emailCode;
	private String emailAttachName;
	private String emailAttachSavename;
	private String emailAttachPath;
	private String emailAttachType;
	// 새롭게 추가한 컬럼 (영호)
	private long emailAttachSize;
	
	private MultipartFile file;
	
	private String emailImgPath;
	
	public EmailAttachVO() {
		
	}

	public EmailAttachVO(MultipartFile file) throws IOException, Exception {
		this.file = file;
		this.emailAttachName = file.getOriginalFilename();
//		this.boardAttachNewname = UploadFileUtils.uploadFile("Z:/", file.getOriginalFilename(), file.getBytes());
		this.emailAttachType = file.getContentType();
		this.emailAttachSize = file.getSize();
	}
	
}
