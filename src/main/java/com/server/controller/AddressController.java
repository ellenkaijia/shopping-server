package com.server.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**  
* 类说明   
*  
* @author zkj  
* @date 2017年4月19日  新建  
*/
@Controller
public class AddressController {

	@RequestMapping("/address")
	public ModelAndView getAddress(ModelAndView modelAndView, HttpSession httpSession) {
		modelAndView.setViewName("/admin/address");
		return modelAndView;
	}
}
