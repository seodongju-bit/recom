package project.A.P009.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface A_P009Controller {
	
	public ModelAndView declarationsManager(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map declarationsList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String declarationsList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveDeclarations(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map ConditionDeclaration(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
