package project.A.P007.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface A_P007Controller {	
	public ModelAndView makecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView createcoupon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView make(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> cousearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
}
