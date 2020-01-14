package project.F.P001.controller;

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

import project.F.P001.vo.PagingVO;

public interface F_P001Controller {
	
//	ModelAndView reviewRanking(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView memberReview(PagingVO vo, String nowPage, String cntPerPage, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	ModelAndView eventProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView bestProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws Exception;

	List<Map<String, Object>> searchoption(String p_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	

}
                   