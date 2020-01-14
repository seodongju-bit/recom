package project.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller("adminController")
public class adminController {
	@RequestMapping(value="/adminPage.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		if(!adminCheck(request)) {
			ModelAndView mav = new ModelAndView(viewName);
			mav.setViewName("redirect:main.do");
			return mav;
		}
		viewName = "adminPage";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
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
