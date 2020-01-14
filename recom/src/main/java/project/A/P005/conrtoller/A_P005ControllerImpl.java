package project.A.P005.conrtoller;


import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSONObject;
import project.A.P005.service.A_P005Service;
import project.A.P005.vo.A_P005VO;





@Controller("basketController")
@EnableAspectJAutoProxy
public class A_P005ControllerImpl   implements A_P005Controller {
//	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private A_P005Service basketService;
	@Autowired
	A_P005VO basketVO ;
	
	@Override
	@RequestMapping(value="/basket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listBasket(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "basket";
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		System.out.println("3333333333333333333333333333333333333333333333333333333333333333333333333"+mem_id);
		if(mem_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
		
		List basketList = basketService.listBasket(mem_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("basketList", basketList);
		return mav;
	}

	
	@Override
	@RequestMapping(value="/basket/removeBasket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> removeBasket(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		String sell_number = request.getParameter("sell_number");
		String ba_color = request.getParameter("ba_color");
		String ba_size = request.getParameter("ba_size");
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		dataMap.put("mem_id", mem_id);
		dataMap.put("sell_number", sell_number);
		dataMap.put("ba_color", ba_color);
		dataMap.put("ba_size", ba_size);
		System.out.println("=======================>>"+dataMap.toString());
		
		try {
			basketService.removeBasket(dataMap);
			resultMap.put("error_yn", "N");	
		} catch (Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "�����߻�");
			e.printStackTrace();
		}
		return resultMap;
	}
		
	@Override
	@RequestMapping(value="/basket/updateBasket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> updateBasket(@RequestParam("sell_number") String sell_number, @RequestParam("ba_quantity") String ba_quantity, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("고객번호="+sell_number);
		System.out.println("상품개수="+ba_quantity);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		String ba_color = request.getParameter("ba_color");
		String ba_size = request.getParameter("ba_size");
		dataMap.put("sell_number", sell_number);
		dataMap.put("ba_quantity", ba_quantity);
		dataMap.put("ba_color", ba_color);
		dataMap.put("ba_size", ba_size);
		dataMap.put("mem_id", mem_id);
		System.out.println("=======================>>"+dataMap.toString());
		
		try {
			basketService.updateBasket(dataMap);
			resultMap.put("error_yn", "N");	
		} catch (Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "�����߻�");
			e.printStackTrace();
		}		
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
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}




}
