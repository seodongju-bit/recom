package project.B.P001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.B.P001.vo.B_P001VO;

public interface B_P001Controller {

	ModelAndView itemManager(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView InsertProduct(B_P001VO b_P001VO ,HttpServletRequest request, HttpServletResponse response) throws Exception;	
	 
	Map ConditionSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
