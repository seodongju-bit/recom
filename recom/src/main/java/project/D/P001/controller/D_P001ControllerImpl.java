package project.D.P001.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import project.D.P001.service.D_P001Service;
import project.D.P001.vo.D_P001VO;






@Controller("D_P001Controller")
public class D_P001ControllerImpl   implements D_P001Controller {

	@Autowired
	private D_P001Service d_P001Service;
	@Autowired
	D_P001VO D_P001VO;

	@Override
	@RequestMapping(value="/myReview.do" ,method = RequestMethod.GET)
	public ModelAndView myReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "myReview";
		
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		if(p_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mavs2 = new ModelAndView(viewName);
			return mavs2;
		}
		
		List reviewlist2 = d_P001Service.reviewItem2(p_id);
		System.out.println(reviewlist2);
		ModelAndView mavs2 = new ModelAndView(viewName);
		mavs2.addObject("List", reviewlist2);
		return mavs2;
	}

	
	
	
	@Override
	@RequestMapping(value="/myReview2.do" ,method = RequestMethod.GET)
	public ModelAndView myReview2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "myReview2";
		
		Map<String, Object> searchMaps2 = new HashMap<String, Object>();
		Map<String, Object> resultMaps2 = new HashMap();
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null) {
			System.out.println("null");
			viewName = "redirect:#";
			ModelAndView mavs3 = new ModelAndView(viewName);
			return mavs3;
		}
		else {
			System.out.println(session);
		}
		
		
		searchMaps2.put("mem_id", mem_id);
		
		List<Map<String,Object>> reviewlist3 = d_P001Service.reviewItem3(searchMaps2);
		resultMaps2 = (Map<String, Object>)reviewlist3.get(0);
		System.out.println(reviewlist3);
		ModelAndView mavs3 = new ModelAndView(viewName);
		mavs3.addObject("List", resultMaps2);
		return mavs3;
		
	
	}
	
	
	
	
	
	
	@Override
	@RequestMapping(value="/reviewwrite.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewwrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String sell_number = request.getParameter("sell_number");
		String order_number = request.getParameter("order_number");
		String sell_title = request.getParameter("sell_title");
		request.setAttribute("order_number", order_number);
		request.setAttribute("sell_number", sell_number);
		request.setAttribute("sell_title", sell_title);
		viewName = "reviewwrite";
		ModelAndView mavs = new ModelAndView(viewName);
		return mavs; 
	}
	
	//리뷰등록
	@Override
	@RequestMapping(value="/reviewEnrollment.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> reviewEnrollment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		//mem_id, 시간, 리뷰번호 생성, 제품번호
		resultMap.put("mem_id", mem_id);
		resultMap.put("review_title", request.getParameter("review_title"));
		resultMap.put("sell_number", request.getParameter("sell_number"));
		resultMap.put("order_number", request.getParameter("order_number"));
		//resultMap.put("pro_number", request.getParameter("pro_number"));
		resultMap.put("review_url", request.getParameter("review_url"));
		resultMap.put("review_youtube", request.getParameter("review_youtube"));
		resultMap.put("review_pdscore", request.getParameter("review_pdscore"));
		resultMap.put("review_sellscore", request.getParameter("review_sellscore"));
		resultMap.put("review_content", request.getParameter("review_content"));
		d_P001Service.addReview(resultMap);
		
		return result;
	}
	
	
	@Override
	@RequestMapping(value="/writes.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView writes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/reviewwrite.do";
		Map<String, Object> dataMap = new HashMap();
		
		String review_content = request.getParameter("content");
		String mem_no = request.getParameter("writer");

		
		System.out.println(review_content);
		System.out.println(mem_no);

		

		dataMap.put("review_content", review_content);
		dataMap.put("mem_no", mem_no);

		
		System.out.println(dataMap);
		
		 d_P001Service.reviewWrite(dataMap);
		
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
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