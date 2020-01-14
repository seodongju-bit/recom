package project.A.P008.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface A_P008Controller {
	public ModelAndView memberManager(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String searchMember2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map ConditionMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
}