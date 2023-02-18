package kr.or.workFit.service.realAdminpage;

import java.util.List;
import java.util.Map;

public interface StatisticsService {

	/** 파이 차트 데이터 select
	 * @param memCo
	 * @return
	 * 	회사별 직급 구성 반환
	 */
	List<Map<String, String>> getPieData(String memCo);

}
