package project.E.P001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.E.P001.vo.E_P001VO;

public interface E_P001Controller {
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView buy(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView payToOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView use_Coupon(HttpServletRequest request, HttpServletResponse response) throws Exception;
}