package kr.or.workFit.service.realAdminpage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Resource(name="commonDao")
	private CommonDao commonDao;

	/** 파이 차트 데이터 select
	 * @param memCo
	 * @return
	 * 	회사별 직급 구성 반환
	 */
	@Override
	public List<Map<String, String>> getPieData(String memCo) {
		return commonDao.selectList("getPieData", memCo);
	}
}
