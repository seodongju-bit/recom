package project.F.P002.controller;

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

public interface F_P002Controller {
	public ModelAndView searchSell(HttpServletRequest request, HttpServletResponse response) throws Exception;

	List<Map<String, Object>> searchOption(String p_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	Map<String, Object> addBasket(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	 	
}
