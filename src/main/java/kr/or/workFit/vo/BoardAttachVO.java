package kr.or.workFit.vo;

import java.io.IOException;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardAttachVO {

	/**
	 * 
	 */
	private String boardAttachCode;

	/**
	 * 
	 */
	private String postCode;

	/**
	 * 
	 */
	private String boardAttachName;

	private String boardAttachNewname;

	private String boardAttachPath;

	private String boardAttachType;

	private Date boardAttachDate;

	private long boardAttachSize;

	private MultipartFile file;

	public BoardAttachVO() {
	}

	public BoardAttachVO(MultipartFile file) throws IOException, Exception {
		this.file = file;
		this.boardAttachName = file.getOriginalFilename();
//		this.boardAttachNewname = UploadFileUtils.uploadFile("Z:/", file.getOriginalFilename(), file.getBytes());
		this.boardAttachType = file.getContentType();
		this.boardAttachSize = file.getSize();
	}

}
