package kr.or.workFit.vo.organizationhelper;

import java.util.Date; 
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.workFit.vo.CareerVO;
import kr.or.workFit.vo.DeceaseVO;
import kr.or.workFit.vo.MemAuthVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LargeInfoMemberVO {
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
	private String deptName;		// 종은 추가 - 부서명

	private CareerVO careerVO;
	private DeceaseVO deceaseVO;
	
}
