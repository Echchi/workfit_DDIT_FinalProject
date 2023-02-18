package kr.or.workFit.controller.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.workFit.controller.sample.service.SampleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SampleController {

	@Resource(name="sampleService")
	private SampleService sampleService;
	
	
	@RequestMapping(value = "/SampleController/retrieveDataSample")
	public @ResponseBody Map<String, Object> retrieveDataSample(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> resultList = sampleService.retrieveDataSample(param);
		resultMap.put("resultList", resultList);
		return resultMap;
	}





}
