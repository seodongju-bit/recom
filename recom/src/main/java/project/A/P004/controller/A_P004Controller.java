package project.A.P004.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface A_P004Controller {
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView coupon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView point(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> pointSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> takecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView givecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myquestion(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView alert(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView usecoupon(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> confirm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> cancle(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
