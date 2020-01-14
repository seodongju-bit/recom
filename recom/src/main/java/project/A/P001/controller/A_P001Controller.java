package project.A.P001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface A_P001Controller {
	public ModelAndView signinmain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchidpage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchpwpage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView idsearchresult(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView unauthorizedmember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView secessionmember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}