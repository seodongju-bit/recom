package project.A.P009.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.A.P008.vo.A_P008VO;
import project.A.P009.service.A_P009Service;
import project.A.P009.vo.A_P009VO;
import project.B.P001.vo.B_P001VO;

@Controller("A_P009Controller")
public class A_P009ControllerImpl implements A_P009Controller{
	private static final Logger logger = LoggerFactory.getLogger(A_P009ControllerImpl.class);
	
	@Autowired
	A_P009Service a_P009Service;
	
	@Autowired
	A_P009VO a_P009VO;
	
	@Override
	@RequestMapping(value="/declarationsManager.do", method = RequestMethod.GET)
	public ModelAndView declarationsManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(!adminCheck(request)) {
			ModelAndView mav = new ModelAndView("declarationsManager");
			mav.setViewName("redirect:main.do");
			return mav;
		}
		ModelAndView mav = new ModelAndView("declarationsManager");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/declarationsList.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map declarationsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String mem_id = request.getParameter("mem_id");
		searchMap.put("mem_id", mem_id);
		List<A_P009VO> data = a_P009Service.declarationsList(searchMap);
		resultMap.put("Data", data);
		
		return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/ConditionDeclaration.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map ConditionDeclaration(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String search = request.getParameter("search");
		String condition = request.getParameter("condition");
		searchMap.put("condition", condition);
		searchMap.put("search", search);
		List<A_P009VO> data = a_P009Service.conditionDeclaration(searchMap);
		resultMap.put("Data", data);
		
		return resultMap;
	}
	
	
	@Override 
	@RequestMapping(value = "/declarationsList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String declarationsList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
        String str = "{\"Data\":[{\"ID\":\"그것만이 내세상\",\"PWD\":\"Keys to the Heart\",\"NAME\":\"2017\",\"EMAIL\":\"한국\",\"JOINDATE\":\"20190101\",\"NUM\":\"1\"}]}";
        //JSON 반환
        return str;
	}
	
	@Override
	@RequestMapping(value = "/saveDeclarations.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map saveDeclarations(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			a_P009Service.saveDeclarations(dataMap);
			result.put("Code", "0");
			result.put("Message", "저장이 완료되었습니다.");
		}catch(Exception e) {
			result.put("Code", "-1");
			result.put("Message", "저장에 실패했습니다.");
			e.printStackTrace();
		}
		resultMap.put("Result", result);
		return resultMap;
	}
	
	public boolean adminCheck(HttpServletRequest request) {
		boolean result = false;
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		String mem_division = (String)session.getAttribute("mem_division");
		try {
			if(isLogOn && mem_division.equals("2")) {
				result = true;
			}
		}catch(Exception e) {}
		return result;
	}
}
