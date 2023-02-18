package kr.or.workFit.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String memId;			// 아이디
	private String memName;			// 이름
	private String memEnName;		// 영어이름
	private String memPass;			// 비밀번호
	private String memSecpass;		// 2차 비번
	private String memDeptTel;		// 내선번호
	private String memTel;			// 전화번호
	private String memIntro;		// 자기소개
	private String memEmail;		// 이메일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date memBirth;			// 생일
	private String memZipcode;		// 우편번호
	private String memAddr;			// 주소
	private String memAddrDetail;	// 상세주소
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date memWorkStartDay;	// 입사일
	private String memWorktype;		// 계약형태
	private String memEdu;			// 최종학력
	private String memJobGrade;		// 직급
	private String memStatus;		// 현재상태
	private String memDeptId;		// 사원번호
	private String memSign;			// 결재 날인파일
	private String memProfileUrl;	// 프로필사진 경로
	private String coCode;			// 회사코드
	private String deptFk;			// 부서번호
	private char memApproveStatus;	// 회원가입승인여부
	private String enabled;			// 시큐리티 
	private String deptName;		// 종은 추가 - 부서명
	private char usageStatus;		// 현수 추가 -아이디 사용여부(0:사용가능 아이디 1:삭제또는퇴사 )
	private char memGender;			// 현수 추가 - 성별(0:남자 1:여자)
	private long memSalary;			// 현수 추가 - 월급
	
	
	
	private List<MemAuthVO> memAuthVOList;
	
	

}
