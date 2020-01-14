package project.A.P006.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface A_P006Controller {
	public ModelAndView chatInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
/*
	ModelAndView sellerChat(HttpServletRequest request, HttpServletResponse response) throws Exception;*/
}