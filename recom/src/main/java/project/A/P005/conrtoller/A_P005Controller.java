package project.A.P005.conrtoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



public interface A_P005Controller {
	public ModelAndView listBasket(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> removeBasket(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> updateBasket(@RequestParam("sell_number") String sell_number, @RequestParam("ba_quantity") String ba_quantity, HttpServletRequest request, HttpServletResponse response) throws Exception;


}