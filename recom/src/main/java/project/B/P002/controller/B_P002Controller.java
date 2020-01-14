package project.B.P002.controller;

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

import project.B.P002.vo.B_P002VO;
import project.main.paging.MainPagingVO;



public interface B_P002Controller {

	ModelAndView addSell(HttpServletRequest request, HttpServletResponse response) throws Exception;



	ModelAndView inputSell(B_P002VO b_P002VO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;



	ModelAndView proNumSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;



	Map<String, Object> proNumSearchAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView orderRequestList(HttpServletRequest request, HttpServletResponse response, MainPagingVO mainPagingVO) throws Exception;
	
	public ModelAndView ordererInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	 
	public Map<String, Object> changeState(HttpServletRequest request, HttpServletResponse response) throws Exception;
	 
	
}
