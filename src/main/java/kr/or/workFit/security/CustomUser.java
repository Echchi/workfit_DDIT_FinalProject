package kr.or.workFit.security;

import java.io.Serializable;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.workFit.vo.MemberVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ToString
@Setter
@Getter
public class CustomUser extends User implements Serializable{

	private static final long serialVersionUID = 1L;
	private MemberVO memberVO;
	
	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities, String name, String deptName, String memProfileUrl) {
		super(username, password, authorities);
		this.memberVO.setMemName(name);
		this.memberVO.setDeptName(deptName);
		this.memberVO.setMemProfileUrl(memProfileUrl);
		log.debug("커스텀유저1 VO :  {}", memberVO);
	}

	public CustomUser(MemberVO vo) {
		super(vo.getMemId(), vo.getMemPass(), 
			vo.getMemAuthVOList().stream()
			.map(auth -> new SimpleGrantedAuthority(auth.getMemAuth()))
			.collect(Collectors.toList()));
		this.memberVO = vo;	
		log.debug("커스텀유저2 VO :  {}", memberVO);
	}
}
