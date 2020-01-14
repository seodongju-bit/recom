package project.A.P003.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface A_P003Controller {
	public ModelAndView memberupdatepage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView membersecessionpage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView Secessionsuccesspage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberpwcheckpage(HttpServletRequest request, HttpServletResponse response) throws Exception;
}