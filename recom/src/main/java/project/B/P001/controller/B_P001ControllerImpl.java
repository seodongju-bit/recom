package project.B.P001.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import oracle.jdbc.proxy.annotation.GetProxy;
import project.A.P009.vo.A_P009VO;
import project.B.P001.service.B_P001Service;
import project.B.P001.vo.B_P001VO;

 


@Controller("B_P001Controller")
public class B_P001ControllerImpl   implements B_P001Controller {

	@Override
	@RequestMapping(value="/itemManager.do" ,method = RequestMethod.GET)
	public ModelAndView itemManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		if(!sellerCheck(request)) {
			ModelAndView mav = new ModelAndView(viewName);
			mav.setViewName("redirect:main.do");
			return mav;
		}
		viewName = "itemManager";
		//JSONObject obj = new JSONObject();
		//obj.put("name", "123");
		//obj.put("age", "234");
	
		//JSONArray ja = new JSONArray();
		//ja.add(obj);
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	
		@RequestMapping(value="/searchOrder.do" ,method = RequestMethod.GET)
	public ModelAndView searchOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		if(!sellerCheck(request)) {
			ModelAndView mav = new ModelAndView(viewName);
			mav.setViewName("redirect:main.do");
			return mav;
		}
		viewName = "searchOrder";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
		
		
		
	private SqlSession sqlSession;
	
	@Autowired
	B_P001VO b_P001VO;
	
	@Autowired
	B_P001Service b_P001Service;
	
	   @Override
	   @RequestMapping(value = "/itemManager/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception  {
	      request.setCharacterEncoding("utf-8");
	      
	      HttpSession session = request.getSession();
	      session = request.getSession();
	      String seller_id = (String)session.getAttribute("mem_id");
	      
	      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
	      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	      
	      searchMap.put("seller_id", seller_id);
	      List<B_P001VO> data =b_P001Service.selectItem(searchMap);
	      resultMap.put("Data", data);
	      return resultMap;
	   }
	   
	   @Override
		@RequestMapping(value = "/itemManager/ConditionSearch.do", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public Map ConditionSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>();
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			String search = request.getParameter("search");
			String condition = request.getParameter("condition");
			searchMap.put("condition", condition);
			searchMap.put("search", search);
			List<B_P001VO> data = b_P001Service.conditionSearch(searchMap);
			resultMap.put("Data", data);
			
			return resultMap;
		}
	   
	   @RequestMapping(value = "/itemManager/selectList.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map selectList(@RequestParam(value="data") List list, HttpServletRequest request, HttpServletResponse response) throws Exception  {
	      request.setCharacterEncoding("utf-8");
	      System.out.println(request.getParameterValues("sStatus")[0]);
	      System.out.println(list);
	      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	      

	      return resultMap;
	   }
	   

	   
	   @RequestMapping(value = "/itemManager/deleteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map deleteList(@RequestParam Map<String, String> requestMap, HttpServletRequest request, HttpServletResponse response) throws Exception  {
	      request.setCharacterEncoding("utf-8");
	      System.out.println(requestMap);
//	      HttpSession session = request.getSession();
//	      session = request.getSession();
//	      String seller_id = (String)session.getAttribute("mem_id");
//	      
//	      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
	      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	      
//	      searchMap.put("seller_id", seller_id);
//	      List<B_P001VO> data =b_P001Service.selectItem(searchMap);
//	      resultMap.put("Data", data);
	      return resultMap;
	   }

	   @Override
	   @RequestMapping(value = "/itemManager/addProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "addProduct";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	   }
	   
	   @Override
	   @RequestMapping(value = "/itemManager/InsertProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView InsertProduct(@ModelAttribute("B_P001VO") B_P001VO b_P001VO, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   //System.out.println(b_P001VO.getRelease_date());
		   //System.out.println(b_P001VO.getPro_vendor());
		   String viewName = getViewName(request);
		   HttpSession session = request.getSession();
		   String mem_id = (String)session.getAttribute("mem_id");
		   b_P001VO.setMem_id(mem_id);
		   b_P001Service.addProduct(b_P001VO);
		   viewName = "addProduct";
		   //Map<String, Object> resultMap = new HashMap<String, Object>();
		   
		   ModelAndView mav = new ModelAndView(viewName);
		   //mav.addObject();
		   return mav;
	   }

	 

	   
	public boolean sellerCheck(HttpServletRequest request) {
		boolean result = false;
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		String mem_division = (String)session.getAttribute("mem_division");
		try {
			if(isLogOn && mem_division.equals("1")) {
				result = true;
			}
		}catch(Exception e) {}
		return result;
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

