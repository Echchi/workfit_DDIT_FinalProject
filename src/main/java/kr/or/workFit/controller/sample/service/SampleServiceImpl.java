package kr.or.workFit.controller.sample.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;


@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	
	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	public List<Map<String, Object>> retrieveDataSample(Map<String, Object> param ) throws Exception{
		System.out.println("########## retrieveDataSample ############### ");
//		return null;
		
		return commonDao.list("Sample_retrieveDataSample", param);
	}

}
