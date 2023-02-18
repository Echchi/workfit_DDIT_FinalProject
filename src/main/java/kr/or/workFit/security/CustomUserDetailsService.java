package kr.or.workFit.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.workFit.mapper.main.MainMapper;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
	
//	@Autowired
//	@Lazy(value = true)
//	@Inject
//	private MainService seqService;
	@Inject
	private MainMapper seqMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			log.debug("유저디테일핸들러");
			MemberVO memVO = seqMapper.securityLogin(username);
			
			log.warn("유저디테일핸들러 memVO : {}", memVO);
			return memVO == null ? null : new CustomUser(memVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
}
