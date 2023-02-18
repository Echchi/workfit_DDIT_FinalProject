package kr.or.workFit.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailVO {
	// -------------영호가 추가함---------------- 
	private String memEmail;
	private String iq;
	private String emailReadStatus;
	private String deleteStatus;
	private String receiverEmailStatus;
	// ------------영호가 추가함----------------
	
	private String emailCode;
	private String memId;
	private String emailTitle;
	private String emailContent;
	private Date emailDate;
	private String emailStatus;
	private String memName;
	
	private List<EmailAttachVO> emailAttachs;
	
	@Setter(value = AccessLevel.PROTECTED)
	private MultipartFile[] emFile;
	

	public void setEmFile(MultipartFile[] emailFile) throws IOException, Exception {
		this.emFile = emailFile;
		System.out.println("emailFile확인2 "+ emailFile);
		if(emailFile != null) {
			List<EmailAttachVO> emailAttachs = new ArrayList<EmailAttachVO>();
			System.out.println("여기 실행되나요 메일1????!!!!!");
			for (MultipartFile items : emailFile) {
				if(StringUtils.isBlank(items.getOriginalFilename())) {
					System.out.println("여기 실행되나요 메일2????!!!!!");
					continue;
				}
				System.out.println("여기 실행되나요 메일3????!!!!!");
				EmailAttachVO emailAttachVO = new EmailAttachVO(items);
				emailAttachs.add(emailAttachVO);
			}
			System.out.println("여기 실행되나요 메일4????!!!!!");
			this.emailAttachs = emailAttachs;
		}
		
		
	}
	
	
}
