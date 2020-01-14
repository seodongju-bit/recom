package project.A.P004.controller;

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

import project.A.P004.service.A_P004Service;
import project.A.P004.vo.A_P004VO;
import project.A.P005.vo.A_P005VO;



@Controller("A_P004Controller")
public class A_P004ControllerImpl   implements A_P004Controller {
	@Autowired
	private A_P004Service activeService;
	@Autowired
	A_P004VO activeVO ;
	
	
	@Override
	@RequestMapping(value="/myPage.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "myPage";
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");

		if(p_id==null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:main.do");
			return mav;	
		}
		
		
		Map<String, Object> searchMap = new HashMap<String, Object>();

		List<Map<String, Object>> resultList2 = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> resultList3 = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> resultList4 = new ArrayList<Map<String, Object>>();

		int basket_count = 0;
		int coupon_count = 0;
		int mem_point = 0;
		int del_count;
		int question_count = 0;
		searchMap.put("mem_id", p_id);
		
		del_count = activeService.delcount(p_id);
		mem_point = activeService.mempoint(p_id);
		basket_count = activeService.baslist(p_id);
		coupon_count = activeService.coulist(p_id);
		question_count = activeService.question(p_id);

		resultList2 = activeService.orderList2(searchMap);
		resultList3 = activeService.orderList3(searchMap);
		resultList4 = activeService.quList(searchMap);
		
		ModelAndView mav = new ModelAndView(viewName);
		
		String p = request.getParameter("page");
		int page = 1;
		if(p!=null) {
			page = Integer.parseInt(p);
			request.setAttribute("tab", "2");
		}
		resultList2 = activeService.paging(resultList2, page);
		mav.addObject("pageInfo", resultList2.get(resultList2.size()-1));
		resultList2.remove(resultList2.size()-1);
		//////// 페이징 2
		String p2 = request.getParameter("page2");
		int page2 = 1;
		if(p2!=null) {
			page2 = Integer.parseInt(p2);
			request.setAttribute("tab", "3");
		}
		resultList4 = activeService.paging(resultList4, page2);
		mav.addObject("pageInfo2", resultList4.get(resultList4.size()-1));
		resultList4.remove(resultList4.size()-1);
		

		mav.addObject("orderList2", resultList2);
		mav.addObject("coupon_count",coupon_count);
		mav.addObject("basket_count",basket_count);
		mav.addObject("mem_point",mem_point);
		mav.addObject("del_count",del_count);
		mav.addObject("question_count",question_count);
		mav.addObject("orderList3", resultList3);
		mav.addObject("quList", resultList4);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/coupon.do" ,method = RequestMethod.GET)
	public ModelAndView coupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "coupon";
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		if(p_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
		List couponsList = activeService.listCoupon(p_id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("couponsList", couponsList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/usecoupon.do" ,method = RequestMethod.GET)
	public ModelAndView usecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "usecoupon";
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
		List usecoupon = activeService.usecoupon(mem_id);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("usecoupon", usecoupon);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/point.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView point(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "point";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="/confirm.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> confirm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		Map<String, Object> dataMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		Map<String, Object> check = new HashMap<String, Object>();// 구매확정 조회
		
		String order_number = request.getParameter("order_number");
		String sell_number = request.getParameter("sell_number");
		String sell_price = request.getParameter("sell_price");
		String choice_review= request.getParameter("choice_review");
		String od_state = request.getParameter("od_state");
		
		check.put("order_number", order_number);
		check.put("sell_number", sell_number);

		int count = 0;
		count = activeService.confirmcheck(check);
		
		dataMap.put("mem_id", mem_id);
		dataMap.put("order_number", order_number);
		dataMap.put("sell_number", sell_number);
		dataMap.put("sell_price", sell_price);
		dataMap.put("choice_review", choice_review);
		// 검색조건설정
		resultMap.put("check", count);
		try {
			Map<String, Object> useMap = activeService.confirm(dataMap);
			if(!od_state.equals("F_0005")) {
			if(choice_review != "") {
			activeService.reviewerGive(useMap);
			activeService.reviewerGiveSave(useMap);
			activeService.giveMe(useMap);
			activeService.giveMeSave(useMap);
			}
			}
			resultMap.put("error_yn", "N");	
		} catch (Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "�����߻�");
			e.printStackTrace();
		}		
		return resultMap;
	}
	
	@Override
	@RequestMapping(value="/cancle.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> cancle(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		Map<String, Object> check = new HashMap<String, Object>();// 구매확정 조회
		
		String order_number = request.getParameter("order_number");
		String sell_number = request.getParameter("sell_number");
		
		
		check.put("order_number", order_number);
		check.put("sell_number", sell_number);
		
		
		int count = 0;
		count = activeService.canclecheck(check);
		
		dataMap.put("order_number", order_number);
		dataMap.put("sell_number", sell_number);
		// 검색조건설정
		resultMap.put("check", count);
		try {
			activeService.cancle(dataMap);
			resultMap.put("error_yn", "N");	
		} catch (Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "�����߻�");
			e.printStackTrace();
		}		
		return resultMap;
	}
	
	@Override
	@RequestMapping(value="/myquestion.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myquestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "myquestion";
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap();
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
		searchMap.put("mem_id", mem_id);
		searchMap.put("qu_number", request.getParameter("qu_number"));
		List<Map<String,Object>> myquestionList = activeService.listquestion(searchMap);
		resultMap = (Map<String, Object>) myquestionList.get(0);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("myquestionList", resultMap);
		return mav;
		 
	}
	
	@Override
	@RequestMapping(value="/pointSearch.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> pointSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		String division = request.getParameter("division");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		if("point_date".equals(division)) {
			searchMap.put("date", division);
		}else {
			searchMap.put("date", division);
		}
		// 검색조건설정
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		searchMap.put("mem_id", mem_id);
		searchMap.put("start", start);
		searchMap.put("end", end);
		//데이터 조회
		List<A_P004VO> data = activeService.listPoint(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value="/givecoupon.do" ,method = RequestMethod.GET)
	public ModelAndView givecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "givecoupon";
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
		List couponsList = activeService.givecoupon();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("couponsList", couponsList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/takecoupon.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> takecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		String co_number = request.getParameter("co_number");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		//System.out.println(co_number+":::"+mem_id);
//		int count = 0;
//		Map<String, Object> check = new HashMap<String, Object>(); // 검색조건
//		check.put("co_number", co_number);
//		check.put("mem_id", mem_id);
//		count = activeService.couponcheck(check);
		// 검색조건설정
		dataMap.put("mem_id", mem_id);
		dataMap.put("co_number", co_number);
//		resultMap.put("cnt", count);
		try {
			activeService.takecoupon(dataMap);
			resultMap.put("error_yn", "N");	
		} catch (Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "�����߻�");
		}		
		return resultMap;
	}
	
	@Override
	@RequestMapping(value="/alert.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView alert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "alert";
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		if(p_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
		List alertList = activeService.alert(p_id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("alertList", alertList);
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
	
	@RequestMapping(value="/initWithdraw.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView initWithdraw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "initWithdraw";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
		
	}

	
	@RequestMapping(value="/withdraw.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Withdraw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "withdraw";
		
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		String password = request.getParameter("password");
		
		ModelAndView mav = new ModelAndView(viewName);
		if(password==null || !activeService.passCheck(p_id, password)) {
			mav.setViewName("initWithdraw");
			request.setAttribute("check", "비밀번호가 일치하지 않습니다");
			return mav;
		}
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("mem_id", p_id);
		int point = activeService.pointSearch(searchMap);
		request.setAttribute("point", point);
		
		return mav;
	}
	
	@RequestMapping(value="/withdrawSave.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView withdrawSave(@RequestParam Map<String, String> withdrawMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "close";
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		withdrawMap.put("mem_id", p_id);
		activeService.withdrawSave(withdrawMap);
		
		
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}

