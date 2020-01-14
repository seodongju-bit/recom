package project.A.P007.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.A.P004.vo.A_P004VO;
import project.A.P007.sercive.A_P007Service;
import project.A.P007.vo.A_P007VO;



@Controller("A_P007Controller")
public class A_P007ControllerImpl   implements A_P007Controller {
	@Autowired
	private A_P007Service makecouponService;
	@Autowired
	A_P007VO makecouponVO ;
	

	@Override
	@RequestMapping(value="/makecoupon.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView makecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "makecoupon";
//		HttpSession session = request.getSession();
//		String mem_id = (String)session.getAttribute("mem_id");
//		System.out.println("session="+mem_id);
//		List pointList = activeService.listPoint(mem_id);
//		System.out.println(pointList);
		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("pointList", pointList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/createcoupon.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createcoupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "createcoupon";
//		HttpSession session = request.getSession();
//		String mem_id = (String)session.getAttribute("mem_id");
//		System.out.println("session="+mem_id);
//		List pointList = activeService.listPoint(mem_id);
//		System.out.println(pointList);
		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("pointList", pointList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/make.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView make(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "createcoupon";
		String co_name = request.getParameter("co_name");
		String co_stdate = request.getParameter("co_stdate");
		String co_enddate = request.getParameter("co_enddate");
		String co_percent = request.getParameter("co_percent");

		int co_number = (int) (Math.random() * 1000000000);

		Map<String, Object> dataMap = new HashMap<String, Object>();

		dataMap.put("co_name", co_name);
		dataMap.put("co_stdate", co_stdate);
		dataMap.put("co_enddate", co_enddate);
		if(co_percent != null) {
		dataMap.put("co_percent", co_percent);
		}else {
		dataMap.put("co_percent", co_percent);
		}
		dataMap.put("co_number", co_number);

		makecouponService.make(dataMap);
		ModelAndView mav = new ModelAndView(viewName);
		return mav;

	}

	@Override
	@RequestMapping(value="/cousearch.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> cousearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		//데이터 조회
		List<A_P007VO> data = makecouponService.listcoupon();
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/save.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할 Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과
		
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			makecouponService.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","저장되었습니다");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);          
        return resultMap;
	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}
}

