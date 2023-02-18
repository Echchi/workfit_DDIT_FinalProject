package kr.or.workFit.vo;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Getter
@Setter
@ToString
public class PostVO implements Serializable{
	private String postCode;
	private String boardCode;
	private String memId;
	private String postTitle;
	private String postContent;
	private int postHit;
	private Date postDate;
	private Date postModDate;
	private String postPopup;
	
	private String memName;
//	private char postPopup;
	private List<BoardAttachVO> boardAttachs;
	
	@Setter(value = AccessLevel.PROTECTED)
	private MultipartFile[] poFile;
	
	public void setPoFile(MultipartFile[] poFile) throws IOException, Exception {
		this.poFile = poFile;
//		log.debug("poFIle :"+ poFile);
		if(poFile != null) {
			List<BoardAttachVO> boardAttachs = new ArrayList<BoardAttachVO>();
			for (MultipartFile items : poFile) {
				if(StringUtils.isBlank(items.getOriginalFilename())) {
					continue;
				}
				BoardAttachVO boardAttachVO = new BoardAttachVO(items);
				boardAttachs.add(boardAttachVO);
			}
			this.boardAttachs = boardAttachs;
		}
	}
	
}
